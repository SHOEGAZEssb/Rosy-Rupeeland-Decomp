#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that dispatch address-derived actor actions. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_0202bb60(void *object, u32 first, u32 second, u32 third);
extern u32 func_020343e4(void *actor, u32 first, u32 second);
extern void func_02032c14(void *actor);
extern void func_02032c4c(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop third, second, and first operands, dispatch them to func_0202bb60 on the
 * global runtime object at offset 0x2ed4, and return zero.
 */
s32 func_02013e14(GamePhaseActorScriptVm *self)
{
    u32 third = func_02012704(&self->base);
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    void *object = *(void **)((u8 *)data_021052fc + 0x2ed4);
    func_0202bb60(object, first, second, third);
    return 0;
}

/* Pop second and first, push func_020343e4(bound actor, first, second), and return zero. */
s32 func_02013e64(GamePhaseActorScriptVm *self)
{
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    func_020127f8(&self->base, func_020343e4(self->actor_84, first, second));
    return 0;
}

/* Pop and discard one script operand, then return zero. */
s32 func_02013ea0(GamePhaseActorScriptVm *self)
{
    (void)func_02012704(&self->base);
    return 0;
}

/* Invoke func_02032c14 on the bound actor and return zero. */
s32 func_02013eb0(GamePhaseActorScriptVm *self)
{
    func_02032c14(self->actor_84);
    return 0;
}

/* Invoke func_02032c4c on the bound actor and return zero. */
s32 func_02013ec4(GamePhaseActorScriptVm *self)
{
    func_02032c4c(self->actor_84);
    return 0;
}
