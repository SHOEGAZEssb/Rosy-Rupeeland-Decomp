#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that control recovered game-phase runtime components. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void ActorCollection_SetEnabled(void *object, s32 value);
extern void GamePhaseAreaScene_SetEnabled(void *object, s32 enabled);
#ifdef __cplusplus
}
#endif

/* Pop a value, apply it to runtime collection 2 through ActorCollection_SetEnabled, and return zero. */
s32 GamePhaseActorScriptVm_SetRuntimeCollection2Enabled(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    ActorCollection_SetEnabled(GamePhaseRuntime_GetActorCollection((GamePhaseRuntime *)data_021052fc, 2), value);
    return 0;
}

/* Pop an enable value, apply it to the area-scene object at runtime offset 0x2fb8, and return zero. */
s32 GamePhaseActorScriptVm_SetAreaSceneEnabled(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseAreaScene_SetEnabled(*(void **)((u8 *)data_021052fc + 0x2fb8), enabled);
    return 0;
}

/*
 * Pop a value and pass it to virtual slot 9 of the runtime object at offset
 * 0x2ed4; the method's precise semantic role remains unconfirmed. Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchRuntimeObjectSlot9(GamePhaseActorScriptVm *self)
{
    typedef void (*Method)(void *, s32);
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)data_021052fc + 0x2ed4);
    Method method = *(Method *)((u8 *)*(void **)object + 0x24);
    method(object, value);
    return 0;
}

/* Select runtime screen mode 1 with the recovered non-null state token and return zero. */
s32 GamePhaseActorScriptVm_SelectRuntimeScreenMode1(GamePhaseActorScriptVm *self)
{
    (void)self;
    func_02008570((GamePhaseRuntime *)data_021052fc, 1, 1);
    return 0;
}

/* Select runtime screen mode 0 with the recovered non-null state token and return zero. */
s32 GamePhaseActorScriptVm_SelectRuntimeScreenMode0(GamePhaseActorScriptVm *self)
{
    (void)self;
    func_02008570((GamePhaseRuntime *)data_021052fc, 0, 1);
    return 0;
}

/* Accept the VM, perform no state changes or SDK effects, and return zero. */
s32 GamePhaseActorScriptVm_RuntimeControlNoOp(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}
