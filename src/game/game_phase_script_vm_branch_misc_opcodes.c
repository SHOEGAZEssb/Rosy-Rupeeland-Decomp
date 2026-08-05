#include "tingle/game_phase_script_vm.h"

/* Implement adjacent unary, conditional-branch, callback, and raw-load VM primitives. */

typedef s32 (*GamePhaseScriptVmByteMethod)(GamePhaseScriptVm *self, u8 value);

/* Bitwise-complement the low-three-bit-selected register, update zero state, return zero. */
s32 func_0201b8fc(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor_04++ & 7;
    self->values_2c[destination] = ~self->values_2c[destination];
    func_0201b2b4(self, destination);
    return 0;
}

/* Jump to the encoded absolute address when zero state is set; otherwise skip it. */
s32 func_0201b92c(GamePhaseScriptVm *self)
{
    if (self->flags_7d & 2)
        self->cursor_04 = (const s8 *)func_0201b278(self->cursor_04);
    else
        self->cursor_04 += 4;
    return 0;
}

/* Jump to the encoded absolute address when zero state is clear; otherwise skip it. */
s32 func_0201b958(GamePhaseScriptVm *self)
{
    if (!(self->flags_7d & 2))
        self->cursor_04 = (const s8 *)func_0201b278(self->cursor_04);
    else
        self->cursor_04 += 4;
    return 0;
}

/* Consume one byte, invoke virtual slot 0x08 with it, and return the method result. */
s32 func_0201b984(GamePhaseScriptVm *self)
{
    u8 value = (u8)*self->cursor_04++;
    void **vtable = *(void ***)self;
    return ((GamePhaseScriptVmByteMethod)vtable[0x08 / 4])(self, value);
}

/* Consume a register index and four raw little-endian bytes, store the value, return zero. */
s32 func_0201b9a8(GamePhaseScriptVm *self)
{
    u8 destination = (u8)*self->cursor_04++;
    self->values_2c[destination] = func_0201b278(self->cursor_04);
    self->cursor_04 += 4;
    return 0;
}
