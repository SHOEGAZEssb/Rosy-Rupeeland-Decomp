#include "tingle/types.h"

/* Overlay 32 display shutdown, per-frame input dispatch, prompt blinking, and dialog helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

typedef struct TouchPoint {
    u32 active;
    s32 x;
    s32 y;
} TouchPoint;

extern void *gDebugFont;
extern const u16 gPadState1[];
extern void *gTouchPanelManager;
extern void *gLupyContext;
extern void *data_020f4e14[];
extern void *data_021052fc[];
extern const u8 data_021f4020[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov032_021fde1c(s32);
extern void func_02092418(void *);
extern void GX_SetGraphicsMode(...);
extern void GXS_SetGraphicsMode(...);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_ConfigureTextGridPriority(...);
extern void GamePhaseAreaScene_SetEnabled(...);
extern void func_02008570(...);
extern void GamePhaseState_SetEnabled(...);
extern void TouchPanelManager_GetPoint(...);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GamePhaseCurrencyHud_Update(void *);
extern void func_ov032_021fe024(void *);
extern void func_ov032_021fe0c4(void *);
extern void func_ov032_021fe0e8(void *);
extern void GraphicsSpriteState_SetFrameIndex(...);
extern u32 genrand_int32(void);
extern s32 func_020bf1f8(...);
extern void func_020939d8(void *);
extern u32 func_02093360(...);
extern s32 DisplayBrightness_GetCurrent(void *);
extern void DisplayBrightness_StartTransition(...);
extern void *func_02079408(...);
extern void func_02092e9c(...);
#ifdef __cplusplus
}
#endif

/*
 * Ends overlay graphics mode for `scene`. It disables scrolling, restores the
 * saved POWCNT bit, resets both engines and text canvases, restores shared UI
 * contexts, and returns void.
 */
extern "C" void func_ov032_021fde38(void *scene)
{
    u8 *context = (u8 *)data_021052fc[0];
    FIELD(s32, scene, 0xf2c) = 0;
    func_ov032_021fde1c(FIELD(s32, scene, 0xb50));
    func_02092418((u8 *)scene + 0xbe8);
    REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1000;
    GX_SetGraphicsMode(1, 0, 0);
    REG32(0x04001000) = (REG32(0x04001000) & ~0x1f00) | 0x1000;
    GXS_SetGraphicsMode(5);
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(data_020f4e14[0], 0, 0x10);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(gDebugFont, 0, 0x10);
    GamePhaseAreaScene_SetEnabled(FIELD(void *, context, 0x2fb8), 0);
    func_02008570(context, 2, 1);
    GamePhaseState_SetEnabled(context + 0x24, 1);
}

/*
 * Samples touch/pad state into `scene`, records a touch-down edge at +0xB84,
 * and invokes the encoded state callback at +0xB6C/+0xB70. A zero callback
 * result advances both sprite groups, the currency HUD, and the paired prompt
 * sprites; the callback result is returned unchanged. The callback encoding is
 * a compiler member-pointer representation and its owning class is not yet
 * confirmed.
 */
extern "C" s32 func_ov032_021fdf30(void *scene)
{
    typedef s32 (*StateCallback)(void *);
    TouchPoint point;
    FIELD(const u16 *, scene, 0xb60) = gPadState1;
    TouchPanelManager_GetPoint(&point, gTouchPanelManager);
    FIELD(s32, scene, 0xb58) = point.x;
    FIELD(s32, scene, 0xb5c) = point.y;

    s32 down = FIELD(u16, gTouchPanelManager, 0x44) == 1;
    FIELD(s32, scene, 0xb84) = down ? !FIELD(s32, scene, 0xb80) : 0;
    FIELD(s32, scene, 0xb80) = down;

    u32 encoded = FIELD(u32, scene, 0xb70);
    void *callbackThis = (u8 *)scene + ((s32)encoded >> 1);
    StateCallback callback;
    if (encoded & 1) {
        void *dispatchBase = FIELD(void *, callbackThis, 0);
        callback = FIELD(StateCallback, dispatchBase, FIELD(u32, scene, 0xb6c));
    } else {
        callback = FIELD(StateCallback, scene, 0xb6c);
    }
    s32 result = callback(callbackThis);
    if (result == 0) {
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 4));
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0));
        GamePhaseCurrencyHud_Update(gLupyContext);
        func_ov032_021fe024(scene);
    }
    return result;
}

/*
 * Drives the paired prompt sprites at +0x64/+0x94. It waits a randomized
 * 180..475-frame idle interval, enables both sprites for 30..89 frames, then
 * disables and hides them. Counters at +0xBDC/+0xBD8 are updated; returns void.
 */
