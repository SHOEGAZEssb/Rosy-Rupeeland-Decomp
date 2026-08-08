#include "tingle/types.h"

/*
 * Overlay 41 cyclic effect motion. This recovered six-state controller moves
 * the leading effect record between fixed, linked-object, and view-relative
 * targets while coordinating value ramps and repeated effect modes.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020ae024(s32, s32);
s32 func_ov041_022009e8(void *);
void func_ov041_02202a00(void *);
void func_ov041_02202a3c(void *);
void func_ov041_02202a70(void *);
void Sound_Play(void *, s32, s32);
extern void *gSoundContext;
}

/*
 * Advance object+0x91C through states zero through five, optionally writing a
 * speed through speedOut and an angular delta through angleOut. States steer
 * toward a fixed off-screen point, orbit until six half-turn crossings, fade
 * the leading value out and back in, then either return to mode four or repeat
 * mode six according to object+0x92C. The function updates effect modes,
 * counters, targets and value deltas; it plays sound 0x12D when mode seven
 * begins. Target semantics beyond their observed ownership remain inferred.
 */
extern "C" void func_ov041_02201b38(void *object, s32 *angleOut, s32 *speedOut)
{
    s32 motionKind = 0;
    s32 dx = 0;
    s32 dy = 0;
    s32 state = FIELD(s32, object, 0x91c);

    switch (state) {
    case 0: {
        FIELD(s32, object, 0x4b0) = 0x86000;
        FIELD(s32, object, 0x4b4) = -0x82000;
        dx = FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c);
        dy = FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70);
        *speedOut = 0x15e;
        if (dy > 0)
            FIELD(s32, object, 0x91c)++;
        motionKind = 1;
        void *view = FIELD(void *, FIELD(void *, object, 0x48), 0x14);
        if (func_ov041_022009e8(view) == 0) {
            FIELD(s32, object, 0x91c) = 1;
            FIELD(s32, object, 0x934) = 3;
        }
        break;
    }
    case 1: {
        u32 direction =
            (u32)(FIELD(s32, object, 0x4b8) + 0x514) & 0xffff;
        FIELD(s32, object, 0x4b8) = direction;
        dy = FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70);
        s32 phase = FIELD(s32, object, 0x934);
        if ((phase & 1) == 0) {
            if (direction < 0x8000)
                FIELD(s32, object, 0x934) = phase + 1;
        } else if (direction > 0x8000) {
            FIELD(s32, object, 0x934) = phase + 1;
        }
        if (FIELD(s32, object, 0x934) > 6) {
            void *owner = FIELD(void *, object, 0x48);
            void *linked = FIELD(void *, owner, 8);
            void *view = FIELD(void *, owner, 0x14);
            FIELD(s32, object, 0x4b0) = FIELD(s32, linked, 0xd4);
            FIELD(s32, object, 0x4b4) = FIELD(s32, linked, 0xd8);
            FIELD(s32, object, 0x928) =
                func_ov041_022009e8(view) == 0 ? -20 : -14;
            FIELD(s32, object, 0x920) = 7;
            FIELD(s32, object, 0x934) = 0;
            FIELD(s32, object, 0x91c)++;
            func_ov041_02202a70(object);
            Sound_Play(gSoundContext, 0x12d, 1);
        }
        break;
    }
    case 2:
        FIELD(s32, object, 0x934)++;
        if (FIELD(s32, object, 0x934) < 30) {
            dx = FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c);
            dy = FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70);
            *speedOut = 0x514;
            motionKind = 1;
        }
        if (FIELD(s32, object, 0x624) <= 0) {
            FIELD(s32, object, 0x91c)++;
            FIELD(s32, object, 0x934) = 0;
            FIELD(s32, object, 0x928) = 0;
        }
        break;
    case 3:
        FIELD(s32, object, 0x934)++;
        if (FIELD(s32, object, 0x934) > 35) {
            FIELD(s32, object, 0x91c)++;
            FIELD(s32, object, 0x928) = 0xcd;
        }
        break;
    case 4:
        motionKind = 2;
        if (FIELD(s32, object, 0x624) >= 0x1000) {
            func_ov041_02202a3c(object);
            FIELD(s32, object, 0x934) = 0;
            if (FIELD(s32, object, 0x92c) == 0) {
                func_ov041_02202a00(object);
                FIELD(s32, object, 0x930) = 80;
                FIELD(s32, object, 0x920) = 4;
                FIELD(s32, object, 0x91c) = 1;
            } else {
                FIELD(s32, object, 0x920) = 6;
                FIELD(s32, object, 0x92c)--;
                FIELD(s32, object, 0x930) = 15;
                FIELD(s32, object, 0x91c) = 5;
            }
        }
        break;
    case 5:
        FIELD(s32, object, 0x930)--;
        if (FIELD(s32, object, 0x930) > 0) {
            *speedOut = 0x258;
            motionKind = 3;
        } else {
            FIELD(s32, object, 0x91c) = 1;
            FIELD(s32, object, 0x934) = 5;
        }
        break;
    default:
        break;
    }

    if (motionKind == 2) {
        void *linked =
            FIELD(void *, FIELD(void *, object, 0x48), 8);
        FIELD(s32, object, 0x4b0) = FIELD(s32, linked, 0xd4);
        FIELD(s32, object, 0x4b4) = FIELD(s32, linked, 0xd8);
        dx = FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c);
        dy = FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70);
    } else if (motionKind == 3) {
        void *owner = FIELD(void *, object, 0x48);
        void *linked = FIELD(void *, owner, 8);
        FIELD(s32, object, 0x4b0) =
            FIELD(s32, linked, 0xd4) - FIELD(s32, owner, 0x190);
        FIELD(s32, object, 0x4b4) =
            FIELD(s32, linked, 0xd8) - FIELD(s32, owner, 0x194);
        dx = FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c);
        dy = FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70);
    }
    if (motionKind != 0) {
        s32 angle = func_020ae024(dx, dy);
        if (angle < 0)
            angle += 0x10000;
        *angleOut = angle - FIELD(s32, object, 0x4b8);
    }
}
