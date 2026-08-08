#include "tingle/types.h"

/*
 * Overlay 39 proximity testing and successful-contact resolution. These
 * recovered helpers compare a point to object +0x98 and advance or finish the
 * encounter while resetting projectile/effect and sound state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc40(s32 squaredDistance);
extern void func_ov049_0220c2dc(void *system, void *input, s32 mode);
extern void func_02072b68(void *renderObject, u8 orientation);
extern void func_ov039_021fdb78(void *scene);
extern void func_ov049_0220c67c(void *system);
extern void func_020a63d0(void *object, s32 mode);
extern void func_0205929c(void *context, s32 soundId, s32 parameter);
extern void func_020594ec(void *context, s32 parameter);
extern void func_0205940c(void *context, s32 soundId, s32 parameter);
extern void Sound_Play(void *context, s32 soundId, s32 parameter);
#ifdef __cplusplus
}
#endif

static s32 fixedSquare(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

/*
 * Compare input point +4/+8 with object +0x98 coordinates +0x20/+0x24 using
 * 20.12 fixed-point squared distance and func_020adc40. Return one when the
 * resulting distance is strictly below 0x32000, otherwise zero. No state
 * changes occur beyond any internal math-helper effects.
 */
extern "C" s32 func_ov039_021feda0(void *scene, const void *point)
{
    void *object = FIELD(void *, scene, 0x98);
    s32 dx = FIELD(s32, point, 4) - FIELD(s32, object, 0x20);
    s32 dy = FIELD(s32, point, 8) - FIELD(s32, object, 0x24);
    return func_020adc40(fixedSquare(dx) + fixedSquare(dy)) < 0x32000;
}

/*
 * Update the +0x454 subsystem from input, reject variant two while projectile
 * state +0x1CB8 is zero or one, and otherwise require the proximity test.
 * Success orients +0x98 to 7, enables +0x9C flag 4, orients +0x4C/+0x5C to 1,
 * stores +0x1CAA=30/+0x1CA0=0x1000, subtracts ten from signed count +0x1CA8,
 * and zeros +0x448/+0x1D94/+0x1D98.
 *
 * If count remains positive, owner +0x44/+0x48 become 20/6. At zero, clamp
 * count, set +0x1CAC=0x5A0/+0x1CAE=0, reset all helper states, clear +0x454,
 * set owner status +0x74=0x17, optionally notify the owner chain for variant
 * zero, set owner +0x44/+0x48 to 30/5, and update sound IDs 0x60/8. Common
 * success resets script/projectile/effect indices, stops sound 0x63 variants
 * 7 and 8, plays variant 5, and returns one. Failure returns zero. Scene,
 * owner, render, helper, subsystem, encounter, and sound state may change.
 */
extern "C" s32 func_ov039_021fee00(void *scene, void *input)
{
    func_ov049_0220c2dc((u8 *)scene + 0x454, input, 0);
    if (FIELD(u16, scene, 0x1cb8) <= 1 &&
        FIELD(u16, scene, 0x1cb2) == 2) {
        return 0;
    }
    if (!func_ov039_021feda0(scene, input)) {
        return 0;
    }

    func_02072b68(FIELD(void *, FIELD(void *, scene, 0x98), 0x0c), 7);
    FIELD(u16, FIELD(void *, scene, 0x9c), 0x42) |= 4;
    func_02072b68(FIELD(void *, FIELD(void *, scene, 0x4c), 0x0c), 1);
    func_02072b68(FIELD(void *, FIELD(void *, scene, 0x5c), 0x0c), 1);
    FIELD(u16, scene, 0x1caa) = 30;
    FIELD(u16, scene, 0x1ca0) = 0x1000;
    FIELD(s16, scene, 0x1ca8) -= 10;
    FIELD(s32, scene, 0x448) = 0;
    FIELD(s32, scene, 0x1d98) = 0;
    FIELD(s32, scene, 0x1d94) = 0;

    void *owner = FIELD(void *, scene, 0x48);
    if (FIELD(s16, scene, 0x1ca8) > 0) {
        FIELD(s32, owner, 0x44) = 20;
        FIELD(s32, owner, 0x48) = 6;
    } else {
        FIELD(s16, scene, 0x1ca8) = 0;
        FIELD(u16, scene, 0x1cac) = 0x5a0;
        FIELD(u16, scene, 0x1cae) = 0;
        func_ov039_021fdb78(scene);
        func_ov049_0220c67c((u8 *)scene + 0x454);
        func_02072b68(FIELD(void *, FIELD(void *, scene, 0x98), 0x0c), 7);
        FIELD(s32, owner, 0x74) = 0x17;
        if (FIELD(u16, scene, 0x1cb2) == 0) {
            void *notifyObject = FIELD(void *, FIELD(void *, owner, 0xc4), 0x34);
            func_020a63d0(notifyObject, 1);
        }
        FIELD(s32, owner, 0x44) = 30;
        FIELD(s32, owner, 0x48) = 5;
        func_0205929c(gSoundContext, 0x60, 0);
        func_020594ec(gSoundContext, 8);
    }

    FIELD(u16, scene, 0x1cb4) = 0;
    FIELD(u16, scene, 0x1cb8) = 5;
    FIELD(u16, scene, 0x1cb6) = 0;
    FIELD(u16, scene, 0x1d9c) = 0;
    func_0205940c(gSoundContext, 0x63, 7);
    func_0205940c(gSoundContext, 0x63, 8);
    Sound_Play(gSoundContext, 0x63, 5);
    return 1;
}
