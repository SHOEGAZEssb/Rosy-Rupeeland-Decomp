#include "tingle/game_phase_script_vm.h"

/* Implement two script opcodes that command objects from a recovered global pointer table. */

#ifdef __cplusplus
extern "C" {
#endif
extern void **data_021f5128;
extern void func_0207acd0(void *object, s32 value);
extern void RecordCategory_RemoveById(void *object, s32 value);
extern void *func_0207b334(s32 selector);
extern void *func_0207ac84(void *object, void *resolved, s32 selector);
extern void RecordDescriptor_SetValue(void *object, s32 value);
#ifdef __cplusplus
}
#endif

/* Pop a command value and table index, call func_0207acd0 on that object, and return zero. */
s32 func_02017718(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    func_0207acd0(data_021f5128[index], value);
    return 0;
}

/* Pop a command value and table index, call RecordCategory_RemoveById on that object, and return zero. */
s32 func_02017750(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    RecordCategory_RemoveById(data_021f5128[index], value);
    return 0;
}

/*
 * Pop a command value, selector, and table index. Resolve the selector through
 * func_0207b334, query the indexed object through func_0207ac84, and if that
 * succeeds apply the command value through RecordDescriptor_SetValue. Return zero.
 */
s32 func_02017818(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *object = data_021f5128[index];
    void *result = func_0207ac84(object, func_0207b334(selector), selector);
    if (result)
        RecordDescriptor_SetValue(result, value);
    return 0;
}
