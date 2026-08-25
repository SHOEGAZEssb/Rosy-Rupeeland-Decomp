#include "tingle/types.h"

/* Overlay 22 centered counter drawing and the animated status/HUD widget. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern void *data_021f5128[];
extern const u8 data_ov022_02200608[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, ...);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_DrawText(void *, s32, s32, s32, ...);
extern s32 GraphicsSpriteRenderer_MeasureText(void *, s32, s32, s32);
extern s32 RecordMode_GetMessageGroup(void *);
extern s32 func_0209189c(void *, s32, s32);
extern s32 TitleRandom_NextBounded(void *, s32);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

extern "C" void func_ov022_021fd48c(void *widget);
extern "C" void func_ov022_021fd4d4(void *widget);
extern "C" void func_ov022_021fd514(void *widget);
extern "C" void func_ov022_021fd554(void *widget);
extern "C" void func_ov022_021fd594(void *widget);

/*
 * Draws the current value obtained from the first global mode record. It asks
 * the debug-font renderer for the width of an 8-digit, style -2 rendering,
 * halves that width with signed rounding, and draws the value centered on
 * x=64 at y=172 with style parameters 13, 8, and -2. Font/render state changes;
 * the function has no return value and performs no direct MMIO.
 */
extern "C" void func_ov022_021fd2f4(void)
{
    s32 value = RecordMode_GetMessageGroup(FIELD(void *, data_021f5128[0], 0x1c));
    s32 width = GraphicsSpriteRenderer_MeasureText(gDebugFont, value, 8, -2);
    s32 half = (width + (width >> 31)) >> 1;
    GraphicsSpriteRenderer_DrawText(gDebugFont, value, 64 - half, 172, 13, 8, -2);
}

/*
 * Constructs the status widget in caller-provided storage. It installs vtable
 * 0x02200608; initializes resource holders +4/+0x10 and the debug-font state;
 * loads resource triples 0x156F..0x1571 and 0x49..0x4B; creates the main sprite
 * at +0x20 and secondary sprite at +0x24; configures the main sprite fields;
 * and positions the secondary sprite at (64,84). SDK sprite/resource state is
 * created, no heap allocation occurs here, and the input pointer is returned.
 */
extern "C" void *func_ov022_021fd370(void *widget)
{
    FIELD(const void *, widget, 0) = data_ov022_02200608;
    AnimationResourceState_InitEmbedded((u8 *)widget + 4);
    AnimationResourceState_InitEmbedded((u8 *)widget + 0x10);
    FIELD(u32, widget, 0x30) = 0;
    func_ov022_021fd48c(widget);
    AnimationResourceState_ReplaceResources((u8 *)widget + 4, data_020f4e18,
                  0x156f, 0x1570, 0x1571);
    AnimationResourceState_ReplaceResources((u8 *)widget + 0x10, data_020f4e18,
                  0x49, 0x4a, 0x4b);
    void *main_sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, widget, 0x1c), (u8 *)widget + 4, 2);
    FIELD(void *, widget, 0x20) = main_sprite;
    FIELD(u8, main_sprite, 0x3a) = 2;
    FIELD(u16, main_sprite, 0x28) = 0x10;
    void *secondary = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, widget, 0x1c), (u8 *)widget + 0x10, 1);
    FIELD(void *, widget, 0x24) = secondary;
    GraphicsSpriteState_ApplyRenderConfig(secondary, 0, 0x40, 0x54, 2, 0, 0);
    return widget;
}

/*
 * Destroys a caller-owned status widget. It restores vtable 0x02200608,
 * releases the debug-font handle and both resource holders, and returns the
 * original address. Sprite/resource state changes; storage is not freed.
 */
extern "C" void *func_ov022_021fd458(void *widget)
{
    FIELD(const void *, widget, 0) = data_ov022_02200608;
    GraphicsSpriteGroup_Destroy(FIELD(void *, widget, 0x1c));
    AnimationResourceState_Destroy((u8 *)widget + 0x10);
    AnimationResourceState_Destroy((u8 *)widget + 4);
    return widget;
}

/*
 * Resets the status widget's runtime fields. It acquires the debug-font handle,
 * sets its +0x1C field to 96, clears sprite pointers +0x20/+0x24, selects mode
 * 1 at +0x28, clears delay +0x2C, and seeds RNG +0x30. SDK handle state and the
 * widget change; no value is returned.
 */
