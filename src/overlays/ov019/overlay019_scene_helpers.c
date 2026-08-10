#include "tingle/types.h"

/* Overlay 19 transition records, scene teardown, display routing, and callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov019_021fd638[];
extern void *data_021052fc;
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void GamePhaseRuntime_UpdateActorPresentationState(void *, s32);
extern void GamePhaseState_ForwardVCount(void *, u16);
extern void GamePhaseCurrencyHud_Update(void *);
extern void func_ov002_021fb9c4(void *);
extern void func_ov002_021fba00(void *);
#ifdef __cplusplus
}
#endif

/*
 * Store caller transition values at +0x24/+0x28 and clear phase/timer +4/+8;
 * the fourth register argument is unused. Returns void; only caller memory
 * changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov019_021fce00(void *state, s32 value24, s32 value28,
                                     s32 unused)
{
    (void)unused;
    FIELD(s32, state, 0x24) = value24;
    FIELD(s32, state, 0x28) = value28;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}

/*
 * Restore vtable data_ov019_021FD638, clear scene flag bit 10 at +0x20, and
 * destroy/free optional overlay-2 helper +0x5C. Return state without freeing
 * it. Heap, helper, and caller state may change; no direct hardware access.
 */
extern "C" void *func_ov019_021fcf2c(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov019_021fd638;
    FIELD(u32, state, 0x20) &= ~0x400U;
    void *helper = FIELD(void *, state, 0x5c);
    if (helper != 0) {
        func_ov002_021fb9c4(helper);
        Heap_Free(helper);
    }
    return state;
}

/*
 * Perform the teardown of 0x021FCF2C, then free the containing scene and return
 * its former address. Heap/helper state changes; the returned pointer is invalid
 * and no direct hardware access occurs.
 */
extern "C" void *func_ov019_021fcf70(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov019_021fd638;
    FIELD(u32, state, 0x20) &= ~0x400U;
    void *helper = FIELD(void *, state, 0x5c);
    if (helper != 0) {
        func_ov002_021fb9c4(helper);
        Heap_Free(helper);
    }
    Heap_Free(state);
    return state;
}

/*
 * Replace Nintendo DS POWCNT1 bit 15 at 0x04000304 with caller bit zero and
 * return void. This directly selects the LCD routing/swap state; no caller or
 * SDK memory changes.
 */
extern "C" void func_ov019_021fd154(s32 value)
{
    volatile u16 *powerControl = (volatile u16 *)0x04000304;
    *powerControl = (*powerControl & ~0x8000U) | (value << 15);
}

/*
 * If optional state +0x58 exists, call 0x02008E10 on global data_021052FC with
 * zero; otherwise call 0x02010E68 on gLupyContext. Then update overlay-2 helper
 * +0x5C through 0x021FBA00. Returns void. Global/SDK and helper state may change;
 * no direct hardware access occurs.
 */
extern "C" void func_ov019_021fd170(void *state)
{
    if (FIELD(void *, state, 0x58) != 0)
        GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 0);
    else
        GamePhaseCurrencyHud_Update(gLupyContext);
    func_ov002_021fba00(FIELD(void *, state, 0x5c));
}

/*
 * Invoke scene update helper 0x021FD170 and return one. Helper/global SDK state
 * may change; no direct hardware access occurs.
 */
extern "C" s32 func_ov019_021fd4c8(void *state)
{
    func_ov019_021fd170(state);
    return 1;
}

/*
 * When scene flag bit 10 at +0x20 is set and optional +0x58 exists, read the
 * Nintendo DS VCOUNT register at 0x04000006 and pass it with global scene data
 * +0x24 to 0x0200EA34. Always return zero. Global SDK state may change and this
 * function directly reads display timing hardware.
 */
extern "C" s32 func_ov019_021fd588(void *state)
{
    if ((FIELD(u32, state, 0x20) & 0x400) &&
        FIELD(void *, state, 0x58) != 0) {
        GamePhaseState_ForwardVCount((u8 *)data_021052fc + 0x24,
                      *(volatile u16 *)0x04000006);
    }
    return 0;
}
