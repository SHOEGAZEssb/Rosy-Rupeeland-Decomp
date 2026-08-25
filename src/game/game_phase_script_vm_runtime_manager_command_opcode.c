#include "tingle/game_phase_script_vm.h"

/*
 * Dispatch maintenance, configuration, actor iteration, and reset operations
 * for the game-phase runtime manager at offset 0x2ea4.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void Actor_SetFlag200000Inverse(void *actor, s32 enabled);
extern void RuntimePresentationManager_DestroyAllEffects(void *presentationManager);
extern void RuntimePresentationManager_GetGraphics3dPresentation(void *presentationManager);
extern void *DualScreenUiPresentationBase_GetEmbeddedState(void *state);
extern void DualScreenUiGridState_Destroy(void *state);
extern void *ActorCollection_GetSpriteGroup(void *collection);
extern void ActorDerivedType1_UpdateOrientationFlag(void *manager);
extern void ActorDerivedType1_TeardownActiveRecord(void *manager);
extern void func_02055688(void);
extern void GraphicsSpriteGroup_ReleaseResources(void *object);
/* Matching forwards the preceding getter result in r0; host preparation makes
 * that argument explicit. */
extern void Graphics3dPresentation_Clear(void);
#ifdef __cplusplus
}
#endif

/* Invoke virtual slot 0x54 of object with argument zero. */
static void invokeModeZero(void *object)
{
    typedef void (*Method)(void *, s32);
    Method method = *(Method *)((u8 *)*(void **)object + 0x54);
    method(object, 0);
}

/*
 * Pop third, second, first, and command operands.  Commands 0..6 run manager
 * maintenance, write three halfwords, clear one halfword, reset manager/entity
 * and related runtime objects, toggle matching actors in collection 1, clear
 * global/list state, or run a second manager operation.  Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchType1ManagerCommand(GamePhaseActorScriptVm *self)
{
    s16 managerOperand2 = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 managerOperand1 = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 managerOperand0 = (s16)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    u8 *manager = *(u8 **)(runtime + 0x2ea4);
    switch (command) {
    case 0:
        ActorDerivedType1_TeardownActiveRecord(manager);
        break;
    case 1:
        *(s16 *)(manager + 0x29a) = managerOperand0;
        *(s16 *)(manager + 0x29c) = managerOperand1;
        *(s16 *)(manager + 0x29e) = managerOperand2;
        break;
    case 2:
        *(s16 *)(manager + 0x29e) = 0;
        break;
    case 3: {
        void *entity = *(void **)(runtime + 0x2ea8);
        invokeModeZero(manager);
        if (entity)
            invokeModeZero(entity);
        GraphicsSpriteGroup_ReleaseResources(
            ActorCollection_GetSpriteGroup(
                GamePhaseRuntime_GetActorCollection(runtime, 1)));
        DualScreenUiGridState_Destroy(DualScreenUiPresentationBase_GetEmbeddedState(*(void **)(runtime + 0x30e8)));
        break;
    }
    case 4: {
        u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(runtime, 1);
        s32 index;
        s32 count = *(s32 *)(collection + 0x2e74);
        for (index = 0; index < count; index++) {
            u8 *actor = *(u8 **)(collection + index * 4);
            if (actor && *(s16 *)(actor + 0x50) == managerOperand0)
                Actor_SetFlag200000Inverse(actor, managerOperand1);
        }
        break;
    }
    case 5: {
        void *presentationManager = runtime + 0x2f7c;
        func_02055688();
        RuntimePresentationManager_DestroyAllEffects(presentationManager);
        RuntimePresentationManager_GetGraphics3dPresentation(presentationManager);
        Graphics3dPresentation_Clear();
        break;
    }
    case 6:
        ActorDerivedType1_UpdateOrientationFlag(manager);
        break;
    }
    return 0;
}
