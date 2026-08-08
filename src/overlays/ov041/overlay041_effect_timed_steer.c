#include "tingle/types.h"

/*
 * Overlay 41 timed effect steering. This recovered helper delays, tracks the
 * linked object for a short window, then steers upward until crossing its
 * stored vertical target and entering mode three.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_020ae024(s32, s32);

/*
 * Increment object+0x930. During frames 41 through 69, write a 0xA0-speed turn
 * toward the linked object's position; after frame 140, write the same speed
 * toward vector (0,-0x1000). Once object+0x4B4 lies above record zero, select
 * state one or two from the record's horizontal half, set value delta 0xCD,
 * enter mode three, and clear timers. angleOut/speedOut are otherwise
 * untouched. No SDK or hardware state is changed.
 */
extern "C" void func_ov041_022024c8(void *object, s32 *angleOut, s32 *speedOut)
{
    s32 timer = ++FIELD(s32, object, 0x930);
    if (timer > 40 && timer < 70) {
        void *linked =
            FIELD(void *, FIELD(void *, object, 0x48), 8);
        s32 angle = func_020ae024(
            FIELD(s32, linked, 0xd4) - FIELD(s32, object, 0x6c),
            FIELD(s32, linked, 0xd8) - FIELD(s32, object, 0x70));
        if (angle < 0)
            angle += 0x10000;
        *angleOut = angle - FIELD(s32, object, 0x4b8);
        *speedOut = 0xa0;
    }
    if (timer > 140) {
        s32 angle = func_020ae024(0, -0x1000);
        if (angle < 0)
            angle += 0x10000;
        *angleOut = angle - FIELD(s32, object, 0x4b8);
        *speedOut = 0xa0;
    }
    if (FIELD(s32, object, 0x4b4) > FIELD(s32, object, 0x70)) {
        FIELD(s32, object, 0x91c) =
            FIELD(s32, object, 0x6c) > 0x80000 ? 1 : 2;
        FIELD(s32, object, 0x928) = 0xcd;
        FIELD(s32, object, 0x920) = 3;
        FIELD(s32, object, 0x934) = 0;
        FIELD(s32, object, 0x930) = 0;
    }
}
