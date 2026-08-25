#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"

/* Reconstruct the actor-script opcode that polls recovered debug/UI state. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *DebugHudState_GetGlobal(...);
extern u32 DebugHudState_PollInput(void *state, u32 index);
extern void DebugHudState_Close(void *state);
extern void GraphicsSpriteState_ResetFrame(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Clear GameWork flag 0x40e, poll the debug-HUD input bitfield, and—when VM
 * flag 0x2 is armed—synchronize actor->0x54 flags.
 * UI bits 8 or 1 clear object flag 1; bit 13 additionally calls
 * GraphicsSpriteState_ResetFrame, and that path sets GameWork flag 0x40e. With neither bit set,
 * UI bit 0 clears object flag 1, while its absence ensures flag 1 is set and
 * flag 0 is clear. Once UI bit 0 is set and bit 1 is clear, close the HUD and
 * return zero. Otherwise rewind two script bytes and return one to poll again
 * on a later update.
 */
s32 GamePhaseActorScriptVm_WaitForDebugHudInput(GamePhaseActorScriptVm *self)
{
    void *debugHud;
    u32 inputBits;
    GameWork_ClearFlag(gGameWork, 0x40e);
    debugHud = DebugHudState_GetGlobal();
    inputBits = DebugHudState_PollInput(debugHud, 0);

    if ((self->actorStateFlags &
         GAME_PHASE_ACTOR_SCRIPT_VM_EFFECT_STATE_PENDING) != 0) {
        u8 *attachment = *(u8 **)((u8 *)self->actor + 0x54);
        if (attachment != 0) {
            u16 *presentationFlags = (u16 *)(attachment + 0x24);
            if ((inputBits & ((1u << 8) | (1u << 1))) != 0) {
                *presentationFlags &= (u16)~2;
                if ((inputBits & (1u << 13)) != 0)
                    GraphicsSpriteState_ResetFrame(attachment);
                GameWork_SetFlag(gGameWork, 0x40e);
            } else if ((inputBits & 1) != 0) {
                *presentationFlags &= (u16)~2;
            } else if ((*presentationFlags & 2) == 0) {
                *presentationFlags |= 2;
                *presentationFlags &= (u16)~1;
            }
        }
    }

    if ((inputBits & 2) == 0 && (inputBits & 1) != 0) {
        DebugHudState_Close(DebugHudState_GetGlobal());
        return 0;
    }
    self->base.cursor -= 2;
    return 1;
}
