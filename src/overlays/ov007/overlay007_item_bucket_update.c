#include "tingle/types.h"

/*
 * Overlay 7 item-bucket update. This recovered helper maps a caller value into
 * a 60-unit bucket and refreshes the fixed indicator object when it changes.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 dividend, s32 divisor);
extern void GraphicsSpriteState_SetAnimationIndex(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Compute bucket `func_020befec(value+59,60)`. Return immediately when it equals
 * state +0x98 or is >=11. Otherwise store it at +0x98, set scale timer +0x9C
 * to 0x200, and when bucket is 10 submit value 3 to primary +0x4C member +0x0C.
 * Clear bit 2 in fixed object +0x78 halfword +0x42, submit the low eight bits
 * of bucket to its +0x0C member, and write 0x200 to its +0x3C/+0x3E halfwords.
 * Return no value. Object/palette effects are delegated; bucket arithmetic,
 * thresholds, flags, and scale writes are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fc0dc(void *state, s32 value)
{
    s32 bucket = func_020befec(value + 59, 60);
    void *object;

    if (bucket == *(s32 *)((u8 *)state + 0x98) || bucket >= 11) {
        return;
    }
    *(s32 *)((u8 *)state + 0x98) = bucket;
    *(s32 *)((u8 *)state + 0x9c) = 0x200;
    if (bucket == 10) {
        void *primary = *(void **)((u8 *)state + 0x4c);
        GraphicsSpriteState_SetAnimationIndex((u8 *)primary + 0x0c, 3);
    }
    object = *(void **)((u8 *)state + 0x78);
    *(u16 *)((u8 *)object + 0x42) &= ~4;
    GraphicsSpriteState_SetAnimationIndex((u8 *)object + 0x0c, bucket & 0xff);
    *(u16 *)((u8 *)object + 0x3c) = 0x200;
    *(u16 *)((u8 *)object + 0x3e) = 0x200;
}
