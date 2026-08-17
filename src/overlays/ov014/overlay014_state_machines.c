#include "tingle/types.h"

/*
 * Overlay 14 subordinate interaction state machines. These handlers translate
 * input/status predicates into sound requests, presentation toggles, GameWork
 * flags, phase changes, and callback transitions.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern const s32 data_ov014_021fd968[];
extern const s32 data_ov014_021fd938[];
extern const s32 data_ov014_021fd958[];
extern const s32 data_ov014_021fd930[];
extern const s32 data_ov014_021fd948[];
extern const s32 data_ov014_021fd940[];
#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov014_021fce14(void *, s32, s32, s32);
extern void func_ov014_021fd2f8(void *, s32);
extern void func_02092260(void *, s32);
extern void func_02092288(void *, s32);
extern void GameWork_SetFlag(void *, s32);
extern void InventoryScroll_BeginMarkerDrag(void *, s32);
extern void InventoryScroll_EndMarkerDrag(void *, s32);
extern void InventoryRecordCollection_Sort(void *, s32);
extern void func_ov000_021fc3f8(void *);
extern s32 func_ov000_021fc450(void *);
extern void func_ov000_021fc460(void *);
extern s32 func_ov000_021fcb98(void *, void *);
extern s32 func_ov000_021fcca8(void *, void *);
extern s32 func_ov000_021fc298(void *, void *);
extern s32 func_ov000_021fcc18(void *, void *);
extern s32 func_ov000_021fccfc(void *, void *);
extern void func_ov000_021fca4c(void *, s32);
extern void func_ov000_021fc9d4(void *);
extern s32 func_ov000_021fc5ac(void *, void *);
extern s32 func_ov000_021fc5d4(void *, void *);
extern s32 func_ov000_021fc5fc(void *, void *);
extern s32 func_ov000_021fc424(void *);
extern s32 func_ov000_021fc4fc(void *);
extern s32 func_ov000_021fc528(void *);
extern s32 func_ov000_021fc538(void *);
extern s32 func_ov000_021fc560(void *, void *);
extern void func_ov000_021fc3a4(void *);
extern void func_ov000_021fc614(void *, s32);
extern void func_ov000_021fc254(void *);
extern void func_ov000_021fc714(void *);
extern void func_ov000_021fc164(void *);
#ifdef __cplusplus
}
#endif

/* Install a confirmed two-word callback descriptor at +0x24/+0x28. */
static void overlay014_set_callback(void *state, const s32 *descriptor)
{
    func_ov014_021fce14(state, descriptor[0], descriptor[1], 0);
}

/*
 * Four-phase main interaction handler. Phase zero initializes +0x78 and enables
 * presentation +0x88. Phase one waits for func_ov000_021fc450, updating through
 * func_ov000_021fc460 until ready. Phase two processes target +0x2C and input
 * +0x30 when state bits 4/5 allow: it can change the selected subordinate item,
 * install callbacks data_ov014_021fd968/938/958/930, request sounds 0/2/3/11,
 * and set GameWork flag 0x388. Independent previous/next predicates move the
 * phase backward/forward. Phase three similarly moves backward or re-enables
 * presentation. Always update non-null +0x78 and return zero. Predicate meaning
 * is inferred from shared overlay 0 behavior; offsets and transitions are
 * confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov014_021fd38c(void *state)
{
    void *subordinate = FIELD(void *, state, 0x78);
    s32 selected;

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_ov000_021fc3f8(subordinate);
        func_ov014_021fd2f8(state, 0);
        ++FIELD(s32, state, 4);
        FIELD(s32, state, 8) = 0;
        break;
    case 1:
        if (func_ov000_021fc450(subordinate)) {
            func_ov014_021fd2f8(state, 0);
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        } else {
            func_ov000_021fc460(subordinate);
            break;
        }
        /* The retail flow enters phase-two handling immediately when ready. */
    case 2:
        if (!func_ov000_021fcb98(subordinate, FIELD(void *, state, 0x2c)) &&
            (FIELD(u32, state, 0x20) & 0x10) &&
            !func_ov000_021fcca8(subordinate, (u8 *)state + 0x30) &&
            (FIELD(u32, state, 0x20) & 0x20)) {
            selected = func_ov000_021fc298(subordinate, (u8 *)state + 0x30);
            if (!func_ov000_021fcc18(subordinate, (u8 *)state + 0x30)) {
                if (func_ov000_021fccfc(subordinate, (u8 *)state + 0x30)) {
                    overlay014_set_callback(state, data_ov014_021fd968);
                    break;
                }
                if (selected >= 0) {
                    func_02092260(state, 0);
                    if (selected != FIELD(s32, subordinate, 0x25c)) {
                        func_ov000_021fca4c(subordinate, selected);
                        func_ov000_021fc9d4(subordinate);
                        func_ov014_021fd2f8(state, 0);
                    }
                    break;
                }
                if (func_ov000_021fc5ac(subordinate, (u8 *)state + 0x30)) {
                    func_02092260(state, 3);
                    overlay014_set_callback(state, data_ov014_021fd938);
                    break;
                }
                if (func_ov000_021fc5d4(subordinate, (u8 *)state + 0x30)) {
                    func_02092260(state, 2);
                    overlay014_set_callback(state, data_ov014_021fd958);
                    break;
                }
                if (func_ov000_021fc5fc(subordinate, (u8 *)state + 0x30)) {
                    func_02092260(state, 0x0b);
                    GameWork_SetFlag(gGameWork, 0x388);
                    overlay014_set_callback(state, data_ov014_021fd930);
                    break;
                }
            }
        }
        if (func_ov000_021fc424(subordinate)) {
            func_02092260(state, 0);
            --FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc4fc(subordinate)) {
            func_02092260(state, 0);
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 3:
        if (func_ov000_021fc528(subordinate)) {
            --FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        } else if (func_ov000_021fc538(subordinate)) {
            func_ov014_021fd2f8(state, 0);
        }
        break;
    }
    if (subordinate != 0)
        func_ov000_021fc164(subordinate);
    return 0;
}

