#include "tingle/game_phase_script_vm.h"
#include "tingle/system.h"

/* Run the shared phase-bytecode dispatch loop used by boot and title scripts. */

typedef s32 (*GamePhaseScriptOpcode)(GamePhaseScriptVm *self);

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseScriptOpcode gGamePhaseScriptVmOpcodeTable[];
#ifdef __cplusplus
}
#endif

/*
 * Execute one debug-stepped opcode or normal opcodes through the first handler
 * that yields. A null cursor or state flag bit 0 suspends execution. The cursor
 * advances before dispatch, and this wrapper itself always returns zero.
 */
s32 GamePhaseScriptVm_Execute(GamePhaseScriptVm *self, s32 singleStep)
{
    s32 result = 0;

    if (!self->cursor)
        return 0;

    if (singleStep) {
        if (self->stateFlags & 1)
            return 0;
        if (gSystemState.pads[0].pressed & 8) {
            s8 opcode = *self->cursor++;
            gGamePhaseScriptVmOpcodeTable[opcode](self);
        }
    } else {
        if (self->stateFlags & 1)
            return 0;
        while (!result) {
            s8 opcode = *self->cursor++;
            result = gGamePhaseScriptVmOpcodeTable[opcode](self);
        }
    }

    return 0;
}
