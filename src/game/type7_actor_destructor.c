#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered teardown for the type-seven actor. It unregisters the actor,
 * releases owned state, and conditionally records its terminal scene values.
 */
extern u8 data_020e1c38[];
extern u8 *data_021052fc;
extern void *gType7ActorRegistry[3];
extern u8 data_020e16b0[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedType1_SetSpecialModeEnabled(void *object, s32 enabled);
extern void func_0206c978(void *resource);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void Type7MarkerPresentation_Destroy(void *helper);
extern void VecFx32Object_Destroy(void *value);
extern void ActorDerivedRuntime_DestroyAlternate(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Restore vtable data_020e1c38. If world object *data_021052fc+0x2ea4 is
 * nonnull, pass it with zero to ActorDerivedType1_SetSpecialModeEnabled. Remove
 * self from the first matching gType7ActorRegistry slot. If owned pointer +0x234
 * exists, release it via func_0206c978 and Heap_Free. Clear GameWork flag
 * 0x3fd. For actor layer byte
 * +0x48 equal to one, write terminal state into data_020e16b0: +0x268 bit
 * 0x10000 selects +0x2b4=-1, +0x2b8=0, +0x2d0=0; otherwise copy +0x1fc to
 * +0x2bc and store the boolean +0x268 bit 0x10 at +0x2d0. In both cases copy
 * signed +0x27e to +0x2c0 and fixed-point +0x1c/+0x20 integer parts to
 * +0x2c4/+0x2c8. Destroy helper +0x2a8, finalize values +0x284, +0x26c,
 * +0x224, and +0x214, invoke base destructor
 * ActorDerivedRuntime_DestroyAlternate, and return self. Registry, heap,
 * GameWork, shared-scene, helper, and actor state may change.
 */
void *Type7Actor_Destroy(void *self)
{
    u8 *actor = (u8 *)self;
    void *worldObject;
    void *resource;
    s32 i;
    *(void **)actor = data_020e1c38;
    worldObject = *(void **)(data_021052fc + 0x2ea4);
    if (worldObject != 0)
        ActorDerivedType1_SetSpecialModeEnabled(worldObject, 0);
    for (i = 0; i < 3; ++i) {
        if (gType7ActorRegistry[i] == actor) {
            gType7ActorRegistry[i] = 0;
            break;
        }
    }
    resource = *(void **)(actor + 0x234);
    if (resource != 0) {
        func_0206c978(resource);
        Heap_Free(resource);
    }
    GameWork_ClearFlag(gGameWork, 0x3fd);
    if (*(s8 *)(actor + 0x48) == 1) {
        if ((*(u32 *)(actor + 0x268) & 0x10000) != 0) {
            *(s32 *)(data_020e16b0 + 0x2b4) = -1;
            *(u32 *)(data_020e16b0 + 0x2b8) = 0;
            *(u32 *)(data_020e16b0 + 0x2d0) = 0;
        } else {
            *(u32 *)(data_020e16b0 + 0x2bc) = *(u32 *)(actor + 0x1fc);
            *(u32 *)(data_020e16b0 + 0x2d0) =
                ((*(u32 *)(actor + 0x268) & 0x10) != 0) ? 1 : 0;
        }
        *(s32 *)(data_020e16b0 + 0x2c0) = *(s16 *)(actor + 0x27e);
        *(s32 *)(data_020e16b0 + 0x2c4) = *(s32 *)(actor + 0x1c) >> 12;
        *(s32 *)(data_020e16b0 + 0x2c8) = *(s32 *)(actor + 0x20) >> 12;
    }
    Type7MarkerPresentation_Destroy(actor + 0x2a8);
    VecFx32Object_Destroy(actor + 0x284);
    VecFx32Object_Destroy(actor + 0x26c);
    VecFx32Object_Destroy(actor + 0x224);
    VecFx32Object_Destroy(actor + 0x214);
    ActorDerivedRuntime_DestroyAlternate(actor);
    return actor;
}
