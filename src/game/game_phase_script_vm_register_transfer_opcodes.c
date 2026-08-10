#include "tingle/game_phase_script_vm.h"

/* Move values among VM registers, external context slots, and the value stack. */

/* Decode source/destination registers from one byte, copy the value, and return zero. */
s32 GamePhaseScriptVm_CopyRegister(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor++;
    self->registers[operand & 7] = self->registers[(operand >> 4) & 7];
    return 0;
}

/* Load a VM register from a signed-byte-indexed context slot and return zero. */
s32 GamePhaseScriptVm_LoadRegisterFromContext(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++ & 7;
    s8 index = *self->cursor++;
    self->registers[destination] = ((u32 *)self->context)[index];
    return 0;
}

/* Store a VM register into a signed-byte-indexed context slot and return zero. */
s32 GamePhaseScriptVm_StoreRegisterToContext(GamePhaseScriptVm *self)
{
    u8 source = ((u8)*self->cursor++ >> 4) & 7;
    s8 index = *self->cursor++;
    ((u32 *)self->context)[index] = self->registers[source];
    return 0;
}

/* Push the register encoded in operand bits 4..6 and return zero. */
s32 GamePhaseScriptVm_PushRegister(GamePhaseScriptVm *self)
{
    u8 source = ((u8)*self->cursor++ >> 4) & 7;
    GamePhaseScriptVm_Push(self, self->registers[source]);
    return 0;
}

/* Read a signed 16-bit immediate, push its sign-extended value, advance, and return zero. */
s32 GamePhaseScriptVm_PushImmediateS16(GamePhaseScriptVm *self)
{
    GamePhaseScriptVm_Push(self, (u32)GamePhaseScriptVm_ReadS16Le(self->cursor));
    self->cursor += 2;
    return 0;
}

/* Load a 32-bit immediate into the byte-selected register, advance, and return zero. */
s32 GamePhaseScriptVm_LoadImmediateU32(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    self->registers[destination] = GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    return 0;
}