extern "C" void func_ov022_021fd48c(void *widget)
{
    void *font = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(void *, widget, 0x1c) = font;
    FIELD(s32, font, 0x1c) = 0x60;
    FIELD(void *, widget, 0x20) = 0;
    FIELD(void *, widget, 0x24) = 0;
    FIELD(s32, widget, 0x28) = 1;
    FIELD(s32, widget, 0x2c) = 0;
    FIELD(u32, widget, 0x30) = genrand_int32();
}

static void set_main_mode(void *widget, s32 mode, s32 animation)
{
    if (FIELD(s32, widget, 0x28) == mode)
        return;
    void *sprite = FIELD(void *, widget, 0x20);
    GraphicsSpriteState_SetAnimationIndex(sprite, animation);
    FIELD(u16, sprite, 0x24) =
        (FIELD(u16, sprite, 0x24) | 2) & (u16)~1;
    FIELD(s32, widget, 0x28) = mode;
}

/*
 * Selects status mode 2 using animation 3. If already selected it is a no-op;
 * otherwise main-sprite flag bit 1 is set, bit 0 cleared, and +0x28 becomes 2.
 */
extern "C" void func_ov022_021fd4d4(void *widget)
{
    set_main_mode(widget, 2, 3);
}

/*
 * Selects status mode 1 using animation 0. If already selected it is a no-op;
 * otherwise main-sprite flag bit 1 is set, bit 0 cleared, and +0x28 becomes 1.
 */
extern "C" void func_ov022_021fd514(void *widget)
{
    set_main_mode(widget, 1, 0);
}

/*
 * Selects status mode 3 using animation 2. If already selected it is a no-op;
 * otherwise main-sprite flag bit 1 is set, bit 0 cleared, and +0x28 becomes 3.
 */
extern "C" void func_ov022_021fd554(void *widget)
{
    set_main_mode(widget, 3, 2);
}

/*
 * Selects status mode 4 using animation 1. If already selected it is a no-op;
 * otherwise main-sprite flag bit 1 is set, bit 0 cleared, and +0x28 becomes 4.
 */
extern "C" void func_ov022_021fd594(void *widget)
{
    set_main_mode(widget, 4, 1);
}

/*
 * Maps external selector values 0..3 onto recovered status modes 2, 3, 4,
 * and 1 respectively. Values outside that range are ignored. The widget may
 * start a main-sprite animation; no value is returned.
 */
extern "C" void func_ov022_021fd5d4(void *widget, u32 selector)
{
    switch (selector) {
    case 0: func_ov022_021fd4d4(widget); break;
    case 1: func_ov022_021fd554(widget); break;
    case 2: func_ov022_021fd594(widget); break;
    case 3: func_ov022_021fd514(widget); break;
    }
}

/*
 * Advances the status widget's temporary mode-5 animation. Entering from mode
 * 1 samples a 30..240 delay and sets mode 5. While in mode 5 the delay counts
 * down; on expiry animation 4 or 5 is chosen randomly and sprite flag bits 0/1
 * are cleared. Once delay is already zero, a set sprite bit 0 returns the widget
 * to mode 1. Widget RNG, animation, flags, mode, and delay may change.
 */
extern "C" void func_ov022_021fd614(void *widget)
{
    switch (FIELD(s32, widget, 0x28)) {
    case 1:
        FIELD(s32, widget, 0x2c) =
            func_0209189c((u8 *)widget + 0x30, 30, 240);
        FIELD(s32, widget, 0x28) = 5;
        break;
    case 5:
        if (FIELD(s32, widget, 0x2c) != 0) {
            if (--FIELD(s32, widget, 0x2c) != 0)
                break;
            void *sprite = FIELD(void *, widget, 0x20);
            GraphicsSpriteState_SetAnimationIndex(sprite,
                         TitleRandom_NextBounded((u8 *)widget + 0x30, 3) != 0 ? 4 : 5);
            FIELD(u16, sprite, 0x24) &= (u16)~3;
        } else if ((FIELD(u16, FIELD(void *, widget, 0x20), 0x24) & 1) != 0) {
            func_ov022_021fd514(widget);
        }
        break;
    }
}

/*
 * Reports whether the status widget is in a transient/covered mode. The widget
 * is read only; returns one for mode 2 or 5 and zero for all other modes.
 */
extern "C" s32 func_ov022_021fd6dc(const void *widget)
{
    s32 mode = FIELD(s32, widget, 0x28);
    return mode == 2 || mode == 5;
}
