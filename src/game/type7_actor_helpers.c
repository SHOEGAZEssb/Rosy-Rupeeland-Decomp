#include "tingle/types.h"

/* Recovered reset, helper-dispatch, and callback-sensitive transform helpers for type seven. */
extern u8 data_020e16b0[];
extern u8 data_020e16d0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *value);
extern void ActorRuntimeTriple_Assign(void *vector, s32 x, s32 y, s32 z);
extern void Actor_RefreshTerrainHeight(void *actor);
extern void func_02031758(void *context, void *actor, void *value);
extern void func_0206dcac(void *resource);
extern void Actor_ApplyMotionImpulse(void *actor, const void *value, s32 mode);
extern void ActorVector_DivideByScalar(void *output, const void *input, s32 scale);
#ifdef __cplusplus
}
#endif

/*
 * Copy actor +0x214 to transform +0x18, refresh terrain height, copy +0x1dc to
 * +0x24, and zero vector-like fields +0x38 and +0x88. Returns no value; actor
 * transform/base motion state changes without direct hardware access.
 */
void Type7Actor_ResetBaseTransformAndMotion(void *self)
{
    u8 *actor = (u8 *)self;
    VecFx32Object_Assign(actor + 0x18, actor + 0x214);
    Actor_RefreshTerrainHeight(actor);
    *(u32 *)(actor + 0x24) = *(u32 *)(actor + 0x1dc);
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
}

/*
 * Forward the three inputs to func_02031758, copy actor transform +0x18 to a
 * temporary, and add signed actor halfword +0x6a times 0xb33 to temporary word
 * +8. Invoke helper +0x2a8 vtable +0x0c with value, the adjusted temporary, and
 * zero. If resource +0x234 exists, pass it to func_0206dcac. Finalize the
 * temporary and return no value; actor/helper/resource state may change.
 */
void Type7Actor_ForwardHelperEvent(void *context, void *self, void *value)
{
    u8 *actor = (u8 *)self;
    u32 temporary[4];
    func_02031758(context, actor, value);
    VecFx32Object_InitCopy(temporary, actor + 0x18);
    temporary[2] = (u32)((s32)temporary[2] + *(s16 *)(actor + 0x6a) * 0xb33);
    (*(void (**)(void *, void *, void *, s32))(
        *(u8 **)(actor + 0x2a8) + 0x0c))(
        actor + 0x2a8, value, temporary, 0);
    if (*(void **)(actor + 0x234) != 0)
        func_0206dcac(*(void **)(actor + 0x234));
    VecFx32Object_Destroy(temporary);
}

/*
 * Inputs are actor, value, and condition. A nonzero condition returns early
 * when record +0x29c halfword +0x40 is zero. Otherwise compare callback pair
 * +0x208/+0x20c against data_020e16b0+0x20/data_020e16d0+4. Nonmatching pairs
 * forward actor/value/condition to Actor_ApplyMotionImpulse. A matching pair
 * first derives a temporary from value with ActorVector_DivideByScalar scale
 * 0x2000, then calls Actor_ApplyMotionImpulse(actor,temporary,0) and finalizes
 * it. Actor/transform state may change; no direct SDK or hardware access
 * occurs.
 */
void Type7Actor_ApplyCallbackAdjustedMotionImpulse(void *self,
                                                   const void *value,
                                                   s32 condition)
{
    u8 *actor = (u8 *)self;
    u32 temporary[4];
    s32 matches;
    if (condition != 0
        && *(u16 *)(*(u8 **)(actor + 0x29c) + 0x40) == 0) {
        return;
    }
    matches = *(void **)(actor + 0x208) == *(void **)(data_020e16b0 + 0x20)
        && (*(void **)(actor + 0x20c) == *(void **)(data_020e16d0 + 4)
            || *(void **)(actor + 0x208) == 0);
    if (!matches) {
        Actor_ApplyMotionImpulse(actor, value, condition);
        return;
    }
    ActorVector_DivideByScalar(temporary, value, 0x2000);
    Actor_ApplyMotionImpulse(actor, temporary, 0);
    VecFx32Object_Destroy(temporary);
}