/*
 * Three-phase focus handler using subordinate member +0x26C. Phase zero selects
 * mode 4 and falls through. Phase one waits for subordinate readiness; when its
 * +0x0C/+0x10 values differ it enables presentation and requests effect 8,
 * then advances. Phase two either responds to state bit 4 and input +0x30 by
 * requesting sound 8 and returning to phase one, or selects mode 6 and installs
 * data_ov014_021fd948. Always update +0x78 and return zero; callee side effects
 * include subordinate animation/presentation changes.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov014_021fd67c(void *state)
{
    void *subordinate = FIELD(void *, state, 0x78);
    void *member = FIELD(void *, subordinate, 0x26c);

    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(member, 4);
        ++FIELD(s32, state, 4);
        FIELD(s32, state, 8) = 0;
        /* Fall through and poll readiness in the same frame. */
    case 1:
        if (!func_ov000_021fc450(subordinate)) {
            func_ov000_021fc460(subordinate);
            break;
        }
        if (FIELD(s32, member, 0x0c) != FIELD(s32, member, 0x10)) {
            func_ov014_021fd2f8(state, 0);
            func_02092288(state, 8);
        }
        ++FIELD(s32, state, 4);
        FIELD(s32, state, 8) = 0;
        /* Fall through to phase two. */
    case 2:
        if (FIELD(u32, state, 0x20) & 0x10) {
            if (func_ov000_021fc560(subordinate, (u8 *)state + 0x30)) {
                func_02092260(state, 8);
                --FIELD(s32, state, 4);
                FIELD(s32, state, 8) = 0;
            }
        } else {
            InventoryScroll_EndMarkerDrag(member, 6);
            overlay014_set_callback(state, data_ov014_021fd948);
        }
        break;
    }
    if (subordinate != 0)
        func_ov000_021fc164(subordinate);
    return 0;
}

/*
 * Two-phase subordinate completion handler. Once +0x150 reaches +0x14C, phase
 * zero calls func_ov000_021fc3a4 and alternates +0x8C, passing mode 1 or 2 to
 * global object +0x78/+0x24C, then advances. Phase one applies four confirmed
 * subordinate reset/finalization calls and installs data_ov014_021fd940. Always
 * update +0x78 and return zero; global mode and subordinate state may change.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov014_021fd7b4(void *state)
{
    void *subordinate = FIELD(void *, state, 0x78);

    if (FIELD(s32, state, 4) == 0) {
        if (FIELD(s32, subordinate, 0x150) >= FIELD(s32, subordinate, 0x14c)) {
            func_ov000_021fc3a4(subordinate);
            FIELD(s32, state, 0x8c) ^= 1;
            InventoryRecordCollection_Sort(FIELD(void *, subordinate, 0x24c),
                          FIELD(s32, state, 0x8c) ? 1 : 2);
            ++FIELD(s32, state, 4);
            FIELD(s32, state, 8) = 0;
        }
    } else if (FIELD(s32, state, 4) == 1) {
        func_ov000_021fc614(subordinate, 0);
        func_ov000_021fc254(subordinate);
        func_ov000_021fc714(subordinate);
        func_ov000_021fc9d4(subordinate);
        overlay014_set_callback(state, data_ov014_021fd940);
    }
    if (subordinate != 0)
        func_ov000_021fc164(subordinate);
    return 0;
}
