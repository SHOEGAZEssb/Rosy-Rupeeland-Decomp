#include "tingle/types.h"

/* Overlay 29 closing confirmation states, animation helpers, commit, and free. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern void *gLupyContext;
extern const s32 data_ov029_021fec60[];
extern const s32 data_ov029_021fec58[];
extern const s32 data_ov029_021fec50[];
extern const s32 data_ov029_021feca8[];
extern const s32 data_ov029_021fec40[];
extern const s32 data_ov029_021fec38[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(void *);
extern void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern void func_02092260(void *, s32);
extern void func_02092288(void *, s32);
extern void func_02092c8c(s32, s32);
extern void func_020939d8(void *);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void func_ov002_021fbe68(void *);
extern void func_ov029_021fce4c(void *, s32, s32);
extern void func_ov029_021fd6fc(void *);
extern void func_ov029_021fd7a8(void *, s32);
extern s32 func_ov029_021fd850(void *);
extern void func_ov029_021fd9b4(void *);
extern s32 func_ov029_021fe798(void *);
extern s32 func_ov045_0220b924(void *, s32, s32, s32);
extern s32 func_ov045_0220b9b8(void *);
extern s32 func_ov045_0220bc34(void *);
extern void func_ov045_0220bdd0(void *);
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

/*
 * Stores signed-16 `duration` at object +0x7C and clears elapsed +0x80. Returns
 * void; only animation state changes.
 */
extern "C" void func_ov029_021fe780(void *object, s32 duration)
{
    FIELD(s32, object, 0x7c) = (s16)duration;
    FIELD(s32, object, 0x80) = 0;
}

/* Returns one when elapsed +0x80 is at least duration +0x7C, otherwise zero. */
extern "C" s32 func_ov029_021fe798(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

/*
 * Two-phase quantity-application state. Phase 0 waits for controller input,
 * asks child +0xD0 to apply amount +0xAC against the current global count with
 * mode zero, and records the returned delta through global-context function
 * 0x02010C00. Phase 1 waits for child completion and absence of its secondary
 * condition, then installs callback pair 0x021FEC60. The common runtime update
 * always runs and zero is returned; controller, child, context, and UI change.
 */
extern "C" s32 func_ov029_021fe7b0(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        if (func_ov029_021fd850(state) != 0) {
            s32 count = GamePhaseCurrencyHud_GetCurrency(gLupyContext);
            s32 delta = func_ov045_0220b924(
                FIELD(void *, state, 0xd0), count,
                FIELD(s32, state, 0xac), 0);
            GamePhaseCurrencyHud_AddCurrency(gLupyContext, FIELD(s32, state, 0xac), delta);
            Overlay029_NextPhase(state);
        }
    } else if (FIELD(s32, state, 4) == 1) {
        void *child = FIELD(void *, state, 0xd0);
        if (func_ov045_0220b9b8(child) != 0 &&
            func_ov045_0220bc34(child) == 0)
            Overlay029_SetPair(state, data_ov029_021fec60);
    }
    func_ov029_021fd6fc(state);
    return 0;
}

/*
 * Four-phase return/cleanup state. Phase 0 waits for input, clears deferred
 * result flag +0x74 (notifying result object +0xA0), resets controller +0x9C,
 * and applies negated amount +0xAC through child +0xD0/global context in mode 1.
 * Phase 1 waits for child completion, then routes mode 7 to pair 0x021FEC58;
 * status 1/2 may route mode-4 count-one to status 5/entry 5/pair 0x021FEC50,
 * exhausted remaining count to pair 0x021FECA8, or animate result object +0xA0
 * for 16 ticks after restoring palette/entry 1; other status uses 0x021FEC40.
 * Phase 2 waits for input and animation completion, virtually destroys +0xA0,
 * and fades in. Phase 3 waits for the fade, resumes overlay-2 +0xA8, plays the
 * source-dependent 0x69/0x6D event, and installs pair 0x021FEC38. The common
 * runtime update always runs and zero is returned; context, child, palette,
 * controller, audio, transition, heap-object, and overlay state may change.
 */
