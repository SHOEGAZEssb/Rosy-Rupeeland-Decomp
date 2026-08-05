#include "tingle/game_phase_script_vm.h"

/* Push immediates and external values, and transfer registers through game-work storage. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGameWork;
#ifdef __cplusplus
}
#endif

/* Push a 32-bit immediate, advance past it, and return zero. */
s32 func_0201bff0(GamePhaseScriptVm *self)
{
    func_02012720(self, func_0201b278(self->cursor_04));
    self->cursor_04 += 4;
    return 0;
}

/* Push a signed halfword from game-work's byte-indexed array and return zero. */
s32 func_0201c020(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor_04++;
    func_02012720(self, (u32)*(s16 *)((u8 *)gGameWork + 0x4c + index * 2));
    return 0;
}

/* Push an unsigned-byte-indexed context slot and return zero. */
s32 func_0201c054(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor_04++;
    func_02012720(self, ((u32 *)self->context_80)[index]);
    return 0;
}

/* Push an indexed callback slot and return zero. */
s32 func_0201c07c(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor_04++;
    func_02012720(self, (u32)self->callbacks_0c[index]);
    return 0;
}

/* Store the selected register in game-work's u32 array at offset 0x7cc and return zero. */
s32 func_0201c0a4(GamePhaseScriptVm *self)
{
    s32 source = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    *(u32 *)((u8 *)gGameWork + 0x7cc + index * 4) = self->values_2c[source];
    return 0;
}

/* Load game-work's u32 array entry into the selected register and return zero. */
s32 func_0201c0e8(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    self->values_2c[destination] = *(u32 *)((u8 *)gGameWork + 0x7cc + index * 4);
    return 0;
}

/* Push game-work's byte-indexed u32 array entry at offset 0x7cc and return zero. */
s32 func_0201c12c(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor_04++;
    func_02012720(self, *(u32 *)((u8 *)gGameWork + 0x7cc + index * 4));
    return 0;
}

/* Push the constant zero and return zero. */
s32 func_0201c160(GamePhaseScriptVm *self)
{
    func_02012720(self, 0);
    return 0;
}
