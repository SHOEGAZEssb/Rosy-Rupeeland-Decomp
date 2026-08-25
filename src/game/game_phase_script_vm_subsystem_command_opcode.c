#include "tingle/game_phase_script_vm.h"

/* Dispatch commands and queries against the singleton returned by GamePhaseProgress_GetOrCreateGlobal. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseProgress_GetOrCreateGlobal(void);
extern s32 GamePhaseProgressController_GetBaseThreshold(void *state, s32 value);
extern s32 GamePhaseProgressController_GetAdjustedThreshold(void *state, s32 value);
extern void GamePhaseProgressController_AddCounterFromProgress(void *state, s32 value);
extern void GamePhaseProgressController_SetCounter(void *state, s32 value);
extern void GamePhaseProgressController_AdvanceStage(void *state);
extern s32 GamePhaseProgressController_CanAdvanceStage(void *state);
extern s32 GamePhaseProgressController_IsBehindComparisonStage(void *state);
extern void GamePhaseProgressController_AddProgress(void *state, s32 value);
extern s32 GamePhaseProgressController_GetStage(void *state);
extern void GamePhaseProgressController_SetStage(void *state, s32 value);
extern void GamePhaseProgressController_SetComparisonStage(void *state, s32 value);
extern s32 GamePhaseProgressController_ClassifyProgress(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Pop value and command.  Commands 1..13 route to recovered singleton
 * operations; query commands store their integer or normalized Boolean value
 * as the VM result, while command 5 stores singleton word 0 directly.  Unsupported commands do
 * nothing.  Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *progress;
    switch (command) {
    case 1:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)GamePhaseProgressController_GetBaseThreshold(GamePhaseProgress_GetOrCreateGlobal(), value));
        break;
    case 2:
        GamePhaseProgressController_AddCounterFromProgress(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 3:
        GamePhaseProgressController_SetCounter(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 4:
        GamePhaseProgressController_SetStage(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 5:
        progress = GamePhaseProgress_GetOrCreateGlobal();
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                                                         *(u32 *)progress);
        break;
    case 6:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)GamePhaseProgressController_GetAdjustedThreshold(GamePhaseProgress_GetOrCreateGlobal(), value));
        break;
    case 7:
        GamePhaseProgressController_AddProgress(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 8:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, GamePhaseProgressController_CanAdvanceStage(GamePhaseProgress_GetOrCreateGlobal()) != 0);
        break;
    case 9:
        GamePhaseProgressController_AdvanceStage(GamePhaseProgress_GetOrCreateGlobal());
        break;
    case 10:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)GamePhaseProgressController_GetStage(GamePhaseProgress_GetOrCreateGlobal()));
        break;
    case 11:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)GamePhaseProgressController_ClassifyProgress(GamePhaseProgress_GetOrCreateGlobal()));
        break;
    case 12:
        GamePhaseProgressController_SetComparisonStage(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 13:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, GamePhaseProgressController_IsBehindComparisonStage(GamePhaseProgress_GetOrCreateGlobal()) != 0);
        break;
    }
    return 0;
}
