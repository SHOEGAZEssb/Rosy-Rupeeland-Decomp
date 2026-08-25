#include "tingle/types.h"

/* Overlay 29 result-resolution animation and mode-dependent outcome routing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern void *gHeapContext;
extern const u8 data_ov029_021fed28[];
extern const u8 data_ov029_021febbc[];
extern const s32 data_ov029_021fec48[];
extern const s32 data_ov029_021fec98[];
extern const s32 data_ov029_021fec90[];
extern const s32 data_ov029_021fec88[];
extern const s32 data_ov029_021fec80[];
extern const s32 data_ov029_021fec78[];
extern const s32 data_ov029_021fec10[];
extern const s32 data_ov029_021fec68[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void GameWork_SetFlag(void *, s32);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 func_0209189c(void *, s32, s32);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void Presentation_SetScript(void *, const void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern s32 Presentation_IsScriptComplete(void *);
extern s32 func_020befec(s32, s32);
extern void func_ov002_021fbe68(void *);
extern void func_ov029_021fce4c(void *, s32, s32);
extern void func_ov029_021fd6fc(void *);
extern void func_ov029_021fd7a8(void *, s32);
extern s32 func_ov029_021fd850(void *);
extern void func_ov029_021fd95c(void *);
extern void func_ov029_021fd988(void *);
extern void func_ov029_021fd9b4(void *);
extern void func_ov029_021fe780(void *, s32);
extern s32 func_ov029_021fe798(void *);
extern void *func_ov045_0220bc40(void *);
extern void func_ov045_0220bd90(void *);
extern void func_ov045_0220bdb0(void *);
extern void func_ov045_0220bdf0(void *);
#ifdef __cplusplus
}
#endif

static void Overlay029_SetPair(void *state, const s32 *pair)
{
    func_ov029_021fce4c(state, pair[0], pair[1]);
}

static void Overlay029_NextPhase(void *state)
{
    FIELD(s32, state, 4)++;
    FIELD(s32, state, 8) = 0;
}

static void Overlay029_SetSelection(void *state, s32 status, s32 entry)
{
    FIELD(s32, state, 0x6c) = status;
    func_ov029_021fd7a8(state, entry);
}

/*
 * Runs the final result-resolution state. Phases 0/1 fade out, play source-
 * dependent event 0x69/0x6D plus 0x6C, allocate a 0xB0-byte result object +0xA0,
 * and initialize it from rodata 0x021FEBBC. Phase 2 waits for readiness and sets
 * a random 60..90 tick duration; phase 3 waits for completion, stops event 0x6C,
 * then compares available amount +0x64 with requested/result amount +0xAC.
 * Source mode +0x5C routes success/failure through game flag 0x38A, result-object
 * animations, palette selectors +0x20/+0x60/+0x80, status +0x6C, selection
 * entries 1..6, optional flag +0x74, remaining count +0x60, and callback pairs
 * 0x021FEC48/98/90/88/80/78/10. Modes 5/6 use 150% and 200% thresholds via
 * integer division; other modes use half/double thresholds as recovered.
 * Phase 4 confirms input, returns to the base palette, selects entry 1/2, and
 * starts a 16-tick animation; phase 5 waits, destroys +0xA0, and fades in;
 * phase 6 resumes overlay-2 child +0xA8 and installs pair 0x021FEC68. The common
 * runtime update always runs and zero is returned. Heap, audio, transition,
 * palette, controller, game-work, result-object, and overlay SDK state change.
 */
