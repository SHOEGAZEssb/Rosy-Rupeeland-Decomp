#include "tingle/types.h"

/*
 * Recovered extended type-two actor velocity update. The routine derives a
 * direction and magnitude from actor transforms, optionally clamps it through
 * indexed world data, and updates the actor's fixed-point motion fields.
 */
extern s16 data_020c9670[];
extern u8 data_020e0f28[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32_Subtract(void *result, const void *from, const void *to);
extern s32 Fx32Vector2_Magnitude(s32 y, s32 x);
extern void *GamePhaseRuntime_GetActorCollection(void *context, s32 index);
extern s32 func_020ae024(s32 y, s32 x);
extern s32 func_020adae4(s32 value, s32 shift);
extern void VecFx32Object_Destroy(void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Copy targetTransform into actor transform +0x78, derive a temporary
 * displacement from +0x78 to +0x18, and obtain its magnitude. Magnitudes above
 * 0x2000 are optionally
 * limited using virtual +0xc8 output, actor +0x256, the primary actor selected
 * from data_021052fc, and the 0x3c-byte records in data_020e0f28 when +0xd0
 * bit one is set; otherwise the signed virtual-output halfword supplies the
 * limit. Positive magnitudes become angle-derived +0x3c/+0x40 velocities using
 * data_020c9670. Actor +0x14 bit 0x40 selects a 0x19a/0xe66 fixed-point blend
 * with +0x8c/+0x90; state becomes five or six according to +0xd0 bit one.
 * Nonpositive magnitude clears velocity and enters state one. With +0xd0 bit
 * two, virtual +0x30 may also clear +0x8c/+0x90/+0x94. The temporary transform
 * is finalized with VecFx32Object_Destroy. The routine has no meaningful return value;
 * actor, virtual, transform, and world-query state may change, with no direct
 * hardware access.
 */
void ActorExtendedType2_UpdateTargetMotion(void *self,
                                           const void *targetTransform)
{
    u8 *actor = (u8 *)self;
    u8 query[0x30];
    u8 limits[0x10];
    s32 magnitude;

    VecFx32Object_Assign(actor + 0x78, targetTransform);
    VecFx32_Subtract(query, actor + 0x78, actor + 0x18);
    magnitude = Fx32Vector2_Magnitude(*(s32 *)(query + 8), *(s32 *)(query + 4));

    if (magnitude > 0x2000) {
        s32 limit;
        (*(void (**)(void *, void *))(*(u8 **)actor + 0xc8))(actor, limits);
        if ((*(u32 *)(actor + 0xd0) & 2) != 0) {
            u16 index = *(u16 *)(actor + 0x256) >> 2;
            u8 *context = *(u8 **)data_021052fc;
            u8 *primary = *(u8 **)((u8 *)GamePhaseRuntime_GetActorCollection(context, 1) + 0x2e7c);
            s16 row = ((*(s32 (**)(void *))(*(u8 **)primary + 0xa8))(primary) != 0)
                          ? *(s16 *)(limits + 4) : *(s16 *)(limits + 2);
            u16 column = *(u16 *)(limits + 6);
            limit = *(u16 *)(data_020e0f28 + (row + (column << 4)) * 0x3c +
                             index * 2) << 4;
            if (magnitude < limit)
                limit = magnitude;
        } else {
            limit = *(s16 *)limits << 4;
        }

        *(u16 *)(actor + 0xde) = 0x100;
        if (limit > 0) {
            s32 angle = func_020ae024(*(s32 *)(query + 8), *(s32 *)(query + 4)) >> 4;
            s32 velocityX = (limit * data_020c9670[angle * 2 + 1]) >> 12;
            s32 velocityY = (limit * data_020c9670[angle * 2]) >> 12;
            if ((*(u32 *)(actor + 0x14) & 0x40) == 0) {
                *(s32 *)(actor + 0x3c) = velocityX;
                *(s32 *)(actor + 0x40) = velocityY;
            } else {
                *(s32 *)(actor + 0x8c) =
                    (s32)(((s64)velocityX * 0x19a +
                           (s64)*(s32 *)(actor + 0x8c) * 0xe66 + 0x800) >> 12);
                *(s32 *)(actor + 0x90) =
                    (s32)(((s64)velocityY * 0x19a +
                           (s64)*(s32 *)(actor + 0x90) * 0xe66 + 0x800) >> 12);
                *(s32 *)(actor + 0x3c) = velocityX;
                *(s32 *)(actor + 0x40) = velocityY;
            }
            *(u16 *)(actor + 0xd6) =
                ((*(u32 *)(actor + 0xd0) & 2) != 0) ? 6 : 5;
        } else {
            *(u16 *)(actor + 0xd6) = 2;
        }
    } else {
        if (*(s16 *)(actor + 0xd8) == 6) {
            *(s32 *)(actor + 0x8c) = func_020adae4(*(s32 *)(actor + 0x3c), 2);
            *(s32 *)(actor + 0x90) = func_020adae4(*(s32 *)(actor + 0x40), 2);
        }
        *(s32 *)(actor + 0x40) = 0;
        *(s32 *)(actor + 0x3c) = 0;
        *(u16 *)(actor + 0xd6) = 1;
    }

    if ((*(u32 *)(actor + 0xd0) & 4) != 0 &&
        (*(s32 (**)(void *))(*(u8 **)actor + 0x30))(actor) != 0) {
        *(u32 *)(actor + 0x94) = 0;
        *(u32 *)(actor + 0x90) = 0;
        *(u32 *)(actor + 0x8c) = 0;
    }
    VecFx32Object_Destroy(query);
}
