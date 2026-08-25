#include "tingle/types.h"

/* Overlay 25 record-reset confirmation, runtime polling, and completion handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02202e20[];
extern const u8 data_ov025_02202e48[];
extern const u8 data_ov025_02202e70[];
extern const u8 data_ov025_02202e78[];
extern const u8 data_ov025_02202e98[];
extern void *gRuntimeContext;

typedef struct TransitionPair {
    u32 callback;
    u32 argument;
} TransitionPair;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 RetailSaveContext_PollOperation(void *);
extern void RetailSaveContext_BeginRecordDelete(void *, s32, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_02200178(void *);
extern void func_ov025_022001f4(void *);
extern void func_ov025_02200224(void *, s32, void *);
extern void func_ov025_022002b0(void *);
extern void func_ov025_02200398(void *, s32, s32);
extern void func_ov025_02200438(void *, s32);
extern void func_ov025_02200468(void *);
extern s32 func_ov025_02200480(void *);
extern void func_ov025_022006c4(void *);
extern void func_ov025_02200824(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Runs the five-state reset flow that opens confirmation modal 0x15. Choice 1
 * starts runtime work for selected row +0x54; choice 2 redraws and cancels.
 * Successful work recreates the row and opens completion modal 0x16; runtime
 * result 4 opens error modal 0x1F. Always maintains the scene and returns zero.
 */
extern "C" s32 func_ov025_02201abc(void *scene)
{
    switch (FIELD(u32, scene, 4)) {
    case 0:
        func_ov025_02200224(scene, 0x15, 0);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Modal creation intentionally falls through to polling. */
    case 1: {
        func_ov025_02200824(scene, 4);
        s32 choice = ModalState_UpdateInput(
            FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
            (s32)(FIELD(u32, scene, 0x20) << 26) >> 31);
        if (choice < 0)
            break;
        func_ov025_022002b0(scene);
        switch (choice) {
        case 1:
            func_ov025_02200398(scene, 5, 3);
            RetailSaveContext_BeginRecordDelete(gRuntimeContext, FIELD(s32, scene, 0x54), 1);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
            break;
        case 2:
            func_ov025_022001f4(scene);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e98);
            break;
        }
        break;
    }
    case 2: {
        func_ov025_02200824(scene, 4);
        s32 status = RetailSaveContext_PollOperation(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            if (FIELD(s32, gRuntimeContext, 0x10) == 4) {
                func_ov025_02200224(scene, 0x1f, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e48);
            }
        } else {
            func_ov025_02200468(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 3:
        func_ov025_02200824(scene, 4);
        if (func_ov025_02200480(scene)) {
            func_ov025_022006c4(scene);
            func_ov025_02200438(scene, 0);
            func_ov025_02200224(scene, 0x16, 0);
            SceneSound_PlayPackedEffect(scene, 0x2d03);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 4:
        func_ov025_02200824(scene, 4);
        if (ModalState_UpdateInput(
                FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_022001f4(scene);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e20);
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}

/*
 * Runs the alternate five-state reset flow entered with a modal already open.
 * It accepts that modal, starts the same selected-row runtime operation, handles
 * result 4 through its own callback pair, recreates the row on completion, and
 * closes through a final modal. Always maintains the scene and returns zero.
 */
extern "C" s32 func_ov025_02201cfc(void *scene)
{
    u32 state = FIELD(u32, scene, 4);
    switch (state) {
    case 0:
        FIELD(u32, scene, 4) = state + 1;
        FIELD(s32, scene, 8) = 0;
        /* State zero intentionally falls through to modal polling. */
    case 1:
        if (ModalState_UpdateInput(
                FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_02200398(scene, 5, 3);
            RetailSaveContext_BeginRecordDelete(gRuntimeContext, FIELD(s32, scene, 0x54), 1);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2: {
        s32 status = RetailSaveContext_PollOperation(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            if (FIELD(s32, gRuntimeContext, 0x10) == 4) {
                func_ov025_02200224(scene, 0x1f, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e78);
            }
        } else {
            func_ov025_02200468(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 3:
        if (func_ov025_02200480(scene)) {
            func_ov025_022006c4(scene);
            func_ov025_02200438(scene, 0);
            func_ov025_02200224(scene, 0x16, 0);
            SceneSound_PlayPackedEffect(scene, 0x2d03);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 4:
        if (ModalState_UpdateInput(
                FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_022001f4(scene);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e70);
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