extern "C" s32 func_ov029_021fe0cc(void *state)
{
    s32 mode;
    s32 available;
    s32 amount;
    void *result = FIELD(void *, state, 0xa0);
    switch (FIELD(s32, state, 4)) {
    case 0:
        DisplayBrightness_StartMaskedTransitions(1, -8);
        Overlay029_NextPhase(state);
        /* fall through */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() == 0)
            break;
        SceneSound_StopPackedEffect(state, FIELD(s32, state, 0x58) == 5 ? 0x6d : 0x69);
        SceneSound_PlayPackedEffect(state, 0x6c);
        result = Heap_Alloc(0xb0, data_ov029_021fed28, 4, gHeapContext);
        if (result != 0)
            result = func_ov045_0220bc40(result);
        FIELD(void *, state, 0xa0) = result;
        Presentation_SetScript(result, data_ov029_021febbc, 0);
        Overlay029_NextPhase(state);
        break;
    case 2:
        if (Presentation_IsScriptComplete(result) != 0) {
            func_ov029_021fe780(
                result, func_0209189c((u8 *)state + 0xe4, 0x3c, 0x5a));
            Overlay029_NextPhase(state);
        }
        break;
    case 3:
        if (func_ov029_021fe798(result) == 0)
            break;
        SceneSound_StopPackedEffect(state, 0x6c);
        mode = FIELD(s32, state, 0x5c);
        available = FIELD(s32, state, 0x64);
        amount = FIELD(s32, state, 0xac);
        if (mode == 7) {
            SceneSound_PlayPackedEffect(state, 0x6b);
            func_ov045_0220bdb0(result);
            Overlay029_SetSelection(state, 2, 1);
            Overlay029_SetPair(state, data_ov029_021fec48);
        } else if (mode <= 1) {
            if (available >= amount) {
                SceneSound_PlayPackedEffect(state, 0x6a);
                GameWork_SetFlag(gGameWork, 0x38a);
                if (amount <= available / 2) {
                    FIELD(s32, state, 0x74) = 1;
                    func_ov045_0220bd90(result);
                    Overlay029_SetSelection(state, 4, 4);
                } else {
                    func_ov045_0220bdf0(result);
                    func_ov029_021fd95c(state);
                    Overlay029_SetSelection(state, 3, 3);
                }
                Overlay029_SetPair(state, data_ov029_021fec98);
            } else {
                SceneSound_PlayPackedEffect(state, 0x6b);
                func_ov045_0220bdb0(result);
                func_ov029_021fd988(state);
                if (amount >= available * 2)
                    Overlay029_SetSelection(state, 1, 6);
                else
                    Overlay029_SetSelection(state, 2, 5);
                if (--FIELD(s32, state, 0x60) > 0)
                    Overlay029_NextPhase(state);
                else
                    Overlay029_SetPair(state, data_ov029_021fec90);
            }
        } else if (mode == 2 || mode == 3) {
            if (available <= amount) {
                SceneSound_PlayPackedEffect(state, 0x6a);
                GameWork_SetFlag(gGameWork, 0x38a);
                if (amount >= available * 2) {
                    func_ov045_0220bd90(result);
                    FIELD(s32, state, 0x74) = 1;
                    Overlay029_SetSelection(state, 4, 4);
                } else {
                    func_ov045_0220bdf0(result);
                    func_ov029_021fd95c(state);
                    Overlay029_SetSelection(state, 3, 3);
                }
            } else {
                SceneSound_PlayPackedEffect(state, 0x6b);
                func_ov045_0220bdb0(result);
                func_ov029_021fd988(state);
                if (amount <= available / 2)
                    Overlay029_SetSelection(state, 1, 6);
                else
                    Overlay029_SetSelection(state, 2, 5);
            }
            Overlay029_SetPair(state, data_ov029_021fec88);
        } else if (mode == 4) {
            if (available <= amount) {
                SceneSound_PlayPackedEffect(state, 0x6a);
                func_ov045_0220bdf0(result);
                func_ov029_021fd95c(state);
                GameWork_SetFlag(gGameWork, 0x38a);
                Overlay029_SetSelection(state, 3, 3);
            } else {
                SceneSound_PlayPackedEffect(state, 0x6b);
                func_ov045_0220bdb0(result);
                func_ov029_021fd988(state);
                Overlay029_SetSelection(state, 2, 4);
            }
            Overlay029_SetPair(state, data_ov029_021fec80);
        } else {
            if (available <= amount) {
                SceneSound_PlayPackedEffect(state, 0x6a);
                GameWork_SetFlag(gGameWork, 0x38a);
                if (func_020befec(available * 200, 100) <= amount) {
                    func_ov045_0220bd90(result);
                    FIELD(s32, state, 0x74) = 1;
                    Overlay029_SetSelection(state, 5, 4);
                } else if (func_020befec(available * 150, 100) <= amount) {
                    func_ov045_0220bd90(result);
                    Overlay029_SetSelection(state, 4, 3);
                } else {
                    func_ov045_0220bdf0(result);
                    func_ov029_021fd95c(state);
                    Overlay029_SetSelection(state, 3, 2);
                }
                Overlay029_SetPair(state, data_ov029_021fec78);
            } else {
                SceneSound_PlayPackedEffect(state, 0x6b);
                func_ov045_0220bdb0(result);
                func_ov029_021fd988(state);
                FIELD(s32, state, 0x6c) = 2;
                FIELD(s32, state, 0xac) = 0;
                func_ov029_021fd7a8(state, 5);
                Overlay029_SetPair(state, data_ov029_021fec10);
            }
        }
        break;
    case 4:
        if (func_ov029_021fd850(state) != 0) {
            func_ov029_021fd9b4(state);
            func_ov029_021fd7a8(state,
                                FIELD(s32, state, 0x60) == 1 ? 2 : 1);
            PresentationScalar_TransitionTo((u8 *)result + 0xc, 2, 0x160);
            FIELD(s32, result, 0x7c) = 0x10;
            FIELD(s32, result, 0x80) = 0;
            Overlay029_NextPhase(state);
        }
        break;
    case 5:
        if (func_ov029_021fd850(state) != 0 &&
            func_ov029_021fe798(result) != 0) {
            if (result != 0) {
                typedef void (*Destructor)(void *);
                FIELD(Destructor *, result, 0)[1](result);
            }
            FIELD(void *, state, 0xa0) = 0;
            DisplayBrightness_StartMaskedTransitions(1, 0);
            Overlay029_NextPhase(state);
        }
        break;
    case 6:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov002_021fbe68(FIELD(void *, state, 0xa8));
            SceneSound_PlayPackedEffect(state, 0x69);
            Overlay029_SetPair(state, data_ov029_021fec68);
        }
        break;
    }
    func_ov029_021fd6fc(state);
    return 0;
}
