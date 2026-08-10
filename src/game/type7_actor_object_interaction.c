#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered object-interaction dispatcher for the type-seven actor. It handles
 * compatible type-two and type-four objects, callback transitions, drag setup,
 * and one auxiliary visual allocation.
 */
extern u8 data_020e16b0[];
extern u8 data_020e1918[];
extern u8 data_020e17a8[];
extern u32 data_020e1908[];
extern u8 data_020e1900[];
extern u32 data_020e1798[];
extern const char gType7ActorPresentationEffectAllocationTag[];
extern u32 data_020e1750[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Type7Actor_IsInteractionSceneActive(void *actor, const void *other);
extern s32 Type7Actor_CheckRandomInteractionAcceptance(void *actor);
extern s32 Type7Actor_HasSpecialCallbackPair(const void *actor);
extern void Type7Actor_SetCallbackPair(void *actor, u32 first, u32 second, s32 duration);
extern void Type7Actor_PlayStateSound(void *actor, s32 mode);
extern void *func_0201f864(void *allocation, ...);
extern void Type7Actor_SetMotionTarget(void *actor, const void *transform);
#ifdef __cplusplus
}
#endif

/* Test an offset-derived callback pair whose semantic identity is unconfirmed. */
static s32 callback_pair_matches(const u8 *actor, void *first, void *second)
{
    void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/*
 * Inputs are a type-seven actor and another actor-like object. Require the
 * Type7Actor_IsInteractionSceneActive gate, clear +0x2a6, a non-null +0x280 target, actor flag
 * 0x8000, timer +0x246 at most zero, neither excluded callback pair
 * data_020e16b0+0x268/data_020e1918 nor +0xf8/data_020e17a8, and acceptance by
 * Type7Actor_CheckRandomInteractionAcceptance. Clear counters +0x2a0/+0x266 before dispatching on the other
 * object's type byte +0x4d.
 *
 * Type two additionally requires record +0x38 bit two and becomes related
 * object +0x210. An unrecognized current callback installs data_020e1908 for
 * 20 ticks and sets +0x256/+0x25a to 60/180. A recognized callback must instead
 * match data_020e16b0+0x250/data_020e1900 and have +0x2a2 above 40; it resets
 * that counter, sets +0x2a4 to 120, installs data_020e1798 indefinitely,
 * selects mode zero, and creates a 0x14-byte auxiliary effect using IDs
 * 0x162b..0x162d and the attachment at +0x54 when allocation succeeds.
 *
 * Type four enters data_020e1750 for 180 ticks immediately when collision flag
 * +0xd0/0x40000 is set. Otherwise other halfword +0x4e values 0x68 and 0x14
 * require record bits three and four respectively; values 0x24..0x26 need no
 * record bit. Accepted values bind +0x210 and initialize drag state from other
 * transform +0x18 through Type7Actor_SetMotionTarget. Actor callback, counters, relation,
 * animation, heap, and auxiliary presentation state may change. Heap_Alloc is
 * the SDK-facing allocator effect; this routine has no return value.
 */
void Type7Actor_HandleObjectInteraction(void *self, void *otherObject)
{
    u8 *actor = (u8 *)self;
    u8 *other = (u8 *)otherObject;
    u8 *record;

    if (Type7Actor_IsInteractionSceneActive(actor, other) == 0 || *(u16 *)(actor + 0x2a6) != 0
        || *(void **)(actor + 0x280) == 0
        || (*(u32 *)(actor + 0x268) & 0x8000) == 0
        || *(s16 *)(actor + 0x246) > 0)
        return;
    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0x268),
                              *(void **)(data_020e1918 + 4))
        || callback_pair_matches(actor, *(void **)(data_020e16b0 + 0xf8),
                                 *(void **)(data_020e17a8 + 4)))
        return;
    if (Type7Actor_CheckRandomInteractionAcceptance(actor) == 0)
        return;
    *(u16 *)(actor + 0x2a0) = 0;
    *(u16 *)(actor + 0x266) = 0;
    record = *(u8 **)(actor + 0x29c);

    if (other[0x4d] == 2) {
        if ((*(u16 *)(record + 0x38) & 4) == 0)
            return;
        *(void **)(actor + 0x210) = other;
        if (Type7Actor_HasSpecialCallbackPair(actor) == 0) {
            Type7Actor_SetCallbackPair(actor, data_020e1908[0], data_020e1908[1], 20);
            *(u16 *)(actor + 0x256) = 60;
            *(u16 *)(actor + 0x25a) = 180;
            return;
        }
        if (!callback_pair_matches(actor,
                                   *(void **)(data_020e16b0 + 0x250),
                                   *(void **)(data_020e1900 + 4))
            || *(u16 *)(actor + 0x2a2) <= 40)
            return;
        *(u16 *)(actor + 0x2a2) = 0;
        *(u16 *)(actor + 0x2a4) = 120;
        Type7Actor_SetCallbackPair(actor, data_020e1798[0], data_020e1798[1], -1);
        *(u16 *)(actor + 0x256) = 60;
        *(u16 *)(actor + 0x25a) = 180;
        Type7Actor_PlayStateSound(actor, 0);
        {
            void *allocation = Heap_Alloc(0x14, gType7ActorPresentationEffectAllocationTag, 4,
                                          &gHeapContext);
            if (allocation != 0)
                func_0201f864(allocation, actor + 0x18,
                              **(void ***)(actor + 0x54), 0x162b,
                              0x162c, 0x162d, 0, 4, 2, 1);
        }
        return;
    }

    if (other[0x4d] == 4) {
        u16 kind;
        if ((*(u32 *)(actor + 0xd0) & 0x40000) != 0) {
            *(u16 *)(actor + 0x24a) = 180;
            Type7Actor_SetCallbackPair(actor, data_020e1750[0], data_020e1750[1], 180);
            *(void **)(actor + 0x210) = other;
            return;
        }
        kind = *(u16 *)(other + 0x4e);
        if (kind == 0x68) {
            if ((*(u16 *)(record + 0x38) & 8) == 0)
                return;
        } else if (kind == 0x14) {
            if ((*(u16 *)(record + 0x38) & 0x10) == 0)
                return;
        } else if (kind < 0x24 || kind > 0x26) {
            return;
        }
        *(void **)(actor + 0x210) = other;
        Type7Actor_SetMotionTarget(actor, other + 0x18);
    }
}
