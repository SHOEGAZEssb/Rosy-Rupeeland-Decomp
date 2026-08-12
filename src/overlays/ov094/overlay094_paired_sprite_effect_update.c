#include "tingle/types.h"

/* Overlay 94 state-machine update for the paired title sprite effect. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern s32 func_02094dd4(void *effect);
#ifdef __cplusplus
}
#endif

/*
 * In state zero, waits for inherited motion completion, removes bit one from
 * both states' +0x24 flags, switches both to animation seven, and advances to
 * state one. State one waits for bit zero on the first state and advances to
 * state two. Returns one only in state two; sprite state changes are software
 * side and are submitted later by the group renderer.
 */
extern "C" s32 func_ov094_02219494(void *effect)
{
    s32 state = *(s32 *)((u8 *)effect + 0xa0);
    switch (state) {
    case 0:
        if (func_02094dd4(effect)) {
            void *firstState = *(void **)((u8 *)effect + 0x9c);
            *(u16 *)((u8 *)firstState + 0x24) &= ~2;
            GraphicsSpriteState_SetAnimationIndex(
                *(void **)((u8 *)effect + 0x9c), 7);

            void *secondState = *(void **)((u8 *)effect + 0xa4);
            *(u16 *)((u8 *)secondState + 0x24) &= ~2;
            GraphicsSpriteState_SetAnimationIndex(
                *(void **)((u8 *)effect + 0xa4), 7);
            *(s32 *)((u8 *)effect + 0xa0) += 1;
        }
        break;
    case 1:
        {
        u16 finished =
            *(u16 *)((u8 *)*(void **)((u8 *)effect + 0x9c) + 0x24) & 1;
        if (finished != 0) {
            *(s32 *)((u8 *)effect + 0xa0) = state + 1;
        }
        }
        break;
    case 2:
        return 1;
    }
    return 0;
}
