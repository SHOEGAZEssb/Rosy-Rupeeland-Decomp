#include "tingle/types.h"

/* Advance extended type-two actor callbacks, motion, targeting, and presentation. */
extern u8 *data_021052fc;
extern u8 data_020df9e8[];
extern u8 data_020dfb08[];
extern u8 data_020dfaf0[];
extern u8 data_020dfa40[];
extern u8 data_020dfb78[];
extern u8 data_020dfaf8[];
extern u8 data_020dfa48[];
extern u16 data_020e6f94[];
extern u8 data_020e8380[];
extern s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void **func_02007f0c(void *runtime, s32 collection);
extern void func_02045184(void *handle, void *actor);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void func_02033ed0(void *actor);
extern s32 func_02032370(void *actor, const void *target, s32 step);
extern s32 func_02032228(void *actor, s32 x, s32 y, s32 step);
extern void func_020066a4(void *output, ...);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020ae024(s32 y, s32 x);
extern void func_0204cff4(s32 *x, s32 *y, s32 maximum);
extern void func_02005058(void *vector);
extern void func_0203bba4(void *actor);
extern void Actor_UpdateAnimationState(void *actor);
extern void func_02035518(void *owner, s32 enabled);
extern void func_0204cf28(void *owner);
extern void func_0204ced8(void *owner, u32 animation);
#ifdef __cplusplus
}
#endif

/* Test the recurring recovered two-word callback/state encoding. */
static s32 pairMatches(u32 first, u32 second,
                       const u8 *firstGlobal, const u8 *secondGlobal)
{
    return first == *(const u32 *)firstGlobal &&
           (second == *(const u32 *)(secondGlobal + 4) || first == 0);
}

