#include "tingle/types.h"

/* Overlay 36 six-state quad-controller child-spawn sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_022054e0[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_PlayDirectSequence(void *sound, s32 id, s32 value);
extern void Sound_StopDirectSequence(void *sound, s32 id, s32 value);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void func_02091b98(void *timer, s32 duration);
extern void func_ov036_02202628(void *controller);
extern void PresentationList_UpdateAndDeleteCompleted(void *list);
#ifdef __cplusplus
}
#endif

/*
 * Advances state +0xA0 while spawning the table-driven oscillating children.
 * State 0 starts sound 0xB1 at 0x7F and falls through. State 1 waits for timer
 * +0xA4, spawns one child, then uses the next 0x10-byte
 * data_ov036_022054e0 record: variant zero starts a 90-frame pause and advances
 * state, while other variants restart at 30 frames. State 2 waits, spawns, sets
 * 60 frames, and advances. State 3 repeatedly spawns at 30-frame intervals;
 * once index +0x15C reaches 15 it instead starts 60 frames and advances.
 * State 4 waits, lowers sound 0xB1 to 0x10, and advances. State 5 reports
 * completion. Lists +0xFC/+0x10C are serviced on every call. Returns one only
 * in state 5; timers, sound, heap/children, lists, index, and state may change.
 */
extern "C" s32 func_ov036_02202790(void *controller)
{
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        Sound_PlayDirectSequence(gSoundContext, 0xb1, 0x7f);
        ++FIELD(s32, controller, 0xa0);
        /* The recovered jump table intentionally continues into state 1. */
    case 1:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            func_ov036_02202628(controller);
            s32 index = FIELD(s32, controller, 0x15c);
            s32 nextVariant =
                *(const s32 *)(data_ov036_022054e0 + index * 0x10);
            if (nextVariant == 0) {
                func_02091b98((u8 *)controller + 0xa4, 0x5a);
                ++FIELD(s32, controller, 0xa0);
            } else {
                func_02091b98((u8 *)controller + 0xa4, 0x1e);
            }
        }
        break;
    case 2:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            func_ov036_02202628(controller);
            func_02091b98((u8 *)controller + 0xa4, 0x3c);
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 3:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            func_ov036_02202628(controller);
            func_02091b98((u8 *)controller + 0xa4, 0x1e);
            if ((u32)FIELD(s32, controller, 0x15c) >= 0xf) {
                func_02091b98((u8 *)controller + 0xa4, 0x3c);
                ++FIELD(s32, controller, 0xa0);
            } else {
                func_02091b98((u8 *)controller + 0xa4, 0x1e);
            }
        }
        break;
    case 4:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Sound_StopDirectSequence(gSoundContext, 0xb1, 0x10);
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 5:
        PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0xfc);
        PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x10c);
        return 1;
    }
    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0xfc);
    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x10c);
    return 0;
}
