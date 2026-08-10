#include "tingle/actor_runtime_scene.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Tear down the collection-created gameplay scene, with optional self-freeing. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d448c;
extern void *data_021052fc;
extern void *func_02007f0c(void *context, s32 index);
extern void func_0200b8cc(ActorRuntimeScene *self);
extern void func_02030b58(void *context, s32 value);
extern void Actor_SetActive(void *object, s32 value);
extern void *Actor_GetCollection(void *object);
extern void ActorCollection_UnregisterAndDestroyActor(void *result, void *object);
extern void ActorDerivedType1_ResetToBaseState(void *object);
extern void func_0204b680(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Restore the scene vtable and internal state, deactivate the context's active
 * actor-like object, notify optional context state, clear GameWork flags 0x403
 * and 0x410, run an object-specific transition for type 3/subtype 2, restore
 * context index 1 to value 1, and destroy the Scene base. Returns self without
 * freeing it. Called helpers may update actor/render/game state; no registers
 * are touched directly.
 */
ActorRuntimeScene *func_0200b41c(ActorRuntimeScene *self)
{
    u8 *root;
    u8 *active;
    u8 *child;
    u8 *object;
    void *context;

    self->base.vtable = &data_020d448c;
    func_0200b8cc(self);
    root = (u8 *)data_021052fc;
    context = func_02007f0c(data_021052fc, 1);
    active = *(u8 **)((u8 *)context + 0x2e7c);
    Actor_SetActive(active, 0);
    if (GameWork_TestFlag(gGameWork, 0x3ec))
        *(u32 *)(active + 0x230) |= 4;
    *(u32 *)(active + 0x10) &= ~0x1000008;

    context = *(void **)(root + 0x2ea8);
    if (context != 0)
        func_0204b680(context);
    if (!GameWork_TestFlag(gGameWork, 0x3f3) &&
        !GameWork_TestFlag(gGameWork, 0x403)) {
        child = *(u8 **)(active + 0x54);
        *(u16 *)(child + 0x24) &= ~0x20;
        ActorDerivedType1_ResetToBaseState(active);
    }

    GameWork_ClearFlag(gGameWork, 0x403);
    GameWork_ClearFlag(gGameWork, 0x410);
    object = (u8 *)self->object;
    if (object[0x4d] == 3 && *(u16 *)(object + 0x4e) == 2)
        ActorCollection_UnregisterAndDestroyActor(Actor_GetCollection(object), object);
    context = func_02007f0c(data_021052fc, 1);
    func_02030b58(context, 1);
    Scene_Destroy(&self->base);
    return self;
}

/*
 * Perform the same teardown as func_0200b41c, then release self through the
 * game heap and return its old address. The portable expression delegates the
 * common behavior; the matching fallback preserves the original inlined form.
 */
ActorRuntimeScene *func_0200b56c(ActorRuntimeScene *self)
{
    func_0200b41c(self);
    Heap_Free(self);
    return self;
}
