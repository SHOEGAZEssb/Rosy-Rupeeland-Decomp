#include "tingle/types.h"

/* Overlay 32 dialog branches that update GameWork flags and install follow-up callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern const u8 data_ov032_02202220[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov032_021fe23c(void *, s32);
extern void func_ov032_021fe2bc(void *, u32);
extern s32 func_ov032_021fe134(void *, s32);
extern void GameWork_SetFlag(...);
extern void GameWork_ClearFlag(...);
#ifdef __cplusplus
}
#endif

static void install_callback(void *scene, u32 offset)
{
    FIELD(u32, scene, 0xb6c) = FIELD(u32, data_ov032_02202220, offset);
    FIELD(u32, scene, 0xb70) = FIELD(u32, data_ov032_02202220, offset + 4);
    FIELD(s32, scene, 0xb64) = 0;
}

/*
 * Runs one of three dialog branches in state +0xB64. States 0..2 show message
 * 0x11 and reveal wrapper +0xF4 before callback +0x78; states 10..13 show 0x14,
 * set GameWork flag 0x3FC, clear 0x398, and choose callback +0x70; states
 * 20..23 clear 0x3FC, show 0x17, and choose callback +0x68. It always returns
 * zero because completion is represented by replacing +0xB6C/+0xB70.
 */
extern "C" s32 func_ov032_0220040c(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0:
        func_ov032_021fe23c(scene, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 1:
        func_ov032_021fe2bc(scene, 0x11);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 2:
        if (func_ov032_021fe134(scene, 1)) {
            void *object = FIELD(void *, scene, 0xf4);
            FIELD(u16, object, 0x24) &= ~4;
            install_callback(scene, 0x78);
            FIELD(s32, scene, 0xb64) = 10;
        }
        break;
    case 10:
        func_ov032_021fe23c(scene, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 11:
        func_ov032_021fe2bc(scene, 0x14);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 12:
        if (func_ov032_021fe134(scene, 1)) ++FIELD(s32, scene, 0xb64);
        break;
    case 13:
        GameWork_SetFlag(gGameWork, 0x3fc);
        GameWork_ClearFlag(gGameWork, 0x398);
        install_callback(scene, 0x70);
        break;
    case 20:
        func_ov032_021fe23c(scene, 1);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 21:
        GameWork_ClearFlag(gGameWork, 0x3fc);
        func_ov032_021fe2bc(scene, 0x17);
        ++FIELD(s32, scene, 0xb64);
        break;
    case 22:
        if (func_ov032_021fe134(scene, 1)) ++FIELD(s32, scene, 0xb64);
        break;
    case 23:
        install_callback(scene, 0x68);
        break;
    }
    return 0;
}
