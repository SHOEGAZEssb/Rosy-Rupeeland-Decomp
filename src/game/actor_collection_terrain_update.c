#include "tingle/types.h"

/*
 * Update category-three actors and reject selected height or terrain
 * transitions by restoring their prior horizontal position and motion state.
 */
typedef struct TerrainUpdateActor TerrainUpdateActor;
typedef void (*TerrainUpdateCallback)(TerrainUpdateActor *);

typedef struct TerrainUpdateVTable {
    u8 field_00[0x88];
    TerrainUpdateCallback callback_88;
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
    s32 field_1dc;
};

typedef struct ActorCollectionTerrainUpdate {
    TerrainUpdateActor *actors_0000[128];
    TerrainUpdateActor *categories_0200[5][128];
    u8 field_0c00[0x220];
    s32 categoryCounts_0e20[5];
} ActorCollectionTerrainUpdate;

extern u8 data_021f5ebc[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020828a0(void *, s32);
extern s32 Actor_GetCachedTerrainHeight(TerrainUpdateActor *);
extern u32 Actor_QueryTerrainCell(TerrainUpdateActor *, s32, s32);
extern void func_0200b2c0(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

static void restoreTerrainActor(TerrainUpdateActor *actor, s32 oldValue)
{
    actor->positionX_1c = actor->previousX_2c;
    actor->positionY_20 = actor->previousY_30;
    actor->field_1dc = oldValue;
    actor->field_3c = 0;
    actor->field_40 = 0;
    func_0200b2c0((u8 *)actor + 0x88, 0, 0, 0);
    func_0200b2c0((u8 *)actor + 0x98, 0, 0, 0);
    actor->flags_d0 |= 0x40;
}

static s32 terrainCodeIsRestricted(u32 terrain)
{
    u32 code = (terrain >> 5) & 0x1f;

    return code == 6 || code == 16 || code == 17 || code == 18 || code == 20;
}

/*
 * Visit the category-three array at offset 0x800. Every actor receives its
 * vtable-offset-0x88 callback unless a global gate and actor flags enable the
 * transition checks, in which case the callback still runs before validation.
 * Flag 0x200 actors are restored whenever Actor_GetCachedTerrainHeight changes. Types one and
 * seven at matching offset-0x24 height additionally use the encoded result of
 * Actor_QueryTerrainCell and a 0x20000 tolerance to decide restoration. Restoration
 * resets fields 0x3c/0x40, objects at 0x88/0x98, and sets flag 0x40 at 0xd0.
 * Returns no value; called actor and terrain helpers may change gameplay state.
 */
void ActorCollection_UpdateCategory3TerrainActors(ActorCollectionTerrainUpdate *self)
{
    s32 count = self->categoryCounts_0e20[3];
    s32 checksEnabled = !func_020828a0(data_021f5ebc, 1);
    s32 i;

    for (i = 0; i < count; i++) {
        TerrainUpdateActor *actor = self->categories_0200[3][i];
        s32 oldValue;

        if (!checksEnabled || (actor->flags_14 & 2) ||
            (actor->flags_d0 & 0x80000)) {
            actor->vtable_00->callback_88(actor);
            continue;
        }
        if (actor->flags_14 & 0x200) {
            oldValue = Actor_GetCachedTerrainHeight(actor);
            actor->vtable_00->callback_88(actor);
            if (oldValue != Actor_GetCachedTerrainHeight(actor))
                restoreTerrainActor(actor, oldValue);
            continue;
        }

        if ((actor->type_4d == 1 || actor->type_4d == 7) &&
            actor->positionZ_24 == Actor_GetCachedTerrainHeight(actor) &&
            !(actor->flags_14 & 0x40)) {
            u32 terrain;
            s32 restricted;

            oldValue = Actor_GetCachedTerrainHeight(actor);
            actor->vtable_00->callback_88(actor);
            terrain = Actor_QueryTerrainCell(actor, actor->positionX_1c >> 16,
                                    actor->positionY_20 >> 16);
            restricted = terrainCodeIsRestricted(terrain) &&
                         actor->type_4d == 1 &&
                         (actor->flags_d0 & 0x10000);
            if (restricted)
                continue;
            if (oldValue >= Actor_GetCachedTerrainHeight(actor) + 0x20000 ||
                ((terrain >> 10) & 0x0f) == 1)
                restoreTerrainActor(actor, oldValue);
            continue;
        }

        actor->vtable_00->callback_88(actor);
    }
}
