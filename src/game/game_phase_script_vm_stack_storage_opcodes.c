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
s32 GamePhaseScriptVm_PushImmediateU32(GamePhaseScriptVm *self)
{
    GamePhaseScriptVm_Push(self, GamePhaseScriptVm_ReadU32Le(self->cursor));
    self->cursor += 4;
    return 0;
}

/* Push a signed halfword from game-work's byte-indexed array and return zero. */
s32 GamePhaseScriptVm_PushGameWorkHalfword(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor++;
    GamePhaseScriptVm_Push(self, (u32)*(s16 *)((u8 *)gGameWork + 0x4c + index * 2));
    return 0;
}

/* Push an unsigned-byte-indexed context slot and return zero. */
s32 GamePhaseScriptVm_PushContextSlot(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor++;
    GamePhaseScriptVm_Push(self, ((u32 *)self->context)[index]);
    return 0;
}

/* Push an indexed pointer-sized slot from VM offset 0x0c and return zero. */
s32 func_0201c07c(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor++;
    GamePhaseScriptVm_Push(self, (u32)self->callbacks_0c[index]);
    return 0;
}

/* Store the selected register in game-work's u32 array at offset 0x7cc and return zero. */
s32 GamePhaseScriptVm_StoreRegisterToGameWorkWord(GamePhaseScriptVm *self)
{
    s32 source = (u8)*self->cursor++ & 7;
    u8 index = (u8)*self->cursor++;
    *(u32 *)((u8 *)gGameWork + 0x7cc + index * 4) = self->registers[source];
    return 0;
}

/* Load game-work's u32 array entry into the selected register and return zero. */
s32 GamePhaseScriptVm_LoadRegisterFromGameWorkWord(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor++ & 7;
    u8 index = (u8)*self->cursor++;
    self->registers[destination] = *(u32 *)((u8 *)gGameWork + 0x7cc + index * 4);
    return 0;
}

/* Push game-work's byte-indexed u32 array entry at offset 0x7cc and return zero. */
s32 GamePhaseScriptVm_PushGameWorkWord(GamePhaseScriptVm *self)
{
    u8 index = (u8)*self->cursor++;
    GamePhaseScriptVm_Push(self, *(u32 *)((u8 *)gGameWork + 0x7cc + index * 4));
    return 0;
}

/* Push the constant zero and return zero. */
s32 GamePhaseScriptVm_PushZero(GamePhaseScriptVm *self)
{
    GamePhaseScriptVm_Push(self, 0);
    return 0;
}
