#include "tingle/types.h"

/* Overlay 32 detail-view state machine bridging a custom widget, dialog text, and the main menu. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

extern void *gGameWork;
extern u8 data_021f5f18[];
extern const u8 data_021f6288[];
extern const u8 data_ov032_02202220[];

#ifdef __cplusplus
extern "C" {
#endif
extern void DisplayBrightness_StartMainTransition(...);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void func_ov032_021fe4a8(void);
extern void func_ov032_0220173c(...);
extern s32 func_ov032_02201960(void *);
extern void func_ov032_022018ac(void *);
extern void func_ov032_021fe23c(void *, s32);
extern void *RetailSelectionHistory_GetMessageRecord(void *);
extern void TitleDialog_SetText(...);
extern s32 func_ov032_021fe134(void *, s32);
extern s32 RetailSelectionManager_HasInactiveSpecialRecord(void *);
extern void func_ov032_021fe0e8(void *);
extern s32 GameWork_TestFlag(...);
extern void func_ov032_021fe2bc(void *, u32);
#ifdef __cplusplus
}
#endif

static void set_flag4(void *scene, u32 wrapperOffset, s32 set)
{
    void *object = FIELD(void *, scene, wrapperOffset);
    u16 flags = FIELD(u16, object, 0x24);
    FIELD(u16, object, 0x24) = set ? (flags | 4) : (flags & ~4);
}

/*
 * Runs the detail-view state stored at +0xB64. States 0..4 fade into and build
 * the widget at +0xEC4; state 10 polls it and branches to message states 20..22
 * or return-to-menu states 90..96 according to signed selection +0xF14. The
 * return path tears the widget down, restores the main layer mask and available
 * menu sprites, then installs callback pair +0x88/+0x8C from 0x02202220 after
 * message 0x23. It always returns zero; callback replacement signals exit.
 */
extern "C" s32 func_ov032_021ff308(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0:
        DisplayBrightness_StartMainTransition(2, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete()) ++FIELD(s32, scene, 0xb64);
        break;
    case 2: {
        func_ov032_021fe4a8();
        set_flag4(scene, 0x154, 0);
        void *object = FIELD(void *, scene, 0xb14);
        FIELD(u16, object, 0x2c) = 0x80;
        FIELD(u16, object, 0x2e) = 0xa0;
        set_flag4(scene, 0xb14, 0);
        func_ov032_0220173c((u8 *)scene + 0xec4, scene);
        ++FIELD(s32, scene, 0xb64);
        break;
    }
    case 3:
        DisplayBrightness_StartMainTransition(1, 0x10);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 4:
        if (DisplayBrightness_IsMainTransitionComplete()) FIELD(s32, scene, 0xb64) = 10;
        break;
    case 10:
        if (func_ov032_02201960((u8 *)scene + 0xec4))
            FIELD(s32, scene, 0xb64) = FIELD(s32, scene, 0xf14) < 0 ? 90 : 20;
        break;
    case 20: {
        func_ov032_021fe23c(scene, 1);
        void *text = RetailSelectionHistory_GetMessageRecord((void *)(data_021f6288 + FIELD(s32, scene, 0xf14) * 8));
        TitleDialog_SetText(FIELD(void *, scene, 0x10), text, 0);
        ++FIELD(s32, scene, 0xb64);
        break;
    }
    case 21:
        if (func_ov032_021fe134(scene, 1)) ++FIELD(s32, scene, 0xb64);
        break;
    case 22:
        func_ov032_021fe23c(scene, 0);
        FIELD(s32, scene, 0xb64) = 10;
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
        func_ov032_022018ac((u8 *)scene + 0xec4);
        set_flag4(scene, 0xb14, 1);
        set_flag4(scene, 0x184, 0);
        if (RetailSelectionManager_HasInactiveSpecialRecord(data_021f5f18)) {
            set_flag4(scene, 0x1b4, 0);
            func_ov032_021fe0e8((u8 *)scene + 0x1b4);
        }
        set_flag4(scene, 0xf4, 0);
        set_flag4(scene, 0x154, 0);
        if (FIELD(s32, scene, 0xc1c) > 0) {
            set_flag4(scene, 0x124, 0);
            u32 flag = FIELD(u32, scene, 0xe60 + FIELD(s32, scene, 0xc1c) * 4);
            if (!GameWork_TestFlag(gGameWork, flag)) {
                set_flag4(scene, 0x1e4, 0);
                func_ov032_021fe0e8((u8 *)scene + 0x1e4);
            }
        }
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
            FIELD(u32, scene, 0xb6c) = FIELD(u32, data_ov032_02202220, 0x88);
            FIELD(u32, scene, 0xb70) = FIELD(u32, data_ov032_02202220, 0x8c);
            FIELD(s32, scene, 0xb64) = 10;
        }
        break;
    }
    return 0;
}
