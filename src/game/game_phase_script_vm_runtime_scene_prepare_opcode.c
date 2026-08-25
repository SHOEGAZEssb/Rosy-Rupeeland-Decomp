#include "tingle/game_phase_script_vm.h"

/* Prepare the active runtime scene and its associated area/object state. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void *GamePhaseState_GetConfiguration(void *state);
extern void DualScreenUiStandardPresentation_BindSource(void *object, void *area);
extern void GamePhaseRuntime_UpdateDualScreenUiPresentation(void *runtime);
extern void GamePhaseRuntime_RefreshAreaAuxiliaryObject(void *runtime, void *area, s32 enabled);
extern void GamePhaseAreaScene_SetEnabled(void *state, s32 enabled);
#ifdef __cplusplus
}
#endif

/* Invoke virtual slot 0x0c with the confirmed arguments 1 and 31. */
static void configureAreaOverlayObject(void *areaOverlayObject)
{
    typedef void (*Method)(void *, s32, s32);
    (*(Method *)((u8 *)*(void **)areaOverlayObject + 0x0c))(areaOverlayObject, 1, 31);
}

/*
 * Resolve the runtime's current area from offset 0x24, attach it to object
 * 0x30e8, configure that object, refresh runtime state, re-enable the area,
 * and enable the nested state at offset 0x2fb8.  Consume no operands and
 * return zero.
 */
s32 GamePhaseActorScriptVm_PrepareRuntimeScene(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    void *areaOverlayObject = *(void **)(runtime + 0x30e8);
    void *areaConfiguration = GamePhaseState_GetConfiguration(runtime + 0x24);
    (void)self;
    DualScreenUiStandardPresentation_BindSource(areaOverlayObject, areaConfiguration);
    configureAreaOverlayObject(areaOverlayObject);
    GamePhaseRuntime_UpdateDualScreenUiPresentation(runtime);
    areaConfiguration = GamePhaseState_GetConfiguration(runtime + 0x24);
    GamePhaseRuntime_RefreshAreaAuxiliaryObject(runtime, areaConfiguration, 1);
    GamePhaseAreaScene_SetEnabled(*(void **)(runtime + 0x2fb8), 1);
    return 0;
}
