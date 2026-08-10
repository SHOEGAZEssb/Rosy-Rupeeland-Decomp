#include "tingle/types.h"

/*
 * Recovered extended type-two actor contact response. These helpers emit a
 * fixed presentation cue and apply separation impulse before base processing.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern s32 func_020405c8(void *actor, s32 first, s32 second, s32 third);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adc90(s32 value, s32 divisor);
extern s32 func_020adae4(s32 value, s32 shift);
extern s32 func_02032a94(void *actor, void *other, s32 context);
#ifdef __cplusplus
}
#endif

/*
 * Clear signed halfword actor +0x280, play sound 0x57 with extra zero, and
 * invoke func_020405c8(actor,0,0x100,20). Its return value is forwarded. Actor,
 * sound, and presentation state may change; the two calls cross engine sound
 * and presentation boundaries.
 */
s32 ActorExtendedType2_TriggerContactFeedback(void *self)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x280) = 0;
    func_020349b8(actor, 0x57, 0);
    return func_020405c8(actor, 0, 0x100, 20);
}

/*
 * For an other object whose type byte +0x4d is two, provided neither object has
 * +0x14 bit 0x10, calculate its fixed-point displacement from actor. When the
 * magnitude exceeds 0x1000, normalize each component with func_020adc90,
 * optionally halve both through func_020adae4 when actor +0xd0 bit 0x10 is set,
 * and subtract them from actor +0x9c/+0xa0. At shorter distance, compare signed
 * layer bytes +0x48 and add +0x1000 or -0x1000 to +0x9c. Always finish by
 * invoking func_02032a94(actor,other,context) and return its result. Actor motion
 * and base contact state may change; no direct SDK or hardware access occurs.
 */
s32 ActorExtendedType2_ApplyContactResponse(void *self, void *otherObject, s32 context)
{
    u8 *actor = (u8 *)self;
    u8 *other = (u8 *)otherObject;
    if (other[0x4d] == 2 &&
        (*(u32 *)(actor + 0x14) & 0x10) == 0 &&
        (*(u32 *)(other + 0x14) & 0x10) == 0) {
        s32 dx = *(s32 *)(other + 0x1c) - *(s32 *)(actor + 0x1c);
        s32 dy = *(s32 *)(other + 0x20) - *(s32 *)(actor + 0x20);
        s32 magnitude = func_0204cfa4(dx, dy);
        if (magnitude > 0x1000) {
            dx = func_020adc90(dx, magnitude);
            dy = func_020adc90(dy, magnitude);
            if ((*(u32 *)(actor + 0xd0) & 0x10) != 0) {
                dx = func_020adae4(dx, 2);
                dy = func_020adae4(dy, 2);
            }
            *(s32 *)(actor + 0x9c) -= dx;
            *(s32 *)(actor + 0xa0) -= dy;
        } else {
            *(s32 *)(actor + 0x9c) +=
                (*(s8 *)(actor + 0x48) < *(s8 *)(other + 0x48)) ? -0x1000 : 0x1000;
        }
    }
    return func_02032a94(actor, other, context);
}
