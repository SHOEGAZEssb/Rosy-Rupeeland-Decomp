#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the timed-sprite variant that copies its owner's current position
 * into the primary motion track and renders with two recovered sprite offsets.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct OwnerPositionTimedSprite {
    void **vtable;
    u8 *sprite;
    PresentationTrack first08;
    PresentationTrack second18;
    s32 remaining28;
    u8 *owner2c;
    s32 radialX30;
    s32 radialScale34;
    s16 spriteOffset38;
    s16 spriteByte3a;
} OwnerPositionTimedSprite;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d60d8;
extern OwnerPositionTimedSprite *func_0201e6e4(
    OwnerPositionTimedSprite *self, u8 *owner, u8 *config, s32 spriteValue);
extern OwnerPositionTimedSprite *func_0201e380(
    OwnerPositionTimedSprite *self);
extern void TimedSpritePresentation_SetVisible(OwnerPositionTimedSprite *self, s32 enabled);
extern void VecFx32Object_Assign(PresentationTrack *destination, const void *source);
extern void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(void *sprite, const void *position, s32 first,
                          s32 second, s32 third, s32 constant8);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the actor-attached base from the four register arguments, install
 * this vtable, copy the two signed stack parameters to offsets 0x38/0x3a, and
 * return self.
 */
OwnerPositionTimedSprite *func_0201ecbc(OwnerPositionTimedSprite *self,
                                        u8 *owner, u8 *config,
                                        s32 spriteValue, s16 spriteOffset,
                                        s16 spriteByte)
{
    func_0201e6e4(self, owner, config, spriteValue);
    self->vtable = (void **)data_020d60d8;
    self->spriteOffset38 = spriteOffset;
    self->spriteByte3a = spriteByte;
    return self;
}

/* Run the shared non-freeing teardown and return self. */
OwnerPositionTimedSprite *func_0201ecec(OwnerPositionTimedSprite *self)
{
    func_0201e380(self);
    return self;
}

/* Run the shared teardown, free self, and return its old address. */
OwnerPositionTimedSprite *func_0201ed00(OwnerPositionTimedSprite *self)
{
    func_0201e380(self);
    Heap_Free(self);
    return self;
}

/*
 * Decrement lifetime and hide/finish if it becomes negative or sprite status
 * bit 1 is set.  Otherwise copy owner field 0x18 into first08 and return zero.
 */
s32 func_0201ed1c(OwnerPositionTimedSprite *self)
{
    self->remaining28--;
    if (self->remaining28 < 0 || (*(u16 *)(self->sprite + 0x24) & 1) != 0) {
        TimedSpritePresentation_SetVisible(self, 0);
        return 1;
    }
    VecFx32Object_Assign(&self->first08, self->owner2c + 0x18);
    return 0;
}

/*
 * Apply first08's X/Y and Z plus radialX30 to the sprite at ownerPosition using
 * recovered constant 8.  Then add spriteOffset38 to sprite halfword 0x28 and,
 * when spriteByte3a is nonnegative, store its low byte at sprite offset 0x3a.
 */
void func_0201ed70(OwnerPositionTimedSprite *self,
                   const void *ownerPosition, const void *unusedCenter)
{
    (void)unusedCenter;
    GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(self->sprite, ownerPosition,
                  *(s32 *)&self->first08.bytes[4],
                  *(s32 *)&self->first08.bytes[8],
                  *(s32 *)&self->first08.bytes[0xc] + self->radialX30, 8);
    *(u16 *)(self->sprite + 0x28) =
        (u16)(*(u16 *)(self->sprite + 0x28) + self->spriteOffset38);
    if (self->spriteByte3a >= 0) {
        self->sprite[0x3a] = (u8)self->spriteByte3a;
    }
}
