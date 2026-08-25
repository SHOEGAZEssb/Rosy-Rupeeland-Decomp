#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Recovered actor planar-position conversion and inclusive rectangle
 * intersection helpers. Coordinates use the game's signed 20.12 format.
 */

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Initialize destination and convert source into its local planar
 * displacement: copy +4, subtract +0xC from +8, and clear +0xC. The vector
 * constructor owns initialization; no hardware or SDK state is touched.
 */
void VecFx32Object_InitPlanarProjection(void *destination, const void *source)
{
    u8 *result = (u8 *)destination;
    const u8 *value = (const u8 *)source;

    VecFx32Object_Init((VecFx32Object *)destination);
    *(s32 *)(result + 4) = *(const s32 *)(value + 4);
    *(s32 *)(result + 8) =
        *(const s32 *)(value + 8) - *(const s32 *)(value + 0xc);
    *(s32 *)(result + 0xc) = 0;
}

/*
 * Intersect two inclusive left/top/right/bottom rectangles. Write their
 * overlap and edge-origin bit pairs to output storage, returning zero for no
 * overlap, one for edge-only contact, or two for area overlap. Invalid
 * non-overlapping input leaves the intersection storage unchanged.
 */
s32 RectS32_IntersectAndClassifyContact(s32 *intersection,
                                       const s32 *firstBounds,
                                       const s32 *secondBounds,
                                       u32 *contactEdges)
{
    s32 result;
    u32 edges = 0;
    s32 difference;

    *contactEdges = 0;
    if (firstBounds[0] > secondBounds[2])
        return 0;
    if (firstBounds[2] < secondBounds[0])
        return 0;
    if (firstBounds[1] > secondBounds[3])
        return 0;
    if (firstBounds[3] < secondBounds[1])
        return 0;
    if (firstBounds[0] == secondBounds[2])
        result = 1;
    else if (firstBounds[2] == secondBounds[0])
        result = 1;
    else if (firstBounds[1] == secondBounds[3])
        result = 1;
    else if (firstBounds[3] == secondBounds[1])
        result = 1;
    else
        result = 2;

    difference = firstBounds[0] - secondBounds[0];
    if (difference > 0) {
        intersection[0] = firstBounds[0];
        edges |= 0x001;
    } else if (difference < 0) {
        intersection[0] = secondBounds[0];
        edges |= 0x100;
    } else {
        intersection[0] = firstBounds[0];
        edges |= 0x101;
    }
    difference = firstBounds[2] - secondBounds[2];
    if (difference < 0) {
        intersection[2] = firstBounds[2];
        edges |= 0x002;
    } else if (difference > 0) {
        intersection[2] = secondBounds[2];
        edges |= 0x200;
    } else {
        intersection[2] = firstBounds[2];
        edges |= 0x202;
    }
    difference = firstBounds[1] - secondBounds[1];
    if (difference > 0) {
        intersection[1] = firstBounds[1];
        edges |= 0x004;
    } else if (difference < 0) {
        intersection[1] = secondBounds[1];
        edges |= 0x400;
    } else {
        intersection[1] = firstBounds[1];
        edges |= 0x404;
    }
    difference = firstBounds[3] - secondBounds[3];
    if (difference < 0) {
        intersection[3] = firstBounds[3];
        edges |= 0x008;
    } else if (difference > 0) {
        intersection[3] = secondBounds[3];
        edges |= 0x800;
    } else {
        intersection[3] = firstBounds[3];
        edges |= 0x808;
    }
    *contactEdges = edges;
    return result;
}
#ifdef __cplusplus
}
#endif
