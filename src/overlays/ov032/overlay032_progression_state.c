#include "tingle/types.h"

/* Overlay 32 progression/selection state machine controlling dialogs, five children, arrows, and unlock animation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern void *gGameWork;
extern u8 data_021f5f18[];
extern const u8 data_ov032_02202220[];

#ifdef __cplusplus
extern "C" {
#endif
extern void DisplayBrightness_StartMainTransition(...);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GameWork_TestFlag(...);
extern void GameWork_SetFlag(...);
extern void func_ov032_021fe55c(void *);
extern void func_ov032_021fe6b0(void *);
extern void func_ov032_021fe7d0(void *);
extern void Overlay032Scene_SetNumericDialogText(void *);
extern void func_ov032_021fe440(void *);
extern void func_ov032_021fe848(void *, s32);
extern void func_ov032_021fe8a0(void *);
extern void GraphicsSpriteState_SetAnimationIndex(...);
extern void func_ov032_02200180(void *);
extern void func_ov032_022001a0(void *);
extern s32 Overlay032SpriteWrapper_HitTest(...);
extern void func_ov032_021fe8d8(void *, s32);
extern s32 func_ov032_021fe92c(void *);
extern void func_ov032_021fe9e8(void *, s32);
extern s32 func_ov032_021fead4(void *);
extern void func_ov032_022001c0(void *);
extern void func_ov032_02200284(void *);
extern void func_ov032_022003e4(void *);
extern void func_ov032_021fe23c(void *, s32);
extern void func_ov032_021fe0e8(void *);
extern s32 RetailSelectionManager_HasInactiveSpecialRecord(void *);
extern void func_ov032_021fe2bc(void *, u32);
extern s32 func_ov032_021fe134(void *, s32);
#ifdef __cplusplus
}
#endif

static void flag4(void *scene, u32 offset, s32 set)
{
    void *object = FIELD(void *, scene, offset);
    u16 value = FIELD(u16, object, 0x24);
    FIELD(u16, object, 0x24) = set ? value | 4 : value & ~4;
}

static void update_arrows(void *scene)
{
    s32 current = FIELD(s32, scene, 0xc24);
    if (current < FIELD(s32, scene, 0xc1c)) func_ov032_022001a0((u8 *)scene + 0x2a4);
    else func_ov032_02200180((u8 *)scene + 0x2a4);
    if (current > 1) func_ov032_022001a0((u8 *)scene + 0x274);
    else func_ov032_02200180((u8 *)scene + 0x274);
}

static void blink_progress_icon(void *scene)
{
    s32 selection = FIELD(s32, scene, 0xc1c);
    if (selection > 3) return;
    s32 phase = FIELD(s32, scene, 0xb7c) % 8;
    if (selection == 1) {
        flag4(scene, 0x304, phase < 4);
    } else {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x304),
                      (u8)(phase < 4 ? selection - 2 : selection - 1));
    }
}

static void reveal_menu(void *scene)
{
    if (FIELD(s32, data_021f5f18, 0x460) > 0) {
        flag4(scene, 0x184, 0);
        if (RetailSelectionManager_HasInactiveSpecialRecord(data_021f5f18)) {
            flag4(scene, 0x1b4, 0);
            func_ov032_021fe0e8((u8 *)scene + 0x1b4);
        }
    }
    flag4(scene, 0xf4, 0);
    flag4(scene, 0x154, 0);
    if (FIELD(s32, scene, 0xc1c) > 0) flag4(scene, 0x124, 0);
}

/*
 * Runs the progression browser in +0xB64. It opens the current unlocked record,
 * supports touch-driven previous/next navigation, marks traversed GameWork flags,
 * animates unlocking an additional record with map scaling and a blinking icon,
 * and returns to the main menu through states 90..96. Selection fields +0xC1C
 * and +0xC24, timers +0xB7C, and the callback pair +0xB6C/+0xB70 are mutated.
 * Returns zero in every state because exit occurs by installing callback pair
 * +0x80/+0x84 from table 0x02202220.
 */
