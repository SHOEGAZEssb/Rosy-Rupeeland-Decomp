#include "tingle/types.h"

/* Update an actor's terrain-driven motion counter and alternating state. */
typedef struct TerrainToggleVTable {
    u8 field_00[0xa0];
    s32 (*query_a0)(void *);
    u8 field_a4[4];
    s32 (*query_a8)(void *);
} TerrainToggleVTable;

typedef struct TerrainQueryVTable {
    u8 field_00[0x2c];
    u32 (*query_2c)(void *, s32, s32);
} TerrainQueryVTable;

extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorFeedbackResources_GetPackedSound(s32);
extern void ActorFeedback_SpawnIndexedPresentation(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Gate processing through global queries 8/7, virtual queries at 0xa0/0xa8,
 * and actor flag 0x10 at 0xd0. A failed gate writes -6 to signed counter
 * 0x1e5. Otherwise query terrain at integer X/Y; terrain nibble 7 or 8 with
 * nonzero motion increments the counter. On wrap to zero, call ActorFeedback_SpawnIndexedPresentation
 * with halfword 0x1e8. When the counter exceeds byte 0x1e7, toggle byte 0x1e6
 * and reset the counter to -1. Other terrain resets it to -1. Returns no value;
 * virtual and terrain queries may observe gameplay state.
 */
void Actor_UpdateTerrainMotionFeedback(void *self)
{
    u8 *actor = (u8 *)self;
    TerrainToggleVTable *vtable = *(TerrainToggleVTable **)actor;
    TerrainQueryVTable **queryObject;
    u32 terrain;
    u32 nibble;
    s8 counter;

    if ((ActorFeedbackResources_GetPackedSound(8) || ActorFeedbackResources_GetPackedSound(7)) &&
        !vtable->query_a0(actor) && !(*(u32 *)(actor + 0xd0) & 0x10) &&
        !vtable->query_a8(actor)) {
        queryObject = *(TerrainQueryVTable ***)((u8 *)gGamePhaseRuntime + 0x2ed4);
        terrain = (*queryObject)->query_2c(
            queryObject, *(s32 *)(actor + 0x1c) >> 16,
            *(s32 *)(actor + 0x20) >> 16);
        nibble = (terrain >> 10) & 0x0f;
        if (nibble == 7 || nibble == 8) {
            if (*(s32 *)(actor + 0x3c) == 0 &&
                *(s32 *)(actor + 0x40) == 0)
                return;
            counter = (s8)(actor[0x1e5] + 1);
            actor[0x1e5] = (u8)counter;
            if (counter == 0) {
                ActorFeedback_SpawnIndexedPresentation(actor, *(s16 *)(actor + 0x1e8));
            } else if (counter > actor[0x1e7]) {
                actor[0x1e6] ^= 1;
                actor[0x1e5] = 0xff;
            }
            return;
        }
        actor[0x1e5] = 0xff;
        return;
    }
    actor[0x1e5] = (u8)-6;
}
