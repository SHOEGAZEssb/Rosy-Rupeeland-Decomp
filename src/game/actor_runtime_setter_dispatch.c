#include "tingle/types.h"

/* Apply numeric script/runtime properties to actor and attachment state. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorBounds_GetWidth(const s8 *bounds);
extern s32 ActorBounds_GetHeight(const s8 *bounds);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern void ActorBounds_Copy(void *destination, const void *source);
extern void ActorBounds_Set(void *bounds, s32 minX, s32 minY, s32 maxX,
                            s32 maxY);
extern void BoundsCenterSnapshot_Init(void *center, const void *bounds);
extern void ActorBounds_SetMinimum(void *bounds, s32 minX, s32 minY);
extern void Actor_SetAttachmentAnimation(void *actor, s32 value);
extern void Actor_SetAttachmentEnabled(void *actor, s32 value);
extern void func_020050a4(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/* Rebuild one signed-byte bounds extent while preserving its midpoint. */
static void setBoundsExtent(s8 *bounds, s32 value, s32 setHeight)
{
    u8 center[8];
    s8 replacement[4];
    s32 width;
    s32 height;

    BoundsCenterSnapshot_Init(center, bounds);
    width = ActorBounds_GetWidth(bounds);
    height = ActorBounds_GetHeight(bounds);
    if (setHeight) {
        ActorBounds_Set(replacement, 0, 0, width, (s8)value);
    } else {
        ActorBounds_Set(replacement, 0, 0, (s8)value, height);
    }
    ActorBounds_Copy(bounds, replacement);
    width = ActorBounds_GetWidth(bounds);
    height = ActorBounds_GetHeight(bounds);
    ActorBounds_SetMinimum(bounds,
                           (s8)center[4] + func_020adae4(width, -2),
                           (s8)center[5] + func_020adae4(height, -2));
}

/* Set or clear one actor word flag according to a zero/nonzero value. */
static void setWordFlag(u32 *flags, u32 mask, s32 value)
{
    if (value != 0) {
        *flags |= mask;
    } else {
        *flags &= ~mask;
    }
}

/*
 * Apply value through selector 0..50. Selectors 0..3 resize either bounds
 * record while retaining its recovered midpoint. Selectors 7..9 convert an
 * integer position to 20.12 and update both current and secondary positions.
 * Other supported selectors write actor flags/fields, mirror values into the
 * optional attachment at +0x58 where shown, or call the actor/attachment
 * helpers. Selectors 4, 6, 11..16, 19, 20, 27, 36..38, and 44..46 are
 * confirmed no-ops. Returns no value; selector 32 invokes vtable slot 0x98,
 * while selectors 10 and 42 can update presentation or SDK-managed state.
 */
void Actor_SetRuntimeProperty(void *self, u32 selector, s32 value)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    u8 *secondary = *(u8 **)(actor + 0x58);
    u16 attachmentValue;

    switch (selector) {
    case 0:
        setBoundsExtent((s8 *)actor + 8, value, 0);
        break;
    case 1:
        setBoundsExtent((s8 *)actor + 8, value, 1);
        break;
    case 2:
        setBoundsExtent((s8 *)actor + 4, value, 0);
        break;
    case 3:
        setBoundsExtent((s8 *)actor + 4, value, 1);
        break;
    case 5:
        setWordFlag((u32 *)(actor + 0x14), 0x10, value);
        break;
    case 7:
        *(s32 *)(actor + 0x2c) = value << 12;
        *(s32 *)(actor + 0x1c) = value << 12;
        break;
    case 8:
        *(s32 *)(actor + 0x30) = value << 12;
        *(s32 *)(actor + 0x20) = value << 12;
        break;
    case 9:
        *(s32 *)(actor + 0x34) = value << 12;
        *(s32 *)(actor + 0x24) = value << 12;
        break;
    case 10:
        Actor_SetAttachmentAnimation(actor, value);
        break;
    case 17:
        *(s32 *)(actor + 0xcc) = value;
        *(s32 *)(actor + 0xc8) = value;
        break;
    case 18:
        actor[0xe7] = (u8)value;
        break;
    case 21:
        *(s16 *)(attachment + 0x32) = (s16)value;
        if (secondary != 0) *(s16 *)(secondary + 0x32) = (s16)value;
        break;
    case 22:
        *(s16 *)(attachment + 0x34) = (s16)value;
        if (secondary != 0) *(s16 *)(secondary + 0x34) = (s16)value;
        break;
    case 23:
        setWordFlag((u32 *)(actor + 0x14), 0x8000, value);
        break;
    case 24:
        *(u16 *)(attachment + 0x28) = (u16)value;
        break;
    case 25:
        *(s8 *)(actor + 0x5e) = (s8)value;
        break;
    case 26:
        actor[0x1e4] = (u8)value;
        break;
    case 28:
        if (value != 0) {
            *(u16 *)(attachment + 0x24) |= 0x20;
            if (secondary != 0) *(u16 *)(secondary + 0x24) |= 0x20;
        } else {
            *(u16 *)(attachment + 0x24) &= (u16)~0x20;
            if (secondary != 0) *(u16 *)(secondary + 0x24) &= (u16)~0x20;
        }
        break;
    case 29:
        setWordFlag((u32 *)(actor + 0x14), 0x100000, value);
        break;
    case 30:
        actor[0x1e7] = (u8)value;
        break;
    case 31:
        *(u16 *)(actor + 0x1e8) = (u16)value;
        break;
    case 32:
        (*(void (**)(void *, s16))(*(u8 **)actor + 0x98))(actor, (s16)value);
        break;
    case 33:
        setWordFlag((u32 *)(actor + 0x10), 0x400, value);
        break;
    case 34:
        setWordFlag((u32 *)(actor + 0x14), 0x02000000, value);
        break;
    case 35:
        attachmentValue = (u16)(s16)value;
        *(u16 *)(attachment + 0x2a) = attachmentValue;
        if (secondary != 0) *(u16 *)(secondary + 0x2a) = attachmentValue;
        break;
    case 39:
        setWordFlag((u32 *)(actor + 0x14), 0x01000000, value);
        break;
    case 40:
        setWordFlag((u32 *)(actor + 0x14), 0x4000, value);
        break;
    case 41:
        setWordFlag((u32 *)(actor + 0x14), 0x2000, value);
        break;
    case 42:
        if (attachment != 0) Actor_SetAttachmentEnabled(actor, value);
        break;
    case 43:
        attachmentValue = (u16)(0x10000u - ((u32)value << 8));
        *(u16 *)(attachment + 0x30) = attachmentValue;
        if (secondary != 0) *(u16 *)(secondary + 0x30) = attachmentValue;
        break;
    case 47:
        func_020050a4(actor + 0x18, actor + 0x28);
        break;
    case 48:
        if (value != 0) {
            *(u16 *)(attachment + 0x24) |= 2;
            *(u16 *)(attachment + 0x24) &= (u16)~0x20;
        } else {
            *(u16 *)(attachment + 0x24) &= (u16)~2;
        }
        *(u16 *)(attachment + 0x24) &= (u16)~1;
        break;
    case 49:
        setWordFlag((u32 *)(actor + 0x14), 0x40000000, value);
        break;
    case 50:
        setWordFlag((u32 *)(actor + 0x14), 0x1000, value);
        break;
    default:
        break;
    }
}
