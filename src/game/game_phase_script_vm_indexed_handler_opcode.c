#include "tingle/game_phase_script_vm.h"

/*
 * Query or invoke one entry in the recovered scenario handler table selected
 * by a script-provided index.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void **gScenarioActionTables[];
extern s32 Scenario_GetStatus(s32 scenario_index);
#ifdef __cplusplus
}
#endif

/*
 * Pop scenario index and mode. Modes 1/2 store whether the scenario is complete
 * or running respectively; modes 3/4 invoke function slot 1/0 of its action
 * record. Mode 0 and unsupported modes do nothing. Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchScenarioAction(GamePhaseActorScriptVm *self)
{
    typedef void (*Handler)(void);
    s32 scenarioIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    switch (mode) {
    case 1:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            &self->base, Scenario_GetStatus(scenarioIndex) == 2);
        break;
    case 2:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            &self->base, Scenario_GetStatus(scenarioIndex) == 1);
        break;
    case 3:
        ((Handler)gScenarioActionTables[scenarioIndex][1])();
        break;
    case 4:
        ((Handler)gScenarioActionTables[scenarioIndex][0])();
        break;
    }
    return 0;
}
