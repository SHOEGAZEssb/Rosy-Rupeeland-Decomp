#include "tingle/graphics_sprite_state.h"
#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/util_animation_resource.h"

/* Constructor for the optional double-buffered phase-90 title sprite effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleSpriteEffect {
    const void *vtable;
    UtilAnimationResource *primary;
    UtilAnimationResource *secondary;
    s16 xOffset;
    s16 yOffset;
    u16 flags;
    s16 delay;
} TitleSpriteEffect;

extern const void *data_ov090_0221ccc8[];
extern const char data_ov090_0221ccd0[];
extern s32 DisplayController_GetVerticalOffset(void);
extern void func_ov090_0221b97c(void *resource, u16 flags);

/*
 * Store coordinate offsets, create the primary paired-sprite resource, and
 * optionally create a secondary resource when `animation` is positive. The
 * low six animation bits are retained in flag bits 2..7; both secondary
 * sprites receive that animation index. Returns the initialized effect.
 */
TitleSpriteEffect *func_ov090_0221c468(
    TitleSpriteEffect *self, void *owner0, void *owner1,
    const void *resources, s32 xOffset, s32 yOffset, s32 animation)
{
    void *resource2;
    void *resource1;
    void *resource0;
    UtilAnimationResource *resource;

    self->vtable = data_ov090_0221ccc8;
    self->xOffset = xOffset;
    self->yOffset = yOffset;
    self->flags &= ~2;
    self->flags &= ~0xff00;
    self->delay = 0;

    resource = (UtilAnimationResource *)Heap_Alloc(
        sizeof(UtilAnimationResource), data_ov090_0221ccd0, 4,
        &gHeapContext);
    if (resource != 0) {
        /* Retail retains these three words across the display-offset call. */
        resource2 = FIELD(void *, resources, 0x0c);
        resource1 = FIELD(void *, resources, 8);
        resource0 = FIELD(void *, resources, 4);
        resource = UtilAnimationResource_Init(
            resource, 0, owner0, owner1, 2, resource0, resource1, resource2,
            DisplayController_GetVerticalOffset());
    }
    self->primary = resource;
    func_ov090_0221b97c(resource, 4);

    if (animation > 0) {
        resource = (UtilAnimationResource *)Heap_Alloc(
            sizeof(UtilAnimationResource), data_ov090_0221ccd0, 4,
            &gHeapContext);
        if (resource != 0) {
            /* The secondary allocation repeats the same retained-word ABI. */
            resource2 = FIELD(void *, resources, 0x0c);
            resource1 = FIELD(void *, resources, 8);
            resource0 = FIELD(void *, resources, 4);
            resource = UtilAnimationResource_Init(
                resource, 0, owner0, owner1, 2, resource0, resource1,
                resource2,
                DisplayController_GetVerticalOffset());
        }
        self->secondary = resource;
        GraphicsSpriteState_SetAnimationIndex(
            (GraphicsSpriteState *)resource->handles[0], (u8)animation);
        GraphicsSpriteState_SetAnimationIndex(
            (GraphicsSpriteState *)resource->handles[1], (u8)animation);
        self->flags = (self->flags & ~0xfc) | (((u16)animation & 0x3f) << 2);
    } else {
        self->secondary = 0;
        self->flags &= ~0xfc;
    }
    return self;
}
