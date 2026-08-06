#include "tingle/types.h"

/*
 * Recovered type-seven actor callbacks that derive motion or presentation
 * state from attached and related objects.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *destination, const void *source);
extern void func_02005058(void *value);
extern void func_02047908(void *actor, const void *transform);
extern void func_02047dd8(void *actor);
extern void func_02047f08(void *actor, s32 condition);
extern void func_02047f20(void *actor, s32 condition);
extern void func_02048148(void *actor);
extern s32 func_0204820c(void *actor);
extern s32 func_0204876c(void *actor, s32 finiteMode);
extern void func_0204a5dc(void *actor);
#ifdef __cplusplus
}
#endif

/* Invoke the actor's virtual +0x54 mode callback. */
static void set_actor_mode(u8 *actor, s32 mode)
{
    typedef void (*ModeCallback)(void *actor, s32 mode);
    ModeCallback callback = *(ModeCallback *)(*(u8 **)actor + 0x54);
    callback(actor, mode);
}

/*
 * Input is a type-seven actor. Set actor flag 0x8000 and +0xd0 bit one. If
 * related object +0x210 is absent, reset through func_02047dd8 and return zero.
 * Otherwise call that object's virtual +0xb4 operation with a temporary
 * 16-byte value and the actor, update actor motion from the result, then
 * finalize the temporary value through func_02005058.
 *
 * When actor collision bit 0x40000 is set, select presentation halfword 14
 * unless the related object's bytes +0x4d/+0x4e identify subtype four with
 * value 0x12. The function always returns zero. Actor, related-object, motion,
 * and temporary-value state may change; there is no direct hardware access.
 */
s32 func_0204955c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *related;
    u8 value[16];

    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) |= 2;
    related = *(u8 **)(actor + 0x210);
    if (related == 0) {
        func_02047dd8(actor);
        return 0;
    }

    {
        typedef void (*TransformCallback)(void *output, void *object,
                                          void *actor);
        TransformCallback callback =
            *(TransformCallback *)(*(u8 **)related + 0xb4);
        callback(value, related, actor);
    }
    func_02047908(actor, value);
    if ((*(u32 *)(actor + 0xd0) & 0x40000) != 0
        && !(related[0x4d] == 4 && *(u16 *)(related + 0x4e) == 0x12))
        *(u16 *)(actor + 0xd6) = 14;
    func_02005058(value);
    return 0;
}

/*
 * Input is a type-seven actor. Treat attached resource +0x234 being non-null
 * as a condition for the two +0x14 flag helpers, enter actor mode zero, and
 * update motion from related object +0x210 transform +0x18 when both the
 * condition and object are present; otherwise use the actor's own +0x18
 * transform. Return zero. Actor flags, mode, and motion may change; there are
 * no direct SDK or hardware effects.
 */
s32 func_0204960c(void *self)
{
    u8 *actor = (u8 *)self;
    s32 hasResource = *(void **)(actor + 0x234) != 0;
    u8 *related;

    func_02047f08(actor, hasResource);
    func_02047f20(actor, hasResource);
    set_actor_mode(actor, 0);
    related = *(u8 **)(actor + 0x210);
    if (hasResource && related != 0)
        func_02047908(actor, related + 0x18);
    else
        func_02047908(actor, actor + 0x18);
    return 0;
}

/*
 * Input is a type-seven actor. Enter actor mode zero, then pass whether
 * attached resource +0x234 exists to the two +0x14 flag helpers. Return zero.
 * Actor mode and flags may change; no SDK or hardware effects occur directly.
 */
s32 func_02049680(void *self)
{
    u8 *actor = (u8 *)self;
    s32 hasResource = *(void **)(actor + 0x234) != 0;
    set_actor_mode(actor, 0);
    func_02047f08(actor, hasResource);
    func_02047f20(actor, hasResource);
    return 0;
}

/*
 * Input is a type-seven actor. Set actor flag 0x8000, +0xd0 bit one, and
 * signed callback timer +0x24a to -1. Reset and return when related object
 * +0x210 is absent. Otherwise run finite target acquisition: dispatch the
 * installed callback and return when it fails, then run the target-state gate
 * and return when that succeeds.
 *
 * The flag-four path copies saved transform +0x224 to +0x78 before the retail
 * control flow overwrites +0x78 with related transform +0x18; both copies are
 * retained because the first may carry reconstructed object semantics not
 * visible in the raw fields. Maintain extra state with func_0204a5dc, update
 * motion, and select presentation 10 for related subtype one or 14 otherwise.
 * Always return zero. Actor, target, callback, and motion state may change; no
 * direct hardware access occurs.
 */
s32 func_020496cc(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *related;

    *(u32 *)(actor + 0x268) |= 0x8000;
    *(u32 *)(actor + 0xd0) |= 2;
    *(u16 *)(actor + 0x24a) = (u16)-1;
    related = *(u8 **)(actor + 0x210);
    if (related == 0) {
        func_02047dd8(actor);
        return 0;
    }
    if (func_0204876c(actor, 1) == 0) {
        func_02048148(actor);
        return 0;
    }
    if (func_0204820c(actor) != 0)
        return 0;
    if ((*(u32 *)(actor + 0x268) & 4) != 0)
        func_020050a4(actor + 0x78, actor + 0x224);
    related = *(u8 **)(actor + 0x210);
    func_020050a4(actor + 0x78, related + 0x18);
    func_0204a5dc(actor);
    func_02047908(actor, actor + 0x78);
    *(u16 *)(actor + 0xd6) = related[0x4d] == 1 ? 10 : 14;
    return 0;
}
