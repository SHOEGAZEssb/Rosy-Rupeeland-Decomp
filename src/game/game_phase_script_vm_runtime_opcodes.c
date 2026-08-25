#include "tingle/game_phase_script_vm.h"

/* Implement generic script opcodes that query or control phase-runtime collections. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void OS_Halt(void);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_FindActorByRuntimeId(void *collection, s32 index);
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
 * 0x3044. Query results are stored in the VM result register and update its
 * condition; selector 5 resolves an actor from runtime collection 1 using the
 * first operand, selector 11 is a no-op, and selectors 0/10/out-of-range enter
 * OS_Halt. Always returns zero after dispatch. The
 * underlying collection calls may mutate runtime state.
 */
s32 GamePhaseScriptVm_DispatchRuntimeMotionCommand(GamePhaseScriptVm *self)
{
    u32 fourthOperand = GamePhaseScriptVm_Pop(self);
    u32 thirdOperand = GamePhaseScriptVm_Pop(self);
    u32 secondOperand = GamePhaseScriptVm_Pop(self);
    u32 firstOperand = GamePhaseScriptVm_Pop(self);
    u32 selector = GamePhaseScriptVm_Pop(self);
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    switch (selector) {
    case 1:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            self, ActorMotion_ConfigureGridTarget(runtime + 0x2fbc, firstOperand,
                                                  secondOperand, thirdOperand,
                                                  fourthOperand));
        break;
    case 2:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            self, ActorMotion_ConfigureBoundActorTarget(runtime + 0x2fbc,
                                                        firstOperand, secondOperand));
        break;
    case 3:
        if (firstOperand)
            ActorMotion_SetMode2(runtime + 0x2fbc);
        else
            ActorMotion_SetMode1AndClearOutputs(runtime + 0x2fbc);
        break;
    case 4:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(self, *(u32 *)(runtime + 0x2fd4) == 2);
        break;
    case 5: {
        void *actorCollection = GamePhaseRuntime_GetActorCollection(runtime, 1);
        void *actor = ActorCollection_FindActorByRuntimeId(actorCollection, firstOperand);
        ActorMotionAreaFollower_BindActor(runtime + 0x2fbc, actor);
        break;
    }
    case 6:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(self, *(u32 *)(runtime + 0x2fec) & 1);
        break;
    case 7:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            self, ActorMotion_ConfigureGridTarget(runtime + 0x3044, firstOperand,
                                                  secondOperand, thirdOperand,
                                                  fourthOperand));
        break;
    case 8:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            self, ActorMotion_ConfigureBoundActorTarget(runtime + 0x3044,
                                                        firstOperand, secondOperand));
        break;
    case 9:
        if (firstOperand)
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
s32 GamePhaseScriptVm_StoreRandomBelowLimit(GamePhaseScriptVm *self)
{
    u32 limit = GamePhaseScriptVm_Pop(self);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(self, genrand_int32() % limit);
    return 0;
}
