#include "tingle/types.h"

/* Overlay 25 record-to-record transfer confirmation and result state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02202e10[];
extern const u8 data_ov025_02202e30[];
extern const u8 data_ov025_02202e88[];
extern const u8 data_ov025_02202e90[];
extern const u8 data_ov025_02202ea0[];
extern const u8 data_ov025_02202ec0[];
extern void *gRuntimeContext;

typedef struct TransitionPair {
    u32 callback;
    u32 argument;
} TransitionPair;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 RetailSaveContext_PollOperation(void *);
extern void RetailSaveContext_BeginRecordCopy(void *, s32, s32, s32);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_02092260(void *, s32);
extern s32 GraphicsSpriteState_TestTouchPoint(void *, void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern s32 func_02095dd4(void *, void *, s32);
extern void func_ov025_021fd9e4(void *, s32);
extern void func_ov025_021fdb18(void *, s32);
extern s32 func_ov025_021fdc4c(void *);
extern void func_ov025_021fdea0(void *, s32);
extern s32 func_ov025_021ff0b0(void *);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_02200178(void *);
extern void func_ov025_022001f4(void *);
extern void func_ov025_02200224(void *, s32, void *);
extern void func_ov025_022002b0(void *);
extern void func_ov025_02200398(void *, s32, s32);
extern void func_ov025_02200438(void *, s32);
extern void func_ov025_02200468(void *);
extern s32 func_ov025_02200480(void *);
extern void func_ov025_02200498(void *, s32);
extern void func_ov025_02200534(void *);
extern void func_ov025_02200794(void *);
extern void func_ov025_02200824(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Runs one frame of the transfer/copy flow between selected row +0x54 and
 * candidate row +0x58. It lays out rows, processes touch selection, animates
 * the candidate, asks for confirmation, starts and polls runtime transfer work,
 * handles result codes 3/4/5 with modals, recreates the changed row, and
 * dispatches callback pairs. States 5..9 and 14..19 are intentionally unused.
 * UI, sprite, runtime, modal, row allocation, and audio state may change.
 * Scene maintenance always runs and zero is returned.
 */
