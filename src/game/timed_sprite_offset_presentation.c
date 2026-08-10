#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a short-lived presentation wrapper around the offset timed-sprite
 * variant.  It builds the sprite's temporary config, owns the resulting
 * presentation object, follows a global runtime position, and exposes a
 * separate 900-frame timeout and optional sprite-byte override.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct OffsetSpriteConfig {
    void *spriteGroup;
    s32 field04;
    s32 field08;
    s32 field0c;
    PresentationTrack first10;
    PresentationTrack second20;
    s32 lifetime30;
    s32 field34;
} OffsetSpriteConfig;

typedef struct TimedSpriteOffsetPresentation {
    void **vtable;
    u32 field04;
    void *presentation08;
    void *spriteGroup0c;
    s16 timer10;
    s16 spriteByte12;
} TimedSpriteOffsetPresentation;

typedef void *(*PresentationDestroy)(void *presentation);
typedef s32 (*PresentationUpdate)(void *presentation, const void *position);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d61f8;
extern const char gTimedSpritePresentationAllocationTag[];
extern u8 *data_021052fc;
extern void *func_0201e250(void *self);
extern OffsetSpriteConfig *TimedSpriteConfig_InitTracks(OffsetSpriteConfig *config);
extern void *func_0201e584(void *self, OffsetSpriteConfig *config,
                           s32 spriteValue, s32 offset);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Assign(PresentationTrack *destination, const void *source);
extern void *ActorMotionAreaFollower_GetPosition(void *source);
#ifdef __cplusplus
}
#endif

void func_0201f458(TimedSpriteOffsetPresentation *self,
                   const PresentationTrack *trackSource, s32 spriteValue,
                   void *spriteGroup, s32 field04, s32 field08, s32 field0c,
                   s32 offset, s32 spriteByte);

/*
 * Initialize the recovered base, install this wrapper's vtable, forward all
 * remaining inputs to func_0201f458, and return self.
 */
TimedSpriteOffsetPresentation *func_0201f378(
    TimedSpriteOffsetPresentation *self,
    const PresentationTrack *trackSource, s32 spriteValue, void *spriteGroup,
    s32 field04, s32 field08, s32 field0c, s32 offset, s32 spriteByte)
{
    func_0201e250(self);
    self->vtable = (void **)data_020d61f8;
    func_0201f458(self, trackSource, spriteValue, spriteGroup, field04,
                  field08, field0c, offset, spriteByte);
    return self;
}

/*
 * Install the wrapper vtable and invoke vtable slot 1 on presentation08 when
 * nonnull.  Return self without freeing it.
 */
TimedSpriteOffsetPresentation *func_0201f3e8(
    TimedSpriteOffsetPresentation *self)
{
    self->vtable = (void **)data_020d61f8;
    if (self->presentation08 != 0) {
        ((PresentationDestroy)(*(void ***)self->presentation08)[1])(
            self->presentation08);
    }
    return self;
}

/* Perform func_0201f3e8's teardown, free self, and return its old address. */
TimedSpriteOffsetPresentation *func_0201f41c(
    TimedSpriteOffsetPresentation *self)
{
    func_0201f3e8(self);
    Heap_Free(self);
    return self;
}

/*
 * Construct a temporary two-track config using spriteGroup and the three
 * recovered config fields, copy trackSource into its first track, set lifetime
 * 900 and field34 2, and zero the second track's recovered X/Y fields.  Allocate
 * a 0x30-byte offset timed sprite, initialize it with spriteValue and offset,
 * retain it at 0x08, set the wrapper's 900-frame timer and spriteByte, then
 * destroy both temporary tracks.  Allocation failure remains a null pointer.
 */
void func_0201f458(TimedSpriteOffsetPresentation *self,
                   const PresentationTrack *trackSource, s32 spriteValue,
                   void *spriteGroup, s32 field04, s32 field08, s32 field0c,
                   s32 offset, s32 spriteByte)
{
    OffsetSpriteConfig config;
    void *presentation;

    TimedSpriteConfig_InitTracks(&config);
    self->spriteGroup0c = spriteGroup;
    config.spriteGroup = spriteGroup;
    config.field04 = field04;
    config.field08 = field08;
    config.field0c = field0c;
    VecFx32Object_Assign(&config.first10, trackSource);
    config.field34 = 2;
    config.lifetime30 = 900;
    *(s32 *)&config.second20.bytes[4] = 0;
    *(s32 *)&config.second20.bytes[8] = 0;
    presentation = Heap_Alloc(0x30, gTimedSpritePresentationAllocationTag, 4, &gHeapContext);
    if (presentation != 0) {
        func_0201e584(presentation, &config, spriteValue, offset);
    }
    self->presentation08 = presentation;
    self->timer10 = 900;
    self->spriteByte12 = (s16)spriteByte;
    VecFx32Object_Destroy(&config.second20);
    VecFx32Object_Destroy(&config.first10);
}

/*
 * Obtain the current global position from runtime offset 0x2fbc and call
 * presentation vtable slot 2.  Return one immediately if it finishes.
 * Otherwise apply spriteByte12 to nested sprite byte 0x3a unless it is -1,
 * decrement timer10, and return whether that timer became negative.
 */
s32 func_0201f520(TimedSpriteOffsetPresentation *self)
{
    const void *position = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
    s32 finished =
        ((PresentationUpdate)(*(void ***)self->presentation08)[2])(
            self->presentation08, position);

    if (finished != 0) {
        return 1;
    }
    if (self->spriteByte12 != -1) {
        u8 *sprite = *(u8 **)((u8 *)self->presentation08 + 4);
        sprite[0x3a] = (u8)self->spriteByte12;
    }
    self->timer10--;
    return self->timer10 < 0;
}
