#include "tingle/types.h"

/*
 * Overlay 7 primary-jitter trigger. This recovered helper changes the primary
 * object's value and enables the random render jitter state.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Submit value 1 through the pointer stored at primary offset +0x0C, set byte +0xA1
 * to one, clear byte +0xA0, and clear word +0x98. Return no value. Object effects
 * are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fc16c(void *state)
{
    void *primary = *(void **)((u8 *)state + 0x4c);

    GraphicsSpriteState_SetAnimationIndex(*(void **)((u8 *)primary + 0x0c), 1);
    *(u8 *)((u8 *)state + 0xa1) = 1;
    *(u8 *)((u8 *)state + 0xa0) = 0;
    *(s32 *)((u8 *)state + 0x98) = 0;
}
