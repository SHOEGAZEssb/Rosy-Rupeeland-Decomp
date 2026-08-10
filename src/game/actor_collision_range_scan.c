#include "tingle/actor_motion.h"

/*
 * Directional collision-range scan. It samples one edge of an input rectangle
 * and converts detected spans to aligned 20.12 fixed-point output bounds.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ByteTileMapOwner_GetCell(void *context, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

static s32 collision_align_down_8(s32 value)
{
    return value & ~7;
}

static s32 collision_align_up_8(s32 value)
{
    return ((value >> 3) + 1) << 3;
}

/*
 * Convert input fixed-point bounds to integer coordinates and scan according
 * to direction bit 1, 2, 4, or 8. Horizontal scans test every X at the lower
 * (4) or upper (8) Y edge; vertical scans test every Y at the lower (1) or
 * upper (2) X edge. Successful ActorCollision_TestPoint queries expand the corresponding
 * aligned span. Direction 8 also performs the observed, otherwise-unused
 * height query. All four result words are finally shifted to 20.12 format.
 * Other direction values only scale the caller's existing result words.
 * Collision queries may have context effects; no hardware is touched.
 */
void ActorCollision_ScanDirectionalRange(ActorCollisionRange *result, void *collisionContext,
                   const ActorCollisionRange *input, s32 direction,
                   s32 z, s32 actorHeight)
{
    s32 minX = input->minX >> 12;
    s32 minY = input->minY >> 12;
    s32 maxX = input->maxX >> 12;
    s32 maxY = input->maxY >> 12;
    s32 coordinate;

    switch (direction) {
    case 4:
    case 8: {
        s32 queryY = (direction == 4 ? minY : maxY) >> 4;
        result->minX = 0x7fffffff;
        result->maxX = 0;
        for (coordinate = minX; coordinate <= maxX; ++coordinate) {
            if (direction == 8)
                (void)ByteTileMapOwner_GetCell(collisionContext,
                                    coordinate >> 4, queryY, z);
            if (ActorCollision_TestPoint(collisionContext, coordinate >> 4, queryY,
                              z, actorHeight)) {
                if (coordinate < result->minX)
                    result->minX = collision_align_down_8(coordinate);
                if (coordinate > result->maxX)
                    result->maxX = collision_align_up_8(coordinate);
            }
        }
        if (direction == 4) {
            result->minY = collision_align_down_8(minY);
            result->maxY = collision_align_down_8(minY + 8);
        } else {
            result->minY = collision_align_down_8(maxY);
            result->maxY = collision_align_down_8(maxY + 8);
        }
        break;
    }
    case 1:
    case 2: {
        s32 queryX = (direction == 1 ? minX : maxX) >> 4;
        result->minY = 0x7fffffff;
        result->maxY = 0;
        for (coordinate = minY; coordinate <= maxY; ++coordinate) {
            if (ActorCollision_TestPoint(collisionContext, queryX, coordinate >> 4,
                              z, actorHeight)) {
                if (coordinate < result->minY)
                    result->minY = collision_align_down_8(coordinate);
                if (coordinate > result->maxY)
                    result->maxY = collision_align_up_8(coordinate);
            }
        }
        if (direction == 1) {
            result->minX = collision_align_down_8(minX);
            result->maxX = collision_align_down_8(minX + 8);
        } else {
            result->minX = collision_align_down_8(maxX);
            /* Confirmed retail shift; unlike the other edge it scales by 256. */
            result->maxX = ((maxX + 8) >> 3) << 8;
        }
        break;
    }
    default:
        break;
    }

    result->minX <<= 12;
    result->minY <<= 12;
    result->maxX <<= 12;
    result->maxY <<= 12;
}
