#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a timed-sprite wrapper that owns an offset-sprite presentation and
 * a separate four-word auxiliary value.  The auxiliary supplies three config
 * words to the child and both allocations are destroyed polymorphically.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct AuxiliarySpriteConfig {
    void *spriteGroup;
    s32 field04;
    s32 field08;
    s32 field0c;
    PresentationTrack first10;
    PresentationTrack second20;
    s32 lifetime30;
    s32 field34;
} AuxiliarySpriteConfig;

typedef struct AuxiliaryTimedSpritePresentation {
    void **vtable;
    u32 dispatchState;
    void *presentation08;
    u8 *auxiliary0c;
    s16 timer10;
    s16 spriteByte12;
} AuxiliaryTimedSpritePresentation;

typedef void *(*OwnedDestroy)(void *object);
typedef s32 (*ChildUpdate)(void *child, const void *position);

#ifdef __cplusplus
extern "C" {
#endif
extern void *gAuxiliaryTimedSpritePresentationVtable;
extern const char gTimedSpriteAuxiliaryAllocationTag[];
extern u8 *data_021052fc;

extern AuxiliarySpriteConfig *TimedSpriteConfig_InitTracks(AuxiliarySpriteConfig *config);
extern void *AnimationResource_Init(void *self, s32 first, s32 second, s32 third);
extern void *func_0201e584(void *self, AuxiliarySpriteConfig *config,
                           s32 spriteValue, s32 offset);
extern void VecFx32Object_Destroy(void *track);
extern void VecFx32Object_Assign(PresentationTrack *destination, const void *source);
extern void *ActorMotionAreaFollower_GetPosition(void *source);
extern void PresentationList_AppendObject(void *manager, void *entry);
#ifdef __cplusplus
}
#endif

static AuxiliaryTimedSpritePresentation *initialize_auxiliary_presentation(
    AuxiliaryTimedSpritePresentation *self,
    const PresentationTrack *trackSource, void *spriteGroup, s32 auxiliaryFirst,
    s32 auxiliarySecond, s32 auxiliaryThird, s32 spriteValue, s32 offset,
    s32 spriteByte, s32 registerWithManager)
{
    AuxiliarySpriteConfig config;
    void *child;

    FieldEffect_Init(self);
    self->vtable = (void **)gAuxiliaryTimedSpritePresentationVtable;
    self->auxiliary0c =
        (u8 *)Heap_Alloc(0x10, gTimedSpriteAuxiliaryAllocationTag, 4, &gHeapContext);
    if (self->auxiliary0c != 0) {
        AnimationResource_Init(self->auxiliary0c, auxiliaryFirst, auxiliarySecond,
                      auxiliaryThird);
    }
    TimedSpriteConfig_InitTracks(&config);
    config.spriteGroup = spriteGroup;
    config.field04 = *(s32 *)(self->auxiliary0c + 4);
    config.field08 = *(s32 *)(self->auxiliary0c + 8);
    config.field0c = *(s32 *)(self->auxiliary0c + 0xc);
    VecFx32Object_Assign(&config.first10, trackSource);
    config.field34 = 2;
    config.lifetime30 = 120;
    *(s32 *)&config.second20.bytes[4] = 0;
    *(s32 *)&config.second20.bytes[8] = 0;
    child = Heap_Alloc(0x30, gTimedSpriteAuxiliaryAllocationTag, 4, &gHeapContext);
    if (child != 0) {
        func_0201e584(child, &config, spriteValue & 0xff, offset);
    }
    self->presentation08 = child;
    self->timer10 = 120;
    self->spriteByte12 = (s16)spriteByte;
    if (registerWithManager != 0) {
        PresentationList_AppendObject(data_021052fc + 0x2f7c, self);
    }
    VecFx32Object_Destroy(&config.second20);
    VecFx32Object_Destroy(&config.first10);
    return self;
}

