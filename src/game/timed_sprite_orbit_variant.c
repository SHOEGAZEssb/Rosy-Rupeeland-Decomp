#include "tingle/heap.h"
#include "tingle/point_2d_s16.h"
#include "tingle/types.h"

/*
 * Implement the rotating actor-attached timed-sprite variant.  It advances a
 * random starting angle, adds a small circular displacement to its motion
 * track, and optionally writes a recovered sprite byte each frame.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct OrbitTimedSprite OrbitTimedSprite;
typedef void (*OrbitTimedSpriteApply)(OrbitTimedSprite *self,
                                      const void *position,
                                      const CPoint2DS16 *center);

struct OrbitTimedSprite {
    void **vtable;
    u8 *sprite;
    PresentationTrack first08;
    PresentationTrack second18;
    s32 remaining28;
    u8 *owner2c;
    s32 radialX30;
    s32 radialScale34;
    u16 angle38;
    s16 angleStep3a;
    s16 spriteOffset3c;
    s16 spriteByte3e;
};

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_020d6118[];
extern const s16 gFx32CosSinTable[];
extern OrbitTimedSprite *func_0201e6e4(OrbitTimedSprite *self, u8 *owner,
                                       u8 *config, s32 spriteValue);
extern OrbitTimedSprite *func_0201e380(OrbitTimedSprite *self);
extern void TimedSpritePresentation_SetVisible(OrbitTimedSprite *self, s32 enabled);
extern void VecFx32Object_Add(PresentationTrack *first,
                          PresentationTrack *second);
extern void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(void *sprite, const void *position, s32 first,
                          s32 second, s32 third, s32 constant8);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the attached base with the four register arguments, install this
 * vtable, copy the two signed stack parameters to offsets 0x3c/0x3e, choose a
 * random starting angle, choose step +0x800 for odd RNG output or -0x800 for
 * even output, and return self.
 */
OrbitTimedSprite *func_0201e9d8(OrbitTimedSprite *self, u8 *owner, u8 *config,
                                s32 spriteValue, s16 spriteOffset,
                                s16 spriteByte)
{
    u32 random;
    func_0201e6e4(self, owner, config, spriteValue);
    self->vtable = (void **)data_020d6118;
    self->spriteOffset3c = spriteOffset;
    self->spriteByte3e = spriteByte;
    random = genrand_int32();
    self->angle38 = (u16)random;
    self->angleStep3a = (random & 1) != 0 ? 0x800 : -0x800;
    return self;
}

/* Duplicate constructor retained for its distinct retail entry point. */
OrbitTimedSprite *func_0201ea20(OrbitTimedSprite *self, u8 *owner, u8 *config,
                                s32 spriteValue, s16 spriteOffset,
                                s16 spriteByte)
{
    u32 random;
    func_0201e6e4(self, owner, config, spriteValue);
    self->vtable = (void **)data_020d6118;
    self->spriteOffset3c = spriteOffset;
    self->spriteByte3e = spriteByte;
    random = genrand_int32();
    self->angle38 = (u16)random;
    self->angleStep3a = (random & 1) != 0 ? 0x800 : -0x800;
    return self;
}

/* Run the shared non-freeing teardown and return self. */
OrbitTimedSprite *func_0201ea68(OrbitTimedSprite *self)
{
    func_0201e380(self);
    return self;
}

/* Run the shared teardown, free self, and return its old address. */
OrbitTimedSprite *func_0201ea7c(OrbitTimedSprite *self)
{
    func_0201e380(self);
    Heap_Free(self);
    return self;
}

/*
 * Decrement lifetime and hide/finish on expiry.  Otherwise derive the center
 * of owner bounds 0x68, call vtable slot 5 with owner position 0x18, advance
 * both tracks, add angleStep3a to the wrapping angle, and return zero.
 */
s32 OrbitTimedSprite_Update(OrbitTimedSprite *self)
{
    CPoint2DS16 center;

    self->remaining28--;
    if (self->remaining28 < 0) {
        TimedSpritePresentation_SetVisible(self, 0);
        return 1;
    }
    CPoint2DS16_InitFromRectangle(&center, self->owner2c + 0x68);
    ((OrbitTimedSpriteApply)self->vtable[5])(
        self, self->owner2c + 0x18, &center);
    VecFx32Object_Add(&self->first08, &self->second18);
    self->angle38 = (u16)(self->angle38 + self->angleStep3a);
    return 0;
}

/*
 * Add a radius-20 circular displacement selected by angle38 to the current
 * track X/Y values, add radialX30 to Z, and apply the six recovered arguments
 * to the sprite.  Then add spriteOffset3c to sprite halfword 0x28 and, when
 * spriteByte3e is nonnegative, store its low byte at sprite offset 0x3a.
 */
void func_0201eb18(OrbitTimedSprite *self, const void *ownerPosition,
                   const CPoint2DS16 *unusedCenter)
{
    s32 tableIndex = (self->angle38 >> 4) * 2;
    s32 x = *(s32 *)&self->first08.bytes[4]
            + gFx32CosSinTable[tableIndex] * 0x14;
    s32 y = *(s32 *)&self->first08.bytes[8]
            + gFx32CosSinTable[tableIndex + 1] * 0x14;

    (void)unusedCenter;
    GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(self->sprite, ownerPosition, x, y,
                  *(s32 *)&self->first08.bytes[0xc] + self->radialX30, 8);
    *(u16 *)(self->sprite + 0x28) =
        (u16)(*(u16 *)(self->sprite + 0x28) + self->spriteOffset3c);
    if (self->spriteByte3e >= 0) {
        self->sprite[0x3a] = (u8)self->spriteByte3e;
    }
}
