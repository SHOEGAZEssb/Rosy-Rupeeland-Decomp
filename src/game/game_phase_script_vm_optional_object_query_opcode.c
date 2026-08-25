#include "tingle/game_phase_script_vm.h"

/* Query confirmed fields and overlay-derived state of the optional singleton. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorDerivedType1_GetSingletonObject(void);
extern s32 func_ov088_0221b218(void *object);
extern s32 func_ov088_0221b380(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Pop query mode and resolve the optional object.  Modes 0..7 return the
 * inverse of flag 0x20, two overlay queries, a signed-state comparison,
 * pointer presence, fx32 X/Y components converted to integers, or signed
 * halfword 0x21c.  A missing object yields zero only where retail checks it.
 * Store the value as the VM result and return zero.
 */
s32 GamePhaseActorScriptVm_DispatchOptionalSingletonQuery(GamePhaseActorScriptVm *self)
{
    s32 query = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *object = (u8 *)ActorDerivedType1_GetSingletonObject();
    s32 result = 0;
    switch (query) {
    case 0:
        if (object)
            result = (*(u16 *)(object + 0x21a) & 0x20) == 0;
        break;
    case 1:
        result = func_ov088_0221b218(object);
        break;
    case 2:
        result = *(s16 *)(object + 0x230) == 1;
        break;
    case 3:
        result = *(void **)(object + 0x24c) != 0;
        break;
    case 4:
        result = *(s32 *)(object + 0x1c) >> 12;
        break;
    case 5:
        result = *(s32 *)(object + 0x20) >> 12;
        break;
    case 6:
        result = *(s16 *)(object + 0x21c);
        break;
    case 7:
        result = func_ov088_0221b380(object);
        break;
    }
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)result);
    return 0;
}
