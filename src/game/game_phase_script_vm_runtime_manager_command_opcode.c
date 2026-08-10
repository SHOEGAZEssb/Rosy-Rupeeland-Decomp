#include "tingle/game_phase_script_vm.h"

/*
 * Dispatch maintenance, configuration, actor iteration, and reset operations
 * for the game-phase runtime manager at offset 0x2ea4.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void Actor_SetFlag200000Inverse(void *actor, s32 enabled);
extern void func_0201df64(void *list);
extern void func_0201e0ec(void *list);
extern void *func_02025d14(void *state);
extern void func_02026514(void *state);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void ActorDerivedType1_UpdateOrientationFlag(void *manager);
extern void ActorDerivedType1_TeardownActiveRecord(void *manager);
extern void func_02055688(void);
extern void func_02074154(void *object);
extern void func_020a2324(void);
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
s32 func_02019aa4(GamePhaseActorScriptVm *self)
{
    s16 third = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 second = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 first = (s16)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *manager = *(u8 **)(runtime + 0x2ea4);
    switch (command) {
    case 0:
        ActorDerivedType1_TeardownActiveRecord(manager);
        break;
    case 1:
        *(s16 *)(manager + 0x29a) = first;
        *(s16 *)(manager + 0x29c) = second;
        *(s16 *)(manager + 0x29e) = third;
        break;
    case 2:
        *(s16 *)(manager + 0x29e) = 0;
        break;
    case 3: {
        void *entity = *(void **)(runtime + 0x2ea8);
        invokeModeZero(manager);
        if (entity)
            invokeModeZero(entity);
        func_02074154(ActorCollection_GetSpriteOwner(GamePhaseRuntime_GetActorCollection(runtime, 1)));
        func_02026514(func_02025d14(*(void **)(runtime + 0x30e8)));
        break;
    }
    case 4: {
        u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(runtime, 1);
        s32 index;
        s32 count = *(s32 *)(collection + 0x2e74);
        for (index = 0; index < count; index++) {
            u8 *actor = *(u8 **)(collection + index * 4);
            if (actor && *(s16 *)(actor + 0x50) == first)
                Actor_SetFlag200000Inverse(actor, second);
        }
        break;
    }
    case 5: {
        void *list = runtime + 0x2f7c;
        func_02055688();
        func_0201df64(list);
        func_0201e0ec(list);
        func_020a2324();
        break;
    }
    case 6:
        ActorDerivedType1_UpdateOrientationFlag(manager);
        break;
    }
    return 0;
}