/* Multiply two fixed-point values and round to 12 fractional bits. */
static s32 multiplyFxRound(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Return immediately when actor +0x14 bit 0x200000 is set. Otherwise run
 * virtual +0x18, process recovered callback pair +0x218/+0x21c, optional path
 * handle +0x274, countdowns +0x252/+0x256/+0x25a/+0x25c, target +0x264, and
 * mode byte +0x24c. Pair comparisons use first words in data_020df9e8 and
 * second words from the address-derived companion globals; their semantic
 * identities remain unconfirmed.
 *
 * Virtual +0xc8 fills a temporary record used by encoded callback dispatch.
 * Virtual +0x1a4 gates movement: successful updates select target-following
 * virtuals +0x140/+0x144, or clear velocity for specific pairs. Active target
 * countdown +0x268 computes displacement, applies descriptor-driven radial
 * impulse through the trigonometric table, clamps +0x8c/+0x90 to 0x6000, and
 * invokes virtual +0x13c on expiry. Finish with optional ground probing,
 * virtual +0xa4, Actor_UpdateAnimationState, helper +0x284 animation synchronization, and
 * virtual +0x20. Returns no value; callbacks, actor/target motion, temporary
 * vector lifetime, attachment presentation, and global runtime state change.
 */
void func_0203e7c8(void *self)
{
    u8 *actor = (u8 *)self;
    u8 temporary[0x40];
    u8 oldMode;
    u32 first;
    u32 second;

    if ((*(u32 *)(actor + 0x14) & 0x200000) != 0)
        return;
    if ((*(u32 *)(actor + 0xd0) & 0x4000) != 0)
        *(u16 *)(actor + 0x252) =
            (*(u32 *)(actor + 0x260) & 0x20000) != 0 ? 60 : 30;

    (*(void (**)(void *))(*(u8 **)actor + 0x18))(actor);
    oldMode = actor[0x24c];
    first = *(u32 *)(actor + 0x218);
    second = *(u32 *)(actor + 0x21c);
    if ((*(u16 *)(actor + 0x272) & 0x400) != 0 &&
        !pairMatches(first, second, data_020df9e8 + 0x120,
                     data_020dfb08) &&
        *(s32 *)(actor + 0x1dc) == *(s32 *)(actor + 0x24)) {
        void **collection = func_02007f0c(data_021052fc, 1);
        void *object = *(void **)((u8 *)collection + 0x2e7c);
        if ((*(s32 (**)(void *))(*(u8 **)object + 0xa8))(object) == 0) {
            u16 sound;
            if (*(void **)(actor + 0x274) != 0)
                func_02045184(*(void **)(actor + 0x274), actor);
            *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x118);
            *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x11c);
            sound = data_020e6f94[*(u16 *)(actor + 0x4e)];
            if (sound != 0)
                func_020349b8(actor, sound, 0);
            *(s16 *)(actor + 0xd6) = 0x11;
            *(u32 *)(actor + 0x260) &= ~3;
            func_02033ed0(actor);
        }
    }

    (*(void (**)(void *, void *))(*(u8 **)actor + 0xc8))(
        actor, temporary + 0x10);
    if (*(void **)(actor + 0x26c) != 0 &&
        *(u16 *)(actor + 0x26a) != 0 &&
        pairMatches(*(u32 *)(actor + 0x218), *(u32 *)(actor + 0x21c),
                    data_020df9e8 + 0x108, data_020dfaf0)) {
        --*(u16 *)(actor + 0x26a);
        (*(void (**)(void *))(*(u8 **)actor + 0x138))(actor);
    }

    if (*(u16 *)(actor + 0x25c) == 0) {
        actor[0x24d] = 0;
    } else {
        --*(u16 *)(actor + 0x25c);
        *(u16 *)(temporary + 0x2a) |= 2;
    }

    if ((*(s32 (**)(void *))(*(u8 **)actor + 0x1a4))(actor) != 0) {
        u32 selector;
        void (*callback)(void *, void *);
        s32 permitMovement;

        *(s16 *)(actor + 0xd6) = 1;
        if (!pairMatches(*(u32 *)(actor + 0x218),
                         *(u32 *)(actor + 0x21c),
                         data_020df9e8 + 0x58, data_020dfa40)) {
            *(s32 *)(actor + 0x3c) = 0;
            *(s32 *)(actor + 0x40) = 0;
        }
        actor[0x24c] = 0;
        if (*(u16 *)(actor + 0x256) < 0x77)
            ++*(u16 *)(actor + 0x256);
        *(u32 *)(actor + 0xd0) &= ~2;

        selector = *(u32 *)(actor + 0x21c);
        if ((selector & 1) != 0) {
            u8 *table = *(u8 **)(actor + ((s32)selector >> 1));
            callback = *(void (**)(void *, void *))(
                table + *(u32 *)(actor + 0x218));
        } else {
            callback = (void (*)(void *, void *))*(u32 *)(actor + 0x218);
        }
        callback(actor, temporary + 0x10);

        permitMovement =
            !pairMatches(*(u32 *)(actor + 0x218),
                         *(u32 *)(actor + 0x21c),
                         data_020df9e8 + 0x190, data_020dfb78) &&
            *(s16 *)(actor + 0xd6) != 0x16 &&
            (*(u32 *)(actor + 0x260) & 0x400) == 0;
        if (permitMovement) {
            if (*(void **)(actor + 0x228) != 0 &&
                (pairMatches(*(u32 *)(actor + 0x218),
                             *(u32 *)(actor + 0x21c),
                             data_020df9e8 + 0x110, data_020dfaf8) ||
                 (*(u32 *)(actor + 0x260) & 0x20) != 0)) {
                s32 step = (*(s32 (**)(void *))(*(u8 **)actor + 0x144))(actor);
                (void)func_02032370(actor,
                                    (u8 *)*(void **)(actor + 0x228) + 0x18,
                                    step);
            } else {
                s32 step = (*(s32 (**)(void *))(*(u8 **)actor + 0x140))(actor);
                (void)func_02032228(actor, *(s32 *)(actor + 0x3c),
                                    *(s32 *)(actor + 0x40), step);
            }
        }

        if (*(s16 *)(actor + 0x252) > 0) {
            *(s32 *)(actor + 0x3c) = 0;
            *(s32 *)(actor + 0x40) = 0;
            --*(s16 *)(actor + 0x252);
        }

        if (actor[0x268] != 0) {
            u8 *target = *(u8 **)(actor + 0x264);
            if (target == 0) {
                actor[0x268] = 0;
            } else if ((*(s32 (**)(void *))(*(u8 **)target + 0xa8))(target) == 0) {
                actor[0x268] = 0;
                actor[0x269] = 0;
                (*(void (**)(void *, s32))(*(u8 **)actor + 0x13c))(actor, 0);
            } else {
                u8 *descriptor = data_020e8380 +
                                 *(u16 *)(actor + 0x4e) * 0x30;
                u16 parameter = *(u16 *)(descriptor + 0x1e);
                s32 kind = parameter >> 2;

                func_020066a4(temporary, target + 0x18, actor + 0x18,
                              (u32)parameter);
                if (func_0204cfa4(*(s32 *)(temporary + 4),
                                  *(s32 *)(temporary + 8)) > 0x4000) {
                    s32 magnitude;
                    s32 angle;
                    if (kind == 0)
                        magnitude = 0x333;
                    else if (kind == 1)
                        magnitude = 0x1ec;
                    else if (kind == 2 || kind == 3)
                        magnitude = 0x11f;
                    else
                        magnitude = 0xcd;
                    angle = func_020ae024(*(s32 *)(temporary + 8),
                                          *(s32 *)(temporary + 4)) >> 4;
                    *(s32 *)(actor + 0x8c) +=
                        multiplyFxRound(data_020c9670[angle * 2 + 1],
                                        magnitude);
                    *(s32 *)(actor + 0x90) +=
                        multiplyFxRound(data_020c9670[angle * 2], magnitude);
                    func_0204cff4((s32 *)(actor + 0x8c),
                                  (s32 *)(actor + 0x90), 0x6000);
                }
                --actor[0x268];
                if (actor[0x268] == 0) {
                    actor[0x269] = 0;
                    (*(void (**)(void *, s32))(*(u8 **)actor + 0x13c))(
                        actor, 0);
                }
                func_02005058(temporary);
            }
        }

        if (pairMatches(*(u32 *)(actor + 0x218),
                        *(u32 *)(actor + 0x21c),
                        data_020df9e8 + 0x60, data_020dfa48)) {
            *(s32 *)(actor + 0x3c) = 0;
            *(s32 *)(actor + 0x40) = 0;
            *(s16 *)(actor + 0xd6) = 7;
        }
    }

    if ((*(u32 *)(actor + 0xd0) & 4) == 0)
        func_0203bba4(actor);
    (*(void (**)(void *))(*(u8 **)actor + 0xa4))(actor);
    Actor_UpdateAnimationState(actor);

    if ((*(u32 *)(actor + 0x260) & 0x40) == 0) {
        u8 mode = actor[0x24c];
        u8 *helper = actor + 0x284;

        if (mode != 0 &&
            (*(u16 *)(*(u8 **)(actor + 0x288) + 0x24) & 4) != 0)
            func_02035518(helper, 1);
        if (mode != oldMode) {
            static const s8 animations[12] = {
                -1, 0, 1, 24, 2, -1, 11, 4, 23, 13, 25, 26
            };
            s32 animation = mode <= 11 ? animations[mode] : -1;
            if (animation != -1) {
                if (*(s16 *)(actor + 0x292) != 0)
                    func_0204cf28(helper);
                func_0204ced8(helper, (u8)animation);
                func_02035518(helper, 1);
            } else {
                func_02035518(helper, 0);
            }
        }
        (*(void (**)(void *))(*(u8 **)helper + 8))(helper);
    }
    (*(void (**)(void *))(*(u8 **)actor + 0x20))(actor);
}
