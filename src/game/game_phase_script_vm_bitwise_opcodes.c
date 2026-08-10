#include "tingle/game_phase_script_vm.h"

/* Apply AND, OR, and XOR to VM registers using register or immediate operands. */

static u8 readOperand(GamePhaseScriptVm *self)
{
    return (u8)*self->cursor++;
}

static u32 readImmediate(GamePhaseScriptVm *self)
{
    u32 value = GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    return value;
}

/* AND destination with the encoded source register, update zero state, and return zero. */
s32 func_0201b74c(GamePhaseScriptVm *self)
{
    u8 operand = readOperand(self);
    s32 destination = operand & 7;
    self->registers[destination] &= self->registers[(operand >> 4) & 7];
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
    return 0;
}

/* AND the byte-selected register with a 32-bit immediate, update zero state, return zero. */
s32 func_0201b790(GamePhaseScriptVm *self)
{
    u8 destination = readOperand(self);
    self->registers[destination] &= readImmediate(self);
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
    return 0;
}

/* OR destination with the encoded source register, update zero state, and return zero. */
s32 func_0201b7dc(GamePhaseScriptVm *self)
{
    u8 operand = readOperand(self);
    s32 destination = operand & 7;
    self->registers[destination] |= self->registers[(operand >> 4) & 7];
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
    return 0;
}

/* OR the byte-selected register with a 32-bit immediate, update zero state, return zero. */
s32 func_0201b820(GamePhaseScriptVm *self)
{
    u8 destination = readOperand(self);
    self->registers[destination] |= readImmediate(self);
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
    return 0;
}

/* XOR destination with the encoded source register, update zero state, and return zero. */
s32 func_0201b86c(GamePhaseScriptVm *self)
{
    u8 operand = readOperand(self);
    s32 destination = operand & 7;
    self->registers[destination] ^= self->registers[(operand >> 4) & 7];
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
    return 0;
}

/* XOR the byte-selected register with a 32-bit immediate, update zero state, return zero. */
s32 func_0201b8b0(GamePhaseScriptVm *self)
{
    u8 destination = readOperand(self);
    self->registers[destination] ^= readImmediate(self);
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
    return 0;
}
