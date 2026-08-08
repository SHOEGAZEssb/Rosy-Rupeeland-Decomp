#include "tingle/types.h"

/*
 * Overlay 41 effect triggering and status. These recovered routines initialize
 * one of several effect modes across the 91-record pool and report whether an
 * effect mode remains active.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void Sound_Play(void *, s32, s32);
void func_02072d04(void *);
void func_ov041_02202a70(void *);
extern void *gSoundContext;
}

/*
 * Reset effect completion and configure modes 1,2,3,9,14 as observed. Mode one
 * stores X, anchors central Y to cameraY-0xC8000, sets count 13, plays sound
 * 0x12D on channel 11, clears timers and initializes an auxiliary structure.
 * Mode two anchors to the linked object's position and sets count two. Mode
 * three uses Y=-0x82000, count four, timer 120 and per-record value 0x1000.
 * Modes nine/fourteen use caller X/Y; mode fourteen additionally hides and
 * resets all seven render children. Every mode rewrites all 91 record positions
 * to (x,y-0x14000), velocities to 0x8000, auxiliary arrays, and completion to
 * zero. No value is returned; audio/render state may change.
 */
extern "C" void func_ov041_022013cc(void *object, s32 mode, s32 x, s32 y)
{
    FIELD(s32, object, 0x928) = 0;
    s32 perRecordValue = 0;
    if (mode == 1) {
        FIELD(s32, object, 0x4b0) = x;
        FIELD(s32, object, 0x4b4) =
            FIELD(s32, FIELD(void *, object, 0x48), 0x194) - 0xc8000;
        FIELD(s32, object, 0x924) = 0;
        FIELD(s32, object, 0x920) = 13;
        Sound_Play(gSoundContext, 0x12d, 11);
        FIELD(s32, object, 0x930) = 0;
        FIELD(s32, object, 0x934) = 0;
        FIELD(s32, object, 0x91c) = 0;
    } else if (mode == 2) {
        void *linked = FIELD(void *, FIELD(void *, object, 0x48), 8);
        FIELD(s32, object, 0x4b0) = FIELD(s32, linked, 0xd4) - 0x46000;
        FIELD(s32, object, 0x4b4) = FIELD(s32, linked, 0xd8);
        FIELD(s32, object, 0x920) = 2;
        FIELD(s32, object, 0x91c) = 0;
    } else if (mode == 3) {
        FIELD(s32, object, 0x4b0) = x;
        FIELD(s32, object, 0x4b4) = -0x82000;
        FIELD(s32, object, 0x924) = 0;
        FIELD(s32, object, 0x920) = 4;
        FIELD(s32, object, 0x91c) = 0;
        FIELD(s32, object, 0x930) = 120;
        FIELD(s32, object, 0x934) = 0;
        perRecordValue = 0x1000;
    } else if (mode == 9 || mode == 14) {
        FIELD(s32, object, 0x4b0) = x;
        FIELD(s32, object, 0x4b4) = y;
        FIELD(s32, object, 0x924) = 0;
        FIELD(s32, object, 0x920) = mode;
        FIELD(s32, object, 0x91c) = 0;
        FIELD(s32, object, 0x934) = 0;
        FIELD(s32, object, 0x930) = 0;
        if (mode == 14) {
            for (s32 slot = 6; slot >= 0; --slot) {
                void *render = FIELD(void *, object, 0x4c + slot * 4);
                FIELD(u16, render, 0x42) |= 4;
                void *resource = FIELD(void *, render, 0x0c);
                FIELD(u16, resource, 0x24) |= 4;
                func_02072d04(resource);
            }
        }
    }

    for (s32 i = 90; i >= 0; --i) {
        FIELD(s32, object, 0x6c + i * 12) = x;
        FIELD(s32, object, 0x70 + i * 12) = y - 0x14000;
        FIELD(s32, object, 0x4b8 + i * 4) = 0x8000;
        FIELD(s32, object, 0x624 + i * 4) = perRecordValue;
        FIELD(s32, object, 0x790 + i * 4) = 0;
    }
    if (mode == 1)
        func_ov041_02202a70(object);
    FIELD(s32, object, 0x940) = 0;
}

/*
 * Return one when object+0x920 contains a nonzero effect mode, otherwise zero.
 * The query has no state changes or SDK effects.
 */
extern "C" s32 func_ov041_0220159c(void *object)
{
    return FIELD(s32, object, 0x920) != 0;
}
