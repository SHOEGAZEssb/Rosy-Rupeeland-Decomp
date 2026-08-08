#include "tingle/types.h"

/* Overlay 25 record-reset confirmation, runtime polling, and completion handlers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02202e20[];
extern const u8 data_ov025_02202e48[];
extern const u8 data_ov025_02202e70[];
extern const u8 data_ov025_02202e78[];
extern const u8 data_ov025_02202e98[];
extern void *gRuntimeContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0207f248(void *);
extern void func_020802f4(void *, s32, s32);
extern void func_02092260(void *, s32);
extern s32 func_02095dd4(void *, void *, s32);
extern void func_ov025_021ff254(void *, u32, u32);
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

static void advance_state(void *scene)
{
    ++FIELD(s32, scene, 4);
    FIELD(s32, scene, 8) = 0;
}

static void transition_pair(void *scene, const u32 *pair)
{
    func_ov025_021ff254(scene, pair[0], pair[1]);
}

static s32 poll_modal(void *scene)
{
    return func_02095dd4(FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                         (s32)(FIELD(u32, scene, 0x20) << 26) >> 31);
}

static s32 poll_reset_runtime(void *scene, const u8 *failure_pair)
{
    s32 status = func_0207f248(gRuntimeContext);
    if (status == 0)
        return 0;
    if (status != -1) {
        func_ov025_02200468(scene);
        advance_state(scene);
        return 1;
    }
    func_ov025_02200438(scene, 1);
    if (FIELD(s32, gRuntimeContext, 0x10) == 4) {
        func_ov025_02200224(scene, 0x1f, 0);
        transition_pair(scene, (const u32 *)failure_pair);
    }
    return 1;
}

static void finish_reset(void *scene)
{
    func_ov025_022006c4(scene);
    func_ov025_02200438(scene, 0);
    func_ov025_02200224(scene, 0x16, 0);
    func_02092260(scene, 0x2d03);
    advance_state(scene);
}

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
        advance_state(scene);
        /* Modal creation intentionally falls through to polling. */
    case 1: {
        func_ov025_02200824(scene, 4);
        s32 choice = poll_modal(scene);
        if (choice < 0)
            break;
        func_ov025_022002b0(scene);
        if (choice == 1) {
            func_ov025_02200398(scene, 5, 3);
            func_020802f4(gRuntimeContext, FIELD(s32, scene, 0x54), 1);
            advance_state(scene);
        } else if (choice == 2) {
            func_ov025_022001f4(scene);
            transition_pair(scene, (const u32 *)data_ov025_02202e98);
        }
        break;
    }
    case 2:
        func_ov025_02200824(scene, 4);
        poll_reset_runtime(scene, data_ov025_02202e48);
        break;
    case 3:
        func_ov025_02200824(scene, 4);
        if (func_ov025_02200480(scene))
            finish_reset(scene);
        break;
    case 4:
        func_ov025_02200824(scene, 4);
        if (poll_modal(scene) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_022001f4(scene);
            transition_pair(scene, (const u32 *)data_ov025_02202e20);
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
    switch (FIELD(u32, scene, 4)) {
    case 0:
        advance_state(scene);
        /* State zero intentionally falls through to modal polling. */
    case 1:
        if (poll_modal(scene) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_02200398(scene, 5, 3);
            func_020802f4(gRuntimeContext, FIELD(s32, scene, 0x54), 1);
            advance_state(scene);
        }
        break;
    case 2:
        poll_reset_runtime(scene, data_ov025_02202e78);
        break;
    case 3:
        if (func_ov025_02200480(scene))
            finish_reset(scene);
        break;
    case 4:
        if (poll_modal(scene) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_022001f4(scene);
            transition_pair(scene, (const u32 *)data_ov025_02202e70);
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
