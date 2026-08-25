#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_area_scene.h"
#include "tingle/heap.h"

/* Lifecycle helpers for the runtime's optional secondary actor subsystem. */

extern u8 gGamePhaseAreaSceneAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorRuntimeAnimationResourceLists_ClearOtherCategory(void *loader);
extern void GamePhaseState_UnloadPhase(void *state);
extern void ActorRuntimeAnimationResourceLists_ClearCategory1(void *loader);
#ifdef __cplusplus
}
#endif

/*
 * Allocate a typed area scene, construct it with area
 * and enabled, store it at runtime offset 0x2fb8, and run its post-create hook.
 * Null is stored and forwarded if allocation fails. Returns no value.
 */
void GamePhaseRuntime_CreateSecondaryActorSubsystem(
    GamePhaseRuntime *self, void *area, s32 enabled)
{
    u8 *b = (u8 *)self;
    GamePhaseAreaScene *object = (GamePhaseAreaScene *)Heap_Alloc(
        sizeof(GamePhaseAreaScene), (const char *)gGamePhaseAreaSceneAllocationTag,
        4, &gHeapContext);
    if (object != 0)
        object = GamePhaseAreaScene_Init(
            object, (GamePhaseAreaSceneConfig *)area, enabled);
    *(void **)(b + 0x2fb8) = object;
    GamePhaseAreaScene_Activate(object);
}

/*
 * Invoke virtual slot one on the optional subsystem at 0x2fb8 when present,
 * clear its pointer, and notify the field loader at 0x30b4. Returns no value.
 */
void GamePhaseRuntime_DestroySecondaryActorSubsystem(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    void *object = *(void **)(b + 0x2fb8);
    if (object != 0)
        (*(void (***)(void *))object)[1](object);
    *(void **)(b + 0x2fb8) = 0;
    ActorRuntimeAnimationResourceLists_ClearOtherCategory(*(void **)(b + 0x30b4));
}

/*
 * Invoke virtual slot nine on the primary gameplay object at 0x2ed4 with
 * argument zero, tear down embedded state 0x24, and advance the field loader.
 * The recovered pointers are assumed non-null. Returns no value.
 */
void GamePhaseRuntime_TeardownActiveAreaState(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    void *object = *(void **)(b + 0x2ed4);
    typedef void (*Method)(void *, s32);
    ((Method *)(*(void **)object))[9](object, 0);
    GamePhaseState_UnloadPhase(b + 0x24);
    ActorRuntimeAnimationResourceLists_ClearCategory1(*(void **)(b + 0x30b4));
}
