#include "tingle/types.h"

/*
 * Overlay 13 phase handlers. These recovered state machines initialize the
 * scene, wait for records/animations, clear progress flags, and install the
 * next member-function callback in +0x24/+0x28.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern const u8 data_ov013_021fec18[];
extern const u8 data_ov013_021febb4[];
extern const s32 data_ov013_021fece8[];
extern const s32 data_ov013_021fed40[];
extern const s32 data_ov013_021fed38[];
extern const s32 data_ov013_021fed30[];
extern const s32 data_ov013_021fed08[];
extern const s32 data_ov013_021fed00[];
extern const s32 data_ov013_021fed28[];
extern const s32 data_ov013_021fed20[];
extern const s32 data_ov013_021fed18[];
extern const s32 data_ov013_021fed10[];
#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov013_021fd310(void *);
extern void func_ov013_021fda40(void *);
extern void func_ov013_021fce04(void *, s32, s32, s32);
extern void func_ov013_021fdbb0(void *);
extern s32 func_ov013_021fdf38(void *);
extern void func_ov013_021fe078(void *, s32, s32, s32);
extern s32 func_ov013_021fdd8c(void *);
extern s32 func_ov013_021fde18(void *);
extern s32 func_ov013_021fdee4(void *);
extern s32 func_ov013_021fdfbc(void *);
extern void func_ov013_021fda9c(void *, s32, void *);
extern void func_ov013_021fdb10(void *);
extern void SceneInputBase_Update(void *, s32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 DisplayBrightness_IsSubTransitionComplete(void);
extern s32 GameWork_TestFlag(void *, s32);
extern void GameWork_ClearFlag(void *, s32);
extern void func_02092260(void *, s32);
extern s32 GraphicsSpriteState_TestTouchPoint(void *, void *);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_02095988(void *, s32);
extern s32 func_02095dd4(void *, void *, s32);
#ifdef __cplusplus
}
#endif

/* Install a two-word callback descriptor and clear its local phase fields. */
static void overlay013_set_callback(void *state, const s32 *descriptor)
{
    func_ov013_021fce04(state, descriptor[0], descriptor[1], 0);
}

