#include "tingle/types.h"

/*
 * Recovered drag-start handler for the type-seven actor. It validates actor
 * state, converts touch coordinates, and begins movement after a dead zone.
 */
extern u8 data_020e16b0[];
extern u8 data_020e1910[];
extern u8 data_020e17c8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedRuntime_TestInteractionQuery(void *actor, const void *input);
extern s32 func_0204c74c(void *actor, const void *input);
extern void Actor_TestQueryPointAndClearFlag2000(void *actor, const void *input);
extern s32 Type7Actor_HasSpecialCallbackPair(const void *actor);
extern void TouchPoint_Init(void *point, s32 x, s32 y);
extern void func_02005030(void *destination, const void *source);
extern void func_02005058(void *value);
extern void func_020478b0(void *actor, const void *transform);
extern void ActorDerivedType1_TrySetStateVector(void *target, const void *transform, s32 duration,
                          s32 mode);
#ifdef __cplusplus
}
#endif

/* Test the callback representation while retaining its unconfirmed offsets. */
static s32 callback_pair_matches(const u8 *actor, void *first, void *second)
{
    void *actorFirst = *(void *const *)(actor + 0x208);
    return actorFirst == first
        && (*(void *const *)(actor + 0x20c) == second || actorFirst == 0);
}

/*
 * Inputs are a type-seven actor and an input record with coordinates in words
 * +4/+8. A +0x01000000 actor is delegated to
 * ActorDerivedRuntime_TestInteractionQuery. Otherwise run the recovered input
 * hooks and require: clear +0x2a6, record +0x38 bit one, actor
 * flag 0x8000, no +0x234 resource, a non-null +0x280 target, actor flag four,
 * nonnegative timer +0x250, clear flags 0x40 and eight, and a callback form not
 * recognized by Type7Actor_HasSpecialCallbackPair. The data_020e16b0+0x260/data_020e1910 pair is
 * excluded. The +0x118/data_020e17c8 pair additionally requires actor flag
 * 0x2000; other pairs do not.
 *
 * Set flags 0x100 after the early actor gates and 0x800 after all drag gates.
 * Convert the touch position relative to actor +0x1c/+0x20/+0x24 and ignore a
 * squared displacement of 256 or less. For a larger displacement, add it to a
 * temporary +0x18 transform, pass that transform to func_020478b0, and forward
 * it to target +0x280 when the target type byte is one. Actor motion and target
 * interpolation state may change; the temporary is finalized and there is no
 * direct SDK or hardware access. This routine has no return value.
 */
void func_0204767c(void *self, const void *inputRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *input = (const u8 *)inputRecord;
    u8 *record;
    u8 *target;
    u32 point[3];
    u32 transform[4];
    s32 x;
    s32 y;
    u32 flags;

    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        ActorDerivedRuntime_TestInteractionQuery(actor, input);
        return;
    }
    if (func_0204c74c(actor, input) == 0 || *(u16 *)(actor + 0x2a6) != 0)
        return;
    Actor_TestQueryPointAndClearFlag2000(actor, input);
    record = *(u8 **)(actor + 0x29c);
    if ((*(u16 *)(record + 0x38) & 2) == 0)
        return;
    flags = *(u32 *)(actor + 0x268);
    if ((flags & 0x8000) == 0)
        return;
    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0x260),
                              *(void **)(data_020e1910 + 4)))
        return;
    if (*(void **)(actor + 0x234) != 0)
        return;
    *(u32 *)(actor + 0x268) = flags | 0x100;

    target = *(u8 **)(actor + 0x280);
    if (target == 0 || (*(u32 *)(actor + 0x268) & 4) == 0)
        return;
    if (callback_pair_matches(actor, *(void **)(data_020e16b0 + 0x118),
                              *(void **)(data_020e17c8 + 4))
        && (*(u32 *)(actor + 0x10) & 0x2000) == 0)
        return;
    if (*(s16 *)(actor + 0x250) < 0)
        return;
    flags = *(u32 *)(actor + 0x268);
    if ((flags & (0x40 | 8)) != 0 || Type7Actor_HasSpecialCallbackPair(actor) != 0)
        return;
    *(u32 *)(actor + 0x268) = flags | 0x800;

    x = *(const s32 *)(input + 4) - (*(s32 *)(actor + 0x1c) >> 12);
    y = *(const s32 *)(input + 8)
        - ((*(s32 *)(actor + 0x20) >> 12) - (*(s32 *)(actor + 0x24) >> 12));
    TouchPoint_Init(point, x, y);
    x = (s32)point[1];
    y = (s32)point[2];
    if (x * x + y * y <= 0x100)
        return;

    func_02005030(transform, actor + 0x18);
    transform[1] += x << 12;
    transform[2] += y << 12;
    func_020478b0(actor, transform);
    if (target[0x4d] == 1)
        ActorDerivedType1_TrySetStateVector(target, transform, 20, 0);
    func_02005058(transform);
}
