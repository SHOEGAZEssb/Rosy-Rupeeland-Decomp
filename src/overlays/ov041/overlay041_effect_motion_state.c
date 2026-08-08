#include "tingle/types.h"

/*
 * Overlay 41 primary effect motion. This recovered controller advances the
 * first effect record through approach, tracking, and exit states while
 * producing an angle delta and movement magnitude for its caller.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020ae024(s32, s32);
u32 genrand_int32(void);
s32 func_ov041_022009e8(void *);
void func_ov041_022013cc(void *, s32, s32, s32);
void func_ov041_02202a00(void *);
s32 func_ov041_02202aa4(void *);
void Sound_Play(void *, s32, s32);
extern void *gSoundContext;
}

/*
 * Advance the motion state at object+0x91C and write the requested angular
 * adjustment and speed through angleOut/speedOut. State zero waits for record
 * zero to cross the target height. State one tracks object+0x4B0/0x4B4, adds
 * timed jitter, and chooses a follow-up mode when its timer expires. State two
 * steers upward, then either retriggers mode nine or resets all 91 records.
 * Mode four can start a falling-value phase and plays sound 0x12D. The helper
 * changes effect, timer, and record state; its callees may use audio and random
 * number services. Several gameplay labels remain inferred from control flow.
 */
extern "C" void func_ov041_022017f8(void *object, s32 *angleOut, s32 *speedOut)
{
    s32 state = FIELD(s32, object, 0x91c);
    if (state == 0) {
        *angleOut = func_ov041_02202aa4(object);
        if (FIELD(s32, object, 0x4b4) > FIELD(s32, object, 0x70)) {
            FIELD(s32, object, 0x91c) = 1;
            func_ov041_02202a00(object);
        }
        return;
    }

    if (state == 1) {
        s32 timer = FIELD(s32, object, 0x930);
        if (timer > 0 && timer % 60 == 0)
            func_ov041_02202a00(object);
        s32 angle = func_020ae024(
            FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c),
            FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70));
        if (angle < 0)
            angle += 0x10000;
        *angleOut = angle - FIELD(s32, object, 0x4b8);
        *speedOut = 250;

        if (timer > 0) {
            *angleOut += func_ov041_02202aa4(object) * 20;
            timer--;
            FIELD(s32, object, 0x930) = timer;
            if (timer <= 0) {
                void *owner = FIELD(void *, object, 0x48);
                void *linked = FIELD(void *, owner, 8);
                void *view = FIELD(void *, owner, 0x14);
                s32 relativeY =
                    FIELD(s32, linked, 0xd8) - FIELD(s32, view, 0x15c);
                s32 choice;
                if (relativeY < -0x12c000)
                    choice = 0;
                else if (relativeY <= -0xc0000)
                    choice = 2;
                else
                    choice = func_ov041_022009e8(view) ? 1 : 2;

                if (choice == 0) {
                    FIELD(s32, object, 0x920) = 11;
                    FIELD(s32, object, 0x91c) = 0;
                    FIELD(s32, object, 0x934) = 0;
                } else if (choice == 1) {
                    s32 column = (s32)(genrand_int32() % 3) - 1;
                    FIELD(s32, object, 0x4b0) =
                        (column * 0x50 + 0x80) << 12;
                    FIELD(s32, object, 0x4b4) = 0x12c000;
                } else {
                    FIELD(s32, object, 0x920) = 6;
                    FIELD(s32, object, 0x91c) = 0;
                    FIELD(s32, object, 0x934) = 0;
                    s32 side = 2 - func_ov041_022009e8(view);
                    FIELD(s32, object, 0x92c) = side >= 1 ? side + 1 : side;
                }
            }
        }

        if (FIELD(s32, object, 0x920) == 4 &&
            FIELD(s32, object, 0x930) <= 0) {
            FIELD(s32, object, 0x4b4) =
                FIELD(s32, object, 0x70) + 0x96000;
            if (FIELD(s32, object, 0x928) == 0 &&
                FIELD(s32, object, 0x70) > 0x78000) {
                FIELD(s32, object, 0x928) = -20;
                FIELD(s32, object, 0x91c)++;
                Sound_Play(gSoundContext, 0x12d, 1);
            }
        }
        return;
    }

    if (state != 2)
        return;

    FIELD(s32, object, 0x4b4) = FIELD(s32, object, 0x70) + 0x96000;
    s32 angle = func_020ae024(
        FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c), 0x96000);
    if (angle < 0)
        angle += 0x10000;
    *angleOut = angle - FIELD(s32, object, 0x4b8);
    *speedOut = 0x320;
    if (FIELD(s32, object, 0x624) >= 0xccd ||
        FIELD(s32, object, 0x4a8) <= 0xe0000)
        return;

    FIELD(s32, object, 0x920) = 8;
    FIELD(s32, object, 0x91c) = 0;
    FIELD(s32, object, 0x930) = 0;
    void *owner = FIELD(void *, object, 0x48);
    void *view = FIELD(void *, owner, 0x14);
    s32 screenY = FIELD(s32, view, 0x15c);
    s32 worldY = FIELD(s32, object, 0x4a8) + FIELD(s32, owner, 0x194);
    if (screenY < worldY) {
        func_ov041_022013cc(object, 9, FIELD(s32, object, 0x4b0),
                            screenY + 0x28000);
        FIELD(s32, object, 0x4b4) = 0x14000;
        return;
    }

    for (s32 i = 90; i >= 0; --i) {
        FIELD(s32, object, 0x6c + i * 12) = FIELD(s32, object, 0x4b0);
        FIELD(s32, object, 0x70 + i * 12) = 0x118000;
        FIELD(s32, object, 0x4b8 + i * 4) = 0x8000;
        FIELD(s32, object, 0x624 + i * 4) = 0;
    }
    FIELD(s32, object, 0x4b4) = 0x118000;
}