/*
 * Phase zero builds the scene, conditionally creates +0x9A8, applies GameWork
 * flag 0x3BD to manager fields +0x18/+0x1C, sets state bit 0, advances +0x04,
 * and clears +0x08. Phase one updates +0x9A8 with mode zero, waits for both
 * readiness predicates, then selects one of three callback descriptors based
 * on +0x974 and flag 0x3BD (clearing the flag in its special path). Always run
 * func_ov013_021fdbb0 and return zero. Calls may allocate scene resources and
 * alter GameWork/graphics state.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fe148(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        func_ov013_021fd310(state);
        if (FIELD(s32, state, 0x97c) == 0)
            func_ov013_021fda40(state);
        if (GameWork_TestFlag(gGameWork, 0x3bd)) {
            void *manager = FIELD(void *, state, 0x84);
            FIELD(s32, manager, 0x18) = -256;
            FIELD(s32, manager, 0x1c) = 0;
        }
        FIELD(u32, state, 0x20) |= 1;
        ++FIELD(s32, state, 4);
        FIELD(s32, state, 8) = 0;
        break;
    case 1:
        if (FIELD(void *, state, 0x9a8) != 0)
            SceneInputBase_Update(FIELD(void *, state, 0x9a8), 0);
        if (DisplayBrightness_IsMainTransitionComplete() && DisplayBrightness_IsSubTransitionComplete()) {
            if (FIELD(s32, state, 0x974) != 0) {
                overlay013_set_callback(state, data_ov013_021fece8);
            } else if (GameWork_TestFlag(gGameWork, 0x3bd)) {
                GameWork_ClearFlag(gGameWork, 0x3bd);
                overlay013_set_callback(state, data_ov013_021fed40);
            } else {
                overlay013_set_callback(state, data_ov013_021fed38);
            }
        }
        break;
    }
    func_ov013_021fdbb0(state);
    return 0;
}

/*
 * Mode-zero +0x9A8 is updated every frame. Phase zero advances immediately.
 * Phase one waits until all records report complete: while waiting it assigns
 * randomized positions with ranges 24/12/18; once complete it marks active
 * first-array associates with bit 2, requests state 6, and advances. Phase two
 * waits 121 frames while using ranges 32/20/26. Phase three waits another 121
 * frames, clears seven flags from 24-byte data_ov013_021fec18 records, five
 * flags from 20-byte data_ov013_021febb4 records, and flag 0x3DE, then installs
 * data_ov013_021fed30. Always update the scene and return zero.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fe28c(void *state)
{
    s32 i;

    if (FIELD(void *, state, 0x9a8) != 0)
        SceneInputBase_Update(FIELD(void *, state, 0x9a8), 0);
    switch (FIELD(s32, state, 4)) {
    case 0:
        ++FIELD(s32, state, 4);
        FIELD(s32, state, 8) = 0;
        break;
    case 1:
        if (func_ov013_021fdf38(state)) {
            func_ov013_021fe078(state, 0x18, 0x0c, 0x12);
        } else {
            for (i = 0; i < 7; ++i) {
                u8 *record = (u8 *)state + 0x8c + i * 0xac;
                if (FIELD(u16, record, 0x98) & 1) {
                    void *target = FIELD(void *, state, 0x950 + i * 4);
                    FIELD(u16, target, 0x24) |= 4;
                }
            }
            func_02092260(state, 6);
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 2:
        if (++FIELD(s32, state, 8) > 0x78) {
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        } else {
            func_ov013_021fe078(state, 0x20, 0x14, 0x1a);
        }
        break;
    case 3:
        if (++FIELD(s32, state, 8) > 0x78) {
            for (i = 0; i < 7; ++i)
                GameWork_ClearFlag(gGameWork,
                    FIELD(u16, data_ov013_021fec18, i * 0x18 + 0x14));
            for (i = 0; i < 5; ++i)
                GameWork_ClearFlag(gGameWork,
                    FIELD(u16, data_ov013_021febb4, i * 0x14 + 0x10));
            GameWork_ClearFlag(gGameWork, 0x3de);
            overlay013_set_callback(state, data_ov013_021fed30);
        }
        break;
    }
    func_ov013_021fdbb0(state);
    return 0;
}

/*
 * Main interaction state machine. Optional +0x9A8 is updated in mode one.
 * Phases 0/1 wait for state flag bit 5 and test the first, second, then final
 * record groups: first-group indexes 2 and 3 choose phases 2 and 30, other
 * indexes install data_ov013_021fed28; second/final matches choose phases 10
 * and 20. If no record matches, controller state +0x984 equal to one can pass
 * a positional test and install data_ov013_021fed20.
 *
 * Phases 2/3 wait for the selected first record, run the +0x988 timer from 0 to
 * -256 over 20 ticks, write its output to manager +0x84, then install
 * data_ov013_021fed18. Phases 10 and 20 wait for the selected record's related
 * object's bit 0; for three frames they alternate its selection, then mark
 * +0x94C with bit 2 and reset to phase zero. Phases 30/31 create +0x9A4,
 * process it against +0x30 and flag bit 5, destroy it on a nonnegative result,
 * then either reset or install data_ov013_021fed10. Always update the scene and
 * return zero. Names such as interaction and timer are inferred; all offsets,
 * thresholds, callback choices, and callee effects are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fe454(void *state)
{
    s32 phase;
    s32 index;
    void *timer = (u8 *)state + 0x988;

    if (FIELD(void *, state, 0x9a8) != 0)
        SceneInputBase_Update(FIELD(void *, state, 0x9a8), 1);
    phase = FIELD(s32, state, 4);
    switch (phase) {
    case 0:
        FIELD(s32, state, 4) = 1;
        FIELD(s32, state, 8) = 0;
        /* The retail switch deliberately falls through into phase one. */
    case 1:
        if ((FIELD(u32, state, 0x20) & 0x20) == 0)
            break;
        if (func_ov013_021fdd8c(state)) {
            index = FIELD(s32, state, 0x96c);
            if (index == 2) {
                func_02092260(state, 0x0b);
                ++FIELD(s32, state, 4);
                FIELD(s32, state, 8) = 0;
            } else if (index == 3) {
                func_02092260(state, 2);
                FIELD(s32, state, 4) = 30;
                FIELD(s32, state, 8) = 0;
            } else {
                func_02092260(state, 2);
                FIELD(s32, state, 0x984) = 4;
                overlay013_set_callback(state, data_ov013_021fed28);
            }
        } else if (func_ov013_021fde18(state)) {
            func_02092260(state, 0x32);
            FIELD(s32, state, 4) = 10;
            FIELD(s32, state, 8) = 0;
        } else if (func_ov013_021fdee4(state)) {
            func_02092260(state, 0x32);
            FIELD(s32, state, 4) = 20;
            FIELD(s32, state, 8) = 0;
        } else if (FIELD(s32, state, 0x984) == 1 &&
                   GraphicsSpriteState_TestTouchPoint(FIELD(void *,
                       FIELD(void *, state, 0x948), 0x9c),
                       (u8 *)state + 0x30)) {
            func_02092260(state, 0x7c);
            FIELD(s32, state, 0x984) = 4;
            overlay013_set_callback(state, data_ov013_021fed20);
        }
        break;
    case 2:
        index = FIELD(s32, state, 0x96c);
        if (func_ov013_021fdfbc((u8 *)state + 0x8c + index * 0xac)) {
            func_02091bac(timer, 2, 0, -256, 20);
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3: {
        void *manager = FIELD(void *, state, 0x84);
        FIELD(s32, manager, 0x18) = func_02091c7c(timer, 1);
        FIELD(s32, manager, 0x1c) = 0;
        if (func_02091cf0(timer))
            overlay013_set_callback(state, data_ov013_021fed18);
        break;
    }
    case 10: {
        u8 *record;
        void *related;
        index = FIELD(s32, state, 0x970);
        record = (u8 *)state + 0x540 + index * 0xac;
        related = FIELD(void *, record, 0x9c);
        if ((FIELD(u16, related, 0x24) & 1) == 0)
            break;
        if (++FIELD(s32, state, 8) >= 3) {
            func_02095988(record,
                FIELD(s32, data_ov013_021febb4, index * 0x14));
            FIELD(u16, FIELD(void *, state, 0x94c), 0x24) |= 4;
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        } else {
            func_02095988(record,
                FIELD(s32, data_ov013_021febb4, index * 0x14) + 1);
        }
        break;
    }
    case 20: {
        u8 *record = (u8 *)state + 0x89c;
        void *related = FIELD(void *, state, 0x938);
        if ((FIELD(u16, related, 0x24) & 1) == 0)
            break;
        if (++FIELD(s32, state, 8) >= 3) {
            func_02095988(record, 0);
            FIELD(u16, FIELD(void *, state, 0x94c), 0x24) |= 4;
            FIELD(s32, state, 4) = 0;
            FIELD(s32, state, 8) = 0;
        } else {
            func_02095988(record, 1);
        }
        break;
    }
    case 30:
        index = FIELD(s32, state, 0x96c);
        if (func_ov013_021fdfbc((u8 *)state + 0x8c + index * 0xac)) {
            func_ov013_021fda9c(state, 0x20, 0);
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 31: {
        s32 result = func_02095dd4(FIELD(void *, state, 0x9a4),
                                    (u8 *)state + 0x30,
                                    (FIELD(u32, state, 0x20) & 0x20) ? -1 : 0);
        if (result >= 0) {
            func_ov013_021fdb10(state);
            if (result == 1) {
                FIELD(s32, state, 0x984) = 4;
                overlay013_set_callback(state, data_ov013_021fed10);
            } else if (result == 2) {
                FIELD(s32, state, 4) = 0;
                FIELD(s32, state, 8) = 0;
            }
        }
        break;
    }
    }
    func_ov013_021fdbb0(state);
    return 0;
}

