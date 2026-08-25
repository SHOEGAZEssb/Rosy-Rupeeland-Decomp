#include "tingle/game_phase_script_vm.h"
#include "tingle/system.h"

/* Execute phase bytecode and manage the interpreter's shared value/call stack. */

typedef s32 (*GamePhaseScriptOpcode)(GamePhaseScriptVm *self);

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseScriptOpcode gGamePhaseScriptVmOpcodeTable[];
#ifdef __cplusplus
}
#endif

/* Pop and return the top value or call address; retail performs no bounds check. */
u32 GamePhaseScriptVm_Pop(GamePhaseScriptVm *self)
{
    self->stackDepth--;
    return self->stack[self->stackDepth];
}

/* Push a value or call address; retail performs no bounds or overflow check. */
void GamePhaseScriptVm_Push(GamePhaseScriptVm *self, u32 value)
{
    self->stack[self->stackDepth] = value;
    self->stackDepth++;
}

/*
 * Execute bytecode from cursor through the signed-opcode dispatch table.
 * Null cursor or stateFlags bit 0 stops immediately. In singleStep mode, exactly
 * one opcode runs only while pad 0 pressed bit 3 is set; normal mode continues
 * until an opcode handler returns nonzero. Cursor advances before each call.
 * The handler return only controls the loop; this wrapper always returns zero.
 */
s32 GamePhaseScriptVm_Execute(GamePhaseScriptVm *self, s32 singleStep)
{
    s32 result = 0;
    if (!self->cursor)
        return 0;
    if (singleStep) {
        if (self->stateFlags & GAME_PHASE_SCRIPT_VM_HALTED)
            return 0;
        if (gSystemState.pads[0].pressed & 8) {
            s8 opcode = *self->cursor++;
            gGamePhaseScriptVmOpcodeTable[opcode](self);
        }
    } else {
        if (self->stateFlags & GAME_PHASE_SCRIPT_VM_HALTED)
            return 0;
        while (!result) {
            s8 opcode = *self->cursor++;
            result = gGamePhaseScriptVmOpcodeTable[opcode](self);
        }
    }
    return 0;
}

/* Recovered default opcode/hook: ignore self and return zero. */
s32 GamePhaseScriptVm_NoOpHook(GamePhaseScriptVm *self)
{
    (void)self;
    return 0;
}

/*
 * Store the result in registers[7] (offset 0x48) and set the condition bit
 * exactly when that result is nonzero. No value is returned.
 */
void GamePhaseScriptVm_StoreResultAndUpdateCondition(GamePhaseScriptVm *self, u32 result)
{
    self->registers[7] = result;
    if (result)
        self->stateFlags |= GAME_PHASE_SCRIPT_VM_CONDITION_TRUE;
    else
        self->stateFlags &= ~GAME_PHASE_SCRIPT_VM_CONDITION_TRUE;
}
