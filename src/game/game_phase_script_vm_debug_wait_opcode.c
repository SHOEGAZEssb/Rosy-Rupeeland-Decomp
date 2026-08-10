#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"

/* Reconstruct the actor-script opcode that polls recovered debug/UI state. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *DebugHudState_GetGlobal(...);
extern u32 DebugHudState_PollInput(void *state, u32 index);
extern void DebugHudState_Close(void *state);
extern void func_02072c98(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Clear GameWork flag 0x40e, poll the debug-HUD input bitfield, and—when VM
 * flag 0x2 is armed—synchronize actor->0x54 flags.
 * UI bits 8 or 1 clear object flag 1; bit 13 additionally calls
 * func_02072c98, and that path sets GameWork flag 0x40e. With neither bit set,
 * UI bit 0 clears object flag 1, while its absence ensures flag 1 is set and
 * flag 0 is clear. Once UI bit 0 is set and bit 1 is clear, close the HUD and
 * return zero. Otherwise rewind two script bytes and return one to poll again
 * on a later update.
 */
s32 func_02015818(GamePhaseActorScriptVm *self)
{
    void *uiState;
    u32 state;
    GameWork_ClearFlag(gGameWork, 0x40e);
    uiState = DebugHudState_GetGlobal();
    state = DebugHudState_PollInput(uiState, 0);

    if ((self->flags_8c & 2) != 0) {
        u8 *object = *(u8 **)((u8 *)self->actor_84 + 0x54);
        if (object != 0) {
            u16 *flags = (u16 *)(object + 0x24);
            if ((state & ((1u << 8) | (1u << 1))) != 0) {
                *flags &= (u16)~2;
                if ((state & (1u << 13)) != 0)
                    func_02072c98(object);
                GameWork_SetFlag(gGameWork, 0x40e);
            } else if ((state & 1) != 0) {
                *flags &= (u16)~2;
            } else if ((*flags & 2) == 0) {
                *flags |= 2;
                *flags &= (u16)~1;
            }
        }
    }

    if ((state & 2) == 0 && (state & 1) != 0) {
        DebugHudState_Close(DebugHudState_GetGlobal());
        return 0;
    }
    self->base.cursor_04 -= 2;
    return 1;
}
