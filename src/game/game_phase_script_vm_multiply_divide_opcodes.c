#include "tingle/game_phase_script_vm.h"

/* Multiply, divide, or take remainders using register and immediate VM operands. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 dividend, s32 divisor);
#ifdef __cplusplus
}
#endif

static void updateZero(GamePhaseScriptVm *self, s32 destination)
{
    GamePhaseScriptVm_UpdateZeroFlag(self, destination);
}

/* Multiply the encoded destination by the encoded source, update zero state, return zero. */
s32 GamePhaseScriptVm_MultiplyRegisters(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->registers[destination] *= self->registers[source];
    updateZero(self, destination);
    return 0;
}

/* Multiply the byte-selected register by a 32-bit immediate, update zero state, return zero. */
s32 GamePhaseScriptVm_MultiplyImmediate(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    u32 immediate = GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    self->registers[destination] *= immediate;
    updateZero(self, destination);
    return 0;
}

/* Divide the encoded destination by the encoded source, update zero state, return zero. */
s32 GamePhaseScriptVm_DivideRegisters(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->registers[destination] =
        (u32)func_020befec((s32)self->registers[destination],
                           (s32)self->registers[source]);
    updateZero(self, destination);
    return 0;
}

/* Divide the byte-selected register by a 32-bit immediate, update zero state, return zero. */
s32 GamePhaseScriptVm_DivideImmediate(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    s32 immediate = (s32)GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    self->registers[destination] =
        (u32)func_020befec((s32)self->registers[destination], immediate);
    updateZero(self, destination);
    return 0;
}

/* Store destination modulo the encoded source, update zero state, and return zero. */
s32 GamePhaseScriptVm_ModuloRegisters(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->registers[destination] =
        (u32)((s32)self->registers[destination] % (s32)self->registers[source]);
    updateZero(self, destination);
    return 0;
}

/* Store destination modulo a 32-bit immediate, update zero state, and return zero. */
s32 GamePhaseScriptVm_ModuloImmediate(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor++;
    s32 immediate = (s32)GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    self->registers[destination] = (u32)((s32)self->registers[destination] % immediate);
    updateZero(self, destination);
    return 0;
}
