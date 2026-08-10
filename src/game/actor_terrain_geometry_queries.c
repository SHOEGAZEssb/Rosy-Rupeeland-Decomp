#include "tingle/types.h"

/* Build actor rectangles and query or adjust terrain-relative coordinates. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GamePhaseState_QueryTerrainHeight(void *terrain, s32 x, s32 y);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern u32 Actor_QueryTerrainCell(void *actor, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Convert actor s16 bounds +0x70/+0x72/+0x74/+0x76 to 20.12 and translate
 * both X edges by vector+4 and both Y edges by vector+8. Write four s32 edges
 * to output and return no value; no hardware or SDK state is touched.
 */
void Actor_BuildWorldInteractionBounds(s32 output[4], const void *self,
                                       const void *position)
{
    const u8 *actor = (const u8 *)self;
    const u8 *vector = (const u8 *)position;
    s32 x = *(s32 *)(vector + 4);
    s32 y = *(s32 *)(vector + 8);

    output[0] = (*(s16 *)(actor + 0x70) << 12) + x;
    output[1] = (*(s16 *)(actor + 0x72) << 12) + y;
    output[2] = (*(s16 *)(actor + 0x74) << 12) + x;
    output[3] = (*(s16 *)(actor + 0x76) << 12) + y;
}

/*
 * Return zero when actor flag 0x04000000 is set. Otherwise query integer terrain
 * height at x/y. If terrain class bits 5..9 equal 15 and height+4 does not
 * exceed actor Z +0x24 shifted by 16, return height+4; otherwise return the base
 * height. Terrain helpers read global map/SDK-managed state.
 */
s32 Actor_QueryTerrainHeight(void *self, s32 x, s32 y)
{
    u8 *actor = (u8 *)self;
    s32 height;

    if ((*(u32 *)(actor + 0x14) & 0x04000000) != 0) return 0;
    height = GamePhaseState_QueryTerrainHeight((u8 *)data_021052fc + 0x24, x, y);
    if (((Actor_QueryTerrainCell(actor, x, y) >> 5) & 0x1f) == 15 &&
        height + 4 <= (*(s32 *)(actor + 0x24) >> 16)) {
        height += 4;
    }
    return height;
}

/*
 * Return zero when actor flag 0x04000000 is set. Otherwise invoke vtable slot
 * 0x2c of the global terrain object at manager offset 0x2ed4 with actor x/y and
 * a zero fourth argument, returning its packed terrain result. The callback may
 * read SDK-managed map state but actor fields are unchanged.
 */
u32 Actor_QueryTerrainCell(void *self, s32 x, s32 y)
{
    u8 *actor = (u8 *)self;
    void *terrain;
    u32 (*query)(void *, s32, s32, s32);

    if ((*(u32 *)(actor + 0x14) & 0x04000000) != 0) return 0;
    terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
    query = *(u32 (**)(void *, s32, s32, s32))(*(u8 **)terrain + 0x2c);
    return query(terrain, x, y, 0);
}

/*
 * Convert vector X/Y +4/+8 from 20.12 to 16-unit grid coordinates, then scan
 * downward from the terrain object's recovered vertical limit. When grid Y
 * equals scan-level minus the queried terrain height, add height in 16.16 form
 * to vector Y and store the same 16.16 value at vector Z +0x0c. If no level
 * matches, leave the vector unchanged. Returns no value; global terrain is read.
 */
void Position_AdjustForTerrainHeight(void *value)
{
    u8 *vector = (u8 *)value;
    s32 gridX = func_020adae4(*(s32 *)(vector + 4) >> 12, 16);
    s32 gridY = func_020adae4(*(s32 *)(vector + 8) >> 12, 16);
    void *terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
    s32 level = func_020adae4((*(u32 *)((u8 *)terrain + 0x20) >> 16) << 4,
                              16) - 1;

    while (level >= 0) {
        s32 height = GamePhaseState_QueryTerrainHeight((u8 *)data_021052fc + 0x24,
                                   gridX, gridY);
        if (gridY == level - height) {
            s32 adjustment = height << 16;
            *(s32 *)(vector + 8) += adjustment;
            *(s32 *)(vector + 0x0c) = adjustment;
            return;
        }
        --level;
    }
}
