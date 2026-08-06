#include "tingle/types.h"

/*
 * Recovered randomized motion callback for the type-seven actor. It seeds a
 * temporary destination, runs target acquisition, and updates directional
 * motion through the shared motion helper.
 */
extern s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *destination, const void *source);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern s32 func_02033f44(void *actor);
extern s32 func_0204832c(void *actor);
extern s32 func_0204820c(void *actor);
extern s32 func_0204876c(void *actor, s32 finiteMode);
extern void func_02047908(void *actor, const void *transform);
extern void func_02047dd8(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Set flag 0x8000 and clear collision bit
 * +0xd0/2. When signed counter +0x248 is zero, copy +0x214 to temporary
 * transform +0x78, draw a 16-bit direction and a sign-cleared random magnitude
 * modulo 0x80 for record subtype two or 0x18 otherwise, and add the corresponding
 * data_020c9670 direction components directly to +0x7c/+0x80. Save
 * func_02033f44(actor) at +0x84 and null related object +0x210.
 *
 * Try func_0204832c, func_0204820c, and finite-mode func_0204876c in order,
 * returning zero when any succeeds. Otherwise choose the motion destination:
 * copy current transform +0x18 to +0x78 while signed +0x264 is positive, or
 * saved transform +0x224 when flag four is set. Run func_02047908 on +0x78; if
 * both resulting directional words +0x3c/+0x40 are zero, run func_02047dd8.
 * Return zero on every path. Actor random, target, callback, transform, motion,
 * and resource state may change; no direct hardware access occurs.
 */
s32 func_02048fe4(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) &= ~2;

    if (*(s16 *)(actor + 0x248) == 0) {
        u32 direction;
        s32 magnitude;
        s32 modulus;
        s32 index;
        func_020050a4(actor + 0x78, actor + 0x214);
        direction = genrand_int32() & 0xffff;
        modulus = (*(u8 **)(actor + 0x29c))[0x54] == 2 ? 0x80 : 0x18;
        magnitude = func_020ada8c(
            (s32)(genrand_int32() & 0x7fffffff), modulus);
        index = (s32)direction >> 4;
        *(s32 *)(actor + 0x7c) +=
            magnitude * data_020c9670[index * 2 + 1];
        *(s32 *)(actor + 0x80) +=
            magnitude * data_020c9670[index * 2];
        *(s32 *)(actor + 0x84) = func_02033f44(actor);
        *(void **)(actor + 0x210) = 0;
    }
    if (func_0204832c(actor) != 0 || func_0204820c(actor) != 0
        || func_0204876c(actor, 1) != 0)
        return 0;
    if (*(s16 *)(actor + 0x264) > 0)
        func_020050a4(actor + 0x78, actor + 0x18);
    else if ((*(u32 *)(actor + 0x268) & 4) != 0)
        func_020050a4(actor + 0x78, actor + 0x224);
    func_02047908(actor, actor + 0x78);
    if (*(s32 *)(actor + 0x3c) == 0 && *(s32 *)(actor + 0x40) == 0)
        func_02047dd8(actor);
    return 0;
}
