#include "tingle/types.h"

/* Overlay 26 progress testing and sine-table orbit control for a scene child. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020948d4(void *, s32);
#ifdef __cplusplus
}
#endif

/* Returns one when progress +0x80 has reached or exceeded target +0x7C, else zero. */
extern "C" s32 func_ov026_02200d08(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

/*
 * Advances angle +0x35C by signed step +0x364 modulo 16 bits, then positions
 * child +0x2E8 on an X/Z circle of radius +0x360 using the SDK sine table.
 * Returns void through the child-control calls.
 */
extern "C" void func_ov026_02200d38(void *scene)
{
    u16 angle = (u16)(FIELD(s32, scene, 0x35c) +
                      FIELD(s32, scene, 0x364));
    FIELD(s32, scene, 0x35c) = angle;
    s32 index = angle >> 4;
    s32 radius = FIELD(s32, scene, 0x360);
    void *child = FIELD(void *, scene, 0x2e8);
    s32 x = (-data_020c9670[index * 2] * radius + 0x800) >> 12;
    s32 z = (data_020c9670[index * 2 + 1] * radius + 0x800) >> 12;
    func_020948d4((u8 *)child + 0xc, x);
    func_020948d4((u8 *)child + 0x2c, z);
}

/*
 * Stores angle +0x35C, radius +0x360, and step +0x364, immediately recomputes
 * child +0x2E8's orbit position, and returns void.
 */
extern "C" void func_ov026_02200d20(void *scene, s32 angle,
                                      s32 radius, s32 step)
{
    FIELD(s32, scene, 0x35c) = angle;
    FIELD(s32, scene, 0x360) = radius;
    FIELD(s32, scene, 0x364) = step;
    func_ov026_02200d38(scene);
}

/*
 * Adds `delta` to orbit step +0x364, clamps it to [-0x100,0x100], recomputes
 * child +0x2E8's orbit position, and returns void.
 */
extern "C" void func_ov026_02200dd8(void *scene, s32 delta)
{
    s32 step = FIELD(s32, scene, 0x364) + delta;
    if (step > 0x100)
        step = 0x100;
    else if (step < -0x100)
        step = -0x100;
    FIELD(s32, scene, 0x364) = step;
    func_ov026_02200d38(scene);
}
