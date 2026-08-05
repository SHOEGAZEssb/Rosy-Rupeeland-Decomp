#include "tingle/game_phase_script_vm.h"

/* Implement boolean script queries against a recovered process-global object subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021f5128;
extern void *func_0207a40c(void *context, s32 selector);
extern void *func_0207a450(void *context, s32 selector);
extern void *func_0207a494(void *context, s32 selector);
extern void *func_0207a99c(void *context, s32 first, s32 second);
extern u32 func_0207a4a8(void *context, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/* Pop a selector, test func_0207a494 for a non-null result, push that boolean, and return zero. */
s32 func_02017788(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)func_02012704(&self->base);
    func_020127f8(&self->base, func_0207a494(data_021f5128, selector) != 0);
    return 0;
}

/* Pop second and first selectors, test func_0207a99c, push its non-null status, and return zero. */
s32 func_020177c8(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    func_020127f8(&self->base,
                  func_0207a99c(data_021f5128, first, second) != 0);
    return 0;
}

/* Pop a selector, test func_0207a40c for a non-null result, push that boolean, and return zero. */
s32 func_0201787c(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)func_02012704(&self->base);
    func_020127f8(&self->base, func_0207a40c(data_021f5128, selector) != 0);
    return 0;
}

/* Pop a selector, test func_0207a450 for a non-null result, push that boolean, and return zero. */
s32 func_020178bc(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)func_02012704(&self->base);
    func_020127f8(&self->base, func_0207a450(data_021f5128, selector) != 0);
    return 0;
}

/* Pop second and first selectors, push the value returned by func_0207a4a8, and return zero. */
s32 func_02017938(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    func_020127f8(&self->base, func_0207a4a8(data_021f5128, first, second));
    return 0;
}
