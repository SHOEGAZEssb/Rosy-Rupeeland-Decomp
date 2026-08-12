#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Periodic tracked-effect spawning for the overlay-90 boss-stage controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void func_ov090_0221a460(VecFx32Object *destination,
                                const VecFx32Object *first,
                                const VecFx32Object *second);
extern void *TrackedResourceActor_SpawnFromKey(s32 key,
                                               const VecFx32Object *position,
                                               const VecFx32Object *target);
extern s64 func_020befec(s32 numerator, s32 denominator);

/*
 * Increment timer +0x1f2 and spawn only when it reaches delay +0x236. The
 * state sum at +0x246 selects a cycle limit of 0, 3, 5, or 10. Before that
 * limit, spawn key 0x13 with one of five X offsets; at/after the limit, spawn
 * key 0x14 toward the global actor. Apply the recovered scale, flag, sprite,
 * and bounds fields, wrap byte +0x1ee, and destroy all temporary vectors.
 */
void func_ov090_0221ab4c(void *self)
{
    VecFx32Object position;
    s32 cycleLimit;
    void *effect;

    FIELD(u16, self, 0x1f2)++;
    if (FIELD(u16, self, 0x1f2) < FIELD(u16, self, 0x236))
        return;
    FIELD(u16, self, 0x1f2) = 0;
    VecFx32Object_InitComponents(&position, 0x200000, 0x136000, 0);

    switch (FIELD(u8, self, 0x246)) {
    case 0:
        cycleLimit = 0;
        break;
    case 1:
    case 2:
    case 3:
        cycleLimit = 3;
        break;
    case 4:
    case 5:
    case 6:
        cycleLimit = 5;
        break;
    case 7:
    case 8:
    case 9:
    default:
        cycleLimit = 10;
        break;
    }

    if (FIELD(u8, self, 0x1ee) >= cycleLimit) {
        effect = TrackedResourceActor_SpawnFromKey(
            0x14, &position,
            (const VecFx32Object *)((u8 *)FIELD(void *, data_021052fc, 0x2ea4) +
                                    0x18));
        FIELD(u32, effect, 0x20c) = 0x8000;
        FIELD(u32, effect, 0x10) |= 0x100;
        FIELD(s16, effect, 0x62) -= 0x10;
        FIELD(s16, effect, 0x66) += 8;
    } else {
        VecFx32Object target;
        VecFx32Object offset;
        VecFx32Object_InitComponents(&offset, 0, 0x20000, 0);
        func_ov090_0221a460(&target, &position, &offset);
        VecFx32Object_Destroy(&offset);
        /* func_020befec returns quotient:remainder; retail switches on r1. */
        switch ((s32)(func_020befec(FIELD(u8, self, 0x1ee), 5) >> 32)) {
        case 1:
            target.value.x += 0x8000;
            break;
        case 2:
            target.value.x -= 0x18000;
            break;
        case 3:
            target.value.x -= 0x8000;
            break;
        case 4:
            target.value.x += 0x18000;
            break;
        }
        effect = TrackedResourceActor_SpawnFromKey(0x13, &position, &target);
        FIELD(u32, effect, 0x20c) = 0x8000;
        FIELD(u32, effect, 0x10) |= 0x100;
        FIELD(u8, FIELD(void *, effect, 0x54), 0x3a) = 1;
        FIELD(u16, FIELD(void *, effect, 0x54), 0x28) = 0x240;
        FIELD(s16, effect, 0x62) -= 0x10;
        FIELD(s16, effect, 0x66) += 8;
        VecFx32Object_Destroy(&target);
    }

    FIELD(u8, self, 0x1ee)++;
    if (FIELD(u8, self, 0x1ee) > cycleLimit)
        FIELD(u8, self, 0x1ee) = 0;
    VecFx32Object_Destroy(&position);
}
