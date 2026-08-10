#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a presentation wrapper around the sampled-arc timed sprite.  It
 * builds the sprite's temporary tracks, owns the resulting presentation, and
 * updates it from the global runtime position until the child reports done.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct SampledArcSpriteConfig {
    void *spriteGroup;
    s32 field04;
    s32 field08;
    s32 field0c;
    PresentationTrack first10;
    PresentationTrack second20;
    s32 lifetime30;
    s32 field34;
} SampledArcSpriteConfig;

typedef struct SampledArcPresentation {
    void **vtable;
    u32 field04;
    void *presentation08;
} SampledArcPresentation;

typedef void *(*PresentationDestroy)(void *presentation);
typedef s32 (*PresentationUpdate)(void *presentation, const void *position);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d61d0;
extern const char gTimedSpritePresentationAllocationTag[];
extern u8 *data_021052fc;
extern void *func_0201e250(void *self);
extern SampledArcSpriteConfig *TimedSpriteConfig_InitTracks(
    SampledArcSpriteConfig *config);
extern void *func_0201edd0(void *self, SampledArcSpriteConfig *config);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Assign(PresentationTrack *destination, const void *source);
extern void *ActorMotionAreaFollower_GetPosition(void *source);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the recovered base and this vtable.  Build a temporary config
 * from spriteGroup and the three recovered fields, copy trackSource, set its
 * lifetime to 1200 and field34 to 2, and clear the second track's recovered
 * X/Y.  Allocate and initialize a 0x2c-byte sampled-arc child, retain it, write
 * spriteOffset to nested sprite halfword 0x28 and constant 2 to byte 0x3a,
 * destroy both temporary tracks, and return self.  The retail path dereferences
 * the retained child after allocation without a null guard.
 */
SampledArcPresentation *func_0201f598(
    SampledArcPresentation *self, const PresentationTrack *trackSource,
    void *spriteGroup, s32 field04, s32 field08, s32 field0c,
    s32 spriteOffset)
{
    SampledArcSpriteConfig config;
    void *presentation;
    u8 *sprite;

    func_0201e250(self);
    self->vtable = (void **)data_020d61d0;
    TimedSpriteConfig_InitTracks(&config);
    config.spriteGroup = spriteGroup;
    config.field04 = field04;
    config.field08 = field08;
    config.field0c = field0c;
    VecFx32Object_Assign(&config.first10, trackSource);
    config.field34 = 2;
    config.lifetime30 = 1200;
    *(s32 *)&config.second20.bytes[4] = 0;
    *(s32 *)&config.second20.bytes[8] = 0;
    presentation = Heap_Alloc(0x2c, gTimedSpritePresentationAllocationTag, 4, &gHeapContext);
    if (presentation != 0) {
        func_0201edd0(presentation, &config);
    }
    self->presentation08 = presentation;
    sprite = *(u8 **)((u8 *)presentation + 4);
    *(u16 *)(sprite + 0x28) = (u16)spriteOffset;
    sprite[0x3a] = 2;
    VecFx32Object_Destroy(&config.second20);
    VecFx32Object_Destroy(&config.first10);
    return self;
}

/* Install this vtable, destroy the nonnull child through slot 1, and return self. */
SampledArcPresentation *func_0201f670(SampledArcPresentation *self)
{
    self->vtable = (void **)data_020d61d0;
    if (self->presentation08 != 0) {
        ((PresentationDestroy)(*(void ***)self->presentation08)[1])(
            self->presentation08);
    }
    return self;
}

/* Perform func_0201f670's teardown, free self, and return its old address. */
SampledArcPresentation *func_0201f6a4(SampledArcPresentation *self)
{
    func_0201f670(self);
    Heap_Free(self);
    return self;
}

/*
 * Obtain the global runtime position at offset 0x2fbc, pass it to child vtable
 * slot 2, and return the child's result normalized to zero or one.
 */
s32 func_0201f6e0(SampledArcPresentation *self)
{
    const void *position = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
    return ((PresentationUpdate)(*(void ***)self->presentation08)[2])(
               self->presentation08, position)
           != 0;
}
