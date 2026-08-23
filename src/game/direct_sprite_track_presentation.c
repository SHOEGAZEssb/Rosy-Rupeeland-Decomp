#include "tingle/field_effect.h"
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
    u32 dispatchState;
    SpriteResourceState resource08;
    u8 *sprite14;
    s32 sampleArgument18;
    PresentationValue track1c;
} DirectSpriteTrackPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gDirectSpriteTrackPresentationVtable;
extern const char gDirectSpriteTrackPresentationAllocationTag[];
extern void *data_020f4e18;
extern u8 *data_021052fc;

extern void AnimationResourceState_InitEmbedded(void *state);
extern void func_02071ee0(void *state, void *table, s32 field0c, s32 field10,
                          s32 field08);
extern void AnimationResourceState_ReleaseResources(void *state);
extern void AnimationResourceState_Destroy(void *state);
extern void VecFx32Object_InitComponents(PresentationValue *track, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(PresentationValue *value);
extern void VecFx32_Subtract(PresentationValue *destination,
                          PresentationValue *track, s32 argument);
extern void func_02056f00(PresentationValue *destination,
                          PresentationValue *source);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_GetSpriteGroup(void *resource);
extern u8 *GraphicsSpriteGroup_CreateState(void *resource, s32 field08, s32 field0c,
                         s32 field10, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 value);
extern void GraphicsSpriteGroup_ReleaseState(void *spriteOwner);
extern void *ActorMotionAreaFollower_GetPosition(void *source);
extern void RuntimePresentationManager_AppendSecondListEffect(void *manager, void *entry);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the FieldEffect base and resource state, create a fixed-point track
 * from x/y, and retain sampleArgument.  Initialize the resource state from the
 * global table and three recovered inputs, then select runtime resource 1 when
 * selector is zero or resource 2 otherwise.  Create the sprite in mode 2 and
 * apply the recovered byte/halfword render fields before returning self.
 */
DirectSpriteTrackPresentation *DirectSpriteTrackPresentation_Init(
    DirectSpriteTrackPresentation *self, s32 selector, s32 field0c,
    s32 field10, s32 field08, s32 spriteValue, s32 x, s32 y, s32 signedField,
    s32 field28, s32 field3a, s32 sampleArgument)
{
    void *resource;
    s16 signedValue;

    FieldEffect_Init(self);
    self->vtable = (void **)gDirectSpriteTrackPresentationVtable;
    AnimationResourceState_InitEmbedded(&self->resource08);
    self->sampleArgument18 = sampleArgument;
    VecFx32Object_InitComponents(&self->track1c, x << 12, y << 12, 0);
    func_02071ee0(&self->resource08, data_020f4e18, field0c, field10, field08);
    resource = ActorCollection_GetSpriteGroup(
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
DirectSpriteTrackPresentation *DirectSpriteTrackPresentation_Destroy(
    DirectSpriteTrackPresentation *self)
{
    self->vtable = (void **)gDirectSpriteTrackPresentationVtable;
    GraphicsSpriteGroup_ReleaseState(*(void **)self->sprite14);
    AnimationResourceState_ReleaseResources(&self->resource08);
    VecFx32Object_Destroy(&self->track1c);
    AnimationResourceState_Destroy(&self->resource08);
    return self;
}

/* Tear down the owned sprite resource and track, free self, and return its old address. */
DirectSpriteTrackPresentation *DirectSpriteTrackPresentation_DestroyAndFree(
    DirectSpriteTrackPresentation *self)
{
    DirectSpriteTrackPresentation_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Return one when sprite flag bit 0 at offset 0x24 is set.  Otherwise sample
 * track1c using sampleArgument18, transform the temporary value, write its
 * fixed-point X/Y components to sprite halfwords 0x2c/0x2e, destroy both
 * temporaries, and return zero.
 */
s32 DirectSpriteTrackPresentation_Update(DirectSpriteTrackPresentation *self)
{
    PresentationValue sampled;
    PresentationValue transformed;

    if ((*(u16 *)(self->sprite14 + 0x24) & 1) != 0) {
        return 1;
    }
    VecFx32_Subtract(&sampled, &self->track1c, self->sampleArgument18);
    func_02056f00(&transformed, &sampled);
    VecFx32Object_Destroy(&sampled);
    *(s16 *)(self->sprite14 + 0x2c) =
        (s16)(*(s32 *)&transformed.bytes[4] >> 12);
    *(s16 *)(self->sprite14 + 0x2e) =
        (s16)(*(s32 *)&transformed.bytes[8] >> 12);
    VecFx32Object_Destroy(&transformed);
    return 0;
}

/*
 * Allocate a 0x2c-byte presentation, construct it with the caller's ten
 * recovered arguments plus the current global position as sampleArgument, and
 * register the resulting pointer (including null on allocation failure) with
 * the runtime manager at offset 0x2f7c.  This entry point has no observable
 * C-level return value in the recovered call sequence.
 */
void DirectSpriteTrackPresentation_SpawnAndRegister(
    s32 selector, s32 field0c, s32 field10, s32 field08, s32 spriteValue,
    s32 x, s32 y, s32 signedField, s32 field28, s32 field3a)
{
    DirectSpriteTrackPresentation *self =
        (DirectSpriteTrackPresentation *)Heap_Alloc(
            0x2c, gDirectSpriteTrackPresentationAllocationTag, 4, &gHeapContext);
    if (self != 0) {
        void *position = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
        DirectSpriteTrackPresentation_Init(
            self, selector, field0c, field10, field08, spriteValue, x, y,
            signedField, field28, field3a, (s32)position);
    }
    RuntimePresentationManager_AppendSecondListEffect(data_021052fc + 0x2f7c, self);
}
