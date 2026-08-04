#include "tingle/game_phase_area_scene.h"
#include "tingle/game_phase_region_table.h"

/* Register known regions and expose renderer/overlay helpers for an area scene. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02029bfc(void *renderer, s32 enabled,
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
 * set and register its halved bounds through func_02029bfc with enabled=1 and
 * trailing value zero. The region table is unchanged; renderer state changes.
 */
void func_02012444(GamePhaseAreaScene *self, void *tablePointer)
{
    GamePhaseRegionTable *table = (GamePhaseRegionTable *)tablePointer;
    s32 i;
    if (!self->subRenderer_04)
        return;
    for (i = 0; i < func_02011a3c(table); i++) {
        if (func_020119c8(table, i)) {
            GamePhaseRegion *region = func_02011788(table, i);
            func_02029bfc(self->subRenderer_04, 1,
                          halfCoordinate(region->left),
                          halfCoordinate(region->top),
                          halfCoordinate(region->right),
                          halfCoordinate(region->bottom), 0);
        }
    }
}

/* Return subRenderer_04 field 0x20's low halfword scaled by 16, or zero. */
s32 func_020124f0(GamePhaseAreaScene *self)
{
    if (!self->subRenderer_04)
        return 0;
    return (*(u32 *)((u8 *)self->subRenderer_04 + 0x20) & 0xffff) << 4;
}

/* Return subRenderer_04 field 0x20's high halfword scaled by 16, or zero. */
s32 func_0201250c(GamePhaseAreaScene *self)
{
    if (!self->subRenderer_04)
        return 0;
    return (*(u32 *)((u8 *)self->subRenderer_04 + 0x20) >> 16) << 4;
}

/*
 * Store overlayObject at field_2ed0. A nonnull object also selects sub BG0/BG1
 * priorities 3/2; null performs no hardware writes.
 */
void func_02012528(GamePhaseAreaScene *self, void *overlayObject)
{
    volatile u16 *subBg0 = (volatile u16 *)0x0400100c;
    self->field_2ed0 = (u32)overlayObject;
    if (!overlayObject)
        return;
    *subBg0 = (u16)((*subBg0 & ~3) | 3);
    subBg0[1] = (u16)((subBg0[1] & ~3) | 2);
}
