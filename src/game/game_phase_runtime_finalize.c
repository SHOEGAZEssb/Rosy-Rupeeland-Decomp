#include "tingle/game_phase_runtime.h"

/* Post-transition actor-state application for GamePhaseRuntime. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020086f8(void *state, GamePhaseRuntime *self);
extern void func_0200875c(void *state, GamePhaseRuntime *self);
extern void func_0202eb18(void *actor, const void *state);
extern void func_02005058(void *state);
extern void func_02030acc(void *actor);
extern void func_020740a4(void);
extern void func_0202d5c8(void *actor);
extern void func_0203ad64(void);
#ifdef __cplusplus
}
#endif

/*
 * Apply a recovered 16-byte state to the primary actor for modes 1/3 and to
 * the optional secondary actor for modes 2/3, then run their reset/finalize
 * hooks. The value argument is unused. Temporary states are explicitly
 * destroyed, and the global completion hook always runs. Returns no value.
 */
void func_02007a24(GamePhaseRuntime *self, s32 value, s32 mode)
{
    u8 primaryState[16];
    u8 secondaryState[16];
    u8 *b = (u8 *)self;
    void *actor;
    (void)value;

    if (mode == 1 || mode == 3) {
        func_020086f8(primaryState, self);
        actor = b + 0x28;
        func_0202eb18(actor, primaryState);
        func_02005058(primaryState);
        func_02030acc(actor);
        func_020740a4();
        func_0202d5c8(actor);
    }

    if ((u32)(mode - 2) <= 1) {
        actor = *(void **)(b + 0x2fb8);
        if (actor != 0) {
            func_0200875c(secondaryState, self);
            actor = (u8 *)*(void **)(b + 0x2fb8) + 8;
            func_0202eb18(actor, secondaryState);
            func_02005058(secondaryState);
            actor = (u8 *)*(void **)(b + 0x2fb8) + 8;
            func_02030acc(actor);
            func_020740a4();
            actor = (u8 *)*(void **)(b + 0x2fb8) + 8;
            func_0202d5c8(actor);
        }
    }
    func_0203ad64();
}