extern "C" s32 func_ov029_021fe870(void *state)
{
    void *result = FIELD(void *, state, 0xa0);
    switch (FIELD(s32, state, 4)) {
    case 0:
        if (func_ov029_021fd850(state) == 0)
            break;
        if (FIELD(s32, state, 0x74) != 0) {
            FIELD(s32, state, 0x74) = 0;
            func_ov045_0220bdd0(result);
        }
        func_020939d8(FIELD(void *, state, 0x9c));
        {
            s32 count = GamePhaseCurrencyHud_GetCurrency(gLupyContext);
            s32 delta = func_ov045_0220b924(
                FIELD(void *, state, 0xd0), count,
                FIELD(s32, state, 0xac), 1);
            GamePhaseCurrencyHud_AddCurrency(gLupyContext, -FIELD(s32, state, 0xac), delta);
        }
        Overlay029_NextPhase(state);
        break;
    case 1:
        if (func_ov045_0220b9b8(FIELD(void *, state, 0xd0)) == 0 ||
            func_ov045_0220bc34(FIELD(void *, state, 0xd0)) != 0)
            break;
        if (FIELD(s32, state, 0x5c) == 7) {
            Overlay029_SetPair(state, data_ov029_021fec58);
        } else if (FIELD(s32, state, 0x6c) == 1 ||
                   FIELD(s32, state, 0x6c) == 2) {
            if (FIELD(s32, state, 0x5c) == 4 &&
                GamePhaseCurrencyHud_GetCurrency(gLupyContext) == 1) {
                FIELD(s32, state, 0xac) = 0;
                FIELD(s32, state, 0x6c) = 5;
                func_ov029_021fd7a8(state, 5);
                Overlay029_SetPair(state, data_ov029_021fec50);
            } else if (FIELD(s32, state, 0x5c) != 4 &&
                       FIELD(s32, state, 0x60) == 0) {
                Overlay029_SetPair(state, data_ov029_021feca8);
            } else {
                func_ov029_021fd9b4(state);
                PresentationScalar_TransitionTo((u8 *)result + 0xc, 2, 0x160);
                FIELD(s32, result, 0x7c) = 0x10;
                FIELD(s32, result, 0x80) = 0;
                FIELD(s32, state, 0x6c) = 0;
                func_ov029_021fd7a8(state, 1);
                Overlay029_NextPhase(state);
            }
        } else {
            Overlay029_SetPair(state, data_ov029_021fec40);
        }
        break;
    case 2:
        if (func_ov029_021fd850(state) != 0 &&
            func_ov029_021fe798(result) != 0) {
            if (result != 0) {
                typedef void (*Destructor)(void *);
                FIELD(Destructor *, result, 0)[1](result);
            }
            FIELD(void *, state, 0xa0) = 0;
            func_02092c8c(1, 0);
            Overlay029_NextPhase(state);
        }
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_ov002_021fbe68(FIELD(void *, state, 0xa8));
            func_02092260(state,
                          FIELD(s32, state, 0x58) == 5 ? 0x6d : 0x69);
            Overlay029_SetPair(state, data_ov029_021fec38);
        }
        break;
    }
    func_ov029_021fd6fc(state);
    return 0;
}

/*
 * Final commit state. Phase 0 waits for controller input, stops source-dependent
 * event 0x69/0x6D, writes status +0x6C to game-work halfword +0x204 and amount
 * +0xAC to game-work word +0x7CC, then advances. Phase 1 returns one. Other
 * paths run the common runtime update and return zero; audio, controller, and
 * persistent game-work state may change.
 */
extern "C" s32 func_ov029_021feb08(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        if (func_ov029_021fd850(state) != 0) {
            func_02092288(state,
                          FIELD(s32, state, 0x58) == 5 ? 0x6d : 0x69);
            FIELD(u16, gGameWork, 0x204) = (u16)FIELD(s32, state, 0x6c);
            FIELD(s32, gGameWork, 0x7cc) = FIELD(s32, state, 0xac);
            Overlay029_NextPhase(state);
        }
    } else if (FIELD(s32, state, 4) == 1) {
        return 1;
    }
    func_ov029_021fd6fc(state);
    return 0;
}

/* Frees `object` and returns its former address; heap ownership is released. */
extern "C" void *func_ov029_021feba8(void *object)
{
    Heap_Free(object);
    return object;
}