/*
 * Update optional +0x9A8 in mode one. In phase zero, once state flag bit 5 is
 * set, a matching first-array record requests state 2, sets controller phase
 * +0x984 to 4, and installs data_ov013_021fed08. Otherwise, controller state 1
 * may pass a +0x948/+0x9C positional test, request state 11, start the timer at
 * +0x988 with (-256,0,20), and advance. Phase one writes the timer output to
 * manager +0x84/+0x18, clears +0x1C, and on completion installs
 * data_ov013_021fed00. Always update the scene and return zero. Position/timer
 * labels are inferred; offsets and transitions are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fe880(void *state)
{
    void *timer = (u8 *)state + 0x988;

    if (FIELD(void *, state, 0x9a8) != 0)
        SceneInputBase_Update(FIELD(void *, state, 0x9a8), 1);
    if (FIELD(s32, state, 4) == 0) {
        if (FIELD(u32, state, 0x20) & 0x20) {
            if (func_ov013_021fdd8c(state)) {
                func_02092260(state, 2);
                FIELD(s32, state, 0x984) = 4;
                overlay013_set_callback(state, data_ov013_021fed08);
            } else if (FIELD(s32, state, 0x984) == 1 &&
                       GraphicsSpriteState_TestTouchPoint(FIELD(void *,
                           FIELD(void *, state, 0x948), 0x9c),
                           (u8 *)state + 0x30)) {
                func_02092260(state, 0x0b);
                func_02091bac(timer, 2, -256, 0, 20);
                ++FIELD(s32, state, 4);
                FIELD(s32, state, 8) = 0;
            }
        }
    } else if (FIELD(s32, state, 4) == 1) {
        void *manager = FIELD(void *, state, 0x84);
        FIELD(s32, manager, 0x18) = func_02091c7c(timer, 1);
        FIELD(s32, manager, 0x1c) = 0;
        if (func_02091cf0(timer))
            overlay013_set_callback(state, data_ov013_021fed00);
    }
    func_ov013_021fdbb0(state);
    return 0;
}
