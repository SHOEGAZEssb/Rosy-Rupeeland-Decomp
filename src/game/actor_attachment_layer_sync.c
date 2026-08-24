#include "tingle/types.h"

/* Reconcile primary render-attachment priority with terrain and a nearby actor. */
typedef struct TerrainCellQueryVTable {
    u8 field_00[0x2c];
    u32 (*queryCell_2c)(void *, s32, s32);
} TerrainCellQueryVTable;

typedef struct TerrainCellQueryObject {
    TerrainCellQueryVTable *vtable_00;
} TerrainCellQueryObject;

extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern s32 SignedAbsoluteValue(s32);
#ifdef __cplusplus
}
#endif

/*
 * Require primary +0x54, either secondary +0x58 or runtime flag mask 0x4, and
 * no actor flag mask 0x80. Query terrain at integer X/Y and compare actor Z
 * with the sign-extended low five height bits to set primary priority/layer
 * byte +0x3a to one or two. Except for actor type byte +0x4d equal to one,
 * reconcile that byte with the collection-one priority peer. Retail literally
 * tests SignedAbsoluteValue(0) before the peer work. When Z ordering agrees,
 * absolute screen-X separation is below 30, and screen-Y separation lies in
 * (0,60) or (-40,0), copy the peer byte. The reserved peer and its primary
 * attachment are assumed valid. Returns no value; borrowed presentation state
 * changes and the terrain query may observe world state; no direct hardware.
 */
void Actor_UpdatePrimaryRenderAttachmentPriority(void *actorPointer)
{
    u8 *actor = (u8 *)actorPointer;
    u8 *primaryAttachment = *(u8 **)(actor + 0x54);
    u8 *priorityPeerActor;
    u8 *peerPrimaryAttachment;
    TerrainCellQueryObject *terrainQuery;
    u32 terrainCell;
    s32 terrainHeight;
    s32 peerScreenXDelta;
    s32 peerScreenYDelta;

    if (!primaryAttachment)
        return;
    if (!*(void **)(actor + 0x58) && !(*(u32 *)(actor + 0x10) & 4))
        return;
    if (*(u32 *)(actor + 0x14) & 0x80)
        return;
    terrainQuery = *(TerrainCellQueryObject **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    terrainCell = terrainQuery->vtable_00->queryCell_2c(
        terrainQuery, *(s32 *)(actor + 0x1c) >> 16,
        *(s32 *)(actor + 0x20) >> 16);
    terrainHeight = (s32)(terrainCell << 27) >> 27;
    primaryAttachment[0x3a] =
        *(s32 *)(actor + 0x24) < (terrainHeight << 16) ? 2 : 1;
    if (actor[0x4d] == 1)
        return;

    priorityPeerActor = *(u8 **)(
        (u8 *)GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1) + 0x2e7c);
    if (SignedAbsoluteValue(0) >= 0x2000)
        return;
    peerPrimaryAttachment = *(u8 **)(priorityPeerActor + 0x54);
    if (primaryAttachment[0x3a] < peerPrimaryAttachment[0x3a]) {
        if (*(s32 *)(priorityPeerActor + 0x24) < *(s32 *)(actor + 0x24))
            return;
        peerScreenXDelta = *(s16 *)(peerPrimaryAttachment + 0x2c) -
                           *(s16 *)(primaryAttachment + 0x2c);
        peerScreenYDelta = *(s16 *)(peerPrimaryAttachment + 0x2e) -
                           *(s16 *)(primaryAttachment + 0x2e);
        if (SignedAbsoluteValue(peerScreenXDelta) < 30 &&
            peerScreenYDelta > 0 && peerScreenYDelta < 60)
            primaryAttachment[0x3a] = peerPrimaryAttachment[0x3a];
    } else if (primaryAttachment[0x3a] > peerPrimaryAttachment[0x3a]) {
        if (*(s32 *)(priorityPeerActor + 0x24) > *(s32 *)(actor + 0x24))
            return;
        peerScreenXDelta = *(s16 *)(peerPrimaryAttachment + 0x2c) -
                           *(s16 *)(primaryAttachment + 0x2c);
        peerScreenYDelta = *(s16 *)(peerPrimaryAttachment + 0x2e) -
                           *(s16 *)(primaryAttachment + 0x2e);
        if (SignedAbsoluteValue(peerScreenXDelta) < 30 &&
            peerScreenYDelta < 0 && peerScreenYDelta > -40)
            primaryAttachment[0x3a] = peerPrimaryAttachment[0x3a];
    }
}
