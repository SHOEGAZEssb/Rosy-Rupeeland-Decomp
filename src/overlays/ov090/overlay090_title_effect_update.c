#include "tingle/graphics_sprite_state.h"
#include "tingle/types.h"
#include "tingle/util_animation_resource.h"

/* Per-frame update for the double-buffered phase-90 title sprite effect. */

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

extern const void *data_ov090_0221cc88[];
extern s32 DisplayController_GetVerticalOffset(void);
extern u32 genrand_int32(void);
extern u64 func_020bf1f8(u32 value, u32 divisor);
extern void func_ov090_0221b97c(void *resource, u16 flags);
extern void func_ov090_0221bc5c(void *resource, u16 flags);
extern void func_ov090_0221c170(void *resource, u8 value);
extern void func_ov090_0221c68c(void *self, s32 targetX, s32 targetY);
extern void func_ov090_0221c728(void *resource, s32 angle);
extern void func_ov090_0221c9f8(void *resource, s32 frame);
extern void func_ov090_0221ca14(TouchPoint *destination,
                                const TouchPoint *source);

/* Return whether either sprite in a paired animation resource has flag bit 0 set. */
static s32 TitleSpriteEffect_AnimationActive(
    const UtilAnimationResource *resource)
{
    return ((((GraphicsSpriteState *)resource->handles[0])->flags & 1) != 0 ||
            (((GraphicsSpriteState *)resource->handles[1])->flags & 1) != 0);
}

/*
 * Place and orient the primary sprites, mirror them into the optional secondary
 * pair while its transition is active, and periodically restart the secondary
 * animation after a randomized 60..149-frame delay. Both resources are then
 * submitted with the current NDS display vertical offset.
 */
void func_ov090_0221c780(TitleSpriteEffect *self, s32 x, s32 y,
                         s32 targetX, s32 targetY, s32 animation,
                         s32 palette, s32 frame)
{
    TouchPoint template;
    TouchPoint position;
    TouchPoint secondaryPosition;
    GraphicsSpriteState *sprite;
    s32 placedX;
    s32 placedY;
    s32 placedFrame;

    func_ov090_0221bc5c(self->primary, 4);
    placedX = (s16)(x + self->xOffset);
    placedY = (s16)(y + self->yOffset);
    placedFrame = (s16)(frame - 1);
    sprite = (GraphicsSpriteState *)self->primary->handles[0];
    if (animation != sprite->animationIndex) {
        GraphicsSpriteState_SetAnimationIndex(
            (GraphicsSpriteState *)self->primary->handles[0],
            (u8)animation);
        GraphicsSpriteState_SetAnimationIndex(
            (GraphicsSpriteState *)self->primary->handles[1],
            (u8)animation);
    }
    self->primary->position.x = placedX;
    self->primary->position.y = placedY;
    func_ov090_0221c9f8(self->primary, placedFrame);
    func_ov090_0221c170(self->primary, (u8)palette);

    if ((self->flags >> 8) != 0) {
        func_ov090_0221c728(
            self->primary,
            (s16)(u16)(((GraphicsSpriteState *)self->primary->handles[0])
                               ->field_30 +
                           0x200));
    } else {
        func_ov090_0221c68c(self, targetX, targetY);
    }

    if (self->secondary != 0) {
        if ((self->flags & 2) != 0) {
            if (TitleSpriteEffect_AnimationActive(self->secondary)) {
                self->flags &= ~2;
                func_ov090_0221b97c(self->secondary, 4);
            } else {
                func_ov090_0221bc5c(self->secondary, 4);
                self->secondary->position.x = placedX;
                self->secondary->position.y = placedY;
                func_ov090_0221c9f8(self->secondary, placedFrame);
                func_ov090_0221c170(self->secondary, (u8)palette);
            }
        } else if ((self->flags & 1) != 0) {
            if (self->delay != 0) {
                self->delay--;
            } else {
                u8 currentAnimation =
                    ((GraphicsSpriteState *)self->secondary->handles[0])
                        ->animationIndex;
                self->flags |= 2;
                GraphicsSpriteState_SetAnimationIndex(
                    (GraphicsSpriteState *)self->secondary->handles[0],
                    currentAnimation);
                GraphicsSpriteState_SetAnimationIndex(
                    (GraphicsSpriteState *)self->secondary->handles[1],
                    currentAnimation);
                func_ov090_0221bc5c(self->secondary, 5);
                self->delay =
                    (s16)((s32)(func_020bf1f8(genrand_int32(), 0x5a) >> 32) +
                          0x3c);
            }
        }
    }

    template.vtable = (TouchPointVTable *)data_ov090_0221cc88;
    template.x = 0;
    template.y = -0xc0 - DisplayController_GetVerticalOffset();
    func_ov090_0221ca14(&position, &template);
    UtilAnimationResource_UpdatePosition(self->primary, &position);
    if (self->secondary != 0) {
        func_ov090_0221ca14(&secondaryPosition, &template);
        UtilAnimationResource_UpdatePosition(self->secondary,
                                             &secondaryPosition);
    }
}
