#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"

/* Implement actor-script opcodes that manipulate persistent GameWork flags. */

/* Pop a flag index, set that persistent GameWork flag, and return zero. */
s32 GamePhaseActorScriptVm_SetGameWorkFlag(GamePhaseActorScriptVm *self)
{
    s32 flag = (s32)GamePhaseScriptVm_Pop(&self->base);
    GameWork_SetFlag(gGameWork, flag);
    return 0;
}

/* Pop a flag index, clear that persistent GameWork flag, and return zero. */
s32 GamePhaseActorScriptVm_ClearGameWorkFlag(GamePhaseActorScriptVm *self)
{
    s32 flag = (s32)GamePhaseScriptVm_Pop(&self->base);
    GameWork_ClearFlag(gGameWork, flag);
    return 0;
}

/* Pop a flag index, store its persistent GameWork state as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_TestGameWorkFlag(GamePhaseActorScriptVm *self)
{
    s32 flag = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, GameWork_TestFlag(gGameWork, flag));
    return 0;
}
