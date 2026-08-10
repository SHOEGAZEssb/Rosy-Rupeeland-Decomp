#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered main frame update for the type-seven actor. It coordinates target
 * tracking, callback dispatch, motion, resource lifetime, and class timers.
 */
extern u8 data_020e16b0[];
extern u8 data_020e1728[];
extern u8 data_020e1748[];
extern u8 data_020e1838[];
extern u8 *data_021052fc;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedRuntime_UpdateFrame(void *actor);
extern s32 func_020adcac(const void *first, const void *second);
extern void Type7Actor_ResetMotionAndCooldown(void *actor);
extern void func_0204b7bc(void *actor, s32 enabled);
extern void Type7Actor_SetTarget(void *actor, void *worldObject, s32 value);
extern void *func_02025d14(void *object);
extern void func_02026588(void *object, s32 value);
extern void Type7Actor_DispatchCurrentCallback(void *actor);
extern void func_02005058(void *value);
extern void *func_020050a4(void *destination, const void *source);
extern s32 func_0206cd10(void *resource);
extern void func_0206c978(void *resource);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void func_02032370(void *actor, const void *target, s32 scale);
extern void func_02032228(void *actor, s32 x, s32 y, s32 scale);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 func_020be328(s32 value);
extern void Actor_UpdateGroundContactProbe(void *actor);
extern void Actor_UpdateAnimationState(void *actor);
extern void func_0204b1e0(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Compare actor callback words +0x208/+0x20c with a supplied first/second pair.
 * This local expression preserves the retail member-pointer comparison, which
 * accepts a zero first word after the first equality. It changes no state.
 */
static s32 callback_pair_matches(const u8 *actor, const void *first,
                                 const void *second)
{
    const void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/*
 * Return immediately when actor +0x268 has bit 0x400 or 0x40000. A pending
 * +0x10 bit 0x01000000 first runs ActorDerivedRuntime_UpdateFrame, then requires target +0x280,
 * matching +0x180/+0x294, and either target distance above twice +0x25c or a
 * nonzero target vtable +0xa8 predicate; otherwise the frame ends. Acceptance
 * clears that bit and +0x180 and invokes Type7Actor_ResetMotionAndCooldown. With +0xd0 bit 0x4000,
 * update signed halfword +0x246 through func_0204b7bc, one-shot +0x268 bit
 * 0x100000, or record +0x29c halfword +0x40. Invoke actor vtable +0x18, mask
 * +0x268 with 0xaf7efe, decrement +0x254, enter state one, clear +0xda and
 * +0x3c/+0x40, and clear +0x14 bit 0x100.
 *
 * With no +0x280 target, an exact set of idle/descriptor conditions may copy
 * +0x1fc and record +0x56/+0x58 to +0x10c/+0x110/+0x114 and call vtable +0x74
 * with +0x298. Positive +0x108 commits +0x104/+0x200 and record +0x30 to shared
 * scene/actor state, calls Type7Actor_SetTarget and the world +0x30e8 helpers, then
 * Type7Actor_DispatchCurrentCallback. A target at +0x280 may instead supply a transform through its
 * vtable +0xb4 into actor +0x214. Completed owned resource +0x234 is released
 * and GameWork flag 0x3fd cleared.
 *
 * If actor vtable +0x38 is zero, advance animation halfword +0x248 toward
 * +0x24a, invoke callback representation +0x208/+0x20c, promote states one/two
 * to eight when +0x9c/+0xa0 is nonzero, and choose motion toward +0x284,
 * target +0x210 transform +0x18, +0x224, or current +0x3c/+0x40. Positive
 * +0x246 cancels velocity, decrements, and enters state 15. Target angular
 * separation controls +0x268 bit 0x800000; bit 0x80000 invokes Actor_UpdateGroundContactProbe
 * and vtable +0xa4. Finish Actor_UpdateAnimationState/func_0204b1e0, update signed timer
 * +0x250 with target/callback/motion-dependent penalties and clamping, tick
 * +0x256/+0x25a, move +0x264 toward zero (clearing +0x250), decrement +0x24e
 * and start +0x264 at 90 on expiry, reduce +0x266 by 20 toward zero, decrement
 * +0x2a0/+0x2a4/+0x2a6, and invoke vtable +0x20. Actor, target, world,
 * GameWork, resource, callback, and motion state may change.
 */
void Type7Actor_UpdateFrame(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *target;
    u8 *record;
    u8 temporary[0x10];
    u32 flags;

    flags = *(u32 *)(actor + 0x268);
    if ((flags & (0x400 | 0x40000)) != 0)
        return;
    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        s32 release = 0;
        ActorDerivedRuntime_UpdateFrame(actor);
        target = *(u8 **)(actor + 0x280);
        if (target == 0 || *(u32 *)(actor + 0x180) != *(u32 *)(actor + 0x294))
            return;
        if (func_020adcac(target + 0x1c, actor + 0x1c)
                > *(s32 *)(actor + 0x25c) * 2)
            release = 1;
        else if ((*(s32 (**)(void *))(*(u8 **)target + 0xa8))(target) != 0)
            release = 1;
        if (!release)
            return;
        *(u32 *)(actor + 0x10) &= ~0x01000000u;
        *(u32 *)(actor + 0x180) = 0;
        Type7Actor_ResetMotionAndCooldown(actor);
    }
    if ((*(u32 *)(actor + 0xd0) & 0x4000) != 0) {
        if (*(s16 *)(actor + 0x246) < 20)
            func_0204b7bc(actor, 1);
        if ((*(u32 *)(actor + 0x268) & 0x100000) != 0) {
            *(u16 *)(actor + 0x246) = 180;
            *(u32 *)(actor + 0x268) &= ~0x100000u;
        } else {
            record = *(u8 **)(actor + 0x29c);
            if (*(s16 *)(actor + 0x246) < *(u16 *)(record + 0x40))
                *(u16 *)(actor + 0x246) = *(u16 *)(record + 0x40);
        }
    }
    (*(void (**)(void *))(*(u8 **)actor + 0x18))(actor);
    *(u32 *)(actor + 0x268) &= 0x00af7efe;
    if (*(u16 *)(actor + 0x254) != 0)
        --*(u16 *)(actor + 0x254);
    *(u16 *)(actor + 0xd6) = 1;
    *(u16 *)(actor + 0xda) = 0;
    *(u32 *)(actor + 0x3c) = 0;
    *(u32 *)(actor + 0x40) = 0;
    *(u32 *)(actor + 0x14) &= ~0x100u;

    target = *(u8 **)(actor + 0x280);
    if (target == 0) {
        s32 launch = 0;
        if (*(void **)(actor + 0x234) == 0
            && (*(u32 *)(actor + 0xd0) & 0x10) == 0
            && *(u32 *)(actor + 0x24) == *(u32 *)(actor + 0x1dc)
            && *(s32 *)(actor + 0x108) == 0
            && *(void **)(actor + 0x298) != 0
            && !callback_pair_matches(actor,
                    *(void **)(data_020e16b0 + 0x78),
                    *(void **)(data_020e1728 + 4))) {
            launch = 1;
        }
        if (launch) {
            record = *(u8 **)(actor + 0x29c);
            *(u32 *)(actor + 0x10c) = *(u32 *)(actor + 0x1fc);
            *(u32 *)(actor + 0x110) = *(u16 *)(record + 0x56);
            *(u32 *)(actor + 0x114) = *(u16 *)(record + 0x58);
            (*(void (**)(void *, void *))(*(u8 **)actor + 0x74))(
                actor, *(void **)(actor + 0x298));
        }
    }
    if (*(s32 *)(actor + 0x108) > 0) {
        void *worldObject;
        void *worldHelper;
        *(u32 *)(actor + 0x108) = 0;
        *(u32 *)(data_020e16b0 + 0x2b8) = *(u32 *)(actor + 0x104);
        *(u32 *)(actor + 0x1fc) = *(u32 *)(actor + 0x200);
        record = *(u8 **)(actor + 0x29c);
        *(u16 *)(actor + 0x258) = *(u16 *)(record + 0x30);
        worldObject = *(void **)(data_021052fc + 0x2ea4);
        Type7Actor_SetTarget(actor, worldObject, *(s16 *)(record + 0x30));
        worldHelper = *(void **)(data_021052fc + 0x30e8);
        func_02026588(func_02025d14(worldHelper), 0);
        *((u8 *)func_02025d14(worldHelper) + 0x8d) = 0;
        Type7Actor_DispatchCurrentCallback(actor);
    }
    target = *(u8 **)(actor + 0x280);
    if (target != 0) {
        (*(void (**)(void *, void *, void *))(*(u8 **)target + 0xb4))(
            target, temporary, actor);
        func_020050a4(actor + 0x214, temporary);
        func_02005058(temporary);
    }
    if (*(void **)(actor + 0x234) != 0
        && func_0206cd10(*(void **)(actor + 0x234)) == 2) {
        void *resource = *(void **)(actor + 0x234);
        if (resource != 0) {
            func_0206c978(resource);
            Heap_Free(resource);
        }
        *(void **)(actor + 0x234) = 0;
        GameWork_ClearFlag(gGameWork, 0x3fd);
    }

    if ((*(s32 (**)(void *))(*(u8 **)actor + 0x38))(actor) == 0) {
        s16 limit = *(s16 *)(actor + 0x24a);
        if (limit != -1) {
            if (*(s16 *)(actor + 0x248) < limit)
                ++*(s16 *)(actor + 0x248);
            else
                Type7Actor_DispatchCurrentCallback(actor);
        }
        {
            s32 adjustment = *(s32 *)(actor + 0x20c);
            if ((adjustment & 1) != 0) {
                u8 *object = actor + (adjustment >> 1);
                s32 slot = *(s32 *)(actor + 0x208);
                (*(void (**)(void *))(*(u8 **)object + slot))(object);
            } else {
                ((void (*)(s32))*(u32 *)(actor + 0x208))(adjustment);
            }
        }
        if ((*(s32 *)(actor + 0x9c) != 0 || *(s32 *)(actor + 0xa0) != 0)
            && (u16)(*(s16 *)(actor + 0xd6) - 1) <= 1) {
            *(u16 *)(actor + 0xd6) = 8;
        }
        if (callback_pair_matches(actor,
                *(void **)(data_020e16b0 + 0x98),
                *(void **)(data_020e1748 + 4))) {
            func_02032370(actor, actor + 0x284, 0x800);
        } else if (*(void **)(actor + 0x210) != 0) {
            func_02032370(actor, (u8 *)*(void **)(actor + 0x210) + 0x18, 0x800);
        } else if (*(void **)(actor + 0x234) == 0
                   && (*(u32 *)(actor + 0x268) & 0x0c) != 0) {
            func_02032370(actor, actor + 0x224, 0x800);
        } else {
            func_02032228(actor, *(s32 *)(actor + 0x3c),
                          *(s32 *)(actor + 0x40), 0x800);
        }
        if (*(s16 *)(actor + 0x246) > 0) {
            *(u32 *)(actor + 0x3c) = 0;
            *(u32 *)(actor + 0x40) = 0;
            --*(s16 *)(actor + 0x246);
            *(u16 *)(actor + 0xd6) = 15;
        }
    }
    target = *(u8 **)(actor + 0x280);
    if (target != 0) {
        s32 separation = func_020be328(
            Actor_GetCachedTerrainHeight(actor) - Actor_GetCachedTerrainHeight(target));
        if (separation >= 0x20000)
            *(u32 *)(actor + 0x268) |= 0x800000;
        else
            *(u32 *)(actor + 0x268) &= ~0x800000u;
    } else {
        *(u32 *)(actor + 0x268) &= ~0x800000u;
    }
    if ((*(u32 *)(actor + 0x268) & 0x80000) != 0) {
        Actor_UpdateGroundContactProbe(actor);
        (*(void (**)(void *))(*(u8 **)actor + 0xa4))(actor);
    }
    Actor_UpdateAnimationState(actor);
    func_0204b1e0(actor);

    if (*(s16 *)(actor + 0x250) > 0) {
        --*(s16 *)(actor + 0x250);
        target = *(u8 **)(actor + 0x210);
        if (target != 0 && target[0x4d] == 4
            && *(u16 *)(target + 0x4e) == 20
            && ((*(u16 *)(target + 0x1f0) & 3) >= 2)) {
            *(s16 *)(actor + 0x250) -= 6;
        }
        if (!callback_pair_matches(actor,
                *(void **)(data_020e16b0 + 0x188),
                *(void **)(data_020e1838 + 4))) {
            if (actor[0x4b] != 0 || actor[0x4a] != 0)
                *(s16 *)(actor + 0x250) -= 4;
            else if (*(s32 *)(actor + 0x3c) == 0
                     && *(s32 *)(actor + 0x40) == 0)
                *(s16 *)(actor + 0x250) -= 2;
        }
        if (*(s16 *)(actor + 0x250) < 0)
            *(u16 *)(actor + 0x250) = 0;
    } else {
        if (*(s16 *)(actor + 0x250) < 0)
            ++*(s16 *)(actor + 0x250);
        *(u32 *)(actor + 0x268) &= 0xfffff7f3;
    }
    if (*(u16 *)(actor + 0x256) != 0)
        --*(u16 *)(actor + 0x256);
    if (*(u16 *)(actor + 0x25a) != 0)
        --*(u16 *)(actor + 0x25a);
    if (*(s16 *)(actor + 0x264) != 0) {
        if (*(s16 *)(actor + 0x264) > 0)
            --*(s16 *)(actor + 0x264);
        else
            ++*(s16 *)(actor + 0x264);
        *(u16 *)(actor + 0x250) = 0;
    }
    if (*(s16 *)(actor + 0x24e) > 0) {
        --*(s16 *)(actor + 0x24e);
        if (*(s16 *)(actor + 0x24e) == 0)
            *(u16 *)(actor + 0x264) = 90;
    }
    if (*(s16 *)(actor + 0x266) > 0) {
        *(s16 *)(actor + 0x266) -= 20;
        if (*(s16 *)(actor + 0x266) < 0)
            *(u16 *)(actor + 0x266) = 0;
    }
    if (*(u16 *)(actor + 0x2a0) != 0)
        --*(u16 *)(actor + 0x2a0);
    if (*(u16 *)(actor + 0x2a4) != 0)
        --*(u16 *)(actor + 0x2a4);
    if (*(u16 *)(actor + 0x2a6) != 0)
        --*(u16 *)(actor + 0x2a6);
    (*(void (**)(void *))(*(u8 **)actor + 0x20))(actor);
}
