#include "tingle/types.h"

/* Coordinate type-1 actor descriptor start, attachment, and vector dispatch. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02038ecc(void *actor, void *records);
extern void func_020390c8(void *actor);
extern void func_020551f0(void *object);
extern void func_02038f98(void *actor);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern void Actor_ApplyMotionImpulse(void *actor, const void *vector, s32 mark);
extern void Type1Actor_TryEnterFailureState(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * If descriptor +0x27c exists and has type byte 0x6d plus signed halfword
 * +0x00 equal to 0x66, set actor halfword +0x282 to six. If no descriptor is
 * active, start one from records through func_02038ecc. Other active descriptor
 * types are unchanged. Returns no value; record start may allocate/play audio.
 */
void func_02039240(void *self, void *records)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor = *(u8 **)(actor + 0x27c);
    if (descriptor == 0) {
        func_02038ecc(actor, records);
    } else if (descriptor[8] == 0x6d && *(s16 *)descriptor == 0x66) {
        *(u16 *)(actor + 0x282) = 6;
    }
}

/*
 * Return while auxiliary +0x26c exists. Otherwise tear down the old record,
 * store external object +0x1f8 as descriptor +0x27c and the object itself at
 * +0x278, call func_020551f0 on it, and materialize the descriptor through
 * func_02038f98. Returns no value; teardown/object/apply calls alter ownership.
 */
void func_02039278(void *self, void *object)
{
    u8 *actor = (u8 *)self;
    if (*(void **)(actor + 0x26c) != 0)
        return;
    func_020390c8(actor);
    *(void **)(actor + 0x27c) = *(void **)((u8 *)object + 0x1f8);
    *(void **)(actor + 0x278) = object;
    func_020551f0(object);
    func_02038f98(actor);
}

/*
 * Return when actor +0x230 bit 0x400 is set. With no auxiliary +0x26c, also
 * reject attachment +0x54 flags 0x14. Require
 * Actor_IsAtCachedTerrainHeight and reject an
 * optional +0x270 object whose byte +0x10 has bit one. For nonzero mode, tear
 * down the active descriptor, then dispatch vector/mode through Actor_ApplyMotionImpulse
 * and finalize with Type1Actor_TryEnterFailureState. Returns no value; helper
 * calls may update
 * actor presentation, ownership, and motion state.
 */
void func_020392b4(void *self, const void *vector, s32 mode)
{
    u8 *actor = (u8 *)self;
    u8 *object;
    if ((*(u32 *)(actor + 0x230) & 0x400) != 0)
        return;
    if (*(void **)(actor + 0x26c) == 0 &&
        ((*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 0x14) != 0))
        return;
    if (Actor_IsAtCachedTerrainHeight(actor) == 0)
        return;
    object = *(u8 **)(actor + 0x270);
    if (object != 0 && (object[0x10] & 1) != 0)
        return;
    if (mode != 0)
        func_020390c8(actor);
    Actor_ApplyMotionImpulse(actor, vector, mode);
    Type1Actor_TryEnterFailureState(actor);
}

/*
 * Tear down the active descriptor and dispatch vector through Actor_ApplyMotionImpulse
 * with mode one. Returns no value; both helpers change actor-owned state.
 */
void func_02039348(void *self, const void *vector)
{
    func_020390c8(self);
    Actor_ApplyMotionImpulse(self, vector, 1);
}
