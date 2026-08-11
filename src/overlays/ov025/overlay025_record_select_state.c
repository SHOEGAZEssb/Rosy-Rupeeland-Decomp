#include "tingle/types.h"

/* Overlay 25 record-row and three-way action selection state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_ov025_02202de8[];
extern const u8 data_ov025_02202df8[];
extern const u8 data_ov025_02202e08[];
extern const u8 data_ov025_02202e40[];
extern const u8 data_ov025_02202ec8[];
extern const u8 data_ov025_02202ed8[];

typedef struct TransitionPair {
    u32 callback;
    u32 argument;
} TransitionPair;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_02092260(void *, s32);
extern s32 func_02092910(void *, void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_ov025_021fd9e4(void *, s32);
extern s32 func_ov025_021fdc4c(void *);
extern void func_ov025_021fdea0(void *, s32);
extern s32 func_ov025_021ff0b0(void *);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_02200178(void *);
extern void func_ov025_022001f4(void *);
extern void func_ov025_02200564(void *);
extern void func_ov025_02200648(void *, s32);
extern void func_ov025_02200824(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Runs one frame of record/action selection. States 0/1 debounce input, test
 * the three rows and three +0x2F4 action controllers, and either update the
 * selected row or dispatch a callback pair. State 2 waits for a chosen action;
 * states 10/11 animate a repeated row selection and branch by record status.
 * Touch/input, controller, row-owner, audio/UI, and scene state may change.
 * Scene maintenance always runs and the function returns zero.
 */
extern "C" s32 func_ov025_02200fe4(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov025_02200824(scene, 4);
        if (++FIELD(s32, scene, 8) > 20) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 1: {
        func_ov025_02200824(scene, 4);
        s32 inputReady = (s32)(FIELD(u32, scene, 0x20) << 26) >> 31;
        if (!inputReady)
            break;
        s32 handled = 0;
        for (s32 i = 0; i < 3; ++i) {
            void *row = FIELD(void *, (u8 *)scene + i * 4, 0xe4);
            if (!func_02092910(FIELD(void *, row, 0x10),
                               (u8 *)scene + 0x30))
                continue;
            handled = 1;
            if (i == FIELD(s32, scene, 0x54)) {
                func_02092260(scene, 2);
                FIELD(s32, scene, 4) = 10;
                FIELD(s32, scene, 8) = 0;
            } else {
                func_02092260(scene, 0x2d02);
                func_ov025_02200648(scene, i);
                func_ov025_022001f4(scene);
                FIELD(s32, scene, 4) = 0;
                FIELD(s32, scene, 8) = 0;
            }
            break;
        }
        if (!handled) {
            for (s32 i = 0; i < 3; ++i) {
                void *controller = (u8 *)scene + 0x2f4 + i * 0xac;
                if (func_02095860(controller, (u8 *)scene + 0x30, 0, 4)) {
                    FIELD(s32, scene, 0x5b8) = i;
                    func_02092260(scene, 2);
                    ++FIELD(s32, scene, 4);
                    FIELD(s32, scene, 8) = 0;
                    handled = 1;
                    break;
                }
            }
        }
        if (!handled) {
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            for (s32 i = 0; i < 3; ++i) {
                GraphicsSpriteGroup_ReleaseIndexedEntries(
                    FIELD(void *,
                          FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0xc));
                func_ov025_021fd9e4(
                    FIELD(void *, (u32 *)scene + i, 0xe4), 0);
            }
            FIELD(s32, scene, 0x54) = -1;
            func_ov025_02200564(scene);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202df8);
        }
        break;
    }
    case 2:
        if (func_ov025_021ff0b0((u8 *)scene + 0x2f4 +
                                FIELD(s32, scene, 0x5b8) * 0xac)) {
            switch (FIELD(s32, scene, 0x5b8)) {
            case 0:
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202ec8);
                break;
            case 1:
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e40);
                break;
            case 2:
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e08);
                break;
            }
        }
        break;
    case 10:
        func_02091bac((u8 *)scene + 0x5fc, 3, 0, 4, 6);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Setup intentionally falls through to the first animation update. */
    case 11: {
        s32 value = func_02091c7c((u8 *)scene + 0x5fc, 1);
        func_ov025_021fdea0(
            FIELD(void *,
                  (u8 *)scene + FIELD(s32, scene, 0x54) * 4, 0xe4),
            value);
        if (func_02091cf0((u8 *)scene + 0x5fc)) {
            if (func_ov025_021fdc4c(
                    FIELD(void *,
                          (u8 *)scene + FIELD(s32, scene, 0x54) * 4,
                          0xe4))) {
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202de8);
            } else {
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202ed8);
            }
        }
        break;
    }
    }
    func_ov025_02200178(scene);
    return 0;
}
