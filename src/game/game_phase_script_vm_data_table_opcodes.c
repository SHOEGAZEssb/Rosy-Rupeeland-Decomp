#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that query and update the table at data_021f3d68. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_021f3d68[];
extern u8 *func_02079a7c(void *table, u32 index);
extern void *func_02079ba4(void *table, u32 value);
extern void func_02079ac0(void *table, u32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a byte offset and table index, resolve the indexed record through
 * func_02079a7c, push the byte at resolved+offset+0xc, and return zero.
 */
s32 func_0201593c(GamePhaseActorScriptVm *self)
{
    u32 offset = func_02012704(&self->base);
    u32 index = func_02012704(&self->base);
    u8 *record = func_02079a7c(data_021f3d68, index);
    func_020127f8(&self->base, record[offset + 0xc]);
    return 0;
}

/* Push whether func_02079ba4 finds the popped value in data_021f3d68. */
s32 func_0201597c(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    func_020127f8(&self->base, func_02079ba4(data_021f3d68, value) != 0);
    return 0;
}

/* Pop a value, pass it to func_02079ac0 for data_021f3d68, and return zero. */
s32 func_020159b4(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    func_02079ac0(data_021f3d68, value);
    return 0;
}
