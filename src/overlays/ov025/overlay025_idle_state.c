#include "tingle/types.h"

/* Overlay 25 idle prompt, activity detection, and timeout transition state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TransitionPair {
    u32 first;
    u32 second;
} TransitionPair;

extern const TransitionPair data_ov025_02202e18;
extern const TransitionPair data_ov025_02202e28;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_02092260(void *, s32);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_02200178(void *);
extern void func_ov025_022001f4(void *);
extern void func_ov025_02200824(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Runs one frame of the three-state idle prompt. State 0 reveals sprite +0xBC
 * and starts event object +0x5FC; state 1 mirrors its progress into sprite
 * halfword +0x34; state 2 either handles activity (scene flag bit 5, set by
 * shared base update SceneInputBase_Update for an active stylus/touch sample) and
 * enters func_ov025_02200FE4 through pair +0x2E18, or sets game flag 0x3D6
 * when the idle counter exceeds 2,400 and enters func_ov025_02202B44 through
 * pair +0x2E28.
 * The activity path emits packed sound 0x2D01 (group 0x5A, ID 1). Always
 * maintains the scene and returns zero. This changes sprites, event state,
 * audio/UI state, and possibly persistent game flags.
 */
extern "C" s32 func_ov025_02200e54(void *scene)
{
    switch (FIELD(u32, scene, 4)) {
    case 0: {
        void *sprite = FIELD(void *, scene, 0xbc);
        FIELD(u16, sprite, 0x24) &= ~4;
        func_02091bac((u8 *)scene + 0x5fc, 1, 0x10, 0x100, 0x10);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* The initialization frame intentionally also updates the prompt. */
    }
    case 1: {
        s32 progress = func_02091c7c((u8 *)scene + 0x5fc, 1);
        void *sprite = FIELD(void *, scene, 0xbc);
        FIELD(u16, sprite, 0x32) = 0x100;
        FIELD(u16, sprite, 0x34) = (u16)progress;
        if (func_02091cf0((u8 *)scene + 0x5fc)) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 2:
        func_ov025_02200824(scene, 4);
        if ((s32)(FIELD(u32, scene, 0x20) << 26) >> 31) {
            func_02092260(scene, 0x2d01);
            FIELD(u16, FIELD(void *, scene, 0xbc), 0x24) |= 4;
            for (s32 i = 0; i < 3; ++i) {
                u8 *entry = (u8 *)scene + i * 4;
                FIELD(s32, FIELD(void *, FIELD(void *, entry, 0xe4), 0xc), 0x20) = 1;
            }
            func_ov025_022001f4(scene);
            /* Retail commits the reset before reading the transition pair. */
            FIELD(volatile s32, scene, 0x5bc) = 0;
            func_ov025_021ff254(
                scene,
                *(volatile const TransitionPair *)&data_ov025_02202e18);
        } else if (++FIELD(s32, scene, 0x5bc) > 0x960) {
            GameWork_SetFlag(gGameWork, 0x3d6);
            func_ov025_021ff254(scene, data_ov025_02202e28);
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
