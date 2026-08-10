#include "tingle/types.h"

/* Overlay 25 randomized animation-cycle setup for the title effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GraphicsSpriteState_GetSequenceDuration(void *);
extern s32 func_0209189c(u32 *, s32, s32);
extern void func_ov025_021fe174(void *, s32, s32, s32);
extern void func_ov025_021fe904(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Selects resource one and `animation`, reads its sequence duration, multiplies
 * by a random value in 5..9, and starts that wait. Sprite, RNG, and timer state
 * change; returns no value.
 */
extern "C" void func_ov025_021feb08(void *object, s32 animation)
{
    func_ov025_021fe174(object, 1, animation, 2);
    s32 frames = GraphicsSpriteState_GetSequenceDuration(FIELD(void *, object, 0xe8));
    s32 repetitions = func_0209189c((u32 *)object + 0x3e, 5, 10);
    func_ov025_021fe904(object, frames * repetitions);
}
