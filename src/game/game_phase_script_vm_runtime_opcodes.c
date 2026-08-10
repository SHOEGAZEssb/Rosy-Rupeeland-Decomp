#include "tingle/game_phase_script_vm.h"

/* Implement generic script opcodes that query or control phase-runtime collections. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void OS_Halt(void);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern u32 ActorMotion_ConfigureGridTarget(void *collection, u32 a, u32 b, u32 c, u32 d);
extern u32 ActorMotion_ConfigureBoundActorTarget(void *collection, u32 a, u32 b);
extern void ActorMotion_SetMode2(void *collection);
extern void ActorMotion_SetMode1AndClearOutputs(void *collection);
extern void ActorMotionAreaFollower_BindActor(void *collection, void *object);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop four operands and a selector. Selectors 1-6 operate on runtime fields
 * 0x2fbc/0x2fd4/0x2fec; selectors 7-9 mirror the collection operations at
 * 0x3044. Query results are stored through GamePhaseScriptVm_SetResult, selector 5 resolves
 * an object from runtime collection 1, selector 11 is a no-op, and selectors
 * 0/10/out-of-range enter OS_Halt. Always returns zero after dispatch. The
 * underlying collection calls may mutate runtime state.
 */
s32 func_02012814(GamePhaseScriptVm *self)
{
    u32 d = GamePhaseScriptVm_Pop(self);
    u32 c = GamePhaseScriptVm_Pop(self);
    u32 b = GamePhaseScriptVm_Pop(self);
    u32 a = GamePhaseScriptVm_Pop(self);
    u32 selector = GamePhaseScriptVm_Pop(self);
    u8 *runtime = (u8 *)data_021052fc;
    switch (selector) {
    case 1:
        GamePhaseScriptVm_SetResult(self, ActorMotion_ConfigureGridTarget(runtime + 0x2fbc, a, b, c, d));
        break;
    case 2:
        GamePhaseScriptVm_SetResult(self, ActorMotion_ConfigureBoundActorTarget(runtime + 0x2fbc, a, b));
        break;
    case 3:
        if (a)
            ActorMotion_SetMode2(runtime + 0x2fbc);
        else
            ActorMotion_SetMode1AndClearOutputs(runtime + 0x2fbc);
        break;
    case 4:
        GamePhaseScriptVm_SetResult(self, *(u32 *)(runtime + 0x2fd4) == 2);
        break;
    case 5: {
        void *collection = GamePhaseRuntime_GetActorCollection(runtime, 1);
        void *object = ActorCollection_FindActorByDescriptorValue(collection, a);
        ActorMotionAreaFollower_BindActor(runtime + 0x2fbc, object);
        break;
    }
    case 6:
        GamePhaseScriptVm_SetResult(self, *(u32 *)(runtime + 0x2fec) & 1);
        break;
    case 7:
        GamePhaseScriptVm_SetResult(self, ActorMotion_ConfigureGridTarget(runtime + 0x3044, a, b, c, d));
        break;
    case 8:
        GamePhaseScriptVm_SetResult(self, ActorMotion_ConfigureBoundActorTarget(runtime + 0x3044, a, b));
        break;
    case 9:
        if (a)
            ActorMotion_SetMode2(runtime + 0x3044);
        else
            ActorMotion_SetMode1AndClearOutputs(runtime + 0x3044);
        break;
    case 11:
        break;
    case 0:
    case 10:
    default:
        OS_Halt();
        break;
    }
    return 0;
}

/* Pop an upper bound, store a global-RNG value modulo that bound, and return zero. */
s32 func_02012a60(GamePhaseScriptVm *self)
{
    u32 limit = GamePhaseScriptVm_Pop(self);
    GamePhaseScriptVm_SetResult(self, genrand_int32() % limit);
    return 0;
}
