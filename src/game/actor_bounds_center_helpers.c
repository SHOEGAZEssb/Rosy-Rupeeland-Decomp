#include "tingle/types.h"

/* Construct bounds-center snapshots and reposition signed-byte actor bounds. */
typedef struct BoundsCenterSnapshot {
    const void *vtable_00;
    s8 centerX_04;
    s8 centerY_05;
} BoundsCenterSnapshot;

extern u8 data_020df030[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorBounds_GetHeight(const s8 *bounds);
#ifdef __cplusplus
}
#endif

/* Empty recovered lifecycle hook; ignores self and returns no value. */
void func_02033734(void *self)
{
    (void)self;
}

/*
 * Initialize a center snapshot with vtable data_020df030 and the midpoint of
 * signed-byte bounds minX/minY/maxX/maxY. Each extent is first truncated to
 * s8 and division by two rounds toward zero. Returns no value and touches no
 * hardware or SDK state.
 */
void BoundsCenterSnapshot_Init(BoundsCenterSnapshot *self, const s8 *bounds)
{
    s8 width;
    s8 height;

    self->vtable_00 = data_020df030;
    self->centerX_04 = 0;
    self->centerY_05 = 0;
    width = (s8)(bounds[2] - bounds[0]);
    height = (s8)(bounds[3] - bounds[1]);
    self->centerX_04 = bounds[0] + width / 2;
    self->centerY_05 = bounds[1] + height / 2;
}

/* Empty recovered snapshot lifecycle hook; ignores self and returns no value. */
void func_02033794(BoundsCenterSnapshot *self)
{
    (void)self;
}

/*
 * Move signed-byte bounds to the supplied minimum X/Y while preserving their
 * previously truncated width and height. Returns no value; byte arithmetic
 * wraps exactly as stored and no hardware or SDK state is touched.
 */
void ActorBounds_SetMinimum(s8 *bounds, s32 minX, s32 minY)
{
    s8 width = (s8)(bounds[2] - bounds[0]);
    s8 height;

    bounds[0] = (s8)minX;
    bounds[2] = (s8)(minX + width);
    height = (s8)ActorBounds_GetHeight(bounds);
    bounds[1] = (s8)minY;
    bounds[3] = (s8)(minY + height);
}
