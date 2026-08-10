#include "tingle/types.h"

/* Resolve an actor's collection and refresh its cached terrain-height state. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02007f0c(void *manager, u32 slot);
extern s32 func_0200eb14(void *terrain, s32 x, s32 y);
extern u32 func_02034464(void *actor, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Resolve the actor collection from the global manager. Actor flag 0x04000000
 * at +0x14 selects slot two; otherwise slot one is used. Returns the manager
 * lookup result and does not directly change actor or hardware state.
 */
void *func_020337d4(void *self)
{
    u8 *actor = (u8 *)self;
    u32 slot = (*(u32 *)(actor + 0x14) & 0x04000000) != 0 ? 2 : 1;

    return func_02007f0c(data_021052fc, slot);
}

/*
 * Resolve an explicitly supplied manager slot. The first argument is confirmed
 * unused by the retail forwarding stub; the second is passed to the global
 * manager lookup. Returns that lookup result with no direct state changes.
 */
void *Actor_GetCollectionBySlot(void *unused, u32 slot)
{
    (void)unused;
    return func_02007f0c(data_021052fc, slot);
}

/*
 * Refresh cached height actor+0x1dc from the global terrain context using
 * actor X/Y at +0x1c/+0x20 shifted by 16. Flag 0x04000000 disables the query
 * and clears the cache. For terrain class bits 5..9 equal to 15, a four-unit
 * ledge adjustment is accepted when it does not exceed actor Z at +0x24;
 * actor flag 0x02000000 at +0x10 records the rejected-above-Z case. Other
 * classes clear that flag. The chosen integer height is stored shifted by 16.
 * Returns no value; the terrain helpers read global map/SDK-managed state.
 */
void Actor_RefreshTerrainHeight(void *self)
{
    u8 *actor = (u8 *)self;
    s32 x;
    s32 y;
    s32 height;
    u32 terrainClass;

    if ((*(u32 *)(actor + 0x14) & 0x04000000) != 0) {
        *(s32 *)(actor + 0x1dc) = 0;
        return;
    }

    x = *(s32 *)(actor + 0x1c) >> 16;
    y = *(s32 *)(actor + 0x20) >> 16;
    height = func_0200eb14((u8 *)data_021052fc + 0x24, x, y);
    terrainClass = func_02034464(actor, x, y);

    if (((terrainClass >> 5) & 0x1f) == 15) {
        if (height + 4 <= (*(s32 *)(actor + 0x24) >> 16)) {
            height += 4;
            *(u32 *)(actor + 0x10) &= ~0x02000000;
        } else {
            *(u32 *)(actor + 0x10) |= 0x02000000;
        }
    } else {
        *(u32 *)(actor + 0x10) &= ~0x02000000;
    }
    *(s32 *)(actor + 0x1dc) = height << 16;
}
