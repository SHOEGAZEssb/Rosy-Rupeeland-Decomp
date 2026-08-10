#include "tingle/types.h"

/* Scan nearby runtime actors for the type-0x6f descriptor collision response. */
extern s16 data_020c9670[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDerivedType1_IsActiveRecordType6F(void *actor);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *value);
extern void VecFx32Object_Init(void *value);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 category);
extern s32 func_0204cfa4(s32 x, s32 y);
extern void func_02034a60(void *actor, u32 sound, s32 extra);
extern void func_ov092_0221ad80(void *target, void *actor, s32 amount,
                                s32 scale);
extern void ActorDerivedType1_TrySetStateVector(void *actor, const void *vector, s32 value, s32 kind);
#ifdef __cplusplus
}
#endif

/*
 * Operate only for active descriptor type 0x6f and when actor timer +0x280 is
 * zero. Clear horizontal primary/secondary motion, set +0x280 to 40, and use
 * one third of descriptor signed radius +0x0c (converted to 20.12) to project
 * a scan center from position +0x18 along the orientation encoded by byte
 * +0xd4 and the shared sine table.
 *
 * Iterate runtime category one. Eligible subtype-four records require subtype
 * value 0x1e and virtual +0xd0 false; when inside the full radius, stop sound
 * 0x54, compute response amount/scale from descriptor ID 0x67/0x68 or defaults
 * 4/0x800, call the overlay-92 interaction, and install the target position as
 * state vector kind -1/value 15. Eligible subtype-seven actors must lack
 * +0x10 bit 0x1000000 and lie from 0x1000 up to the radius; dispatch their
 * virtual +0xb8 with a normalized direction and mode one. After scanning,
 * dispatch descriptor sound +0x2e through func_02034a60 and destroy the copied
 * center. Returns no value; collection, virtual, sound, overlay, and vector
 * helpers have observable engine state.
 */
void ActorDerivedType1_ScanActiveRecordCollisions(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor;
    s32 center[4];
    s32 radius;
    s32 projection;
    s32 index;
    s32 i;

    if (ActorDerivedType1_IsActiveRecordType6F(actor) == 0 || *(s16 *)(actor + 0x280) != 0)
        return;
    *(s32 *)(actor + 0x90) = 0;
    *(s32 *)(actor + 0x8c) = 0;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x3c) = 0;
    *(u16 *)(actor + 0x280) = 40;
    descriptor = *(u8 **)(actor + 0x27c);
    radius = *(s16 *)(descriptor + 0x0c) << 12;
    projection = func_020adae4(radius, 3);
    VecFx32Object_InitCopy(center, actor + 0x18);
    index = ((actor[0xd4] & 7) << 9) * 2;
    center[1] -= projection * data_020c9670[index];
    center[2] += projection * data_020c9670[index + 1];

    for (i = 0;; ++i) {
        u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
        u8 *target;
        s32 dx;
        s32 dy;
        s32 distance;
        if (i >= *(s32 *)(collection + 0x2e74))
            break;
        target = *(u8 **)(collection + i * 4);
        if (target == 0)
            continue;
        if (target[0x4d] == 4) {
            s32 amount;
            s32 scale;
            if (*(u16 *)(target + 0x4e) != 0x1e ||
                (*(s32 (**)(void *))(*(u8 **)target + 0xd0))(target) != 0)
                continue;
            dx = *(s32 *)(target + 0x1c) - center[1];
            dy = *(s32 *)(target + 0x20) - center[2];
            distance = func_0204cfa4(dx, dy);
            if (distance >= radius)
                continue;
            func_02034a60(actor, 0x54, 0);
            if (*(s16 *)descriptor == 0x67 || *(s16 *)descriptor == 0x68) {
                amount = 0x14 - (func_020adc90(distance, radius) >> 10);
                scale = 0x1ccd;
            } else {
                amount = 4;
                scale = 0x800;
            }
            func_ov092_0221ad80(target, actor, amount, scale);
            ActorDerivedType1_TrySetStateVector(actor, target + 0x18, 15, -1);
        } else if (target[0x4d] == 7 &&
                   (*(u32 *)(target + 0x10) & 0x1000000) == 0) {
            s32 direction[4];
            dx = *(s32 *)(target + 0x1c) - center[1];
            dy = *(s32 *)(target + 0x20) - center[2];
            distance = func_0204cfa4(dx, dy);
            if (distance < 0x1000 || distance >= radius)
                continue;
            VecFx32Object_Init(direction);
            direction[1] = func_020adc90(dx, distance);
            direction[2] = func_020adc90(dy, distance);
            (*(void (**)(void *, const void *, s32))
                (*(u8 **)target + 0xb8))(target, direction, 1);
            VecFx32Object_Destroy(direction);
        }
    }
    if (*(u16 *)(descriptor + 0x2e) != 0)
        func_02034a60(actor, *(u16 *)(descriptor + 0x2e), 0);
    VecFx32Object_Destroy(center);
}
