#include "tingle/types.h"

/* Build actor collision centers and fixed-point world-space rectangles. */
typedef struct CollisionVector {
    s32 word[4];
} CollisionVector;

typedef struct CollisionShapeActor {
    u8 field_00[8];
    s8 minX_08;
    s8 minY_09;
    s8 maxX_0a;
    s8 maxY_0b;
    u8 field_0c[0x0c];
    CollisionVector position_18;
} CollisionShapeActor;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(CollisionVector *);
extern void VecFx32Object_InitComponents(CollisionVector *, s32, s32, s32);
extern void VecFx32Object_Destroy(CollisionVector *);
extern void VecFx32Object_Assign(CollisionVector *, const CollisionVector *);
extern s32 func_020adae4(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize output and place it at the center of actor bounds 0x08-0x0b,
 * relative to position 0x18. If either signed-byte width or height truncates
 * to zero, copy position directly. The center calculation uses func_020adae4
 * with divisor two and 20.12 scaling. Returns no value; temporary vector value
 * construction/destruction may use SDK helpers but touches no hardware.
 */
void Actor_GetCollisionCenter(CollisionVector *output,
                              CollisionShapeActor *actor)
{
    s8 width;
    s8 height;

    VecFx32Object_Init(output);
    width = (s8)(actor->maxX_0a - actor->minX_08);
    height = (s8)(actor->maxY_0b - actor->minY_09);
    if (!width || !height) {
        VecFx32Object_Assign(output, &actor->position_18);
    } else {
        CollisionVector center;
        s32 x = func_020adae4(width, 2) + actor->minX_08;
        s32 y = func_020adae4(height, 2) + actor->minY_09;

        VecFx32Object_InitComponents(&center, actor->position_18.word[1] + (x << 12),
                      actor->position_18.word[2] + (y << 12),
                      actor->position_18.word[3]);
        VecFx32Object_Assign(output, &center);
        VecFx32Object_Destroy(&center);
    }
}

/*
 * Convert actor signed-byte bounds 0x08-0x0b to 20.12 values and translate
 * both X edges by transform offset 0x04 and both Y edges by offset 0x08.
 * Store minX/minY/maxX/maxY in output and return no value.
 */
void Actor_BuildCollisionRect(s32 output[4], const CollisionShapeActor *actor,
                              const CollisionVector *transform)
{
    output[0] = ((s32)actor->minX_08 << 12) + transform->word[1];
    output[1] = ((s32)actor->minY_09 << 12) + transform->word[2];
    output[2] = ((s32)actor->maxX_0a << 12) + transform->word[1];
    output[3] = ((s32)actor->maxY_0b << 12) + transform->word[2];
}
