#include "tingle/game_phase_area_scene.h"
#include "tingle/game_phase_region_table.h"

/* Register known regions and expose renderer/overlay helpers for an area scene. */

#ifdef __cplusplus
extern "C" {
#endif
extern void DualLayerTileRenderer_FillTileRectangle(void *renderer, s32 enabled,
                          s32 left, s32 top, s32 right, s32 bottom,
                          s32 value);
#ifdef __cplusplus
}
#endif

static s32 halfCoordinate(s16 value)
{
    return value < 0 ? -(-(s32)value / 2) : value / 2;
}

/*
 * If a sub-renderer exists, iterate every region whose bound GameWork flag is
 * set and register its halved bounds through DualLayerTileRenderer_FillTileRectangle with enabled=1 and
 * trailing value zero. The region table is unchanged; renderer state changes.
 */
void GamePhaseAreaScene_RegisterEnabledRegions(
    GamePhaseAreaScene *self, GamePhaseRegionTable *table)
{
    s32 i;
    if (!self->subRenderer)
        return;
    for (i = 0; i < GamePhaseRegionTable_GetCount(table); i++) {
        if (GamePhaseRegionTable_IsRegionEnabled(table, i)) {
            GamePhaseRegion *region = GamePhaseRegionTable_GetRegion(table, i);
            DualLayerTileRenderer_FillTileRectangle(self->subRenderer, 1,
                          halfCoordinate(region->left),
                          halfCoordinate(region->top),
                          halfCoordinate(region->right),
                          halfCoordinate(region->bottom), 0);
        }
    }
}

/* Return subRenderer field 0x20's low halfword scaled by 16, or zero. */
s32 GamePhaseAreaScene_GetSubRendererLowCoordinate(GamePhaseAreaScene *self)
{
    if (!self->subRenderer)
        return 0;
    return (*(u32 *)((u8 *)self->subRenderer + 0x20) & 0xffff) << 4;
}

/* Return subRenderer field 0x20's high halfword scaled by 16, or zero. */
s32 GamePhaseAreaScene_GetSubRendererHighCoordinate(GamePhaseAreaScene *self)
{
    if (!self->subRenderer)
        return 0;
    return (*(u32 *)((u8 *)self->subRenderer + 0x20) >> 16) << 4;
}

/*
 * Retain overlayObject. A nonnull object also selects sub BG0/BG1 priorities
 * 3/2; null performs no hardware writes.
 */
void GamePhaseAreaScene_SetOverlayObject(GamePhaseAreaScene *self,
                                         void *overlayObject)
{
    volatile u16 *subBg0 = (volatile u16 *)0x0400100c;
    self->overlayObject = overlayObject;
    if (!overlayObject)
        return;
    *subBg0 = (u16)((*subBg0 & ~3) | 3);
    subBg0[1] = (u16)((subBg0[1] & ~3) | 2);
}
