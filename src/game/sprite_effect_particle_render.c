/* Rendering dispatch for resident sprite-effect particles. */

#include "tingle/sprite_effect.h"
#include "tingle/vec_fx32.h"

extern void func_0209c3b4(void *context);
extern void func_0209c430(void *context, const VecFx32Object *position,
                          const VecFx32Object *scale, u16 angle,
                          const s32 *bounds, u32 animation,
                          const s32 *region, u16 color, s32 parameter);
extern void func_0209c614(void *context, const VecFx32Object *position,
                          const VecFx32Object *scale, u16 angle,
                          const s32 *bounds, u32 kind, u16 color,
                          s32 parameter);

/*
 * Submit every active particle through the retail sprite renderer. Modes
 * 0/2/3/4/6/7/8 use rectangular animation regions, while 1/9/10 select the
 * alternate primitive path. Temporary vectors are owned by this call and are
 * destroyed after each synchronous submission.
 */
void func_020a3fc4(SpriteEffectInstance *effect)
{
    VecFx32Object *positions = (VecFx32Object *)effect->positions08;
    s32 mode = effect->mode70;
    s32 index;

    func_0209c3b4(effect->owner00);
    if (mode == 5 || mode < 0 || mode > 10)
        return;

    for (index = (s32)effect->count04 - 1; index >= 0; --index) {
        VecFx32Object position;
        VecFx32Object scale;
        s32 z;

        if (effect->active1c[index] <= 0)
            continue;

        z = positions[index].value.z;
        VecFx32Object_InitComponents(
            &position, positions[index].value.x,
            positions[index].value.y + z,
            (mode == 1 || mode == 9 || mode == 10) ? (-z >> 12) : z);

        if (mode == 2 || mode == 6) {
            VecFx32Object_InitComponents(&scale, effect->field18[index],
                                         effect->field18[index], 0x1000);
        } else if (mode == 3 || mode == 7) {
            s32 animatedScale =
                (s32)(((s64)effect->field18[index] *
                       effect->field28[index] +
                       0x800) >>
                      12);
            VecFx32Object_InitComponents(&scale, animatedScale,
                                         animatedScale, 0x1000);
        } else {
            VecFx32Object_InitComponents(&scale, effect->field18[index],
                                         effect->field18[index],
                                         effect->field18[index]);
        }

        if (mode == 1 || mode == 9 || mode == 10) {
            s32 bounds[2];
            u32 kind;
            u16 color;

            if (mode == 1) {
                bounds[0] = 13;
                bounds[1] = 0;
                kind = 6;
                color = 0x7fff;
            } else if (mode == 9) {
                bounds[0] = -1;
                bounds[1] = 1;
                kind = 2;
                color = effect->alpha52;
            } else {
                bounds[0] = 0;
                bounds[1] = 8;
                kind = 1;
                color = 0x7fff;
            }
            func_0209c614(effect->owner00, &position, &scale,
                          (u16)effect->state10[index], bounds, kind, color,
                          (s16)effect->field50);
        } else {
            s32 bounds[2];
            s32 region[4];
            s32 frame = effect->field20[index];
            s32 cellSize;
            u16 color;

            if (mode == 8) {
                bounds[0] = -4;
                bounds[1] = -4;
                cellSize = 0x8000;
            } else {
                bounds[0] = -8;
                bounds[1] = -8;
                cellSize = (mode == 0) ? 0x10000 : 0x20000;
            }
            region[0] = frame * cellSize;
            region[1] = 0;
            region[2] = (frame + 1) * cellSize;
            region[3] = cellSize;
            color = (mode == 2 || mode == 6) ?
                        (u16)effect->field24[index] :
                        0x7fff;
            func_0209c430(effect->owner00, &position, &scale,
                          (u16)effect->state10[index], bounds,
                          effect->animation48, region, color,
                          (s16)effect->field50);
        }

        VecFx32Object_Destroy(&scale);
        VecFx32Object_Destroy(&position);
    }
}
