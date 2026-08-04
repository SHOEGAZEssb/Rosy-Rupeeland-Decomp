#include "tingle/game_phase_area_scene.h"

/* Restore sub-screen graphics state and enable or disable area-scene rendering. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GX_SetBankForSubBG(s32 bank);
extern void GXS_SetGraphicsMode(s32 mode);
extern void func_020aea7c(s32 value);
extern void func_0202d68c(void *renderer, s32 enabled);
extern s32 func_0202844c(GamePhaseAreaSceneConfig *config);
extern void func_ov056_0220ee78(void *object);
extern void func_ov056_0220ee20(void *object, s32 enabled);
#ifdef __cplusplus
}
#endif

typedef void (*AreaControlVirtual)(void *self, s32 value);
typedef void (*AreaControlNoArgs)(void *self);

static void callVirtual(void *object, u32 offset, s32 value)
{
    AreaControlVirtual method =
        *(AreaControlVirtual *)(*(u8 **)object + offset);
    method(object, value);
}

/*
 * Restore sub-BG bank 4 and graphics mode 0, enable/update/draw the optional
 * sub-renderer through virtual methods 0x20/0x08/0x1c, restore the optional
 * overlay object and BG priorities 3/2, then enable the whole area scene via
 * func_020122a0. Directly changes sub-engine VRAM and BG control hardware.
 */
void func_020121f8(GamePhaseAreaScene *self)
{
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    GXS_SetGraphicsMode(0);
    if (self->subRenderer_04) {
        callVirtual(self->subRenderer_04, 0x20, 1);
        (*(AreaControlNoArgs *)(*(u8 **)self->subRenderer_04 + 8))(
            self->subRenderer_04);
        (*(AreaControlNoArgs *)(*(u8 **)self->subRenderer_04 + 0x1c))(
            self->subRenderer_04);
    }
    if (self->field_2ed0) {
        volatile u16 *subBg0 = (volatile u16 *)0x0400100c;
        func_ov056_0220ee78((void *)self->field_2ed0);
        *subBg0 = (u16)((*subBg0 & ~3) | 3);
        subBg0[1] = (u16)((subBg0[1] & ~3) | 2);
    }
    func_020122a0(self, 1);
}

/*
 * Propagate enabled to the embedded renderer, sub-renderer virtual method
 * 0x24, optional overlay, and field_2ebc virtual method 0x54. Config modes 0/3
 * use the caller value but pass zero to field_2ebc; other modes only force an
 * enabled state when config flags40 bit 17 and func_0202844c both permit it,
 * otherwise all consumers receive zero. RendererFlags bit 5 records the final
 * state. No value is returned; renderer/overlay state changes.
 */
void func_020122a0(GamePhaseAreaScene *self, s32 enabled)
{
    u32 mode = (self->config_2eac->flags40 >> 18) & 3;
    s32 finalEnabled;
    s32 field2ebcValue;
    if (mode == 0 || mode == 3) {
        finalEnabled = enabled;
        field2ebcValue = 0;
    } else if (enabled && (self->config_2eac->flags40 & 0x20000) &&
               func_0202844c(self->config_2eac)) {
        finalEnabled = 1;
        field2ebcValue = 1;
    } else {
        finalEnabled = 0;
        field2ebcValue = 0;
    }
    func_0202d68c(self->renderer_08, finalEnabled);
    if (self->subRenderer_04)
        callVirtual(self->subRenderer_04, 0x24, finalEnabled);
    if (self->field_2ed0)
        func_ov056_0220ee20((void *)self->field_2ed0, finalEnabled);
    callVirtual(self->field_2ebc, 0x54, field2ebcValue);
    self->rendererFlags_2ea8 =
        (self->rendererFlags_2ea8 & ~0x20) |
        ((finalEnabled & 1) << 5);
}

/* Return the retained address-derived area-scene config pointer. */
GamePhaseAreaSceneConfig *func_02012438(GamePhaseAreaScene *self)
{
    return self->config_2eac;
}
