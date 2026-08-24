#include "tingle/types.h"

/*
 * Overlay 41 attack-like effect motion. This recovered eight-state controller
 * steers the leading record through entry, tracking, value fades, a lateral
 * response, and a return to the ordinary mode-four cycle.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020ae024(s32, s32);
u32 genrand_int32(void);
void func_ov041_02202a00(void *);
void func_ov041_02202a3c(void *);
void func_ov041_02202a70(void *);
void Sound_Play(void *, s32, s32);
extern void *gSoundContext;
extern s16 gFx32CosSinTable[];
}

/*
 * Advance object+0x91C and write an angle delta/speed when the current state
 * requests motion. Entry chooses one of two horizontal targets. The middle
 * states launch mode 12, wait for its value fade, track the linked object's Y,
 * and either restore mode four or respond to object+0x950 with a side sweep.
 * Sweep states also derive object+0x940 from the shared direction table.
 * Effect callbacks, random selection, and sound 0x12D are observable effects;
 * the attack interpretation is inferred from the paths and proximity latch.
 */
extern "C" void func_ov041_02201e98(void *object, s32 *angleOut, s32 *speedOut)
{
    void *owner = FIELD(void *, object, 0x48);
    s32 state = FIELD(s32, object, 0x91c);
    s32 dx = FIELD(s32, object, 0x4b0) - FIELD(s32, object, 0x6c);
    s32 dy = FIELD(s32, object, 0x4b4) - FIELD(s32, object, 0x70);
    s32 ownerY = FIELD(s32, owner, 0x194);
    s32 steer = 0;
    s32 updateScale = 0;

    switch (state) {
    case 0:
        FIELD(s32, object, 0x4b0) =
            (genrand_int32() & 8) == 0 ? 0x21000 : 0xdf000;
        FIELD(s32, object, 0x4b4) = -0x82000;
        FIELD(s32, object, 0x91c)++;
        dy = -1;
        /* fall through */
    case 1:
        steer = 1;
        *speedOut = 0x15e;
        if ((FIELD(s32, object, 0x6c) < 0x21000 ||
             FIELD(s32, object, 0x6c) > 0xdf000) &&
            dy > 0) {
            FIELD(s32, object, 0x4b0) = 0x80000;
            FIELD(s32, object, 0x4b4) = ownerY - 0x104000;
            FIELD(s32, object, 0x928) = -10;
            FIELD(s32, object, 0x920) = 12;
            FIELD(s32, object, 0x934) = 0;
            FIELD(s32, object, 0x954) = 0;
            FIELD(s32, object, 0x950) = 0;
            FIELD(s32, object, 0x91c)++;
            func_ov041_02202a70(object);
            Sound_Play(gSoundContext, 0x12d, 1);
        }
        break;
    case 2:
        FIELD(s32, object, 0x934) = 0;
        *speedOut = 0xdc;
        if (FIELD(s32, object, 0x624) <= 0) {
            FIELD(s32, object, 0x91c)++;
            FIELD(s32, object, 0x928) = 0;
        }
        /* fall through */
    case 3: {
        steer = 1;
        s32 timer = FIELD(s32, object, 0x934);
        if (timer > 30)
            *speedOut = 0x1c2;
        if (timer > 180)
            *speedOut = 0x140;
        FIELD(s32, object, 0x934) = timer + 1;
        if (dy < 4)
            FIELD(s32, object, 0x4b4) += 0x333;
        void *linked = FIELD(void *, owner, 8);
        if (FIELD(s32, linked, 0xd8) - FIELD(s32, object, 0x4b4) <
            -0x28000)
            FIELD(s32, object, 0x934) = 360;
        if (FIELD(s32, object, 0x934) >= 360) {
            FIELD(s32, object, 0x934) = 0;
            FIELD(s32, object, 0x91c)++;
        }
        if (FIELD(s32, object, 0x950) != 0) {
            FIELD(s32, object, 0x4b0) =
                FIELD(s32, object, 0x6c) > 0x80000 ? 0x12000 : 0xee000;
            FIELD(s32, object, 0x930) = 0;
            Sound_Play(gSoundContext, 0x12d, 1);
            FIELD(s32, object, 0x4b4) =
                FIELD(s32, object, 0x70) - 0x1e000;
            FIELD(s32, object, 0x91c) = 6;
        }
        break;
    }
    case 4:
        FIELD(s32, object, 0x934)++;
        if (FIELD(s32, object, 0x934) > 14) {
            FIELD(s32, object, 0x91c)++;
            FIELD(s32, object, 0x928) = 0xcd;
        }
        break;
    case 5:
        if (FIELD(s32, object, 0x624) >= 0x1000) {
            func_ov041_02202a3c(object);
            func_ov041_02202a00(object);
            FIELD(s32, object, 0x930) = 40;
            FIELD(s32, object, 0x934) = 0;
            FIELD(s32, object, 0x920) = 4;
            FIELD(s32, object, 0x940) = 0;
            FIELD(s32, object, 0x91c) = 1;
        }
        break;
    case 6:
        steer = 1;
        updateScale = 1;
        *speedOut = 0x1cc;
        if (dy > 0) {
            FIELD(s32, object, 0x4b0) = 0x80000;
            FIELD(s32, object, 0x4b4) =
                FIELD(s32, object, 0x70) - 0x50000;
            FIELD(s32, object, 0x91c)++;
        }
        break;
    case 7:
        steer = 1;
        updateScale = 1;
        *speedOut = 0x1cc;
        if (dx > -0x8000 && dx < 0x8000) {
            FIELD(s32, object, 0x91c) = 5;
            FIELD(s32, object, 0x928) = 0xcd;
        }
        break;
    default:
        break;
    }

    if (steer) {
        s32 angle = func_020ae024(dx, dy);
        if (angle < 0)
            angle += 0x10000;
        *angleOut = angle - FIELD(s32, object, 0x4b8);
    }
    if (updateScale) {
        s32 phase = FIELD(s32, object, 0x930) + 0x258;
        if (phase > 0x10000)
            phase = 0x10000;
        FIELD(s32, object, 0x930) = phase;
        u32 direction = ((u16)phase >> 4) * 2;
        FIELD(s32, object, 0x940) =
            (0x1000 - gFx32CosSinTable[direction + 1]) >> 1;
    }
}