extern "C" s32 func_ov025_02201494(void *scene)
{
    switch (FIELD(u32, scene, 4)) {
    case 0: {
        for (s32 i = 0; i < 3; ++i) {
            if (i == FIELD(s32, scene, 0x54)) {
                func_ov025_021fdb18(
                    FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0x10);
            } else {
                func_ov025_021fd9e4(
                    FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0);
            }
        }
        func_ov025_02200534(scene);
        func_ov025_022001f4(scene);
        func_02095928((u8 *)scene + 0x19c);
        if (FIELD(s32, scene, 0x54) == 2) {
            func_02095820((u8 *)scene + 0x19c, 0xe4, 0x18);
        } else {
            func_02095820((u8 *)scene + 0x19c, 0xe4, 0xa0);
        }
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Setup intentionally falls through to input processing. */
    }
    case 1: {
        func_ov025_02200824(scene, 4);
        s32 inputReady = (s32)(FIELD(u32, scene, 0x20) << 26) >> 31;
        if (!inputReady)
            break;
        s32 handled = 0;
        for (s32 i = 0; i < 3; ++i) {
            void *row = FIELD(void *, (u8 *)scene + i * 4, 0xe4);
            if (GraphicsSpriteState_TestTouchPoint(FIELD(void *, row, 0x10),
                              (u8 *)scene + 0x30) &&
                i != FIELD(s32, scene, 0x54)) {
                FIELD(s32, scene, 0x58) = i;
                handled = 1;
                func_02095940((u8 *)scene + 0x19c);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
                break;
            }
        }
        if (!handled &&
            func_02095860((u8 *)scene + 0x19c,
                          (u8 *)scene + 0x30, 0, 4)) {
            func_02092260(scene, 3);
            FIELD(s32, scene, 4) = 20;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 2:
        func_02091bac((u8 *)scene + 0x5fc, 3, 0, 4, 6);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Animation setup intentionally falls through to its update. */
    case 3: {
        s32 value = func_02091c7c((u8 *)scene + 0x5fc, 1);
        func_ov025_021fdea0(
            FIELD(void *,
                  (u8 *)scene + FIELD(s32, scene, 0x58) * 4, 0xe4),
            value);
        if (!func_02091cf0((u8 *)scene + 0x5fc))
            break;
        if (func_ov025_021fdc4c(
                FIELD(void *,
                      (u8 *)scene + FIELD(s32, scene, 0x58) * 4,
                      0xe4))) {
            func_ov025_02200398(scene, 2, 2);
            FIELD(s32, scene, 4) = 10;
            FIELD(s32, scene, 8) = 0;
        } else {
            func_ov025_02200224(scene, 0x13, 0);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 4: {
        func_ov025_02200824(scene, 4);
        s32 choice = func_02095dd4(FIELD(void *, scene, 0x59c),
                                   (u8 *)scene + 0x30,
                                   (s32)(FIELD(u32, scene, 0x20) << 26) >> 31);
        if (choice < 0)
            break;
        func_ov025_022002b0(scene);
        switch (choice) {
        case 1:
            func_ov025_022001f4(scene);
            func_ov025_02200398(scene, 2, 2);
            FIELD(s32, scene, 4) = 10;
            FIELD(s32, scene, 8) = 0;
            break;
        case 2:
            for (s32 i = 0; i < 3; ++i) {
                if (i == FIELD(s32, scene, 0x54)) {
                    func_ov025_021fd9e4(
                        FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0x10);
                } else {
                    func_ov025_021fdb18(
                        FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0);
                }
            }
            func_ov025_02200498(scene, FIELD(s32, scene, 0x54));
            func_ov025_022001f4(scene);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e90);
            break;
        }
        break;
    }
    case 10:
        RetailSaveContext_BeginRecordCopy(gRuntimeContext, FIELD(s32, scene, 0x54),
                      FIELD(s32, scene, 0x58), 1);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    case 11: {
        func_ov025_02200824(scene, 4);
        s32 status = RetailSaveContext_PollOperation(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            s32 result = FIELD(s32, gRuntimeContext, 0x10);
            if (result == 3) {
                func_ov025_02200224(scene, 0x1d, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202ea0);
            } else if (result == 5) {
                func_ov025_02200224(scene, 0x1e, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e88);
            } else if (result == 4) {
                func_ov025_02200224(scene, 0x1f, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202ec0);
            }
        } else {
            func_ov025_02200468(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 12:
        func_ov025_02200824(scene, 4);
        if (func_ov025_02200480(scene)) {
            func_ov025_02200794(scene);
            func_ov025_02200438(scene, 0);
            func_ov025_02200224(scene, 0x14, 0);
            func_02092260(scene, 0x2d03);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 13:
        func_ov025_02200824(scene, 4);
        if (func_02095dd4(FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                          (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_ov025_022002b0(scene);
            for (s32 i = 0; i < 3; ++i) {
                if (i == FIELD(s32, scene, 0x54)) {
                    func_ov025_021fd9e4(
                        FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0x10);
                } else {
                    func_ov025_021fdb18(
                        FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0);
                }
            }
            func_ov025_02200498(scene, FIELD(s32, scene, 0x54));
            func_ov025_022001f4(scene);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e10);
        }
        break;
    case 20:
        func_ov025_02200824(scene, 4);
        if (func_ov025_021ff0b0((u8 *)scene + 0x19c)) {
            for (s32 i = 0; i < 3; ++i) {
                if (i == FIELD(s32, scene, 0x54)) {
                    func_ov025_021fd9e4(
                        FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0x10);
                } else {
                    func_ov025_021fdb18(
                        FIELD(void *, (u8 *)scene + i * 4, 0xe4), 0);
                }
            }
            func_ov025_02200498(scene, FIELD(s32, scene, 0x54));
            func_ov025_022001f4(scene);
            func_02095940((u8 *)scene + 0x19c);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e30);
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
