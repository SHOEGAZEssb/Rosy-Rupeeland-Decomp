#include "tingle/types.h"

/* Coordinate attachment animation and forward actor geometry updates. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02057084(s32 x, s32 y);
extern void GraphicsSpriteState_SetAnimationIndex(void *attachment, u32 animation);
extern void func_020050a4(void *destination, const void *source);
extern void ActorBounds_Translate(void *bounds, s32 x, s32 y);
extern void Position_AdjustForTerrainHeight(void *position);
#ifdef __cplusplus
}
#endif

/*
 * If actor+0x54 has an attachment, derive a direction from the supplied 20.12
 * coordinates, save it at actor+0xd4, and select the attachment animation
 * indexed by that direction plus byte 0xe7. The attachment's halfword flags
 * at 0x24 have bits 0x40 and 1 cleared and bit 2 set. Returns no value; the
 * direction and animation helpers can update presentation state.
 */
void Actor_UpdateAttachmentDirectionFromVector(void *self, s32 x, s32 y)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    s32 direction;

    if (attachment == 0) {
        return;
    }

    direction = func_02057084(x, y);
    actor[0xd4] = (u8)direction;
    GraphicsSpriteState_SetAnimationIndex(attachment, (direction + actor[0xe7]) & 0xff);
    *(u16 *)(attachment + 0x24) &= (u16)~0x40;
    *(u16 *)(attachment + 0x24) &= (u16)~1;
    *(u16 *)(attachment + 0x24) |= 2;
}

/* Copy the supplied vector into actor+0x38; returns no value. */
void Actor_SetVelocity(void *self, const void *value)
{
    func_020050a4((u8 *)self + 0x38, value);
}

/* Update the signed-byte bounds at actor+8 from x and y; returns no value. */
void Actor_TranslateSecondaryBounds(void *self, s32 x, s32 y)
{
    ActorBounds_Translate((u8 *)self + 8, x, y);
}

/* Update the signed-byte bounds at actor+4 from x and y; returns no value. */
void Actor_TranslateCollisionBounds(void *self, s32 x, s32 y)
{
    ActorBounds_Translate((u8 *)self + 4, x, y);
}

/* Snap the actor's position at +0x18 to a matching terrain height; returns no value. */
void Actor_AdjustPositionForTerrainHeight(void *self)
{
    Position_AdjustForTerrainHeight((u8 *)self + 0x18);
}
