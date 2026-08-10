#include "tingle/types.h"

/* Synchronize attachment byte 0x3a with terrain height and a nearby actor. */
typedef struct LayerQueryVTable {
    u8 field_00[0x2c];
    u32 (*query_2c)(void *, s32, s32);
} LayerQueryVTable;

typedef struct LayerQueryObject {
    LayerQueryVTable *vtable_00;
} LayerQueryObject;

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern s32 func_020be334(s32);
#ifdef __cplusplus
}
#endif

/*
 * Require config 0x54, either attachment 0x58 or actor flag 0x04, and no actor
 * flag 0x80. Query global object 0x2ed4 at integer X/Y; compare actor Z with
 * the sign-extended low five query bits to set config byte 0x3a to one or two.
 * Non-type-one actors then compare that byte with the context-one actor's
 * config byte. When Z ordering agrees, horizontal separation is below 30,
 * and vertical separation lies in (0,60) or (-40,0), copy the peer byte.
 * Returns no value; the virtual terrain query may observe world state.
 */
void func_02031564(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *config = *(u8 **)(actor + 0x54);
    u8 *peer;
    u8 *peerConfig;
    LayerQueryObject *query;
    u32 queryResult;
    s32 queryHeight;
    s32 dx;
    s32 dy;

    if (!config)
        return;
    if (!*(void **)(actor + 0x58) && !(*(u32 *)(actor + 0x10) & 4))
        return;
    if (*(u32 *)(actor + 0x14) & 0x80)
        return;
    query = *(LayerQueryObject **)((u8 *)data_021052fc + 0x2ed4);
    queryResult = query->vtable_00->query_2c(
        query, *(s32 *)(actor + 0x1c) >> 16,
        *(s32 *)(actor + 0x20) >> 16);
    queryHeight = (s32)(queryResult << 27) >> 27;
    config[0x3a] = *(s32 *)(actor + 0x24) < (queryHeight << 16) ? 2 : 1;
    if (actor[0x4d] == 1)
        return;

    peer = *(u8 **)((u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1) + 0x2e7c);
    if (func_020be334(0) >= 0x2000)
        return;
    peerConfig = *(u8 **)(peer + 0x54);
    if (config[0x3a] < peerConfig[0x3a]) {
        if (*(s32 *)(peer + 0x24) < *(s32 *)(actor + 0x24))
            return;
        dx = *(s16 *)(peerConfig + 0x2c) - *(s16 *)(config + 0x2c);
        dy = *(s16 *)(peerConfig + 0x2e) - *(s16 *)(config + 0x2e);
        if (func_020be334(dx) < 30 && dy > 0 && dy < 60)
            config[0x3a] = peerConfig[0x3a];
    } else if (config[0x3a] > peerConfig[0x3a]) {
        if (*(s32 *)(peer + 0x24) > *(s32 *)(actor + 0x24))
            return;
        dx = *(s16 *)(peerConfig + 0x2c) - *(s16 *)(config + 0x2c);
        dy = *(s16 *)(peerConfig + 0x2e) - *(s16 *)(config + 0x2e);
        if (func_020be334(dx) < 30 && dy < 0 && dy > -40)
            config[0x3a] = peerConfig[0x3a];
    }
}
