#include "tingle/types.h"

/*
 * Overlay 39 later-scene helper pool and thin subsystem adapters. This group
 * steers the rotating barrier, launches/integrates/renders ten helpers, copies
 * indexed positions, and forwards calls into embedded target/effect systems.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039HelperVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039HelperVector;

extern const s16 data_020c9670[];
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov039_022014f8(void *output, const void *first,
                                const void *second);
extern s32 func_020ae024(s32 y, s32 x);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_Destroy(void *vector);
extern void *func_0201e0ec(void *object);
extern void func_0209c430(void *renderer, ...);
extern void func_ov049_0220c2dc(void *system, void *input, s32 mode);
extern s32 func_ov049_0220c3d8(void *system);
extern s32 func_ov069_022115c0(void *system);
extern s32 func_ov069_02211778(void *system);
#ifdef __cplusplus
}
#endif

static s32 fixedMultiply(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Update angular velocity +0x1CD0 and angle +0x1CCC. Mode zero freezes state;
 * mode one derives the owner bearing around scene +0x2C/+0xAC and accelerates
 * by 30 toward it outside a +/-0x258 dead band. All active modes decay velocity
 * by 15 toward zero, snap values within +/-15, clamp to +/-0x190, and wrap the
 * accumulated angle to 16 bits. No value is returned; only scene state changes.
 */
extern "C" void func_ov039_02203480(void *scene, s32 mode)
{
    if (mode == 0) return;
    s32 &velocity = FIELD(s32, scene, 0x1cd0);
    if (mode == 1) {
        Overlay039HelperVector origin;
        func_ov039_022014f8(&origin, (u8 *)scene + 0x2c,
                            (u8 *)scene + 0xac);
        void *ownerPos = FIELD(void *, FIELD(void *,
            FIELD(void *, scene, 0x48), 8), 0x48);
        s32 bearing = func_020ae024(FIELD(s32, ownerPos, 0x34) - origin.y_08,
                                    -(FIELD(s32, ownerPos, 0x30) - origin.x_04));
        s32 delta = bearing - FIELD(s32, scene, 0x1ccc);
        if (delta > 0x7fff) delta -= 0x10000;
        if (delta < -0x8000) delta += 0x10000;
        if (delta > 0x258) velocity += 30;
        if (delta < -0x258) velocity -= 30;
        VecFx32Object_Destroy(&origin);
    }
    if (velocity < 0) velocity += 15;
    if (velocity > 0) velocity -= 15;
    if (velocity > -15 && velocity < 15) velocity = 0;
    if (velocity > 0x190) velocity = 0x190;
    if (velocity < -0x190) velocity = -0x190;
    FIELD(s32, scene, 0x1ccc) =
        (u16)(FIELD(s32, scene, 0x1ccc) + velocity);
}

/*
 * Find the first of ten helpers whose state +0x18 is four. Place it at source
 * X/Y, derive a direction toward target X/Y (or angle 0xFA0 if both target
 * values are zero), store a 0x1B33-speed trigonometric velocity in +0x10/+0x14,
 * clear state and age, and return immediately. If none is free, do nothing.
 */
extern "C" void func_ov039_022035d4(void *scene, s32 targetX, s32 targetY,
                                     s32 sourceX, s32 sourceY)
{
    for (s32 i = 9; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0x74 + i * 4);
        if (FIELD(s32, helper, 0x18) != 4) continue;
        FIELD(s32, helper, 4) = sourceX;
        FIELD(s32, helper, 8) = sourceY;
        s32 angle = targetX == 0 && targetY == 0
                        ? 0xfa0 : func_020ae024(targetY - sourceY,
                                               targetX - sourceX);
        u32 index = ((u32)angle >> 4) * 2;
        FIELD(s32, helper, 0x10) = fixedMultiply(data_020c9670[index + 1],
                                                 0x1b33);
        FIELD(s32, helper, 0x14) = fixedMultiply(data_020c9670[index], 0x1b33);
        FIELD(s32, helper, 0x18) = FIELD(s32, helper, 0x1c) = 0;
        return;
    }
}

/* Mark every one of the ten later-scene helpers free (state four). */
extern "C" void func_ov039_022036cc(void *scene)
{
    for (s32 i = 9; i >= 0; i--)
        FIELD(s32, FIELD(void *, scene, 0x74 + i * 4), 0x18) = 4;
}

