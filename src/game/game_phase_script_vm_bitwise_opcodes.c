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

/* AND destination with the encoded source register, update the condition to
 * reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_AndRegisters(GamePhaseScriptVm *self)
{
    u8 operand = readOperand(self);
    s32 destination = operand & 7;
    self->registers[destination] &= self->registers[(operand >> 4) & 7];
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}

/* AND the byte-selected register with a 32-bit immediate, update the condition
 * to reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_AndImmediate(GamePhaseScriptVm *self)
{
    u8 destination = readOperand(self);
    self->registers[destination] &= readImmediate(self);
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}

/* OR destination with the encoded source register, update the condition to
 * reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_OrRegisters(GamePhaseScriptVm *self)
{
    u8 operand = readOperand(self);
    s32 destination = operand & 7;
    self->registers[destination] |= self->registers[(operand >> 4) & 7];
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}

/* OR the byte-selected register with a 32-bit immediate, update the condition
 * to reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_OrImmediate(GamePhaseScriptVm *self)
{
    u8 destination = readOperand(self);
    self->registers[destination] |= readImmediate(self);
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}

/* XOR destination with the encoded source register, update the condition to
 * reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_XorRegisters(GamePhaseScriptVm *self)
{
    u8 operand = readOperand(self);
    s32 destination = operand & 7;
    self->registers[destination] ^= self->registers[(operand >> 4) & 7];
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}

/* XOR the byte-selected register with a 32-bit immediate, update the condition
 * to reflect whether the destination result is zero, and return zero. */
s32 GamePhaseScriptVm_XorImmediate(GamePhaseScriptVm *self)
{
    u8 destination = readOperand(self);
    self->registers[destination] ^= readImmediate(self);
    GamePhaseScriptVm_UpdateConditionForZeroRegisterValue(self, destination);
    return 0;
}
