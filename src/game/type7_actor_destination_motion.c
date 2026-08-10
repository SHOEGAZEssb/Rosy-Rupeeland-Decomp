#include "tingle/types.h"

/*
 * Recovered type-seven destination motion and completion reset. The update
 * advances an actor toward a saved transform using the shared direction table;
 * the reset restores callback and global-target state once it arrives.
 */
extern s16 data_020c9670[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *destination, const void *source);
extern void func_0200b2c0(void *value, s32 x, s32 y, s32 z);
extern void ActorDerivedType1_SetSpecialModeEnabled(void *object, s32 mode);
extern void Type7Actor_SelectRandomCallback(void *actor);
extern void Type7Actor_CompleteDestinationMotion(void *actor);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Clear actor flag 0x8000, set +0xd0 bit one,
 * and copy destination transform +0x284 to temporary transform +0x78. Measure
 * the X/Y delta from current transform +0x18 with func_0204cfa4. If it is less
 * than one fx32 unit (0x1000), select presentation two, snap current transform
 * to the destination, and run Type7Actor_CompleteDestinationMotion.
 *
 * Otherwise select presentation 10, clear the vector-like values at
 * +0x38/+0x88/+0x98, derive a direction with func_020ae024, and compute a step
 * from four times +0x23c through func_020adae4(..., 2), clamped to the measured
 * distance. Multiply that step by the corresponding data_020c9670 direction
 * pair with fx32 rounding, advance X/Y +0x1c/+0x20, and copy current transform
 * +0x18 to +0x28. Always return zero. Actor transform, presentation, vector,
 * and callback state may change; no SDK or hardware effects occur directly.
 */
s32 Type7Actor_UpdateDestinationMotion(void *self)
{
    u8 *actor = (u8 *)self;
    s32 dx;
    s32 dy;
    s32 distance;

    *(u32 *)(actor + 0x268) &= ~0x8000;
    *(u32 *)(actor + 0xd0) |= 2;
    func_020050a4(actor + 0x78, actor + 0x284);
    dx = *(s32 *)(actor + 0x7c) - *(s32 *)(actor + 0x1c);
    dy = *(s32 *)(actor + 0x80) - *(s32 *)(actor + 0x20);
    distance = func_0204cfa4(dx, dy);
    if (distance < 0x1000) {
        *(u16 *)(actor + 0xd6) = 2;
        func_020050a4(actor + 0x18, actor + 0x78);
        Type7Actor_CompleteDestinationMotion(actor);
    } else {
        s32 direction;
        s32 index;
        s32 step;
        s64 product;

        *(u16 *)(actor + 0xd6) = 10;
        func_0200b2c0(actor + 0x38, 0, 0, 0);
        func_0200b2c0(actor + 0x88, 0, 0, 0);
        func_0200b2c0(actor + 0x98, 0, 0, 0);
        direction = func_020ae024(dy, dx);
        step = func_020adae4(*(s32 *)(actor + 0x23c) << 2, 2);
        if (distance <= step)
            step = distance;
        index = direction >> 4;
        product = (s64)data_020c9670[index * 2 + 1] * step + 0x800;
        *(s32 *)(actor + 0x1c) += (s32)(product >> 12);
        product = (s64)data_020c9670[index * 2] * step + 0x800;
        *(s32 *)(actor + 0x20) += (s32)(product >> 12);
        func_020050a4(actor + 0x28, actor + 0x18);
    }
    return 0;
}

/*
 * Input is a type-seven actor that completed destination motion. Clear actor
 * flags 0x80000 and four, clear +0x14 bits two/four, set +0x14 bit 0x2000000,
 * pass the global object at data_021052fc+0x2ea4 to ActorDerivedType1_SetSpecialModeEnabled with mode
 * zero, and select a fresh randomized callback through Type7Actor_SelectRandomCallback. Actor,
 * global-object, random, and callback state may change; there is no return
 * value or direct hardware access.
 */
void Type7Actor_CompleteDestinationMotion(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *globalObject = *(u8 **)(data_021052fc + 0x2ea4);
    *(u32 *)(actor + 0x268) &= ~(0x80000 | 4);
    *(u32 *)(actor + 0x14) =
        (*(u32 *)(actor + 0x14) & ~(2 | 4)) | 0x2000000;
    ActorDerivedType1_SetSpecialModeEnabled(globalObject, 0);
    Type7Actor_SelectRandomCallback(actor);
}
