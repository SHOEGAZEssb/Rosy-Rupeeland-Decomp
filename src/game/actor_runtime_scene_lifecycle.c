#include "tingle/actor_runtime_scene.h"
#include "tingle/game_work.h"

/* Initialize the scene handler created for a collection-attached game object. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d448c;
extern void *gGamePhaseRuntime;
extern void *GamePhaseRuntime_GetActorCollection(void *context, s32 index);
extern void func_02030b58(void *context, s32 value);
extern void ActorDerivedType1_ClearStateVectorTimers(void *object);
extern void Type7Actor_EnterSpecialPresentationState(void *object);
extern void GraphicsSpriteState_SetAnimationIndex(u8 value);
extern void ActorRuntimeScene_ActivateFlaggedActors(ActorRuntimeScene *self);
#ifdef __cplusplus
}
#endif

/*
 * Initialize a 0x28-byte Scene around object, set scene flags/value04, prepare
 * the active actor-like object stored at context offset 0x2ea4, clear three
 * embedded triples, notify an optional context object at 0x2ea8, and select
 * context index 1 with value 0. When neither GameWork flag 0x3f3 nor 0x403 is
 * set, the active object's offset-0x54 child is also enabled/configured.
 * Returns self; called helpers mutate scene, actor, persistent, and rendering
 * state, but this routine performs no direct hardware register access.
 */
ActorRuntimeScene *ActorRuntimeScene_Init(ActorRuntimeScene *self, void *object)
{
    u8 *root;
    u8 *active;
    u8 *child;
    void *context;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d448c;
    self->object = object;
    Scene_SetFlags03(&self->base);
    self->base.value04 = 2;

    root = (u8 *)gGamePhaseRuntime;
    active = *(u8 **)(root + 0x2ea4);
    if (!GameWork_TestFlag(gGameWork, 0x3f3) &&
        !GameWork_TestFlag(gGameWork, 0x403)) {
        child = *(u8 **)(active + 0x54);
        GraphicsSpriteState_SetAnimationIndex(child[0x38]);
        child = *(u8 **)(active + 0x54);
        *(u16 *)(child + 0x36) = 0x100;
        child = *(u8 **)(active + 0x54);
        *(u16 *)(child + 0x24) |= 0x20;
    }

    *(u32 *)(active + 0x230) &= ~4;
    ActorDerivedType1_ClearStateVectorTimers(active);
    VecFx32Object_SetComponents(active + 0x38, 0, 0, 0);
    VecFx32Object_SetComponents(active + 0x88, 0, 0, 0);
    VecFx32Object_SetComponents(active + 0x98, 0, 0, 0);

    context = *(void **)(root + 0x2ea8);
    if (context != 0)
        Type7Actor_EnterSpecialPresentationState(context);
    ActorRuntimeScene_ActivateFlaggedActors(self);
    context = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
    func_02030b58(context, 0);
    GameWork_TestFlag(gGameWork, 0x410);
    return self;
}
