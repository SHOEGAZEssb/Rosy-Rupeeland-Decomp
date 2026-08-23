#include "tingle/field_effect.h"
#include "tingle/heap.h"

/* Implement CFieldEffect, followed by the independent CEffChip class. */

typedef struct PresentationTrack { u8 bytes[0x10]; } PresentationTrack;
typedef struct TimedSpritePresentation {
    void *vtable;
    u8 *sprite;
    PresentationTrack first08;
    PresentationTrack second18;
    s32 remaining28;
} TimedSpritePresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6098;
extern void VecFx32Object_InitComponents(PresentationTrack *track,s32 first,s32 second,s32 third);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Add(PresentationTrack *first,PresentationTrack *second);
extern void VecFx32_Subtract(void *output,PresentationTrack *track,s32 argument);
extern u8 *GraphicsSpriteGroup_CreateState(u32 first,u32 second,u32 third,u32 fourth,u32 fifth);
extern void GraphicsSpriteGroup_ReleaseState(void *spriteOwner, void *sprite);
#ifdef __cplusplus
}
#endif

/* Install the FieldEffect vtable, clear dispatch-state bits 0..9, and return self. */
void *FieldEffect_Init(void *self)
{
    FieldEffect *effect = (FieldEffect *)self;
    effect->vtable = (void **)gFieldEffectVtable;
    effect->dispatchState &= ~0x3ff;
    return self;
}

/* FieldEffect's non-deleting destructor is a no-op and returns self. */
void *FieldEffect_Destroy(void *self) { return self; }

/* Free the FieldEffect object and return its old address. */
void *FieldEffect_DestroyAndFree(void *self) { Heap_Free(self); return self; }

/* Shared derived-destructor tail; the FieldEffect base owns no resources. */
void *FieldEffect_DestroyBase(void *self) { return self; }

/*
 * Initialize two zeroed interpolation tracks, clear the timer, create a sprite
 * from the five recovered config values, set sprite flag 4, and return self.
 */
TimedSpritePresentation *func_0201e290(TimedSpritePresentation *self,u8 *config)
{
    self->vtable=data_020d6098;
    VecFx32Object_InitComponents(&self->first08,0,0,0);
    VecFx32Object_InitComponents(&self->second18,0,0,0);
    self->remaining28=0;
    self->sprite=GraphicsSpriteGroup_CreateState(*(u32 *)(config+0),*(u32 *)(config+4),
        *(u32 *)(config+8),*(u32 *)(config+0xc),*(u32 *)(config+0x34)&0xff);
    *(u16 *)(self->sprite+0x24)|=4;
    return self;
}

/* Release the sprite from its owner and destroy both tracks, then return self
 * without freeing it. */
TimedSpritePresentation *func_0201e308(TimedSpritePresentation *self)
{
    self->vtable=data_020d6098;
    GraphicsSpriteGroup_ReleaseState(*(void **)self->sprite, self->sprite);
    VecFx32Object_Destroy(&self->second18);
    VecFx32Object_Destroy(&self->first08);
    return self;
}

/* Perform func_0201e308's teardown, free self, and return its old address. */
TimedSpritePresentation *func_0201e340(TimedSpritePresentation *self)
{
    self->vtable=data_020d6098;
    GraphicsSpriteGroup_ReleaseState(*(void **)self->sprite, self->sprite);
    VecFx32Object_Destroy(&self->second18);
    VecFx32Object_Destroy(&self->first08);
    Heap_Free(self);
    return self;
}

/* Duplicate non-freeing teardown retained for its distinct virtual-table slot. */
TimedSpritePresentation *func_0201e380(TimedSpritePresentation *self)
{
    self->vtable=data_020d6098;
    GraphicsSpriteGroup_ReleaseState(*(void **)self->sprite, self->sprite);
    VecFx32Object_Destroy(&self->second18);
    VecFx32Object_Destroy(&self->first08);
    return self;
}

/* Clear sprite flag 4 when enabled is nonzero, otherwise set it. */
void TimedSpritePresentation_SetVisible(TimedSpritePresentation *self,s32 enabled)
{
    if(enabled) *(u16 *)(self->sprite+0x24)&=~4;
    else *(u16 *)(self->sprite+0x24)|=4;
}

/*
 * Decrement the lifetime; once negative, hide via TimedSpritePresentation_SetVisible and return one.
 * Otherwise advance the tracks, sample a fixed-point position, copy its X/Y
 * integer parts to sprite offsets 0x2c/0x2e, destroy the sample, and return zero.
 */
s32 func_0201e3d8(TimedSpritePresentation *self,s32 argument)
{
    s32 sample[4];
    self->remaining28--;
    if(self->remaining28<0){TimedSpritePresentation_SetVisible(self,0);return 1;}
    VecFx32Object_Add(&self->first08,&self->second18);
    VecFx32_Subtract(sample,&self->first08,argument);
    *(u16 *)(self->sprite+0x2c)=(u16)(sample[1]>>12);
    *(u16 *)(self->sprite+0x2e)=(u16)(sample[2]>>12);
    VecFx32Object_Destroy(sample);
    return 0;
}
