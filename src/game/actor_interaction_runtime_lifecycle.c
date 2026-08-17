#include "tingle/heap.h"
#include "tingle/types.h"

/* Initialize, reset, and tear down the shared actor-interaction runtime and feedback slots. */
extern const char gInteractionRecordAllocatorPoolAllocationTag[];
extern void *gInteractionRecordAllocatorPool;
extern void *gActorFeedbackPresentations[6];
extern u16 gActorExtendedLinkDestinationCount;
extern u16 gActorExtendedLinkSourceCount;
extern u16 gActorExtendedType2ReentryAngleAccumulator;
extern u8 gActorInteractionResourceState[];
extern void *gGameWork;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *InteractionRecordAllocatorPool_Init(void *allocation);
extern void InteractionRecordAllocatorPool_DestroyContents(void *object);
extern void ActorFeedbackResources_Load(void);
extern void ActorFeedbackResources_Unload(void);
extern void ActorRegisteredSubclass_ResetRegistry(void);
extern void ActorTargetSelection_Reset(void);
extern void ActorTargetSelection_ClearCandidates(void);
extern void ActorExtendedPairing_UpdateLinks(void);
extern void InteractionTimingState_Reset(void);
extern void Type7ActorRegistry_Populate(void);
extern void Type7ActorRegistry_Clear(void);
extern void GridEffectActorRegistry_LoadSharedResource(void);
extern void GridEffectActorRegistry_UnloadSharedResource(void);
extern void func_020534cc(void);
extern void func_0205355c(void);
extern void ActorDerivedType1_SetSingletonFieldE4To20E(void);
extern s32 func_02059344(void *context, s32 channel);
extern void Sound_StopDirectSequence(void *context, s32 channel, s32 value);
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Allocate and initialize the 0x40-byte shared object, materialize the actor
 * resource table, set GameWork halfwords selected by indices 0x90..0x9b at
 * offset +0x4c to -1, clear the two recovered counters, invoke
 * ActorRegisteredSubclass_ResetRegistry, and clear all six feedback slots.
 * Returns no value; allocation, resource, and subsystem initialization change
 * global ownership and engine state.
 */
void ActorInteractionRuntime_Init(void)
{
    void *object = Heap_Alloc(0x40, gInteractionRecordAllocatorPoolAllocationTag, 4, &gHeapContext);
    s32 i;
    if (object != 0)
        object = InteractionRecordAllocatorPool_Init(object);
    gInteractionRecordAllocatorPool = object;
    ActorFeedbackResources_Load();
    for (i = 0x90; i <= 0x9b; ++i)
        *(s16 *)((u8 *)gGameWork + i * 2 + 0x4c) = -1;
    gActorExtendedLinkDestinationCount = 0;
    gActorExtendedLinkSourceCount = 0;
    ActorRegisteredSubclass_ResetRegistry();
    for (i = 0; i < 6; ++i)
        gActorFeedbackPresentations[i] = 0;
}

/*
 * Start the recovered actor, scene, presentation, and related runtime helpers
 * in retail order, clearing gActorExtendedType2ReentryAngleAccumulator and the leading resource-table
 * halfword first. Returns no value; every called initializer changes global
 * subsystem state.
 */
void ActorInteractionRuntime_Start(void)
{
    ActorTargetSelection_Reset();
    gActorExtendedType2ReentryAngleAccumulator = 0;
    *(u16 *)gActorInteractionResourceState = 0;
    ActorExtendedPairing_UpdateLinks();
    InteractionTimingState_Reset();
    Type7ActorRegistry_Populate();
    GridEffectActorRegistry_LoadSharedResource();
    func_020534cc();
    ActorDerivedType1_SetSingletonFieldE4To20E();
}

/* Accept no inputs, change no known state, and return no value. */
void ActorInteractionRuntime_NoOp(void)
{
}

/*
 * Destroy each nonnull one of the six global feedback presentations through
 * vtable slot +0x04 and clear its slot. Returns no value; virtual calls release
 * presentation ownership.
 */
void ActorFeedback_DestroyPresentations(void)
{
    s32 i;
    for (i = 0; i < 6; ++i) {
        void *object = gActorFeedbackPresentations[i];
        if (object != 0) {
            if (object != 0)
                (*(void (**)(void *))(*(u8 **)object + 4))(object);
            gActorFeedbackPresentations[i] = 0;
        }
    }
}

/*
 * Stop sound channels 31 and 32 when active, shut down the recovered runtime
 * helpers in retail order, destroy and free the shared object when present,
 * clear its global, then shut down the actor helper and resource table.
 * Returns no value; sound, virtual subsystem, heap, and resource calls have
 * observable hardware and ownership effects.
 */
void ActorInteractionRuntime_Shutdown(void)
{
    void *object;

    if (func_02059344(gSoundContext, 0x1f) != 0)
        Sound_StopDirectSequence(gSoundContext, 0x1f, 0);
    if (func_02059344(gSoundContext, 0x20) != 0)
        Sound_StopDirectSequence(gSoundContext, 0x20, 0);
    func_0205355c();
    GridEffectActorRegistry_UnloadSharedResource();
    Type7ActorRegistry_Clear();
    object = gInteractionRecordAllocatorPool;
    if (object != 0) {
        InteractionRecordAllocatorPool_DestroyContents(object);
        Heap_Free(object);
    }
    gInteractionRecordAllocatorPool = 0;
    ActorTargetSelection_ClearCandidates();
    ActorFeedbackResources_Unload();
}

#ifdef __cplusplus
}
#endif
