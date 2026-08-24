#include "tingle/types.h"

/*
 * Overlay 39 helper launch-vector calculation. These recovered routines claim
 * the first helper in state four, seed its position, and derive a fixed-point
 * velocity from the shared trigonometric table and an atan-like SDK helper.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039VectorObject {
    s32 field_00;
    s32 x_04;
    s32 y_08;
    s32 field_0c;
} Overlay039VectorObject;

extern const s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitCopy(Overlay039VectorObject *destination, void *source);
extern void VecFx32Object_Destroy(void *object);
extern s32 func_020ae024(s32 x, s32 y);
#ifdef __cplusplus
}
#endif

static s32 scaledDirection(s16 component)
{
    /* 0x1B33 is the confirmed velocity magnitude; round at bit 11. */
    return (s32)(((s64)component * 0x1b33 + 0x800) >> 12);
}

/*
 * Copy the vector-like value at scene object +0x98's +0x1C into a temporary,
 * then add 0xA000 to its y coordinate. Scan helper pointers +0xA0..+0x114
 * downward for the first record whose +0x18 equals four. Seed helper +4/+8
 * from that temporary. If both target inputs are zero use direction (0,0xFA0);
 * otherwise use target minus the seeded position. Add angleOffset, retain its
 * low halfword, divide by 16, and index interleaved signed trig values to store
 * velocity at helper +0x10/+0x14, scaled by 0x1B33 with 0x800 rounding. Clear
 * helper +0x18/+0x1C and stop after one helper. Always destroy the temporary.
 * Returns no value; helper state and temporary SDK-object state change.
 */
extern "C" void func_ov039_021fd93c(void *scene, s32 targetX, s32 targetY,
                                     s32 angleOffset)
{
    Overlay039VectorObject position;
    void *sourceObject = FIELD(void *, scene, 0x98);
    VecFx32Object_InitCopy(&position, (u8 *)sourceObject + 0x1c);
    position.y_08 += 0xa000;

    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        if (FIELD(s32, helper, 0x18) != 4) {
            continue;
        }
        FIELD(s32, helper, 4) = position.x_04;
        FIELD(s32, helper, 8) = position.y_08;
        s32 dx;
        s32 dy;
        if (targetX == 0 && targetY == 0) {
            dx = 0;
            dy = 0xfa0;
        } else {
            dx = targetX - position.x_04;
            dy = targetY - position.y_08;
        }
        u16 angle = (u16)(func_020ae024(dx, dy) + angleOffset);
        s32 index = ((s32)angle) >> 4;
        FIELD(s32, helper, 0x10) = scaledDirection(gFx32CosSinTable[index * 2 + 1]);
        FIELD(s32, helper, 0x14) = scaledDirection(gFx32CosSinTable[index * 2]);
        FIELD(u32, helper, 0x18) = 0;
        FIELD(u32, helper, 0x1c) = 0;
        break;
    }
    VecFx32Object_Destroy(&position);
}

/*
 * Scan the same helper array downward for the first +0x18==4 record. Store
 * currentX/currentY at +4/+8, derive direction from target-current or the
 * default (0,0xFA0), divide the returned angle by 16, and install the same
 * 0x1B33-scaled trig velocity at +0x10/+0x14 before clearing +0x18/+0x1C.
 * Inputs are scene, target pair, and current pair (currentY is stack-passed).
 * Returns no value; at most one helper changes.
 */
extern "C" void func_ov039_021fda80(void *scene, s32 targetX, s32 targetY,
                                     s32 currentX, s32 currentY)
{
    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        if (FIELD(s32, helper, 0x18) != 4) {
            continue;
        }
        FIELD(s32, helper, 4) = currentX;
        FIELD(s32, helper, 8) = currentY;
        s32 dx;
        s32 dy;
        if (targetX == 0 && targetY == 0) {
            dx = 0;
            dy = 0xfa0;
        } else {
            dx = targetX - currentX;
            dy = targetY - currentY;
        }
        s32 index = func_020ae024(dx, dy) >> 4;
        FIELD(s32, helper, 0x10) = scaledDirection(gFx32CosSinTable[index * 2 + 1]);
        FIELD(s32, helper, 0x14) = scaledDirection(gFx32CosSinTable[index * 2]);
        FIELD(u32, helper, 0x18) = 0;
        FIELD(u32, helper, 0x1c) = 0;
        return;
    }
}
