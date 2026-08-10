#include "tingle/game_phase_script_vm.h"

/* Implement the final adjacent runtime command and query opcodes in this VM block. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void func_020330fc(void *actor, s32 command, s32 value);
extern s32 func_0204fc6c(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop a value, resolve actor zero from runtime collection 2, send command
 * 0x2a with that value, and return zero.
 */
s32 GamePhaseActorScriptVm_SendCommand2aToCollection2Actor0(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *collection = GamePhaseRuntime_GetActorCollection(data_021052fc, 2);
    void *actor = ActorCollection_FindActorByDescriptorValue(collection, 0);
    func_020330fc(actor, 0x2a, value);
    return 0;
}

/* Query the recovered global runtime value, push it, and return zero. */
s32 func_0201b0d4(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_SetResult(&self->base, (u32)func_0204fc6c());
    return 0;
}
