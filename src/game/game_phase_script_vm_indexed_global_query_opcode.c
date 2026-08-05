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
s32 func_0201af88(GamePhaseActorScriptVm *self)
{
    u16 index = (u16)func_02012704(&self->base);
    func_020127f8(&self->base, (u32)func_02063698(data_021e9ac0, index));
    return 0;
}
