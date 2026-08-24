#include "tingle/types.h"

/*
 * Update category-three actors and reject selected height or terrain
 * transitions by restoring their prior horizontal position and motion state.
 */
typedef struct TerrainUpdateActor TerrainUpdateActor;
typedef void (*RefreshCachedTerrainHeightCallback)(TerrainUpdateActor *);

typedef struct TerrainUpdateVTable {
    u8 field_00[0x88];
    RefreshCachedTerrainHeightCallback refreshCachedTerrainHeight_88;
} TerrainUpdateVTable;

struct TerrainUpdateActor {
    TerrainUpdateVTable *vtable_00;
    u8 field_04[0x0c];
    u32 flags_10;
    u32 flags_14;
    u8 field_18[4];
    s32 positionX_1c;
    s32 positionY_20;
    s32 positionZ_24;
    s32 field_28;
    s32 previousX_2c;
    s32 previousY_30;
    u8 field_34[8];
    s32 field_3c;
    s32 field_40;
    u8 field_44[9];
    u8 type_4d;
    u8 field_4e[0x82];
    u32 flags_d0;
    u8 field_d4[0x108];
    s32 cachedTerrainHeightFx32_1dc;
};

typedef struct ActorCollectionTerrainUpdate {
    TerrainUpdateActor *actors_0000[128];
    TerrainUpdateActor *categories_0200[5][128];
    u8 field_0c00[0x220];
    s32 categoryCounts_0e20[5];
} ActorCollectionTerrainUpdate;

extern u8 gActorRuntimeFlags[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeFlags_Test(void *, s32);
extern s32 Actor_GetCachedTerrainHeight(TerrainUpdateActor *);
extern u32 Actor_QueryTerrainCell(TerrainUpdateActor *, s32, s32);
extern void VecFx32Object_SetComponents(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

static void restoreTerrainActor(
    TerrainUpdateActor *actor, s32 previousCachedTerrainHeightFx32)
{
    actor->positionX_1c = actor->previousX_2c;
    actor->positionY_20 = actor->previousY_30;
    actor->cachedTerrainHeightFx32_1dc = previousCachedTerrainHeightFx32;
    actor->field_3c = 0;
    actor->field_40 = 0;
    VecFx32Object_SetComponents((u8 *)actor + 0x88, 0, 0, 0);
    VecFx32Object_SetComponents((u8 *)actor + 0x98, 0, 0, 0);
    actor->flags_d0 |= 0x40;
}

static s32 terrainClassIsRestricted(u32 packedCell)
{
    u32 terrainClass = (packedCell >> 5) & 0x1f;

    return terrainClass == 6 || terrainClass == 16 || terrainClass == 17 ||
           terrainClass == 18 || terrainClass == 20;
}

/*
 * Visit the category-three array at offset 0x800. Every actor receives its
 * vtable-offset-0x88 cached-height refresh unless a global gate and actor flags
 * enable transition checks, in which case the refresh still runs before
 * validation. Flag 0x200 actors are restored whenever their cached terrain
 * height changes. Types one and seven at the cached height additionally use the
 * packed terrain cell and a 0x20000 FX32 (32-world-unit, two-height-level)
 * tolerance to decide restoration. Restoration resets fields 0x3c/0x40,
 * objects at 0x88/0x98, and sets flag 0x40 at 0xd0. Returns no value; actor and
 * terrain callbacks may change gameplay state.
 */
void ActorCollection_UpdateCategory3TerrainActors(ActorCollectionTerrainUpdate *self)
{
    s32 count = self->categoryCounts_0e20[3];
    s32 checksEnabled = !ActorRuntimeFlags_Test(gActorRuntimeFlags, 1);
    s32 i;

    for (i = 0; i < count; i++) {
        TerrainUpdateActor *actor = self->categories_0200[3][i];
        s32 previousCachedTerrainHeightFx32;

        if (!checksEnabled || (actor->flags_14 & 2) ||
            (actor->flags_d0 & 0x80000)) {
            actor->vtable_00->refreshCachedTerrainHeight_88(actor);
            continue;
        }
        if (actor->flags_14 & 0x200) {
            previousCachedTerrainHeightFx32 =
                Actor_GetCachedTerrainHeight(actor);
            actor->vtable_00->refreshCachedTerrainHeight_88(actor);
            if (previousCachedTerrainHeightFx32 !=
                Actor_GetCachedTerrainHeight(actor))
                restoreTerrainActor(actor, previousCachedTerrainHeightFx32);
            continue;
        }

        if ((actor->type_4d == 1 || actor->type_4d == 7) &&
            actor->positionZ_24 == Actor_GetCachedTerrainHeight(actor) &&
            !(actor->flags_14 & 0x40)) {
            u32 packedCell;
            s32 restricted;

            previousCachedTerrainHeightFx32 =
                Actor_GetCachedTerrainHeight(actor);
            actor->vtable_00->refreshCachedTerrainHeight_88(actor);
            packedCell = Actor_QueryTerrainCell(
                actor, actor->positionX_1c >> 16, actor->positionY_20 >> 16);
            restricted = terrainClassIsRestricted(packedCell) &&
                         actor->type_4d == 1 &&
                         (actor->flags_d0 & 0x10000);
            if (restricted)
                continue;
            if (previousCachedTerrainHeightFx32 >=
                    Actor_GetCachedTerrainHeight(actor) + 0x20000 ||
                ((packedCell >> 10) & 0x0f) == 1)
                restoreTerrainActor(actor, previousCachedTerrainHeightFx32);
            continue;
        }

        actor->vtable_00->refreshCachedTerrainHeight_88(actor);
    }
}
