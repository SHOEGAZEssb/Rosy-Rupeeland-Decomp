#include "tingle/heap.h"
#include "tingle/point_2d_s16.h"
#include "tingle/types.h"

/*
 * Implement the ownerless orbiting timed-sprite subclass.  It retains a local
 * position track instead of following actor bounds and reuses the orbit
 * variant's rendering hook with a zero center.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct FreeOrbitTimedSprite FreeOrbitTimedSprite;
typedef void (*FreeOrbitTimedSpriteApply)(FreeOrbitTimedSprite *self,
                                          const void *position,
                                          const CPoint2DS16 *center);

struct FreeOrbitTimedSprite {
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
    PresentationTrack position40;
};

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d60f8;
extern FreeOrbitTimedSprite *func_0201e9d8(FreeOrbitTimedSprite *self,
                                           u8 *owner, u8 *config,
                                           s32 spriteValue,
                                           s16 spriteOffset, s16 spriteByte);
extern FreeOrbitTimedSprite *TimedSpritePresentation_DestroyBase(FreeOrbitTimedSprite *self);
extern void TimedSpritePresentation_SetVisible(FreeOrbitTimedSprite *self, s32 enabled);
extern void VecFx32Object_InitCopy(PresentationTrack *track, const void *source);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Add(PresentationTrack *first,
                          PresentationTrack *second);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the orbit base with a null owner, install this subclass vtable,
 * construct position40 from positionSource, and return self.  The two signed
 * trailing values remain the orbit base's sprite offset and optional byte.
 */
FreeOrbitTimedSprite *func_0201ebac(FreeOrbitTimedSprite *self,
                                    const void *positionSource, u8 *config,
                                    s32 spriteValue, s16 spriteOffset,
                                    s16 spriteByte)
{
    func_0201e9d8(self, 0, config, spriteValue, spriteOffset, spriteByte);
    self->vtable = (void **)data_020d60f8;
    VecFx32Object_InitCopy(&self->position40, positionSource);
    return self;
}

/* Destroy position40, run shared non-freeing teardown, and return self. */
FreeOrbitTimedSprite *func_0201ebf8(FreeOrbitTimedSprite *self)
{
    VecFx32Object_Destroy(&self->position40);
    TimedSpritePresentation_DestroyBase(self);
    return self;
}

/* Destroy position40 and the shared base, free self, and return its old address. */
FreeOrbitTimedSprite *func_0201ec18(FreeOrbitTimedSprite *self)
{
    VecFx32Object_Destroy(&self->position40);
    TimedSpritePresentation_DestroyBase(self);
    Heap_Free(self);
    return self;
}

/*
 * Decrement lifetime and hide/finish on expiry.  Otherwise call vtable slot 5
 * with position40 and a recovered bounds-center value whose vtable is
 * gCPoint2DS16VTable and whose X/Y are zero, advance both tracks, advance the
 * wrapping orbit angle, and return zero.
 */
s32 func_0201ec40(FreeOrbitTimedSprite *self)
{
    CPoint2DS16 zeroCenter;

    self->remaining28--;
    if (self->remaining28 < 0) {
        TimedSpritePresentation_SetVisible(self, 0);
        return 1;
    }
    zeroCenter.vtable = gCPoint2DS16VTable;
    zeroCenter.x = 0;
    zeroCenter.y = 0;
    ((FreeOrbitTimedSpriteApply)self->vtable[5])(
        self, &self->position40, &zeroCenter);
    VecFx32Object_Add(&self->first08, &self->second18);
    self->angle38 = (u16)(self->angle38 + self->angleStep3a);
    return 0;
}