/*
 * Initialize the FieldEffect base and this vtable; allocate/construct the
 * 0x10-byte auxiliary from three inputs; use its words 0x04/0x08/0x0c plus
 * spriteGroup and trackSource to build a 120-frame config; allocate a 0x30-byte
 * offset-sprite child using the low byte of spriteValue and offset; retain a
 * 120-frame wrapper timer and spriteByte; optionally register self with the
 * runtime manager at offset 0x2f7c; destroy temporary tracks and return self.
 * Retail code dereferences the auxiliary even when its allocation failed.
 */
AuxiliaryTimedSpritePresentation *AuxiliaryTimedSpritePresentation_InitBase(
    AuxiliaryTimedSpritePresentation *self,
    const PresentationTrack *trackSource, void *spriteGroup, s32 auxiliaryFirst,
    s32 auxiliarySecond, s32 auxiliaryThird, s32 spriteValue, s32 offset,
    s32 spriteByte, s32 registerWithManager)
{
    return initialize_auxiliary_presentation(
        self, trackSource, spriteGroup, auxiliaryFirst, auxiliarySecond,
        auxiliaryThird, spriteValue, offset, spriteByte, registerWithManager);
}

/* Duplicate constructor retained for its distinct retail entry point. */
AuxiliaryTimedSpritePresentation *AuxiliaryTimedSpritePresentation_Init(
    AuxiliaryTimedSpritePresentation *self,
    const PresentationTrack *trackSource, void *spriteGroup, s32 auxiliaryFirst,
    s32 auxiliarySecond, s32 auxiliaryThird, s32 spriteValue, s32 offset,
    s32 spriteByte, s32 registerWithManager)
{
    return initialize_auxiliary_presentation(
        self, trackSource, spriteGroup, auxiliaryFirst, auxiliarySecond,
        auxiliaryThird, spriteValue, offset, spriteByte, registerWithManager);
}

/*
 * Install this vtable, destroy the child and auxiliary through vtable slot 1
 * when nonnull, and return self without freeing it.
 */
AuxiliaryTimedSpritePresentation *AuxiliaryTimedSpritePresentation_Destroy(
    AuxiliaryTimedSpritePresentation *self)
{
    self->vtable = (void **)gAuxiliaryTimedSpritePresentationVtable;
    if (self->presentation08 != 0) {
        ((OwnedDestroy)(*(void ***)self->presentation08)[1])(
            self->presentation08);
    }
    if (self->auxiliary0c != 0) {
        ((OwnedDestroy)(*(void ***)self->auxiliary0c)[1])(self->auxiliary0c);
    }
    return self;
}

/* Destroy both owned objects, free self, and return its old address. */
AuxiliaryTimedSpritePresentation *AuxiliaryTimedSpritePresentation_DestroyAndFree(
    AuxiliaryTimedSpritePresentation *self)
{
    AuxiliaryTimedSpritePresentation_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Duplicate non-freeing teardown retained for a distinct virtual-table slot. */
AuxiliaryTimedSpritePresentation *AuxiliaryTimedSpritePresentation_DestroyBase(
    AuxiliaryTimedSpritePresentation *self)
{
    return AuxiliaryTimedSpritePresentation_Destroy(self);
}

/*
 * Obtain the global position at runtime offset 0x2fbc and pass it to child
 * vtable slot 2, ignoring that return value.  Apply spriteByte12 to the nested
 * sprite byte 0x3a unless it is -1, decrement timer10, and return whether the
 * timer became negative.
 */
s32 AuxiliaryTimedSpritePresentation_Update(AuxiliaryTimedSpritePresentation *self)
{
    const void *position = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
    ((ChildUpdate)(*(void ***)self->presentation08)[2])(
        self->presentation08, position);
    if (self->spriteByte12 != -1) {
        u8 *sprite = *(u8 **)((u8 *)self->presentation08 + 4);
        sprite[0x3a] = (u8)self->spriteByte12;
    }
    self->timer10--;
    return self->timer10 < 0;
}
