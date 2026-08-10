#include "tingle/game_phase_script_vm.h"

/* Query a halfword-indexed entry from the recovered global runtime object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9ac0;
extern s32 func_02063698(void *context, u16 index);
#ifdef __cplusplus
}
#endif

/* Pop and narrow an index, query the global context, push the result, and return zero. */
s32 GamePhaseActorScriptVm_QueryGlobalContextByIndex(GamePhaseActorScriptVm *self)
{
    u16 index = (u16)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, (u32)func_02063698(data_021e9ac0, index));
    return 0;
}