extern "C" s32 func_ov032_021ff6e0(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0:
        FIELD(s32, scene, 0xc24) = FIELD(s32, scene, 0xc1c);
        DisplayBrightness_StartMainTransition(2, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 1: {
        if (!DisplayBrightness_IsMainTransitionComplete()) break;
        u32 flag = FIELD(u32, scene, 0xe60 + FIELD(s32, scene, 0xc24) * 4);
        FIELD(s32, scene, 0xb64) = GameWork_TestFlag(gGameWork, flag) ? 2 : 60;
        break;
    }
    case 2:
        func_ov032_021fe55c(scene);
        func_ov032_021fe6b0(scene);
        Overlay032Scene_SetNumericDialogText(scene);
        func_ov032_021fe440(scene);
        func_ov032_021fe848(scene, 0);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x304),
                      (u8)(FIELD(s32, scene, 0xc1c) >= 3 ? 2 : FIELD(s32, scene, 0xc1c) - 1));
        flag4(scene, 0x304, 0);
        flag4(scene, 0x154, 0);
        flag4(scene, 0x274, 0);
        flag4(scene, 0x2a4, 0);
        func_ov032_02200180((u8 *)scene + 0x2a4);
        if (FIELD(s32, scene, 0xc24) > 1) func_ov032_022001a0((u8 *)scene + 0x274);
        else func_ov032_02200180((u8 *)scene + 0x274);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 3:
        DisplayBrightness_StartMainTransition(1, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 4:
        if (DisplayBrightness_IsMainTransitionComplete()) FIELD(s32, scene, 0xb64) = 10;
        break;
    case 10:
        if (!FIELD(s32, scene, 0xb84)) break;
        if (Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x154, (u8 *)scene + 0xb54, -1, -1))
            FIELD(s32, scene, 0xb64) = 90;
        else if (Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x274, (u8 *)scene + 0xb54, 20, 20))
            FIELD(s32, scene, 0xb64) = 30;
        else if (Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x2a4, (u8 *)scene + 0xb54, 20, 20))
            FIELD(s32, scene, 0xb64) = 20;
        break;
    case 20:
        func_ov032_021fe8d8(scene, -1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 21:
        if (func_ov032_021fe92c(scene)) {
            ++FIELD(s32, scene, 0xc24);
            FIELD(s32, scene, 0xb64) = 40;
        }
        break;
    case 30:
        func_ov032_021fe8d8(scene, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 31:
        if (func_ov032_021fe92c(scene)) {
            --FIELD(s32, scene, 0xc24);
            FIELD(s32, scene, 0xb64) = 40;
        }
        break;
    case 40:
        func_ov032_021fe440(scene);
        func_ov032_021fe848(scene, 0);
        update_arrows(scene);
        if (FIELD(s32, scene, 0xb80) && FIELD(void *, scene, 0x280) &&
            Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x274, (u8 *)scene + 0xb54, 20, 20)) {
            FIELD(s32, scene, 0xb64) = 30;
        } else if (FIELD(s32, scene, 0xb80) && FIELD(void *, scene, 0x2b0) &&
                   Overlay032SpriteWrapper_HitTest((u8 *)scene + 0x2a4, (u8 *)scene + 0xb54, 20, 20)) {
            FIELD(s32, scene, 0xb64) = 20;
        } else {
            FIELD(s32, scene, 0xb64) = 10;
        }
        break;
    case 60:
        for (s32 i = FIELD(s32, scene, 0xc24); i > 0; --i)
            GameWork_SetFlag(gGameWork, FIELD(u32, scene, 0xe60 + i * 4));
        if (FIELD(s32, scene, 0xc24) <= 1) {
            FIELD(s32, scene, 0xb64) = 80;
        } else {
            --FIELD(s32, scene, 0xc1c);
            --FIELD(s32, scene, 0xc24);
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 61:
        if (FIELD(s32, scene, 0xc1c) > 0) {
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x304),
                          (u8)(FIELD(s32, scene, 0xc1c) >= 3 ? 2 : FIELD(s32, scene, 0xc1c) - 1));
            flag4(scene, 0x304, 0);
        }
        func_ov032_021fe55c(scene);
        func_ov032_021fe6b0(scene);
        Overlay032Scene_SetNumericDialogText(scene);
        func_ov032_021fe440(scene);
        func_ov032_021fe848(scene, 0);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 62:
        DisplayBrightness_StartMainTransition(1, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 63:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            FIELD(s32, scene, 0xb7c) = 120;
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 64:
        if (--FIELD(s32, scene, 0xb7c) <= 0) {
            func_ov032_021fe9e8(scene, -1);
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 65:
        if (func_ov032_021fead4(scene)) {
            ++FIELD(s32, scene, 0xc1c);
            ++FIELD(s32, scene, 0xc24);
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 66:
        func_ov032_021fe6b0(scene);
        Overlay032Scene_SetNumericDialogText(scene);
        func_ov032_021fe440(scene);
        func_ov032_021fe848(scene, 1);
        func_ov032_021fe9e8(scene, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 67:
        if (func_ov032_021fead4(scene)) {
            func_ov032_021fe55c(scene);
            func_ov032_022001c0(scene);
            FIELD(s32, scene, 0xb7c) = 200;
            ++FIELD(s32, scene, 0xb64);
        }
        break;
    case 68:
        func_ov032_02200284(scene);
        if (--FIELD(s32, scene, 0xb7c) <= 0) {
            func_ov032_021fe848(scene, 0);
            FIELD(s32, scene, 0xb7c) = 30;
            ++FIELD(s32, scene, 0xb64);
        } else blink_progress_icon(scene);
        break;
    case 69:
        func_ov032_02200284(scene);
        if (--FIELD(s32, scene, 0xb7c) <= 0) ++FIELD(s32, scene, 0xb64);
        blink_progress_icon(scene);
        break;
    case 70:
        func_ov032_022003e4(scene);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x304), (u8)(FIELD(s32, scene, 0xc1c) - 1));
        flag4(scene, 0x304, 0);
        flag4(scene, 0x154, 0);
        flag4(scene, 0x274, 0);
        flag4(scene, 0x2a4, 0);
        update_arrows(scene);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 71:
        FIELD(s32, scene, 0xb64) = 10;
        break;
    case 80:
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x304), 0);
        flag4(scene, 0x304, 0);
        func_ov032_021fe55c(scene);
        func_ov032_021fe6b0(scene);
        Overlay032Scene_SetNumericDialogText(scene);
        func_ov032_021fe440(scene);
        func_ov032_021fe848(scene, 1);
        DisplayBrightness_StartMainTransition(1, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 81:
        if (DisplayBrightness_IsMainTransitionComplete()) {
            func_ov032_022001c0(scene);
            FIELD(s32, scene, 0xb7c) = 200;
            FIELD(s32, scene, 0xb64) = 68;
        }
        break;
    case 90:
        DisplayBrightness_StartMainTransition(2, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 91:
        if (DisplayBrightness_IsMainTransitionComplete()) ++FIELD(s32, scene, 0xb64);
        break;
    case 92:
        REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1300;
        func_ov032_021fe7d0(scene);
        func_ov032_021fe8a0(scene);
        flag4(scene, 0x304, 1);
        flag4(scene, 0x274, 1);
        flag4(scene, 0x2a4, 1);
        reveal_menu(scene);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 93:
        func_ov032_021fe23c(scene, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 94:
        if (DisplayBrightness_IsMainTransitionComplete()) ++FIELD(s32, scene, 0xb64);
        break;
    case 95:
        func_ov032_021fe2bc(scene, 0x23);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 96:
        if (func_ov032_021fe134(scene, 0)) {
            FIELD(u32, scene, 0xb6c) = FIELD(u32, data_ov032_02202220, 0x80);
            FIELD(u32, scene, 0xb70) = FIELD(u32, data_ov032_02202220, 0x84);
            FIELD(s32, scene, 0xb64) = 10;
        }
        break;
    }
    return 0;
}
