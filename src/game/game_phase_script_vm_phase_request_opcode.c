#include "tingle/game_phase_script_vm.h"

/* Reconstruct the script opcode that submits a four-operand phase request. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void GamePhaseRuntime_StageAreaRequest(
    void *runtime, s32 areaNumber, s32 transitionValueA, s32 transitionValueB,
    s32 transitionValueC, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Pop an area number and three transition values, submit them with mode zero,
 * and return one. Returning one stops the current VM dispatch loop after the
 * request is queued.
 */
s32 GamePhaseActorScriptVm_StageAreaRequest(GamePhaseActorScriptVm *self)
{
    s32 transitionValueC = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 transitionValueB = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 transitionValueA = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 areaNumber = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseRuntime_StageAreaRequest(
        gGamePhaseRuntime, areaNumber, transitionValueA, transitionValueB,
        transitionValueC, 0);
    return 1;
}
