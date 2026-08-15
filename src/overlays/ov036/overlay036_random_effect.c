#include "tingle/types.h"

/* Overlay 36 randomized timed-effect construction and owned-handle teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205eac[];
extern const u8 data_ov036_02205f80[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void *func_ov036_021fcf30(void *object);
extern void PresentationList_DeleteAll(void *record);
extern u32 genrand_int32(void);
extern void Presentation_SetPosition(void *object, s32 value, s32 minimum, s32 zero);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern s32 Presentation_InterpolateLinear(s32 minimum, s32 maximum, s32 scale, s32 value);
extern void GraphicsAnimationInstance_Destroy(void *handle);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a 16-byte embedded helper with vtable-like data
 * data_ov036_02205EAC and clears fields +4/+8/+0xC. It returns nothing and
 * changes only the supplied record.
 */
extern "C" void func_ov036_021fe218(void *record)
{
    FIELD(const void *, record, 0) = data_ov036_02205eac;
    FIELD(s32, record, 8) = 0;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 0xc) = 0;
}

/*
 * Resets the embedded helper's vtable-like word and invokes its common
 * destructor. Returns record; the helper's internal state can change.
 */
extern "C" void *func_ov036_021fe238(void *record)
{
    FIELD(const void *, record, 0) = data_ov036_02205eac;
    PresentationList_DeleteAll(record);
    return record;
}

/*
 * Constructs a randomized timed effect from config. It initializes the common
 * base and embedded helper at +0x9C, stores a generated random word at +0xC8,
 * clears state +0xAC and owned handle +0xCC, configures common transform/timer
 * state from config +0/+4, copies six halfwords from +8..+0x12 into spaced
 * fields +0xB0..+0xC4, stores config +0x1C at +0xD0, and activates +0x88.
 * Returns object; RNG, transform, timer, and object state change.
 */
extern "C" void *func_ov036_021fe258(void *object, const void *config)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov036_02205f80;
    func_ov036_021fe218((u8 *)object + 0x9c);
    FIELD(u32, object, 0xc8) = 0;
    FIELD(u32, object, 0xc8) = genrand_int32();
    FIELD(s32, object, 0xac) = 0;
    FIELD(void *, object, 0xcc) = 0;
    Presentation_SetPosition(object, FIELD(s32, config, 0), -0x600, 0);
    PresentationScalar_TransitionTo((u8 *)object + 0x1c, 4, FIELD(s32, config, 4));
    FIELD(s32, object, 0x7c) =
        (s16)Presentation_InterpolateLinear(0, 0xb4, 0x800, FIELD(s32, config, 4));
    FIELD(s32, object, 0x80) = 0;
    FIELD(u32, object, 0xb0) = FIELD(u16, config, 8);
    FIELD(u32, object, 0xb4) = FIELD(u16, config, 0xa);
    FIELD(u32, object, 0xb8) = FIELD(u16, config, 0xc);
    FIELD(u32, object, 0xbc) = FIELD(u16, config, 0xe);
    FIELD(u32, object, 0xc0) = FIELD(u16, config, 0x10);
    FIELD(u32, object, 0xc4) = FIELD(u16, config, 0x12);
    FIELD(s32, object, 0xd0) = FIELD(s32, config, 0x1c);
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Destroys the optional owned handle +0xCC, embedded helper +0x9C, and common
 * render base without freeing object. Vtable-like words are reset before each
 * stage. Returns object; owned and base state change.
 */
extern "C" void *func_ov036_021fe328(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_02205f80;
    if (FIELD(void *, object, 0xcc) != 0)
        GraphicsAnimationInstance_Destroy(FIELD(void *, object, 0xcc));
    FIELD(const void *, object, 0x9c) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)object + 0x9c);
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Fully deletes the randomized effect by performing the same handle, embedded
 * helper, and base destruction as func_ov036_021fe328, then freeing object.
 * Returns the now-invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_021fe370(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_02205f80;
    if (FIELD(void *, object, 0xcc) != 0)
        GraphicsAnimationInstance_Destroy(FIELD(void *, object, 0xcc));
    FIELD(const void *, object, 0x9c) = data_ov036_02205eac;
    PresentationList_DeleteAll((u8 *)object + 0x9c);
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}
