#include "tingle/types.h"

/* Produce a type-1 actor contact position with a guarded adjacent-cell correction. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *value);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Increment actor signed halfword +0x24c. Normally copy position +0x18 to
 * output. When record byte +0x4d equals seven, copy through a temporary; in
 * actor states one or two, test the adjacent X cell in the record's direction.
 * If its terrain height (cell result <<16) equals Actor_GetCachedTerrainHeight, replace the
 * temporary X with that cell coordinate and add 0xf000 for positive movement.
 * Copy the temporary to output and destroy it. Returns no value; vector copy/
 * teardown may maintain SDK object state, while terrain queries are read-only.
 */
void ActorDerivedType1_BuildContactPosition(void *output, void *self, const void *recordValue)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)recordValue;

    ++*(s16 *)(actor + 0x24c);
    if (record[0x4d] == 7) {
        s32 temporary[4];
        VecFx32Object_InitCopy(temporary, actor + 0x18);
        if (*(s16 *)(actor + 0xd6) == 1 ||
            *(s16 *)(actor + 0xd6) == 2) {
            s32 direction = *(s32 *)(record + 0x1c) >
                            *(s32 *)(actor + 0x1c) ? 1 : -1;
            s32 cellX = (*(s32 *)(actor + 0x1c) >> 16) + direction;
            s32 height = Actor_QueryTerrainHeight(actor, cellX,
                                      *(s32 *)(actor + 0x20) >> 16) << 4;
            if (Actor_GetCachedTerrainHeight(actor) == (height << 12)) {
                temporary[1] = cellX << 16;
                if (direction > 0)
                    temporary[1] += 0xf000;
            }
        }
        VecFx32Object_InitCopy(output, temporary);
        VecFx32Object_Destroy(temporary);
    } else {
        VecFx32Object_InitCopy(output, actor + 0x18);
    }
}
