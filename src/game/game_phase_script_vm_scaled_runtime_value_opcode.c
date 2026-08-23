#include "tingle/game_phase_script_vm.h"

/* Combine two script operands with a recovered runtime scale and store the VM result. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern s32 func_020befec(s32 dividend, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Pop a factor and base, narrow both to halfwords, divide the factor by 192,
 * multiply it by the low-halfword runtime field at 0x2ed4->0x20 scaled by
 * 1/16, add base/256, store the result as the VM result, and return zero.  Signed truncating
 * division is retained for the recovered arithmetic sequence.
 */
s32 GamePhaseActorScriptVm_CalculateScaledRuntimeValue(GamePhaseActorScriptVm *self)
{
    s32 factor = (u16)GamePhaseScriptVm_Pop(&self->base);
    s32 base = (u16)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *state = *(u8 **)(runtime + 0x2ed4);
    s32 runtimeScale = (s32)((u32)(*(s32 *)(state + 0x20) << 16) >> 12);
    s32 result = func_020befec(factor, 192) * (runtimeScale / 256)
               + base / 256;

    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)result);
    return 0;
}
