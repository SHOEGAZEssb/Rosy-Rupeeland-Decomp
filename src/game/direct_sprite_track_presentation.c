#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a presentation object that directly owns a sprite resource and a
 * sampled position track.  Construction selects one of two sprite resources,
 * applies recovered render fields, and updates sprite coordinates from the
 * track until the sprite reports completion.
 */

typedef struct PresentationValue {
    u8 bytes[0x10];
} PresentationValue;

typedef struct SpriteResourceState {
    u8 bytes[0x0c];
} SpriteResourceState;

typedef struct DirectSpriteTrackPresentation {
    void **vtable;
    u32 field04;
    SpriteResourceState resource08;
    u8 *sprite14;
    s32 sampleArgument18;
    PresentationValue track1c;
} DirectSpriteTrackPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6158;
extern const char data_020d6278[];
extern void *data_020f4e18;
extern u8 *data_021052fc;
extern void *func_0201e250(void *self);
extern void func_02071ea4(void *state);
extern void func_02071ee0(void *state, void *table, s32 field0c, s32 field10,
                          s32 field08);
extern void func_02071f38(void *state);
extern void func_02071eb8(void *state);
extern void func_0200500c(PresentationValue *track, s32 x, s32 y, s32 z);
extern void func_02005058(PresentationValue *value);
extern void VecFx32_Subtract(PresentationValue *destination,
                          PresentationValue *track, s32 argument);
extern void func_02056f00(PresentationValue *destination,
                          PresentationValue *source);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_GetSpriteOwner(void *resource);
extern u8 *GraphicsSpriteGroup_CreateState(void *resource, s32 field08, s32 field0c,
                         s32 field10, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 value);
extern void GraphicsSpriteGroup_ReleaseState(void *spriteOwner);
extern void *ActorMotionAreaFollower_GetPosition(void *source);
extern void func_0201df44(void *manager, void *entry);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the recovered base and resource state, create a fixed-point track
 * from x/y, and retain sampleArgument.  Initialize the resource state from the
 * global table and three recovered inputs, then select runtime resource 1 when
 * selector is zero or resource 2 otherwise.  Create the sprite in mode 2 and
 * apply the recovered byte/halfword render fields before returning self.
 */
DirectSpriteTrackPresentation *func_0201fc28(
    DirectSpriteTrackPresentation *self, s32 selector, s32 field0c,
    s32 field10, s32 field08, s32 spriteValue, s32 x, s32 y, s32 signedField,
    s32 field28, s32 field3a, s32 sampleArgument)
{
    void *resource;
    s16 signedValue;

    func_0201e250(self);
    self->vtable = (void **)data_020d6158;
    func_02071ea4(&self->resource08);
    self->sampleArgument18 = sampleArgument;
    func_0200500c(&self->track1c, x << 12, y << 12, 0);
    func_02071ee0(&self->resource08, data_020f4e18, field0c, field10, field08);
    resource = ActorCollection_GetSpriteOwner(
        GamePhaseRuntime_GetActorCollection(data_021052fc, selector == 0 ? 1 : 2));
    self->sprite14 = GraphicsSpriteGroup_CreateState(
        resource, *(s32 *)&self->resource08.bytes[0],
        *(s32 *)&self->resource08.bytes[4],
        *(s32 *)&self->resource08.bytes[8], 2);
    GraphicsSpriteState_SetAnimationIndex(self->sprite14, spriteValue & 0xff);
    *(s16 *)(self->sprite14 + 0x2c) = (s16)x;
    *(s16 *)(self->sprite14 + 0x2e) = (s16)y;
    *(s16 *)(self->sprite14 + 0x28) = (s16)field28;
    self->sprite14[0x3a] = (u8)field3a;
    signedValue = (s16)signedField;
    *(s16 *)(self->sprite14 + 0x32) = signedValue;
    *(s16 *)(self->sprite14 + 0x34) = signedValue;
    return self;
}

/*
 * Reinstall this vtable, release the sprite owner reached through sprite14,
 * tear down both resource-state phases and the position track, and return self
 * without freeing its allocation.
 */
DirectSpriteTrackPresentation *func_0201fd64(
    DirectSpriteTrackPresentation *self)
{
    self->vtable = (void **)data_020d6158;
    GraphicsSpriteGroup_ReleaseState(*(void **)self->sprite14);
    func_02071f38(&self->resource08);
    func_02005058(&self->track1c);
    func_02071eb8(&self->resource08);
    return self;
}

/* Perform func_0201fd64's teardown, free self, and return its old address. */
DirectSpriteTrackPresentation *func_0201fda4(
    DirectSpriteTrackPresentation *self)
{
    func_0201fd64(self);
    Heap_Free(self);
    return self;
}

/*
 * Return one when sprite flag bit 0 at offset 0x24 is set.  Otherwise sample
 * track1c using sampleArgument18, transform the temporary value, write its
 * fixed-point X/Y components to sprite halfwords 0x2c/0x2e, destroy both
 * temporaries, and return zero.
 */
s32 func_0201fdec(DirectSpriteTrackPresentation *self)
{
    PresentationValue sampled;
    PresentationValue transformed;

    if ((*(u16 *)(self->sprite14 + 0x24) & 1) != 0) {
        return 1;
    }
    VecFx32_Subtract(&sampled, &self->track1c, self->sampleArgument18);
    func_02056f00(&transformed, &sampled);
    func_02005058(&sampled);
    *(s16 *)(self->sprite14 + 0x2c) =
        (s16)(*(s32 *)&transformed.bytes[4] >> 12);
    *(s16 *)(self->sprite14 + 0x2e) =
        (s16)(*(s32 *)&transformed.bytes[8] >> 12);
    func_02005058(&transformed);
    return 0;
}

/*
 * Allocate a 0x2c-byte presentation, construct it with the caller's ten
 * recovered arguments plus the current global position as sampleArgument, and
 * register the resulting pointer (including null on allocation failure) with
 * the runtime manager at offset 0x2f7c.  This entry point has no observable
 * C-level return value in the recovered call sequence.
 */
void func_0201fe68(s32 selector, s32 field0c, s32 field10, s32 field08,
                   s32 spriteValue, s32 x, s32 y, s32 signedField,
                   s32 field28, s32 field3a)
{
    DirectSpriteTrackPresentation *self =
        (DirectSpriteTrackPresentation *)Heap_Alloc(
            0x2c, data_020d6278, 4, &gHeapContext);
    if (self != 0) {
        void *position = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
        func_0201fc28(self, selector, field0c, field10, field08, spriteValue,
                      x, y, signedField, field28, field3a, (s32)position);
    }
    func_0201df44(data_021052fc + 0x2f7c, self);
}
