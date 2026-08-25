#include "tingle/heap.h"
#include "tingle/point_2d_s16.h"
#include "tingle/types.h"

/*
 * Implement the actor-attached timed-sprite presentation.  This variant copies
 * two motion tracks, follows bounds owned by another runtime object, and lets
 * virtual hooks apply the resulting position and radial correction to a sprite.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct AttachedTimedSprite AttachedTimedSprite;

typedef s32 (*AttachedTimedSpriteGate)(AttachedTimedSprite *self, s32 argument);
typedef void (*AttachedTimedSpriteApply)(AttachedTimedSprite *self,
                                         const void *position,
                                         const CPoint2DS16 *center);

struct AttachedTimedSprite {
    void **vtable;
    u8 *sprite;
    PresentationTrack first08;
    PresentationTrack second18;
    s32 remaining28;
    u8 *owner2c;
    s32 radialX30;
    s32 radialScale34;
};

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6138;
extern const s16 gFx32CosSinTable[];
extern AttachedTimedSprite *TimedSpritePresentation_Init(AttachedTimedSprite *self,
                                          u8 *config);
extern AttachedTimedSprite *TimedSpritePresentation_DestroyBase(AttachedTimedSprite *self);
extern void TimedSpritePresentation_SetVisible(AttachedTimedSprite *self, s32 enabled);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Assign(PresentationTrack *destination, const void *source);
extern void VecFx32Object_Add(PresentationTrack *first,
                          PresentationTrack *second);
extern void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(void *sprite, const void *position, s32 first,
                          s32 second, s32 third, s32 constant8);
extern void VecFx32_Subtract(void *output, s32 argument,
                          PresentationTrack *track);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern u16 func_020ae024(s32 x, s32 y);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the shared presentation from config, install this variant's
 * vtable, clear radial offsets, copy both tracks and the lifetime, clear sprite
 * flag 2, apply spriteValue, retain owner, and return self.
 */
AttachedTimedSprite *AttachedTimedSprite_Init(
    AttachedTimedSprite *self, u8 *owner, u8 *config, s32 spriteValue)
{
    TimedSpritePresentation_Init(self, config);
    self->vtable = (void **)data_020d6138;
    self->radialX30 = 0;
    self->radialScale34 = 0x1800;
    VecFx32Object_Assign(&self->first08, config + 0x10);
    VecFx32Object_Assign(&self->second18, config + 0x20);
    self->remaining28 = *(s32 *)(config + 0x30);
    *(u16 *)(self->sprite + 0x24) &= (u16)~2;
    GraphicsSpriteState_SetAnimationIndex(self->sprite, spriteValue);
    self->owner2c = owner;
    return self;
}

/* Run the shared non-freeing teardown and return self. */
AttachedTimedSprite *AttachedTimedSprite_Destroy(AttachedTimedSprite *self)
{
    TimedSpritePresentation_DestroyBase(self);
    return self;
}

/* Run the shared teardown, free self, and return its old address. */
AttachedTimedSprite *AttachedTimedSprite_DestroyAndFree(
    AttachedTimedSprite *self)
{
    TimedSpritePresentation_DestroyBase(self);
    Heap_Free(self);
    return self;
}

/*
 * Call vtable slot 3 with argument and return its nonzero result.  When it
 * returns zero, call slot 4 with the same inputs and return zero.
 */
s32 AttachedTimedSprite_Update(AttachedTimedSprite *self, s32 argument)
{
    s32 result = ((AttachedTimedSpriteGate)self->vtable[3])(self, argument);
    if (result != 0) {
        return result;
    }
    ((AttachedTimedSpriteGate)self->vtable[4])(self, argument);
    return 0;
}

/*
 * Decrement the lifetime and hide/finish when it becomes negative.  Otherwise
 * derive the center of owner bounds at offset 0x68, pass owner position 0x18
 * and that center to vtable slot 5, advance both tracks, and return zero.
 */
s32 AttachedTimedSprite_AdvanceLifetimeAndMotion(AttachedTimedSprite *self)
{
    CPoint2DS16 center;

    self->remaining28--;
    if (self->remaining28 < 0) {
        TimedSpritePresentation_SetVisible(self, 0);
        return 1;
    }
    CPoint2DS16_InitFromRectangle(&center, self->owner2c + 0x68);
    ((AttachedTimedSpriteApply)self->vtable[5])(
        self, self->owner2c + 0x18, &center);
    VecFx32Object_Add(&self->first08, &self->second18);
    return 0;
}

/*
 * Apply the current track vector plus radialX30 to the sprite at ownerPosition.
 * The final halfword self-assignment is retail-observed and has no value change.
 */
void AttachedTimedSprite_ApplyOwnerPosition(
    AttachedTimedSprite *self, const void *ownerPosition,
    const CPoint2DS16 *unusedCenter)
{
    (void)unusedCenter;
    GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(self->sprite, ownerPosition,
                  *(s32 *)&self->first08.bytes[4],
                  *(s32 *)&self->first08.bytes[8],
                  *(s32 *)&self->first08.bytes[0xc] + self->radialX30, 8);
    *(u16 *)(self->sprite + 0x28) = *(u16 *)(self->sprite + 0x28);
}

/*
 * Damp the recovered radial components at offsets 0x1c/0x20 to 95 percent,
 * sample the first track, and add the supplied center.  If the resulting
 * fixed-point vector is longer than 0x4000, add a radialScale34 vector selected
 * from the interleaved angle table.  The retail implementation starts the DS
 * square-root unit in 64-bit mode and polls its busy bit; a portable backend
 * must replace that hardware boundary with an equivalent integer square root.
 * This function returns no value and destroys the temporary track sample.
 */
void AttachedTimedSprite_ApplyRadialCorrection(
    AttachedTimedSprite *self, s32 argument, const CPoint2DS16 *center)
{
    s32 sample[4];
    s32 x;
    s32 y;
    u64 squaredLength;
    u32 length;

    *(s32 *)&self->second18.bytes[4] =
        func_020adae4(*(s32 *)&self->second18.bytes[4] * 0x5f, 0x64);
    *(s32 *)&self->second18.bytes[8] =
        func_020adae4(*(s32 *)&self->second18.bytes[8] * 0x5f, 0x64);
    VecFx32_Subtract(sample, argument, &self->first08);
    x = sample[2] + ((s32)center->y << 12);
    y = sample[1] + ((s32)center->x << 12);
    sample[2] = x;
    sample[1] = y;
    squaredLength = (u64)((s64)x * x + (s64)y * y);

    *(volatile u16 *)0x040002b0 = 1;
    *(volatile u64 *)0x040002b8 = squaredLength;
    while ((*(volatile u16 *)0x040002b0 & 0x8000) != 0) {
    }
    length = (*(volatile u32 *)0x040002b4 + 1) >> 1;

    if (length > 0x4000) {
        s32 angleIndex = ((s32)func_020ae024(x, y) >> 4) * 2;
        s64 product = (s64)gFx32CosSinTable[angleIndex + 1]
                      * self->radialScale34;
        *(s32 *)&self->second18.bytes[4] += (s32)((product + 0x800) >> 12);
        product = (s64)gFx32CosSinTable[angleIndex] * self->radialScale34;
        *(s32 *)&self->second18.bytes[8] += (s32)((product + 0x800) >> 12);
    }
    VecFx32Object_Destroy(sample);
}
