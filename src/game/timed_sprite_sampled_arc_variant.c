#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a timed-sprite variant driven by one sampled motion track.  Its
 * update converts fixed-point sample values to sprite coordinates and uses the
 * track's recovered Z component as a vertical subtraction.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct SampledArcTimedSprite {
    void *vtable;
    u8 *sprite;
    PresentationTrack first08;
    PresentationTrack second18;
    s32 remaining28;
} SampledArcTimedSprite;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d60ac;
extern SampledArcTimedSprite *func_0201e290(SampledArcTimedSprite *self,
                                            u8 *config);
extern SampledArcTimedSprite *func_0201e380(SampledArcTimedSprite *self);
extern void func_0201e3b8(SampledArcTimedSprite *self, s32 enabled);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Assign(PresentationTrack *destination, const void *source);
extern void GraphicsSpriteState_SetScreenPositionCulled(void *sprite, s32 x, s32 y, s32 constant8);
extern void VecFx32_Subtract(void *output, s32 argument,
                          PresentationTrack *track);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the shared base from config, install this vtable, clear sprite
 * flag 2, copy config lifetime 0x30 and track 0x10, and return self.
 */
SampledArcTimedSprite *func_0201edd0(SampledArcTimedSprite *self, u8 *config)
{
    func_0201e290(self, config);
    self->vtable = data_020d60ac;
    *(u16 *)(self->sprite + 0x24) &= (u16)~2;
    self->remaining28 = *(s32 *)(config + 0x30);
    VecFx32Object_Assign(&self->first08, config + 0x10);
    return self;
}

/* Run the shared non-freeing teardown and return self. */
SampledArcTimedSprite *func_0201ee18(SampledArcTimedSprite *self)
{
    func_0201e380(self);
    return self;
}

/* Run the shared teardown, free self, and return its old address. */
SampledArcTimedSprite *func_0201ee2c(SampledArcTimedSprite *self)
{
    func_0201e380(self);
    Heap_Free(self);
    return self;
}

/*
 * Decrement lifetime and hide/finish on expiry or sprite status bit 1.
 * Otherwise clear sprite flag 4, sample first08 using argument, convert X to
 * integer pixels, subtract first08's Z from sampled Y, update the sprite with
 * recovered constant 8, destroy the sample, and return whether flag 8 is set.
 */
s32 func_0201ee48(SampledArcTimedSprite *self, s32 argument)
{
    s32 sample[4];
    s32 finished;

    self->remaining28--;
    if (self->remaining28 < 0 || (*(u16 *)(self->sprite + 0x24) & 1) != 0) {
        func_0201e3b8(self, 0);
        return 1;
    }
    *(u16 *)(self->sprite + 0x24) &= (u16)~4;
    VecFx32_Subtract(sample, argument, &self->first08);
    GraphicsSpriteState_SetScreenPositionCulled(self->sprite, sample[1] >> 12,
                  (sample[2] >> 12)
                      - (*(s32 *)&self->first08.bytes[0xc] >> 12),
                  8);
    finished = (*(u16 *)(self->sprite + 0x24) & 8) != 0;
    VecFx32Object_Destroy(sample);
    return finished;
}
