#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a small timed-sprite presentation backed by a table record.  The
 * constructor copies an offset-based configuration block, submits its record
 * fields and initial position to the runtime subsystem, and the update advances
 * a one-step state latch while the runtime owns the visible effect.
 */

typedef struct PresentationValue {
    u8 bytes[0x10];
} PresentationValue;

typedef struct TimedSpriteRecordPresentation {
    void **vtable;
    u32 field04;
    s32 field08;
    s32 state0c;
    u8 *record10;
    s32 field14;
    s16 field18;
    s16 field1a;
    s16 field1c;
    s16 field1e;
} TimedSpriteRecordPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d62b0;
extern const char data_020d62d0[];
extern u8 *data_021052fc;
extern void *func_0201e250(void *self);
extern void *func_0201e28c(void *self);
extern u8 *func_020284e0(s32 index);
extern void GamePhaseVisualEffect_Configure(void *runtime, u32 field00, u32 field02,
                          u32 field04, u32 field06, u32 field08, u32 field0e,
                          void *copiedFields);
extern void VecFx32Object_InitComponents(PresentationValue *value, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(PresentationValue *value);
extern void GamePhaseVisualEffect_SetBaseOffset(void *runtime, PresentationValue *value);
extern void func_0201ded4(void *manager, void *entry);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the recovered base, retain field08, and resolve config offset
 * 0x12 through func_020284e0.  Copy config offsets 0x34 and 0x38..0x3e into
 * self, clear state0c, submit the record's offsets 0x00..0x08 and 0x0e plus
 * the copied block to the runtime at 0x2ed8, then submit a temporary position
 * made from signed record offsets 0x0a/0x0c shifted by four.  Destroy the
 * temporary and return self.
 */
TimedSpriteRecordPresentation *func_0201ff2c(
    TimedSpriteRecordPresentation *self, s32 field08, const u8 *config)
{
    PresentationValue position;
    void *runtime;

    func_0201e250(self);
    self->vtable = (void **)data_020d62b0;
    self->field08 = field08;
    self->record10 = func_020284e0(*(const s16 *)(config + 0x12));
    self->field14 = *(const s32 *)(config + 0x34);
    self->field18 = *(const s16 *)(config + 0x38);
    self->field1a = *(const s16 *)(config + 0x3a);
    self->field1c = *(const s16 *)(config + 0x3c);
    self->field1e = *(const s16 *)(config + 0x3e);
    self->state0c = 0;
    runtime = data_021052fc + 0x2ed8;
    GamePhaseVisualEffect_Configure(runtime, *(u16 *)(self->record10 + 0x00),
                  *(u16 *)(self->record10 + 0x02),
                  *(u16 *)(self->record10 + 0x04),
                  *(u16 *)(self->record10 + 0x06),
                  *(u16 *)(self->record10 + 0x08),
                  *(u16 *)(self->record10 + 0x0e), &self->field14);
    VecFx32Object_InitComponents(&position, *(s16 *)(self->record10 + 0x0a) << 4,
                  *(s16 *)(self->record10 + 0x0c) << 4, 0);
    GamePhaseVisualEffect_SetBaseOffset(runtime, &position);
    VecFx32Object_Destroy(&position);
    return self;
}

/* Run recovered base teardown and return self without freeing it. */
TimedSpriteRecordPresentation *func_02020018(
    TimedSpriteRecordPresentation *self)
{
    func_0201e28c(self);
    return self;
}

/* Run recovered base teardown, free self, and return its old address. */
TimedSpriteRecordPresentation *func_0202002c(
    TimedSpriteRecordPresentation *self)
{
    func_0201e28c(self);
    Heap_Free(self);
    return self;
}

/* Set state0c from zero to one on the first update and always return zero. */
s32 func_02020048(TimedSpriteRecordPresentation *self)
{
    if (self->state0c == 0) {
        self->state0c++;
    }
    return 0;
}

/*
 * Allocate and construct a 0x20-byte presentation from field08 and config,
 * then register the resulting pointer (including null on allocation failure)
 * with the runtime manager at offset 0x2f7c.
 */
void func_02020060(s32 field08, const u8 *config)
{
    TimedSpriteRecordPresentation *self =
        (TimedSpriteRecordPresentation *)Heap_Alloc(
            0x20, data_020d62d0, 4, &gHeapContext);
    if (self != 0) {
        func_0201ff2c(self, field08, config);
    }
    func_0201ded4(data_021052fc + 0x2f7c, self);
}
