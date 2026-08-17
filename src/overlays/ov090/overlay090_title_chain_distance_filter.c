#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Distance correction used by the articulated overlay-90 boss-stage chain. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern s32 SignedAbsoluteValue(s32 value);
extern void func_ov090_0221b3d0(VecFx32Object *vector, fx32 scale);

/*
 * Convert a nonzero displacement into a correction when its magnitude differs
 * from the chain's target distance at +0x0C by more than one fixed-point unit.
 * The returned flag says whether `difference` was normalized and rescaled.
 */
s32 func_ov090_0221c350(void *self, VecFx32Object *difference)
{
    fx32 magnitude = VecFx32Object_GetMagnitude(difference);
    fx32 delta = SignedAbsoluteValue(magnitude - FIELD(fx32, self, 0x0c));

    if (delta > 0x1000 &&
        (difference->value.x != 0 || difference->value.y != 0 ||
         difference->value.z != 0)) {
        VecFx32Object_Normalize(difference);
        if (magnitude < FIELD(fx32, self, 0x0c))
            func_ov090_0221b3d0(difference, -0x2000);
        func_ov090_0221b3d0(difference, delta);
        return 1;
    }
    return 0;
}
