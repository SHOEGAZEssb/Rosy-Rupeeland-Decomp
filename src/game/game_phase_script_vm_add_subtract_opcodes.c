#include "tingle/game_phase_script_vm.h"

/* Add or subtract register and immediate operands in the compact script VM. */

/* Add the encoded source register to the encoded destination, update zero state, return zero. */
s32 func_0201b45c(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->registers[destination] += self->registers[source];
    func_0201b2b4(self, destination);
    return 0;
}

/* Add a 32-bit immediate to the byte-selected register, update zero state, return zero. */
s32 func_0201b4a0(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    u32 immediate = func_0201b278(self->cursor);
    self->cursor += 4;
    self->registers[destination] += immediate;
    func_0201b2b4(self, destination);
    return 0;
}

/* Subtract the encoded source register from the destination, update zero state, return zero. */
s32 func_0201b4ec(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->registers[destination] -= self->registers[source];
    func_0201b2b4(self, destination);
    return 0;
}

/* Subtract a 32-bit immediate from the byte-selected register, update zero state, return zero. */
s32 func_0201b530(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    u32 immediate = func_0201b278(self->cursor);
    self->cursor += 4;
    self->registers[destination] -= immediate;
    func_0201b2b4(self, destination);
    return 0;
}
