#include "tingle/types.h"

/* Reset the motion-probe actor's random-motion configuration and working vectors. */
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
#ifdef __cplusplus
}
#endif

/* Clear one actor vector through the recovered temporary-vector lifecycle. */
static void clearVector(u8 *actor, u32 offset)
{
    s32 zero[4];
    VecFx32Object_InitComponents(zero, 0, 0, 0);
    VecFx32Object_Assign(actor + offset, zero);
    VecFx32Object_Destroy(zero);
}

/*
 * Clear range words +0x244/+0x248, set duration +0x24c to one, clear
 * amplitude/phase-step +0x250/+0x254 and timer +0x240, then zero vectors
 * +0x220, +0x210, and +0x230 in that order. Returns no value; vector helpers
 * run their normal temporary-state lifecycle and actor configuration changes.
 */
void ActorMotionProbe_ResetMotion(void *self)
{
    u8 *actor = (u8 *)self;
    *(s32 *)(actor + 0x244) = 0;
    *(s32 *)(actor + 0x248) = 0;
    *(s32 *)(actor + 0x24c) = 1;
    *(s32 *)(actor + 0x250) = 0;
    *(s32 *)(actor + 0x254) = 0;
    *(s32 *)(actor + 0x240) = 0;
    clearVector(actor, 0x220);
    clearVector(actor, 0x210);
    clearVector(actor, 0x230);
}
