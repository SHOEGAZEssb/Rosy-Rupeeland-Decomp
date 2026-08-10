#include "tingle/game_phase_script_vm.h"

/* Prepare the active runtime scene and its associated area/object state. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *GamePhaseState_GetConfiguration(void *state);
extern void func_02026174(void *object, void *area);
extern void GamePhaseRuntime_UpdateDualScreenUiPresentation(void *runtime);
extern void GamePhaseRuntime_RefreshAreaAuxiliaryObject(void *runtime, void *area, s32 enabled);
extern void func_020122a0(void *state, s32 enabled);
#ifdef __cplusplus
}
#endif

/* Invoke virtual slot 0x0c with the confirmed arguments 1 and 31. */
static void configureObject(void *object)
{
    typedef void (*Method)(void *, s32, s32);
    (*(Method *)((u8 *)*(void **)object + 0x0c))(object, 1, 31);
}

/*
 * Resolve the runtime's current area from offset 0x24, attach it to object
 * 0x30e8, configure that object, refresh runtime state, re-enable the area,
 * and enable the nested state at offset 0x2fb8.  Consume no operands and
 * return zero.
 */
s32 func_0201a090(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    void *object = *(void **)(runtime + 0x30e8);
    void *area = GamePhaseState_GetConfiguration(runtime + 0x24);
    (void)self;
    func_02026174(object, area);
    configureObject(object);
    GamePhaseRuntime_UpdateDualScreenUiPresentation(runtime);
    area = GamePhaseState_GetConfiguration(runtime + 0x24);
    GamePhaseRuntime_RefreshAreaAuxiliaryObject(runtime, area, 1);
    func_020122a0(*(void **)(runtime + 0x2fb8), 1);
    return 0;
}