/* Add velocity vector +4/+8 into position vector +4/+8. */
extern "C" void func_ov039_02203770(void *position, const void *velocity)
{
    FIELD(s32, position, 4) += FIELD(s32, velocity, 4);
    FIELD(s32, position, 8) += FIELD(s32, velocity, 8);
}

/*
 * Integrate active (state zero) helpers, increment their age, and recycle them
 * to state four outside X [0x144000,0x2BC000] or Y [0x6E000,0x280000].
 */
extern "C" void func_ov039_022036f0(void *scene)
{
    for (s32 i = 9; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0x74 + i * 4);
        if (FIELD(s32, helper, 0x18) != 0) continue;
        func_ov039_02203770(helper, (u8 *)helper + 0x0c);
        FIELD(s32, helper, 0x1c)++;
        s32 x = FIELD(s32, helper, 4), y = FIELD(s32, helper, 8);
        if (x > 0x2bc000 || x < 0x144000 || y > 0x280000 || y < 0x6e000)
            FIELD(s32, helper, 0x18) = 4;
    }
}

/*
 * Submit every active helper as a resource effect. Position comes from helper
 * +4/+8, scale is 0x1000, and `(age & 6)` selects one of four confirmed size
 * pairs. Renderer bounds are -8/+8 and alpha is 0x7FFF. Temporary vectors and
 * common renderer/resource state change; no value is returned.
 */
extern "C" void func_ov039_02203794(void *scene)
{
    static const s32 sizes[8][2] = {
        {0x18000,0},{0x28000,0x10000},{0x28000,0},{0x38000,0x10000},
        {0x38000,0},{0x48000,0x10000},{0x48000,0},{0x58000,0x10000}
    };
    for (s32 i = 9; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0x74 + i * 4);
        if (FIELD(s32, helper, 0x18) != 0) continue;
        Overlay039HelperVector scale, position;
        s32 bounds[2] = {-8,-8}, packet[2] = {8,8};
        VecFx32Object_InitComponents(&scale, 0x1000, 0x1000, 0x1000);
        VecFx32Object_Init(&position);
        position.x_04 = FIELD(s32, helper, 4);
        position.y_08 = FIELD(s32, helper, 8);
        position.z_0c = 0;
        void *resource = func_0201e0ec((u8 *)FIELD(void *, data_021052fc, 0) +
                                       0x2f7c);
        func_0209c430(resource, &position, &scale, 0, bounds, 0,
                      sizes[FIELD(s32, helper, 0x1c) & 6], 0x7fff, packet);
        VecFx32Object_Destroy(&position);
        VecFx32Object_Destroy(&scale);
    }
}

/* Copy indexed 0x3C-byte record +0x484/+0x488 into result +4/+8 and zero +0xC. */
extern "C" void func_ov039_0220391c(void *scene, s32 index, void *result)
{
    FIELD(s32, result, 4) = FIELD(s32, scene, 0x484 + index * 0x3c);
    FIELD(s32, result, 8) = FIELD(s32, scene, 0x488 + index * 0x3c);
    FIELD(s32, result, 0x0c) = 0;
}

/* Copy indexed 0x10-byte record +0x15A0/+0x15A8 into result and zero result Z. */
extern "C" void func_ov039_02203940(void *scene, s32 index, void *result)
{
    FIELD(s32, result, 4) = FIELD(s32, scene, 0x15a0 + index * 0x10);
    FIELD(s32, result, 8) = FIELD(s32, scene, 0x15a8 + index * 0x10);
    FIELD(s32, result, 0x0c) = 0;
}

/* Forward input to embedded +0x464 target system with mode one. */
extern "C" void func_ov039_02203964(void *scene, void *input)
{
    func_ov049_0220c2dc((u8 *)scene + 0x464, input, 1);
}

/* Return the +0x464 target system's query result. */
extern "C" s32 func_ov039_0220397c(void *scene)
{
    return func_ov049_0220c3d8((u8 *)scene + 0x464);
}

/* Return the first status query for embedded system +0xB3C. */
extern "C" s32 func_ov039_02203990(void *scene)
{
    return func_ov069_022115c0((u8 *)scene + 0xb3c);
}

/* Return the second status query for embedded system +0xB3C. */
extern "C" s32 func_ov039_022039a4(void *scene)
{
    return func_ov069_02211778((u8 *)scene + 0xb3c);
}
