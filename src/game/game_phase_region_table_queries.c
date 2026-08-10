#include "tingle/game_phase_region_table.h"

/* Query points and rectangle-corner relationships in a phase region table. */

/*
 * Return the first region index containing (x,y), or -1. Bounds are left/top
 * inclusive and right/bottom exclusive; table state is unchanged.
 */
s32 GamePhaseRegionTable_FindContainingRegion(
    const GamePhaseRegionTable *self, s32 x, s32 y)
{
    s32 i;
    for (i = 0; i < self->count; i++) {
        if (GamePhaseRegion_ContainsPoint(&self->regions[i], x, y))
            return i;
    }
    return -1;
}

/* Return whether (x,y) lies in region's half-open rectangle; no state changes. */
s32 GamePhaseRegion_ContainsPoint(const GamePhaseRegion *region, s32 x, s32 y)
{
    return x >= region->left && x < region->right &&
           y >= region->top && y < region->bottom;
}

/* Return a pointer to regions[index] without bounds checking or state changes. */
GamePhaseRegion *GamePhaseRegionTable_GetRegion(GamePhaseRegionTable *self,
                                                s32 index)
{
    return &self->regions[index];
}

/*
 * Classify which complete side of candidate has corners inside regions[index]:
 * 0 all four, 1 right, 2 left, 3 bottom, 4 top, or -1 for no recognized full
 * side. Only corner containment is tested; general rectangle overlap is not.
 */
s32 GamePhaseRegionTable_ClassifyContainedSide(
    const GamePhaseRegionTable *self, s32 index,
    const GamePhaseRegion *candidate)
{
    const GamePhaseRegion *region = &self->regions[index];
    s32 topLeft =
        GamePhaseRegion_ContainsPoint(region, candidate->left, candidate->top);
    s32 topRight =
        GamePhaseRegion_ContainsPoint(region, candidate->right, candidate->top);
    s32 bottomLeft =
        GamePhaseRegion_ContainsPoint(region, candidate->left, candidate->bottom);
    s32 bottomRight =
        GamePhaseRegion_ContainsPoint(region, candidate->right, candidate->bottom);
    if (topLeft && topRight && bottomLeft && bottomRight)
        return 0;
    if (!(topLeft && bottomLeft) && topRight && bottomRight)
        return 1;
    if (topLeft && bottomLeft && !(topRight && bottomRight))
        return 2;
    if (!(topLeft && topRight) && bottomLeft && bottomRight)
        return 3;
    if (topLeft && topRight && !(bottomLeft && bottomRight))
        return 4;
    return -1;
}
