
/* Portable reconstruction of the sprite-motion controller constructor at
 * 0x020957bc, including its recovered base-object initialization. */
#include "tingle/types.h"

extern u8 data_020f26e0[];
extern void Presentation_Init(void *object);
extern void func_02072b68(void *sprite, u32 animation);
extern void PresentationScalar_SetImmediate(void *component, s32 value);
extern void PresentationScalar_TransitionTo(void *component, s32 mode, s32 target);
extern s32 Presentation_AdvanceTransitions(void *object);
extern s32 func_02092910(void *sprite, const void *point);

void *func_020957bc(void *object)
{
    u8 *bytes = (u8 *)object;

    Presentation_Init(object);
    *(void **)(bytes + 0x00) = data_020f26e0;
    *(u32 *)(bytes + 0x9c) = 0;
    *(u32 *)(bytes + 0xa8) = 0;
    *(u32 *)(bytes + 0xa0) = 0;
    *(u32 *)(bytes + 0xa4) = 0;
    return object;
}

/* Attach a sprite state to the controller and reproduce the retail animation,
 * display-mode, and attribute initialization performed at 0x020957f0. */
void func_020957f0(void *object, void *sprite, s32 animation,
                   s32 display_mode, s32 attribute)
{
    u8 *bytes = (u8 *)object;
    u8 *sprite_bytes = (u8 *)sprite;

    *(void **)(bytes + 0x9c) = sprite;
    func_02072b68(sprite, (u32)animation & 0xffu);
    sprite_bytes[0x3a] = (u8)display_mode;
    *(u16 *)(sprite_bytes + 0x28) = (u16)attribute;
}

/* Set the controller's 20.12 fixed-point position and reset its Z component,
 * matching 0x02095820. */
void func_02095820(void *object, s32 x, s32 y)
{
    u8 *bytes = (u8 *)object;
    s32 fixed_x = x << 12;
    s32 fixed_y = y << 12;

    *(s32 *)(bytes + 0xa0) = fixed_x;
    *(s32 *)(bytes + 0xa4) = fixed_y;
    PresentationScalar_SetImmediate(bytes + 0x0c, fixed_x);
    PresentationScalar_SetImmediate(bytes + 0x1c, fixed_y);
    PresentationScalar_SetImmediate(bytes + 0x2c, 0);
}

/*
 * Hit-test a controller and start its retail two-axis response motion
 * (0x02095860). Offsets are integer pixels converted to 20.12 targets; the
 * six-frame completion counter is reset only on a successful opaque hit.
 */
s32 func_02095860(void *object, const void *point,
                  s32 xOffset, s32 yOffset)
{
    u8 *bytes = (u8 *)object;
    s32 hit = func_02092910(*(void **)(bytes + 0x9c), point);

    if (hit) {
        PresentationScalar_SetImmediate(bytes + 0x0c, *(s32 *)(bytes + 0xa0));
        PresentationScalar_SetImmediate(bytes + 0x1c, *(s32 *)(bytes + 0xa4));
        PresentationScalar_TransitionTo(bytes + 0x0c, 3,
                      *(s32 *)(bytes + 0xa0) + (xOffset << 12));
        PresentationScalar_TransitionTo(bytes + 0x1c, 3,
                      *(s32 *)(bytes + 0xa4) + (yOffset << 12));
        *(s32 *)(bytes + 0x7c) = 6;
        *(s32 *)(bytes + 0x80) = 0;
    }
    return hit;
}

/* Retail sprite visibility controls at 0x02095928..0x02095988. */
void func_02095928(void *object)
{
    u8 *sprite = *(u8 **)((u8 *)object + 0x9c);
    if (sprite != 0) {
        *(u32 *)(sprite + 0x24) &= ~4u;
    }
}

void func_02095940(void *object)
{
    u8 *sprite = *(u8 **)((u8 *)object + 0x9c);
    if (sprite != 0) {
        *(u32 *)(sprite + 0x24) |= 4u;
    }
}

s32 func_02095958(void *object)
{
    u8 *sprite = *(u8 **)((u8 *)object + 0x9c);
    if (sprite == 0) {
        return 0;
    }
    return (*(u16 *)(sprite + 0x24) & 4u) == 0;
}

void func_02095988(void *object, s32 animation)
{
    void *sprite = *(void **)((u8 *)object + 0x9c);
    if (sprite != 0) {
        func_02072b68(sprite, (u32)animation & 0xffu);
    }
}

/* Advance controller interpolation and publish its rounded coordinates. */
void func_020958f0(void *object)
{
    u8 *bytes = (u8 *)object;
    u8 *sprite = *(u8 **)(bytes + 0x9c);
    s32 x;
    s32 y;

    if (sprite == 0)
        return;
    x = *(s32 *)(bytes + 0x10);
    y = *(s32 *)(bytes + 0x20);
    *(u16 *)(sprite + 0x2c) = (u16)((x + ((x >> 11) < 0 ? 0xfff : 0)) >> 12);
    *(u16 *)(sprite + 0x2e) = (u16)((y + ((y >> 11) < 0 ? 0xfff : 0)) >> 12);
}

void func_020958d8(void *object)
{
    Presentation_AdvanceTransitions(object);
    func_020958f0(object);
}

