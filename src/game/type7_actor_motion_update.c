#include "tingle/types.h"

/*
 * Recovered type-seven drag initialization and motion update helpers. They
 * retain a requested transform, derive directional motion, and select animation
 * states from actor flags and callback representations.
 */
extern u8 data_020e16b0[];
extern u8 data_020e1718[];
extern u8 data_020e1770[];
extern u8 data_020e1700[];
extern s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *destination, const void *source);
extern void func_020066a4(void *output, const void *first, const void *second);
extern void func_02005058(void *value);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_02046d8c(const void *actor);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/* Multiply signed 20.12 fixed-point values using the retail +0x800 rounding. */
static s32 multiply_fx_round(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Test an offset-derived callback pair whose semantic identity is unconfirmed. */
static s32 callback_pair_matches(const u8 *actor, void *first, void *second)
{
    void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/*
 * Inputs are an actor and transform. Copy the transform to actor +0x224, set
 * flag four at +0x268, and set signed timer +0x250 to 180. The copy helper may
 * update transform-owned state; this routine has no return or hardware effect.
 */
void func_020478b0(void *self, const void *transform)
{
    u8 *actor = (u8 *)self;
    func_020050a4(actor + 0x224, transform);
    *(u32 *)(actor + 0x268) |= 4;
    *(u16 *)(actor + 0x250) = 180;
}

/*
 * Inputs are actor, transform, and timer. Set flags four and eight, copy the
 * transform to +0x224, and store the timer at +0x250. No value is returned and
 * no SDK or hardware service is called directly.
 */
void func_020478dc(void *self, const void *transform, s32 timer)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x0c;
    func_020050a4(actor + 0x224, transform);
    *(u16 *)(actor + 0x250) = (u16)timer;
}

/*
 * Inputs are actor and requested transform. Copy the request to actor +0x78
 * and compute its planar displacement from +0x18. Above magnitude 0x4000,
 * derive speed from +0x238/+0x23c, collision flag +0xd0 bit two, subtype byte
 * record+0x54, timer +0x2a4, several offset-derived callback pairs, and target
 * separation. The data_020e16b0+0x68/data_020e1718 pair can boost speed after
 * 40 ticks when its target is farther than 0x40000, setting flag 0x400000 past
 * 0x46000. Flag +0x268 bit two doubles speed; actor flag +0x14 bit 0x40 divides
 * it by ten. Convert the displacement angle through data_020c9670 and store
 * directional components at +0x3c/+0x40 and speed at +0x240. When +0x246 is
 * zero, add one sixty-fourth of those components to +0x8c/+0x90.
 *
 * At or below the threshold, clear the directional fields and select animation
 * one, eight, or ten from current velocity and collision state. Falling below
 * actor +0x1dc selects animation eleven unless flag +0x14 bit 0x40 is set. If
 * collision flag +0xd0 bit four is set and virtual callback +0x30 accepts the
 * actor, clear motion +0x8c/+0x90/+0x94 and select animation eight. The copied
 * displacement temporary is finalized. Actor transform, velocity, flags, and
 * animation state change; no direct hardware access occurs.
 */
void func_02047908(void *self, const void *requestedTransform)
{
    u8 *actor = (u8 *)self;
    u32 displacement[4];
    s32 magnitude;
    s32 speed = 0;
    s32 componentX;
    s32 componentY;
    s32 angle;

    func_020050a4(actor + 0x78, requestedTransform);
    func_020066a4(displacement, actor + 0x78, actor + 0x18);
    magnitude = func_0204cfa4((s32)displacement[1], (s32)displacement[2]);
    if (magnitude > 0x4000) {
        if ((*(u32 *)(actor + 0xd0) & 2) != 0) {
            if (func_02046d8c(actor) != 0) {
                u8 subtype = (*(u8 **)(actor + 0x29c))[0x54];
                if (subtype == 1)
                    speed = multiply_fx_round(*(s32 *)(actor + 0x23c), 0x1800);
                else if (subtype == 0)
                    speed = multiply_fx_round(*(s32 *)(actor + 0x23c), 0x1400);
                else if (*(u16 *)(actor + 0x2a4) == 0)
                    speed = *(s32 *)(actor + 0x23c);
                else
                    speed = multiply_fx_round(*(s32 *)(actor + 0x23c),
                        0x1000 + 0x18 * *(u16 *)(actor + 0x2a4));
            } else if (callback_pair_matches(
                           actor, *(void **)(data_020e16b0 + 0x68),
                           *(void **)(data_020e1718 + 4))) {
                u8 *target = *(u8 **)(actor + 0x280);
                if (target != 0) {
                    s32 separation = func_0204cfa4(
                        *(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c),
                        *(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20));
                    if (*(s16 *)(actor + 0x248) > 40 && separation > 0x40000) {
                        s32 coefficient = (*(u8 **)(actor + 0x29c))[0x54] == 2
                            ? 0x1400 : 0x159a;
                        speed = multiply_fx_round(*(s32 *)(actor + 0x23c),
                                                  coefficient);
                        if (separation > 0x46000)
                            *(u32 *)(actor + 0x268) |= 0x400000;
                    } else {
                        speed = *(s32 *)(actor + 0x23c);
                    }
                } else {
                    speed = *(s32 *)(actor + 0x23c);
                }
            } else if (callback_pair_matches(
                           actor, *(void **)(data_020e16b0 + 0xc0),
                           *(void **)(data_020e1770 + 4))
                       && (*(u8 **)(actor + 0x29c))[0x54] == 1) {
                speed = multiply_fx_round(*(s32 *)(actor + 0x23c), 0x1800);
            } else {
                speed = *(s32 *)(actor + 0x23c);
            }
            *(u16 *)(actor + 0xd6) = 10;
        } else {
            speed = *(s32 *)(actor + 0x238);
            *(u16 *)(actor + 0xd6) = callback_pair_matches(
                actor, *(void **)(data_020e16b0 + 0x50),
                *(void **)(data_020e1700 + 4)) ? 9 : 8;
        }
        if ((*(u32 *)(actor + 0x268) & 2) != 0)
            speed <<= 1;
        if ((*(u32 *)(actor + 0x14) & 0x40) != 0)
            speed = func_020adae4(speed, 10);
        angle = func_020ae024((s32)displacement[2], (s32)displacement[1]) >> 4;
        componentX = (speed * data_020c9670[angle * 2 + 1]) >> 12;
        componentY = (speed * data_020c9670[angle * 2]) >> 12;
        *(s32 *)(actor + 0x3c) = componentX;
        *(s32 *)(actor + 0x40) = componentY;
        *(s32 *)(actor + 0x240) = speed;
        if (*(s16 *)(actor + 0x246) == 0) {
            *(s32 *)(actor + 0x8c) += func_020adae4(componentX, 0x40);
            *(s32 *)(actor + 0x90) += func_020adae4(componentY, 0x40);
        }
    } else {
        s32 velocity = func_0204cfa4(*(s32 *)(actor + 0x8c),
                                     *(s32 *)(actor + 0x90));
        if (velocity > 0x19a)
            *(u16 *)(actor + 0xd6) =
                (*(u32 *)(actor + 0xd0) & 2) != 0 ? 10 : 8;
        else
            *(u16 *)(actor + 0xd6) = 1;
        *(s32 *)(actor + 0x40) = 0;
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x240) = 0;
    }

    if ((*(u32 *)(actor + 0x14) & 0x40) == 0
        && *(s32 *)(actor + 0x1dc) < *(s32 *)(actor + 0x24))
        *(u16 *)(actor + 0xd6) = 11;
    if ((*(u32 *)(actor + 0xd0) & 4) != 0) {
        typedef s32 (*ActorCallback)(void *actor);
        ActorCallback callback = *(ActorCallback *)(*(u8 **)actor + 0x30);
        if (callback(actor) != 0) {
            *(s32 *)(actor + 0x94) = 0;
            *(s32 *)(actor + 0x90) = 0;
            *(s32 *)(actor + 0x8c) = 0;
            *(u16 *)(actor + 0xd6) = 8;
        }
    }
    func_02005058(displacement);
}
