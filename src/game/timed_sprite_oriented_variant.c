#include "tingle/heap.h"
#include "tingle/types.h"

/* Specialize the timed sprite presentation with copied tracks and orientation. */

typedef struct Track { u8 bytes[0x10]; } Track;
typedef struct OrientedTimedSprite { void *vtable; u8 *sprite; Track first08; Track second18; s32 remaining28; } OrientedTimedSprite;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d605c;
extern OrientedTimedSprite *TimedSpritePresentation_Init(OrientedTimedSprite *self,u8 *config);
extern OrientedTimedSprite *TimedSpritePresentation_DestroyBase(OrientedTimedSprite *self);
extern void TimedSpritePresentation_SetVisible(OrientedTimedSprite *self,s32 enabled);
extern void VecFx32Object_Assign(Track *destination,const void *source);
extern void VecFx32Object_Add(Track *first,Track *second);
extern u16 func_020ae024(s32 x,s32 y);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite,s32 value);
extern void GraphicsSpriteState_SetWorldPositionFromOrigin(void *sprite,s32 argument,s32 first,s32 second,
                          s32 third,s32 constant8);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base, install this variant's vtable, copy config tracks and
 * lifetime, enable sprite flag 2, derive/store orientation from track values,
 * set sprite value zero, and return self.
 */
OrientedTimedSprite *OrientedTimedSprite_Init(
    OrientedTimedSprite *self, u8 *config)
{
    u16 angle;
    TimedSpritePresentation_Init(self,config);
    self->vtable=data_020d605c;
    VecFx32Object_Assign(&self->first08,config+0x10);
    VecFx32Object_Assign(&self->second18,config+0x20);
    self->remaining28=*(s32 *)(config+0x30);
    *(u16 *)(self->sprite+0x24)|=2;
    angle=func_020ae024(-*(s32 *)&self->second18.bytes[4],
                        *(s32 *)&self->second18.bytes[8]);
    GraphicsSpriteState_SetAnimationIndex(self->sprite,0);
    *(u16 *)(self->sprite+0x30)=angle;
    return self;
}

/* Run the shared non-freeing teardown and return self. */
OrientedTimedSprite *OrientedTimedSprite_Destroy(OrientedTimedSprite *self){TimedSpritePresentation_DestroyBase(self);return self;}

/* Run the shared teardown, free self, and return its old address. */
OrientedTimedSprite *OrientedTimedSprite_DestroyAndFree(OrientedTimedSprite *self){TimedSpritePresentation_DestroyBase(self);Heap_Free(self);return self;}

/*
 * Decrement lifetime and hide/finish when negative.  Otherwise advance the
 * tracks, update the sprite through GraphicsSpriteState_SetWorldPositionFromOrigin with recovered constant 8,
 * and return whether sprite status flag 8 is set.
 */
s32 OrientedTimedSprite_Update(OrientedTimedSprite *self,s32 argument)
{
    self->remaining28--;
    if(self->remaining28<0){TimedSpritePresentation_SetVisible(self,0);return 1;}
    VecFx32Object_Add(&self->first08,&self->second18);
    GraphicsSpriteState_SetWorldPositionFromOrigin(self->sprite,argument,*(s32 *)&self->first08.bytes[4],
        *(s32 *)&self->first08.bytes[8],*(s32 *)&self->first08.bytes[0xc],8);
    return (*(u16 *)(self->sprite+0x24)&8)!=0;
}
