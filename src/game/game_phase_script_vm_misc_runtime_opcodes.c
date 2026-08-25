#include "tingle/game_phase_script_vm.h"

/* Implement adjacent global, runtime-object, actor-flag, and overlay opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_021f5f18[];
extern void *gGamePhaseRuntime;
extern const void *data_020d430c;
extern void RetailSelectionHistory_InsertUniqueId(void *state, s32 value);
extern void RetailSelectionHistory_SetTrailingValue(void *state, s32 value);
extern void *GamePhaseRuntime_GetAuxiliaryOverlayObject(void *runtime);
extern void func_ov056_0220f054(void *state, const void *configuration);
#ifdef __cplusplus
}
#endif

/* Pop a value, pass it to the first recovered global-state operation, return zero. */
s32 GamePhaseActorScriptVm_InsertSelectionHistoryId(GamePhaseActorScriptVm *self)
{
    RetailSelectionHistory_InsertUniqueId(data_021f5f18, (s32)GamePhaseScriptVm_Pop(&self->base));
    return 0;
}

/* Pop a value, pass it to the second recovered global-state operation, return zero. */
s32 GamePhaseActorScriptVm_SetSelectionHistoryTrailingValue(GamePhaseActorScriptVm *self)
{
    s32 trailingValue = (s32)GamePhaseScriptVm_Pop(&self->base);
    RetailSelectionHistory_SetTrailingValue(data_021f5f18, trailingValue);
    return 0;
}

/* Invoke virtual slot 0x34 of object with one script value. */
static void invokeRuntimeValue(void *object, s32 value)
{
    typedef void (*Method)(void *, s32);
    (*(Method *)((u8 *)*(void **)object + 0x34))(object, value);
}

/*
 * Pop value and mode.  Mode 1 sends the value to runtime object 0x2ed4; mode 2
 * sends it to the nested object reached through runtime offset 0x2fb8.  Return
 * zero; unsupported modes do nothing.
 */
s32 GamePhaseActorScriptVm_DispatchRuntimeObjectValue(GamePhaseActorScriptVm *self)
{
    s32 scriptValue = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 targetSelector = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    if (targetSelector == 1)
        invokeRuntimeValue(*(void **)(runtime + 0x2ed4), scriptValue);
    else if (targetSelector == 2)
        invokeRuntimeValue(*(void **)(*(u8 **)(runtime + 0x2fb8) + 4), scriptValue);
    return 0;
}

/* Mirror a popped enable value to actor flag bit 0x08000000; return zero. */
s32 GamePhaseActorScriptVm_SetInteractionIconEnabledFlag(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (enabled)
        *flags |= 0x08000000;
    else
        *flags &= ~0x08000000;
    return 0;
}

/*
 * Pop second and first configuration values, combine them with the recovered
 * tag, resolve runtime state, invoke the overlay operation, and return zero.
 */
s32 GamePhaseActorScriptVm_SetAuxiliaryOverlayCameraTarget(GamePhaseActorScriptVm *self)
{
    struct CameraTargetConfiguration { const void *tag; s32 x; s32 y; } cameraTarget;
    cameraTarget.y = (s32)GamePhaseScriptVm_Pop(&self->base);
    cameraTarget.x = (s32)GamePhaseScriptVm_Pop(&self->base);
    cameraTarget.tag = data_020d430c;
    func_ov056_0220f054(GamePhaseRuntime_GetAuxiliaryOverlayObject(gGamePhaseRuntime),
                        &cameraTarget);
    return 0;
}
