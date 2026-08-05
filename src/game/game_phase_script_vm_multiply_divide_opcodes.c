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
    func_0201b2b4(self, destination);
}

/* Multiply the encoded destination by the encoded source, update zero state, return zero. */
s32 func_0201b57c(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor_04++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->values_2c[destination] *= self->values_2c[source];
    updateZero(self, destination);
    return 0;
}

/* Multiply the byte-selected register by a 32-bit immediate, update zero state, return zero. */
s32 func_0201b5c0(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor_04++;
    u32 immediate = func_0201b278(self->cursor_04);
    self->cursor_04 += 4;
    self->values_2c[destination] *= immediate;
    updateZero(self, destination);
    return 0;
}

/* Divide the encoded destination by the encoded source, update zero state, return zero. */
s32 func_0201b60c(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor_04++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->values_2c[destination] =
        (u32)func_020befec((s32)self->values_2c[destination],
                           (s32)self->values_2c[source]);
    updateZero(self, destination);
    return 0;
}

/* Divide the byte-selected register by a 32-bit immediate, update zero state, return zero. */
s32 func_0201b65c(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor_04++;
    s32 immediate = (s32)func_0201b278(self->cursor_04);
    self->cursor_04 += 4;
    self->values_2c[destination] =
        (u32)func_020befec((s32)self->values_2c[destination], immediate);
    updateZero(self, destination);
    return 0;
}

/* Store destination modulo the encoded source, update zero state, and return zero. */
s32 func_0201b6ac(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor_04++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    self->values_2c[destination] =
        (u32)((s32)self->values_2c[destination] % (s32)self->values_2c[source]);
    updateZero(self, destination);
    return 0;
}

/* Store destination modulo a 32-bit immediate, update zero state, and return zero. */
s32 func_0201b6fc(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor_04++;
    s32 immediate = (s32)func_0201b278(self->cursor_04);
    self->cursor_04 += 4;
    self->values_2c[destination] = (u32)((s32)self->values_2c[destination] % immediate);
    updateZero(self, destination);
    return 0;
}
