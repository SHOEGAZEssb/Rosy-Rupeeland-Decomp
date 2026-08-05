#include "tingle/game_phase_script_vm.h"

/* Move values among VM registers, external context slots, and the value stack. */

/* Decode source/destination registers from one byte, copy the value, and return zero. */
s32 func_0201b320(GamePhaseScriptVm *self)
{
    u8 operand = (u8)*self->cursor_04++;
    self->values_2c[operand & 7] = self->values_2c[(operand >> 4) & 7];
    return 0;
}

/* Load a VM register from a signed-byte-indexed context slot and return zero. */
s32 func_0201b354(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor_04++ & 7;
    s8 index = *self->cursor_04++;
    self->values_2c[destination] = ((u32 *)self->context_80)[index];
    return 0;
}

/* Store a VM register into a signed-byte-indexed context slot and return zero. */
s32 func_0201b38c(GamePhaseScriptVm *self)
{
    u8 source = ((u8)*self->cursor_04++ >> 4) & 7;
    s8 index = *self->cursor_04++;
    ((u32 *)self->context_80)[index] = self->values_2c[source];
    return 0;
}

/* Push the register encoded in operand bits 4..6 and return zero. */
s32 func_0201b3c8(GamePhaseScriptVm *self)
{
    u8 source = ((u8)*self->cursor_04++ >> 4) & 7;
    func_02012720(self, self->values_2c[source]);
    return 0;
}

/* Read a signed 16-bit immediate, push its sign-extended value, advance, and return zero. */
s32 func_0201b3f4(GamePhaseScriptVm *self)
{
    func_02012720(self, (u32)func_0201b260(self->cursor_04));
    self->cursor_04 += 2;
    return 0;
}

/* Load a 32-bit immediate into the byte-selected register, advance, and return zero. */
s32 func_0201b424(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor_04++;
    self->values_2c[destination] = func_0201b278(self->cursor_04);
    self->cursor_04 += 4;
    return 0;
}
