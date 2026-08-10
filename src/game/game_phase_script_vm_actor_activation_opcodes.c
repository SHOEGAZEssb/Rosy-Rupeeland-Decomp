#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that activate or deactivate actors in the bound actor's collection. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02030ad4(void *collection, s32 index);
extern void Actor_SetActive(void *actor, s32 active);
extern void *func_020337d4(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop an activation value and actor index, resolve the indexed actor, and set
 * its active state when present. Deactivating an actor whose type byte at 0x4d
 * is one also clears its halfword at 0xd6. Returns zero.
 */
s32 func_02015e9c(GamePhaseActorScriptVm *self)
{
    s32 active = (s32)func_02012704(&self->base);
    s32 index = (s32)func_02012704(&self->base);
    u8 *actor = (u8 *)func_02030ad4(func_020337d4(self->actor_84), index);

    if (actor != 0) {
        Actor_SetActive(actor, active != 0);
        if (active == 0 && actor[0x4d] == 1)
            *(u16 *)(actor + 0xd6) = 0;
    }
    return 0;
}

/* Activate every non-null actor in the bound actor's 128-entry collection and return zero. */
s32 func_02015f10(GamePhaseActorScriptVm *self)
{
    s32 index;
    void **actors = (void **)func_020337d4(self->actor_84);
    for (index = 0; index < 128; index++) {
        if (actors[index] != 0)
            Actor_SetActive(actors[index], 1);
    }
    return 0;
}
