#include "tingle/heap.h"
#include "tingle/types.h"

/* Dispatch type-1 interactions that create, update, or hand off an auxiliary resource. */
extern void *gSceneManager;
extern u8 data_02105310[];
extern void *data_021f5ebc;
extern const char data_020df48c[];
extern void *gGameWork;
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032a94(void *actor);
extern void *SceneManager_GetCurrent(void *manager);
extern s32 func_0200b294(void *state);
extern s32 ActorDerivedType1_HasBlockingStateFlags(void *actor);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern s32 func_020828a0(void *state, s32 mask);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern void func_0206c978(void *resource);
extern void *func_0206c68c(void *allocation, void *actor);
extern void GameWork_SetFlag(void *work, u32 flag);
extern s32 func_0206cb04(void *resource, void *target, s32 mode);
extern void func_020099c0(void *manager, s32 first, s32 second);
extern s32 ActorDerivedType1_IsTargetStateEligible(void *target);
extern void ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(void *actor);
extern void ActorDerivedType1_ApplyWeightedCollisionDisplacement(
    void *actor, void *target, s32 distance, s32 offset);
extern s32 func_0206e3a4(void *resource);
extern void func_02048c2c(void *target, void *resource);
#ifdef __cplusplus
}
#endif

/* Allocate and initialize the confirmed 0xb4-byte auxiliary resource. */
static void *createAuxiliary(u8 *actor)
{
    void *resource = Heap_Alloc(0xb4, data_020df48c, 4, &gHeapContext);
    if (resource != 0) resource = func_0206c68c(resource, actor);
    *(void **)(actor + 0x26c) = resource;
    GameWork_SetFlag(gGameWork, 0x3ee);
    return resource;
}

/*
 * Notify func_02032a94, then consume the interaction by returning one through
 * all paths. Scene mode 2, global state, actor state/flag, disabled target,
 * and height gates suppress further work. Target type 2 can reset the actor,
 * recreate +0x26c, attach it with func_0206cb04, play a manager event, or use
 * target +0x260/+0x27f/+0x29e to dispatch
 * ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect or
 * ActorDerivedType1_ApplyWeightedCollisionDisplacement.
 * Target type 7 can create +0x26c when its +0x234 resource is eligible and hand that
 * auxiliary resource to func_02048c2c. Allocation, freeing, GameWork, scene,
 * manager, target virtual, and resource calls have observable engine/SDK
 * effects; the target itself may also be modified by the called handlers.
 */
s32 ActorDerivedType1_HandleAuxiliaryInteraction(void *self, void *other)
{
    u8 *actor = (u8 *)self;
    u8 *target = (u8 *)other;
    void *scene;

    func_02032a94(actor);
    scene = SceneManager_GetCurrent(gSceneManager);
    if (*(s32 *)((u8 *)scene + 4) == 2 || func_0200b294(data_02105310) != 0 ||
        ActorDerivedType1_HasBlockingStateFlags(actor) != 0 || *(s16 *)(actor + 0xd6) == 0x0d ||
        (*(u32 *)(actor + 0x230) & 0x20000) != 0)
        return 1;
    if ((*(u32 *)(actor + 0xd0) & 0x100) != 0 ||
        (*(u32 *)(target + 0x10) & 0x1000000) != 0 ||
        Actor_IsAtCachedTerrainHeight(actor) == 0)
        return 1;

    if (target[0x4d] == 2) {
        if (func_020828a0(data_021f5ebc, 0x40) != 0 ||
            *(s16 *)(actor + 0x268) > 0)
            return 1;
        ActorDerivedType1_TeardownActiveRecord(actor);
        if ((*(s32 (**)(void *))(*(u8 **)target + 0x1ac))(target) != 0) {
            if ((*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) == 0) {
                void *resource = *(void **)(actor + 0x26c);
                if (resource != 0) {
                    func_0206c978(resource);
                    Heap_Free(resource);
                }
                createAuxiliary(actor);
            }
            if (func_0206cb04(*(void **)(actor + 0x26c), target, 1) != 0) {
                *(u32 *)(actor + 0x10) &= ~0x1f0000;
                func_020099c0(data_021052fc + 0x2fbc, 0x14, 2);
            }
        } else if ((*(u32 *)(target + 0x260) & 1) != 0) {
            s32 offset = *(s8 *)(target + 0x27f);
            if (ActorDerivedType1_IsTargetStateEligible(target) != 0)
                offset += *(s16 *)(target + 0x29e);
            if (ActorDerivedType1_IsTargetStateEligible(target) != 0 || target[0x24c] == 3)
                ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(actor);
            ActorDerivedType1_ApplyWeightedCollisionDisplacement(actor, target, 0x14, offset);
        }
    } else if (target[0x4d] == 7) {
        void *targetResource;
        s32 eligible = 0;
        if (func_020828a0(data_021f5ebc, 0x40) != 0) return 1;
        targetResource = *(void **)(target + 0x234);
        if (targetResource != 0 && func_0206e3a4(targetResource) == 0)
            eligible = 1;
        if (*(void **)(actor + 0x26c) == 0 && eligible) {
            ActorDerivedType1_TeardownActiveRecord(actor);
            createAuxiliary(actor);
        }
        if (*(void **)(actor + 0x26c) != 0 &&
            (targetResource == 0 || eligible)) {
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
            func_02048c2c(target, *(void **)(actor + 0x26c));
        }
    }
    return 1;
}
