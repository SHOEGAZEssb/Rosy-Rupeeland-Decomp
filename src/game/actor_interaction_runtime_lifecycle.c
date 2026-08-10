#include "tingle/heap.h"
#include "tingle/types.h"

/* Initialize, reset, and tear down the shared actor-interaction runtime and feedback slots. */
extern const char data_020df4f8[];
extern void *data_02105778;
extern void *gActorFeedbackPresentations[6];
extern u16 data_0210572a;
extern u16 data_02105728;
extern u16 data_02105774;
extern u8 data_021056e4[];
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
extern void func_02034e58(void);
extern void func_02034ea8(void);
extern void ActorExtendedPairing_UpdateLinks(void);
extern void InteractionTimingState_Reset(void);
extern void Type7ActorRegistry_Populate(void);
extern void Type7ActorRegistry_Clear(void);
extern void func_0204fafc(void);
extern void func_0204fb2c(void);
extern void func_020534cc(void);
extern void func_0205355c(void);
extern void ActorDerivedType1_SetSingletonFieldE4To20E(void);
extern s32 func_02059344(void *context, s32 channel);
extern void func_0205929c(void *context, s32 channel, s32 value);
#ifdef __cplusplus
}
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
    void *object = Heap_Alloc(0x40, data_020df4f8, 4, &gHeapContext);
    s32 i;
    if (object != 0)
        object = InteractionRecordAllocatorPool_Init(object);
    data_02105778 = object;
    ActorFeedbackResources_Load();
    for (i = 0x90; i <= 0x9b; ++i)
        *(s16 *)((u8 *)gGameWork + i * 2 + 0x4c) = -1;
    data_0210572a = 0;
    data_02105728 = 0;
    ActorRegisteredSubclass_ResetRegistry();
    for (i = 0; i < 6; ++i)
        gActorFeedbackPresentations[i] = 0;
}

/*
 * Start the recovered actor, scene, presentation, and related runtime helpers
 * in retail order, clearing data_02105774 and the leading resource-table
 * halfword first. Returns no value; every called initializer changes global
 * subsystem state.
 */
void ActorInteractionRuntime_Start(void)
{
    func_02034e58();
    data_02105774 = 0;
    *(u16 *)data_021056e4 = 0;
    ActorExtendedPairing_UpdateLinks();
    InteractionTimingState_Reset();
    Type7ActorRegistry_Populate();
    func_0204fafc();
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
    if (func_02059344(gSoundContext, 0x1f) != 0)
        func_0205929c(gSoundContext, 0x1f, 0);
    if (func_02059344(gSoundContext, 0x20) != 0)
        func_0205929c(gSoundContext, 0x20, 0);
    func_0205355c();
    func_0204fb2c();
    Type7ActorRegistry_Clear();
    if (data_02105778 != 0) {
        InteractionRecordAllocatorPool_DestroyContents(data_02105778);
        Heap_Free(data_02105778);
    }
    data_02105778 = 0;
    func_02034ea8();
    ActorFeedbackResources_Unload();
}
