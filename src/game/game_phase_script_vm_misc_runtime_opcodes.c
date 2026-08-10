#include "tingle/game_phase_script_vm.h"

/* Implement adjacent global, runtime-object, actor-flag, and overlay opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_021f5f18[];
extern void *data_021052fc;
extern const void *data_020d430c;
extern void func_02098020(void *state, s32 value);
extern void func_020983c0(void *state, s32 value);
extern void *GamePhaseRuntime_GetAuxiliaryOverlayObject(void *runtime);
extern void func_ov056_0220f054(void *state, const void *configuration);
#ifdef __cplusplus
}
#endif

/* Pop a value, pass it to the first recovered global-state operation, return zero. */
s32 func_02019f4c(GamePhaseActorScriptVm *self)
{
    func_02098020(data_021f5f18, (s32)GamePhaseScriptVm_Pop(&self->base));
    return 0;
}

/* Pop a value, pass it to the second recovered global-state operation, return zero. */
s32 func_02019f6c(GamePhaseActorScriptVm *self)
{
    func_020983c0(data_021f5f18, (s32)GamePhaseScriptVm_Pop(&self->base));
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
s32 func_02019f8c(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    if (mode == 1)
        invokeRuntimeValue(*(void **)(runtime + 0x2ed4), value);
    else if (mode == 2)
        invokeRuntimeValue(*(void **)(*(u8 **)(runtime + 0x2fb8) + 4), value);
    return 0;
}

/* Mirror a popped enable value to actor flag bit 0x08000000; return zero. */
s32 func_0201a00c(GamePhaseActorScriptVm *self)
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
s32 func_0201a03c(GamePhaseActorScriptVm *self)
{
    struct Configuration { const void *tag; s32 first; s32 second; } config;
    config.second = (s32)GamePhaseScriptVm_Pop(&self->base);
    config.first = (s32)GamePhaseScriptVm_Pop(&self->base);
    config.tag = data_020d430c;
    func_ov056_0220f054(GamePhaseRuntime_GetAuxiliaryOverlayObject(data_021052fc), &config);
    return 0;
}
