#include "tingle/types.h"

/* Overlay 32 interactive menu state machine for dialog prompts and six sprite-backed choices. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern void *gSoundContext;
extern u8 data_021f5f18[];
extern const u8 data_ov032_02202220[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov032_021fe23c(void *, s32);
extern void func_ov032_021fe0e8(void *);
extern void func_ov032_021fe2bc(void *, u32);
extern s32 func_ov032_021fe134(void *, s32);
extern s32 func_ov032_021ff288(...);
extern void func_ov032_021fe10c(void *);
extern s32 func_02098348(void *);
extern s32 GameWork_TestFlag(...);
extern void Sound_Play(...);
#ifdef __cplusplus
}
#endif

static void set_object_flag4(void *scene, u32 wrapperOffset, s32 set)
{
    void *object = FIELD(void *, scene, wrapperOffset);
    u16 flags = FIELD(u16, object, 0x24);
    FIELD(u16, object, 0x24) = set ? (flags | 4) : (flags & ~4);
}

static void install_menu_callback(void *scene, u32 tableOffset)
{
    FIELD(u32, scene, 0xb6c) = FIELD(u32, data_ov032_02202220, tableOffset);
    FIELD(u32, scene, 0xb70) = FIELD(u32, data_ov032_02202220, tableOffset + 4);
    FIELD(s32, scene, 0xb64) = 0;
}

/*
 * Runs the menu state in +0xB64. It reveals choices according to global and
 * GameWork conditions, presents/advances dialog text, hit-tests four selectable
 * sprite wrappers against touch point +0xB54, installs address-derived callback
 * pairs for three choices, and handles a confirmation prompt in states 20/21.
 * It hides all six choice objects after a hit and always returns zero because
 * completion is represented by replacing +0xB6C/+0xB70.
 */
extern "C" s32 func_ov032_021feea0(void *scene)
{
    s32 state = FIELD(s32, scene, 0xb64);
    switch (state) {
    case 0:
        func_ov032_021fe23c(scene, 1);
        if (FIELD(s32, data_021f5f18, 0x460) > 0) {
            set_object_flag4(scene, 0x184, 0);
            if (func_02098348(data_021f5f18)) {
                set_object_flag4(scene, 0x1b4, 0);
                func_ov032_021fe0e8((u8 *)scene + 0x1b4);
            }
        }
        set_object_flag4(scene, 0x154, 0);
        set_object_flag4(scene, 0xf4, 0);
        if (FIELD(s32, scene, 0xc1c) > 0) {
            set_object_flag4(scene, 0x124, 0);
            u32 flag = FIELD(u32, scene, 0xe60 + FIELD(s32, scene, 0xc1c) * 4);
            if (!GameWork_TestFlag(gGameWork, flag)) {
                set_object_flag4(scene, 0x1e4, 0);
                func_ov032_021fe0e8((u8 *)scene + 0x1e4);
            }
        }
        FIELD(s32, scene, 0xb64) = 1;
        break;
    case 1:
        func_ov032_021fe2bc(scene, (u16)FIELD(s16, gGameWork, 0xf8));
        FIELD(s32, scene, 0xb64) = 5;
        break;
    case 2:
        if (func_ov032_021fe134(scene, 1)) ++FIELD(s32, scene, 0xb64);
        break;
    case 3:
        if (func_ov032_021fe134(scene, 1)) FIELD(s32, scene, 0xb64) = 10;
        /* Confirmed fallthrough: the original immediately performs the state-5 poll too. */
    case 5:
        if (func_ov032_021fe134(scene, 0)) FIELD(s32, scene, 0xb64) = 10;
        break;
    case 10:
        func_ov032_021fe23c(scene, 0);
        FIELD(s32, scene, 0xb64) = 11;
        break;
    case 11:
        if (FIELD(s32, scene, 0xb84)) {
            s32 selected = 0;
            void *touch = (u8 *)scene + 0xb54;
            if (func_ov032_021ff288((u8 *)scene + 0x154, touch, -1, -1)) {
                Sound_Play(gSoundContext, 0x81, 5);
                FIELD(s32, scene, 0xb64) = 20;
                selected = 1;
            } else if (func_ov032_021ff288((u8 *)scene + 0xf4, touch, -1, -1)) {
                Sound_Play(gSoundContext, 0x81, 2);
                install_menu_callback(scene, 0x10);
                selected = 1;
            } else if (func_ov032_021ff288((u8 *)scene + 0x124, touch, -1, -1)) {
                Sound_Play(gSoundContext, 0x81, 3);
                install_menu_callback(scene, 0x00);
                selected = 1;
            } else if (func_ov032_021ff288((u8 *)scene + 0x184, touch, -1, -1)) {
                Sound_Play(gSoundContext, 0x81, 3);
                install_menu_callback(scene, 0x08);
                selected = 1;
            }
            if (selected) {
                func_ov032_021fe10c(scene);
                const u32 offsets[] = {0xf4, 0x124, 0x154, 0x184, 0x1b4, 0x1e4};
                for (u32 i = 0; i < 6; ++i) set_object_flag4(scene, offsets[i], 1);
            }
        }
        break;
    case 20:
        func_ov032_021fe23c(scene, 1);
        func_ov032_021fe2bc(scene, 0x19);
        FIELD(s32, scene, 0xb64) = 21;
        break;
    case 21:
        if (func_ov032_021fe134(scene, 1)) install_menu_callback(scene, 0x90);
        break;
    }
    return 0;
}
