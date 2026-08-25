#include "tingle/game_phase_script_vm.h"

/* Implement script queries for actor status bit 0 at offset 0x169. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void *Actor_GetOwningCollection(void *actor);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_FindActorByRuntimeId(void *collection, s32 index);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/* Store actor byte 0x169 bit 0 as the VM result. */
static void StoreActorFlag169Bit0Result(GamePhaseActorScriptVm *self, const void *actor)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, *((const u8 *)actor + 0x169) & 1);
}

/*
 * Pop a selector. A nonzero selector resolves that indexed actor from the
 * bound collection. Zero instead selects the runtime collection-1 actor at
 * offset 0x2e7c when the bound collection's mode at 0x2e84 is 1, or follows
 * the runtime 0x2fb8 -> 0x2ebc pointers otherwise. Store selected actor byte
 * 0x169 bit 0 as the VM result and return zero.
 */
s32 GamePhaseActorScriptVm_GetSelectedActorFlag169Bit0(GamePhaseActorScriptVm *self)
{
    s32 selectedActorRuntimeId = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *selectedActor;
    if (selectedActorRuntimeId != 0) {
        selectedActor = (u8 *)ActorCollection_FindActorByRuntimeId(
            Actor_GetOwningCollection(self->actor), selectedActorRuntimeId);
    } else if (*(u32 *)((u8 *)Actor_GetOwningCollection(self->actor) + 0x2e84) == 1) {
        u8 *collectionOne = (u8 *)GamePhaseRuntime_GetActorCollection(
            gGamePhaseRuntime, 1);
        selectedActor = *(u8 **)(collectionOne + 0x2e7c);
    } else {
        u8 *runtimeOwner = *(u8 **)((u8 *)gGamePhaseRuntime + 0x2fb8);
        selectedActor = *(u8 **)(runtimeOwner + 0x2ebc);
    }
    StoreActorFlag169Bit0Result(self, selectedActor);
    return 0;
}

/*
 * Pop an index. If runtime pointers 0x24->0 and 0x2fb8->0x2eac->0 differ,
 * return zero immediately. Otherwise collection mode 1 resolves the index
 * from runtime collection 2, mode 2 from collection 1, and other modes halt.
 * Type-1 targets redirect to collection 1's actor at 0x2e7c. Store byte 0x169
 * bit 0 from the final target as the VM result and return zero.
 */
s32 GamePhaseActorScriptVm_GetIndexedRuntimeActorFlag169Bit0(GamePhaseActorScriptVm *self)
{
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)gGamePhaseRuntime;
    u8 *runtimeOwner = *(u8 **)(runtime + 0x2fb8);
    void *runtimePointer24Target = **(void ***)(runtime + 0x24);
    void *ownerPointer2eacTarget = **(void ***)(runtimeOwner + 0x2eac);
    u32 mode;
    u8 *targetActor;
    if (runtimePointer24Target != ownerPointer2eacTarget)
        return 0;
    mode = *(u32 *)((u8 *)Actor_GetOwningCollection(self->actor) + 0x2e84);
    if (mode == 1)
        targetActor = (u8 *)ActorCollection_FindActorByRuntimeId(
            GamePhaseRuntime_GetActorCollection(runtime, 2), index);
    else if (mode == 2)
        targetActor = (u8 *)ActorCollection_FindActorByRuntimeId(
            GamePhaseRuntime_GetActorCollection(runtime, 1), index);
    else {
        OS_Halt();
        targetActor = 0;
    }
    if (targetActor[0x4d] == 1) {
        u8 *collectionOne = (u8 *)GamePhaseRuntime_GetActorCollection(runtime, 1);
        targetActor = *(u8 **)(collectionOne + 0x2e7c);
    }
    StoreActorFlag169Bit0Result(self, targetActor);
    return 0;
}
