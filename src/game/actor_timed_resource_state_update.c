#include "tingle/types.h"

/* Advance actor timed state, reconcile transient effects, and request removal. */
extern u8 data_02105310[];
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0201b23c(void *state);
extern void func_0201273c(void *state, s32 value);
extern s32 func_0200b058(void *effectState, void *actor);
extern void *func_02007f0c(void *manager, u32 slot);
extern void *func_020337d4(void *actor);
extern void func_0202eba4(void *collection, void *reference, void *actor);
extern void *func_0200af04(void *effectState, s32 index);
extern void func_0201b180(void *state, void *value);
extern void func_0201b228(void *state);
extern void Actor_UpdateAttachmentDirectionFromVector(void *actor, s32 x, s32 y);
extern void func_0202d494(void *collection, void *actor);
#ifdef __cplusplus
}
#endif

/*
 * If timed state actor+0xec is inactive, return one. Otherwise update it with
 * zero and continue only when byte 0x169 bit 1 is set. A nonzero transient mode
 * byte 0xe8 must pass data_02105310's actor predicate or the function returns
 * zero immediately. Modes other than two dispatch a collection/reference/actor
 * callback using global manager slot one; all nonzero modes are then cleared,
 * bind an effect-state value into +0xec, finalize that state, and refresh actor
 * direction from motion +0x3c/+0x40 when their sum is nonzero. Finally actor
 * flag 0x20 at +0x14 dispatches a collection removal/update callback and returns
 * zero; all other completed paths return one. Helpers may mutate collection,
 * presentation, or SDK-managed timed state.
 */
s32 func_02034164(void *self)
{
    u8 *actor = (u8 *)self;
    void *slotOne;
    void *collection;

    if (func_0201b23c(actor + 0xec) == 0) {
        return 1;
    }
    func_0201273c(actor + 0xec, 0);
    if ((actor[0x169] & 1) == 0) {
        return 1;
    }

    if (actor[0xe8] != 0) {
        if (func_0200b058(data_02105310, actor) == 0) {
            return 0;
        }
        if (actor[0xe8] != 2) {
            slotOne = func_02007f0c(data_021052fc, 1);
            collection = func_020337d4(actor);
            func_0202eba4(collection,
                          *(void **)((u8 *)slotOne + 0x2e7c), actor);
        }
        actor[0xe8] = 0;
        func_0201b180(actor + 0xec, func_0200af04(data_02105310, 0));
        func_0201b228(actor + 0xec);
        if (*(s32 *)(actor + 0x3c) + *(s32 *)(actor + 0x40) != 0) {
            Actor_UpdateAttachmentDirectionFromVector(actor, *(s32 *)(actor + 0x3c),
                          *(s32 *)(actor + 0x40));
        }
    }

    if ((*(u32 *)(actor + 0x14) & 0x20) != 0) {
        func_0202d494(func_020337d4(actor), actor);
        return 0;
    }
    return 1;
}
