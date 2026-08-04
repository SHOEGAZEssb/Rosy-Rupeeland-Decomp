#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement actor-script opcodes for immediate position and motion parameters. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032e04(void *actor);
extern void func_02032de4(void *actor, u32 first, u32 second);
extern void func_02032df4(void *actor, u32 first, u32 second);
#ifdef __cplusplus
}
#endif

/*
 * Pop y then x integer coordinates, form an fx32 vector with z=0, copy it to
 * actor vector objects at offsets 0x28 and 0x18, invoke func_02032e04 on the
 * actor, destroy the temporary vector, and return zero.
 */
s32 func_0201409c(GamePhaseActorScriptVm *self)
{
    s32 y = (s32)func_02012704(&self->base);
    s32 x = (s32)func_02012704(&self->base);
    u8 *actor = (u8 *)self->actor_84;
    VecFx32Object value;
    VecFx32Object *copy;
    func_0200500c(&value, x << 12, y << 12, 0);
    copy = func_020050a4((VecFx32Object *)(actor + 0x28), &value);
    func_020050a4((VecFx32Object *)(actor + 0x18), copy);
    func_02005058(&value);
    func_02032e04(actor);
    return 0;
}

/* Pop second then first, call func_02032de4 on the bound actor, and return zero. */
s32 func_0201410c(GamePhaseActorScriptVm *self)
{
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    func_02032de4(self->actor_84, first, second);
    return 0;
}

/* Pop second then first, call func_02032df4 on the bound actor, and return zero. */
s32 func_0201413c(GamePhaseActorScriptVm *self)
{
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    func_02032df4(self->actor_84, first, second);
    return 0;
}
