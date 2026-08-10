#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered extended type-two actor target-follow effect handler. It follows
 * a live target for a bounded duration and periodically spawns a small effect.
 */
extern char gActorExtendedType2SpritePresentationAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorExtendedType2_ApplyTargetImpulse(void *actor, const void *targetTransform);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern u32 genrand_int32(void);
extern void *func_0201f864(void *allocation, ...);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0x260 bit zero, set bit one, and return zero immediately when
 * virtual +0x38 reports busy. Counter +0x254 then increments; after 180 ticks,
 * with no target +0x228, or when target virtual +0xa8 reports inactive, actor
 * virtual +0xe8 is invoked. A live target with +0xd0 bit 0x100 also invokes
 * +0xe8; otherwise ActorExtendedType2_ApplyTargetImpulse applies its transform
 * at +0x18. Every 16th tick, a 0x14-byte heap allocation is initialized through
 * func_0201f864 using
 * actor position, attachment resource, IDs 0x135b..0x135d, a random value in
 * [0,2], and fixed trailing parameters. The routine always returns zero and
 * may change actor, target, heap, random, and effect state; heap allocation is
 * the only direct SDK-style resource operation.
 */
s32 ActorExtendedType2_UpdateTargetFollowEffect(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *vtable = *(u8 **)actor;
    u8 *target;

    *(u32 *)(actor + 0x260) = (*(u32 *)(actor + 0x260) & ~1) | 2;
    if ((*(s32 (**)(void *))(vtable + 0x38))(actor) != 0)
        return 0;

    ++*(u16 *)(actor + 0x254);
    target = *(u8 **)(actor + 0x228);
    if (*(u16 *)(actor + 0x254) > 180 || target == 0 ||
        (*(s32 (**)(void *))(*(u8 **)target + 0xa8))(target) == 0) {
        (*(void (**)(void *))(vtable + 0xe8))(actor);
        return 0;
    }

    if ((*(u32 *)(target + 0xd0) & 0x100) != 0)
        (*(void (**)(void *))(vtable + 0xe8))(actor);
    else
        ActorExtendedType2_ApplyTargetImpulse(actor, target + 0x18);

    if (func_020ada8c(*(u16 *)(actor + 0x254), 16) == 0) {
        void *allocation = Heap_Alloc(0x14, gActorExtendedType2SpritePresentationAllocationTag, 4, &gHeapContext);
        if (allocation != 0) {
            u32 random = genrand_int32() & 0x7fffffff;
            void *resource = **(void ***)(actor + 0x54);
            func_0201f864(allocation, actor + 0x18, resource, 0x135b,
                          0x135c, 0x135d,
                          func_020ada8c((s32)random, 3) & 0xff,
                          0x12, -1, 1);
        }
    }
    return 0;
}
