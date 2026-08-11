#include "tingle/types.h"

/* Overlay 25 effect-hook and packed-sound event dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *, s32, s32);
extern void func_020954e0(void *);
extern void func_020954f4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Dispatches `event` for `object`. Type zero invokes the selected effect hook;
 * type one decodes a low-halfword sound group and ID and plays it through the
 * shared sound context. Handled events return 2; unknown types return 1.
 */
extern "C" s32 func_ov025_021ff158(void *object, const void *event)
{
    switch (FIELD(s32, event, 0)) {
    case 0:
        if (FIELD(s32, event, 4)) {
            func_020954e0(object);
        } else {
            func_020954f4(object);
        }
        return 2;
    case 1: {
        u16 packed = (u16)FIELD(s32, event, 4);
        Sound_Play(gSoundContext, packed >> 7, packed & 0x7f);
        return 2;
    }
    default:
        return 1;
    }
}
