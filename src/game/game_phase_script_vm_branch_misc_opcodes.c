#include "tingle/game_phase_script_vm.h"

/* Implement adjacent unary, conditional-branch, callback, and raw-load VM primitives. */

typedef s32 (*GamePhaseScriptVmByteMethod)(GamePhaseScriptVm *self, u8 value);

/* Bitwise-complement the low-three-bit-selected register, update the condition
 * to reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_NotRegister(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor++ & 7;
    self->registers[destination] = ~self->registers[destination];
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}

/* Jump to the encoded absolute address when condition flag bit one is set; otherwise skip it. */
s32 GamePhaseScriptVm_JumpIfConditionSet(GamePhaseScriptVm *self)
{
    if (self->stateFlags & 2)
        self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    else
        self->cursor += 4;
    return 0;
}

/* Jump to the encoded absolute address when condition flag bit one is clear; otherwise skip it. */
s32 GamePhaseScriptVm_JumpIfConditionClear(GamePhaseScriptVm *self)
{
    if (!(self->stateFlags & 2))
        self->cursor = (const s8 *)GamePhaseScriptVm_ReadU32Le(self->cursor);
    else
        self->cursor += 4;
    return 0;
}

/* Consume one byte, invoke virtual slot 0x08 with it, and return the method result. */
s32 GamePhaseScriptVm_InvokeByteMethod(GamePhaseScriptVm *self)
{
    u8 value = (u8)*self->cursor++;
    void **vtable = *(void ***)self;
    return ((GamePhaseScriptVmByteMethod)vtable[0x08 / 4])(self, value);
}

/* Consume a register index and four raw little-endian bytes, store the value, return zero. */
s32 func_0201b9a8(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    self->registers[destination] = GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    return 0;
}