extern "C" void func_ov032_021fe024(void *scene)
{
    s32 idle = FIELD(s32, scene, 0xbdc);
    if (idle <= 0) {
        FIELD(s32, scene, 0xbdc) = func_020bf1f8(genrand_int32(), 0x3c) * 5 + 0xb4;
        FIELD(s32, scene, 0xbd8) = func_020bf1f8(genrand_int32(), 0x3c) + 0x1e;
        func_ov032_021fe0e8((u8 *)scene + 0x64);
        func_ov032_021fe0e8((u8 *)scene + 0x94);
        return;
    }
    FIELD(s32, scene, 0xbdc) = --idle;
    s32 visible = FIELD(s32, scene, 0xbd8);
    if (visible > 0 && --visible == 0) {
        FIELD(s32, scene, 0xbd8) = visible;
        func_ov032_021fe0c4((u8 *)scene + 0x64);
        func_ov032_021fe0c4((u8 *)scene + 0x94);
        GraphicsSpriteState_SetFrameIndex(FIELD(void *, scene, 0x64), 0);
        GraphicsSpriteState_SetFrameIndex(FIELD(void *, scene, 0x94), 0);
    } else if (visible > 0) {
        FIELD(s32, scene, 0xbd8) = visible;
    }
}

/* Clears flag bit 1 and sets bit 0 in the SDK object referenced by `wrapper`; returns void. */
extern "C" void func_ov032_021fe0c4(void *wrapper)
{
    void *object = FIELD(void *, wrapper, 0);
    FIELD(u16, object, 0x24) = (FIELD(u16, object, 0x24) | 1) & ~2;
}

/* Clears flag bit 0 and sets bit 1 in the SDK object referenced by `wrapper`; returns void. */
extern "C" void func_ov032_021fe0e8(void *wrapper)
{
    void *object = FIELD(void *, wrapper, 0);
    FIELD(u16, object, 0x24) = (FIELD(u16, object, 0x24) & ~1) | 2;
}

/* Closes the object at +0x10, disables the +0xC4 prompt sprite, and hides it; returns void. */
extern "C" void func_ov032_021fe10c(void *scene)
{
    func_020939d8(FIELD(void *, scene, 0x10));
    func_ov032_021fe0c4((u8 *)scene + 0xc4);
    GraphicsSpriteState_SetFrameIndex(FIELD(void *, scene, 0xc4), 0);
}

/*
 * Feeds a copied pad state to the object at +0x10, injecting a one-frame touch
 * edge as pad bit 0 or 1 according to object flag bit 1. Returns one when the
 * dialog reports completion (optionally closing it), otherwise synchronizes the
 * +0xC4 prompt sprite with that flag and returns zero.
 */
extern "C" s32 func_ov032_021fe134(void *scene, s32 closeOnComplete)
{
    u16 input[11];
    for (s32 i = 0; i < 11; ++i) input[i] = ((u16 *)FIELD(void *, scene, 0xb60))[i];
    void *dialog = FIELD(void *, scene, 0x10);
    u32 flags = FIELD(u32, dialog, 0x38);
    if (flags & 1) return 1;
    if (FIELD(s32, scene, 0xb84)) input[1] |= (flags & 2) ? 1 : 2;

    if (func_02093360(dialog, input) & 1) {
        if (closeOnComplete) func_020939d8(dialog);
        func_ov032_021fe0c4((u8 *)scene + 0xc4);
        GraphicsSpriteState_SetFrameIndex(FIELD(void *, scene, 0xc4), 0);
        return 1;
    }
    if (FIELD(u32, dialog, 0x38) & 2) {
        func_ov032_021fe0c4((u8 *)scene + 0xc4);
        GraphicsSpriteState_SetFrameIndex(FIELD(void *, scene, 0xc4), 0);
    } else {
        func_ov032_021fe0e8((u8 *)scene + 0xc4);
    }
    return 0;
}

/*
 * Toggles an eight-step fade on the handle at +0xBE0, guarded by +0xBC8.
 * Enabling requests delta -8 and disabling requests delta 0; returns void.
 */
extern "C" void func_ov032_021fe23c(void *scene, s32 enabled)
{
    s32 active = FIELD(s32, scene, 0xbc8);
    if (enabled && !active) {
        void *handle = FIELD(void *, scene, 0xbe0);
        DisplayBrightness_StartTransition(handle, DisplayBrightness_GetCurrent(handle), -8, 8);
        FIELD(s32, scene, 0xbc8) = 1;
    } else if (!enabled && active) {
        void *handle = FIELD(void *, scene, 0xbe0);
        DisplayBrightness_StartTransition(handle, DisplayBrightness_GetCurrent(handle), 0, 8);
        FIELD(s32, scene, 0xbc8) = 0;
    }
}

/* Maps the low 16 bits of `messageId` through table 0x021F4020, installs the result in the dialog at +0x10, stores the original ID at +0xBD4, and returns void. */
extern "C" void func_ov032_021fe2bc(void *scene, u32 messageId)
{
    FIELD(u32, scene, 0xbd4) = messageId;
    func_02092e9c(FIELD(void *, scene, 0x10), func_02079408(data_021f4020, (u16)messageId), 0);
}
