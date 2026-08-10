#include "tingle/types.h"

/* Reset the motion-probe actor's random-motion configuration and working vectors. */
#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *vector);
#ifdef __cplusplus
}
#endif

/* Clear one actor vector through the recovered temporary-vector lifecycle. */
static void clearVector(u8 *actor, u32 offset)
{
    s32 zero[4];
    func_0200500c(zero, 0, 0, 0);
    func_020050a4(actor + offset, zero);
    func_02005058(zero);
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
