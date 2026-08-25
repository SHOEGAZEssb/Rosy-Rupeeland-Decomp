#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"
#include "tingle/scene.h"

/* Detect valid map-edge exits and launch the directional transition overlay. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gGamePhaseBoundaryTransitionAllocationTag[];
extern u8 gActorRuntimeCollection[];
extern void *ActorDerivedType1_GetSingletonObject(void);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *object);
extern s32 ActorRuntimeCollection_GetBusyState(void *object);
extern s32 ActorDerivedType1_GetActiveRecordId(void *actor);
extern VecFx32Object *VecFx32Object_InitPlanarProjection(
    VecFx32Object *vector, const void *source);
extern void *func_ov074_0220fda8(void *object, s32 directionIndex);
#ifdef __cplusplus
}
#endif

static s32 launchBoundaryOverlay(s32 direction)
{
    void *object;
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x4a);
    object = Heap_Alloc(0x174, (const char *)gGamePhaseBoundaryTransitionAllocationTag, 4,
                        &gHeapContext);
    if (object != 0)
        func_ov074_0220fda8(object, direction - 1);
    return 1;
}

/*
 * Test global/scene/actor conditions required for a map-edge transition. The
 * normal path rejects busy transition systems, incompatible actor flags,
 * movement mismatches, and unsupported actor modes. If
 * GamePhaseState_GetBoundaryDirection reports an enabled edge in configuration
 * fields 0x14..0x1a, allocate overlay 74 for direction 0..3 and return one.
 * Otherwise return zero.
 */
s32 GamePhaseState_TryStartBoundaryTransition(GamePhaseState *self)
{
    u8 *actor = *(u8 **)((u8 *)self + 0x2e80);
    u8 *config = (u8 *)self->configuration;
    Scene *current;
    s32 special = 0;
    s32 actorMode;
    s32 direction;

    if (GameWork_TestFlag(gGameWork, 0x3ee) ||
        ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) || ActorRuntimeCollection_GetBusyState(gActorRuntimeCollection))
        return 0;
    current = SceneManager_GetCurrent(gSceneManager);
    if (current->value04 != 1)
        return 0;
    if (ActorDerivedType1_GetSingletonObject() != 0 &&
        *(s16 *)((u8 *)ActorDerivedType1_GetSingletonObject() + 0x230) == 1)
        special = 1;

    if (!special) {
        u32 flags = *(u32 *)(actor + 0xd0);
        if ((flags & 0x100) || (flags & 0x10000) ||
            (*(u32 *)(actor + 0x230) & 0x980000) ||
            *(u32 *)(actor + 0x270) != 0 || (flags & 0x10) ||
            *(u32 *)(actor + 0x24) != *(u32 *)(actor + 0x1dc) ||
            *(s16 *)(actor + 0x268) != 0 || (flags & 0x4000))
            return 0;
        actorMode = ActorDerivedType1_GetActiveRecordId(actor);
        if (actorMode != -1 && actorMode != 0x64 && actorMode != 0x65 &&
            actorMode != 0x66 && actorMode != 0x7f)
            return 0;
    }

    direction = GamePhaseState_GetBoundaryDirection(self);
    if (direction < 1 || direction > 4)
        return 0;
    if (*(s16 *)(config + 0x12 + direction * 2) < 0)
        return 0;
    return launchBoundaryOverlay(direction);
}

/*
 * Return 1/2/3/4 when the actor position lies within 32 pixels of the left,
 * right, top, or bottom map edge. Dimensions come from phaseObject field 0x20
 * as two 16-bit tile counts and positions are fx32. Return -1 when movement is
 * blocked by actor flag 0x10 or the actor remains inside all four boundaries.
 */
s32 GamePhaseState_GetBoundaryDirection(GamePhaseState *self)
{
    u8 *actor = *(u8 **)((u8 *)self + 0x2e80);
    VecFx32Object vector;
    u32 dimensions;
    s32 x;
    s32 z;
    s32 result = -1;

    if (*(u32 *)(actor + 0xd0) & 0x10)
        return -1;
    VecFx32Object_InitPlanarProjection(&vector, actor + 0x18);
    dimensions = *(u32 *)((u8 *)self->phaseObject + 0x20);
    x = vector.value.x >> 12;
    z = vector.value.y >> 12;
    if (x < 32)
        result = 1;
    else if (x > (s32)((dimensions & 0xffff) << 4) - 32)
        result = 2;
    else if (z < 32)
        result = 3;
    else if (z > (s32)((dimensions >> 16) << 4) - 32)
        result = 4;
    VecFx32Object_Destroy(&vector);
    return result;
}
