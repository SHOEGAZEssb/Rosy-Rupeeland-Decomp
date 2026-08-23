#include "tingle/types.h"

/* Resolve an actor's collection and refresh its cached terrain-height state. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *manager, u32 slot);
extern s32 GamePhaseState_QueryTerrainHeight(void *terrain, s32 x, s32 y);
extern u32 Actor_QueryTerrainCell(void *actor, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Return the collection that owns the actor. Spawn sets actor flag 0x04000000
 * at +0x14 for collection mode two; that flag selects global runtime slot two,
 * while ordinary actors use slot one. The returned collection is borrowed and
 * no actor, collection, or hardware state changes.
 */
void *Actor_GetOwningCollection(void *actorPointer)
{
    u8 *actor = (u8 *)actorPointer;
    u32 slot = (*(u32 *)(actor + 0x14) & 0x04000000) != 0 ? 2 : 1;

    return GamePhaseRuntime_GetActorCollection(data_021052fc, slot);
}

/*
 * Return the borrowed actor collection at an explicitly supplied global
 * runtime slot. The first argument is confirmed unused by the retail forwarding
 * stub; no actor, collection, or hardware state changes.
 */
void *Actor_GetGlobalCollectionBySlot(void *unusedActor, u32 slot)
{
    (void)unusedActor;
    return GamePhaseRuntime_GetActorCollection(data_021052fc, slot);
}

/*
 * Refresh the signed FX32 Q20.12 world height cached at actor+0x1dc from the
 * global terrain context. Actor X/Y at +0x1c/+0x20 are quantized into
 * 16-world-unit grid cells. Flag 0x04000000 disables sampling and clears the
 * cache while preserving the class-15 rejection flag at actor+0x10. For
 * terrain class 15, a four-height-level (64-world-unit) ledge adjustment is
 * accepted only when it does not exceed actor Z at +0x24; flag 0x02000000 at
 * +0x10 records rejection of that raised level. Other classes clear the flag.
 * The selected integer height level is stored shifted by 16. Returns no value;
 * terrain helpers read global map state and no ownership is transferred.
 */
void Actor_RefreshCachedTerrainHeight(void *actorPointer)
{
    u8 *actor = (u8 *)actorPointer;
    s32 gridX;
    s32 gridY;
    s32 selectedHeightLevel;
    u32 packedCell;

    if ((*(u32 *)(actor + 0x14) & 0x04000000) != 0) {
        *(s32 *)(actor + 0x1dc) = 0;
        return;
    }

    gridX = *(s32 *)(actor + 0x1c) >> 16;
    gridY = *(s32 *)(actor + 0x20) >> 16;
    selectedHeightLevel = GamePhaseState_QueryTerrainHeight(
        (u8 *)data_021052fc + 0x24, gridX, gridY);
    packedCell = Actor_QueryTerrainCell(actor, gridX, gridY);

    if (((packedCell >> 5) & 0x1f) == 15) {
        if (selectedHeightLevel + 4 <= (*(s32 *)(actor + 0x24) >> 16)) {
            selectedHeightLevel += 4;
            *(u32 *)(actor + 0x10) &= ~0x02000000;
        } else {
            *(u32 *)(actor + 0x10) |= 0x02000000;
        }
    } else {
        *(u32 *)(actor + 0x10) &= ~0x02000000;
    }
    *(s32 *)(actor + 0x1dc) = selectedHeightLevel << 16;
}
