#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"
#include "tingle/scene.h"

/* Detect valid map-edge exits and launch the directional transition overlay. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d5544[];
extern u8 data_02105310[];
extern void *ActorDerivedType1_GetSingletonObject(void);
extern s32 func_0200b04c(void *object);
extern s32 func_0200b294(void *object);
extern s32 ActorDerivedType1_GetActiveRecordId(void *actor);
extern void OverlayManager_LoadOverlay(s32 value, s32 mode, s32 mask);
extern s32 OverlayManager_GetGlobal(void);
extern void *func_02056f00(void *vector, const void *source);
extern void func_02005058(void *vector);
extern void *func_ov074_0220fda8(void *object, s32 directionIndex);
#ifdef __cplusplus
}
#endif

static s32 launchBoundaryOverlay(s32 direction)
{
    void *object;
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x4a);
    object = Heap_Alloc(0x174, (const char *)data_020d5544, 4,
                        &gHeapContext);
    if (object != 0)
        func_ov074_0220fda8(object, direction - 1);
    return 1;
}

/*
 * Test global/scene/actor conditions required for a map-edge transition. The
 * normal path rejects busy transition systems, incompatible actor flags,
 * movement mismatches, and unsupported actor modes. If func_0200efe0 reports
 * an enabled edge in configuration fields 0x14..0x1a, allocate overlay 74 for
 * direction 0..3 and return one. Otherwise return zero.
 */
s32 func_0200ecf0(GamePhaseState *self)
{
    u8 *actor = *(u8 **)((u8 *)self + 0x2e80);
    u8 *config = (u8 *)self->configuration;
    Scene *current;
    s32 special = 0;
    s32 actorMode;
    s32 direction;

    if (GameWork_TestFlag(gGameWork, 0x3ee) ||
        func_0200b04c(data_02105310) || func_0200b294(data_02105310))
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

    direction = func_0200efe0(self);
    if (direction < 1 || direction > 4)
        return 0;
    if (*(s16 *)(config + 0x12 + direction * 2) < 0)
        return 0;
    return launchBoundaryOverlay(direction);
}

/*
 * Return 1/2/3/4 when the actor position lies within 32 pixels of the left,
 * right, top, or bottom map edge. Dimensions come from owned_2eb0 field 0x20
 * as two 16-bit tile counts and positions are fx32. Return -1 when movement is
 * blocked by actor flag 0x10 or the actor remains inside all four boundaries.
 */
s32 func_0200efe0(GamePhaseState *self)
{
    u8 *actor = *(u8 **)((u8 *)self + 0x2e80);
    s32 vector[4];
    u32 dimensions;
    s32 x;
    s32 z;
    s32 result = -1;

    if (*(u32 *)(actor + 0xd0) & 0x10)
        return -1;
    func_02056f00(vector, actor + 0x18);
    dimensions = *(u32 *)((u8 *)self->owned_2eb0 + 0x20);
    x = vector[1] >> 12;
    z = vector[2] >> 12;
    if (x < 32)
        result = 1;
    else if (x > (s32)((dimensions & 0xffff) << 4) - 32)
        result = 2;
    else if (z < 32)
        result = 3;
    else if (z > (s32)((dimensions >> 16) << 4) - 32)
        result = 4;
    func_02005058(vector);
    return result;
}
