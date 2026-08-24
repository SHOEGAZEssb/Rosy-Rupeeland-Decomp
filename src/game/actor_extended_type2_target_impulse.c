#include "tingle/types.h"

/* Apply a descriptor-scaled radial impulse toward a supplied target position. */
extern u8 data_020e8380[];
extern s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32_Subtract(void *output, const void *first, const void *second);
extern s32 Fx32Vector2_Magnitude(s32 x, s32 y);
extern s32 func_020ae024(s32 y, s32 x);
extern void Fx32Vector2_LimitMagnitude(s32 *x, s32 *y, s32 maximum);
extern void VecFx32Object_Destroy(void *vector);
#ifdef __cplusplus
}
#endif

/* Multiply with the retail fixed-point rounding step. */
static s32 multiplyFxRound(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Copy target into actor vector +0x78 and construct its displacement from actor
 * position +0x18. When planar distance exceeds 0x4000, decode descriptor
 * halfword +0x1e bits two and above: values zero, one, and all others select
 * magnitudes 0x2000, 0x1000, and 0x800. Store 0x100 at actor +0xde, project the
 * magnitude through gFx32CosSinTable toward the target, add it to +0x8c/+0x90,
 * clamp both to 0x6000, and clear desired motion +0x3c/+0x40. Finally, when
 * +0xd0 bit four is set and virtual +0x30 returns nonzero, clear +0x8c/+0x90/
 * +0x94. Destroy the temporary displacement. Returns no value; target, motion,
 * virtual, and temporary-vector state change.
 */
void ActorExtendedType2_ApplyTargetImpulse(void *self, const void *target)
{
    u8 *actor = (u8 *)self;
    s32 displacement[4];

    VecFx32Object_Assign(actor + 0x78, target);
    VecFx32_Subtract(displacement, actor + 0x78, actor + 0x18);
    if (Fx32Vector2_Magnitude(displacement[1], displacement[2]) > 0x4000) {
        u8 *record = data_020e8380 + *(u16 *)(actor + 0x4e) * 0x30;
        u32 kind = *(u16 *)(record + 0x1e) >> 2;
        s32 magnitude = kind == 0 ? 0x2000 : kind == 1 ? 0x1000 : 0x800;
        s32 angle;

        *(u16 *)(actor + 0xde) = 0x100;
        angle = func_020ae024(displacement[2], displacement[1]) >> 4;
        *(s32 *)(actor + 0x8c) +=
            multiplyFxRound(gFx32CosSinTable[angle * 2 + 1], magnitude);
        *(s32 *)(actor + 0x90) +=
            multiplyFxRound(gFx32CosSinTable[angle * 2], magnitude);
        Fx32Vector2_LimitMagnitude((s32 *)(actor + 0x8c),
                      (s32 *)(actor + 0x90), 0x6000);
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
    }
    if ((*(u32 *)(actor + 0xd0) & 4) != 0 &&
        (*(s32 (**)(void *))(*(u8 **)actor + 0x30))(actor) != 0) {
        *(s32 *)(actor + 0x8c) = 0;
        *(s32 *)(actor + 0x90) = 0;
        *(s32 *)(actor + 0x94) = 0;
    }
    VecFx32Object_Destroy(displacement);
}
