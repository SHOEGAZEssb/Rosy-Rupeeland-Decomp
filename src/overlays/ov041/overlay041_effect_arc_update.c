#include "tingle/types.h"

/*
 * Overlay 41 arcing effect motion. This recovered helper advances a shared
 * direction-table phase, positions the leading record on a vertical arc, and
 * transitions the effect into mode ten when the arc completes.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
u32 genrand_int32(void);
void func_ov041_02202a70(void *);
extern s16 data_020c9670[];
}

/*
 * Lower the arc baseline toward 0xDC000, advance object+0x930 by 0x320, and
 * place record zero at baseline plus 0x28000 times the table's second
 * component. The routine fixes its direction at 0x8000 and derives
 * object+0x940 from the same table sample. After phase 0x20000 it selects mode
 * ten, resets phase state, anchors the baseline to ownerY-0xAA000, randomly
 * offsets direction by plus or minus 70, and reinitializes auxiliary effect
 * state. It returns no value and consumes the global PRNG on transition.
 */
extern "C" void func_ov041_02202220(void *object)
{
    if (FIELD(s32, object, 0x4b4) > 0xdc000)
        FIELD(s32, object, 0x4b4) -= 0x1000;

    s32 phase = FIELD(s32, object, 0x930) + 0x320;
    FIELD(s32, object, 0x930) = phase;
    u32 direction = ((u16)phase >> 4) * 2;
    s32 sample = data_020c9670[direction + 1];
    FIELD(s32, object, 0x70) =
        FIELD(s32, object, 0x4b4) +
        (s32)(((s64)sample * 0x28000 + 0x800) >> 12);
    FIELD(s32, object, 0x4b8) = 0x8000;
    FIELD(s32, object, 0x940) = (0x1000 - sample) >> 1;

    if (phase > 0x20000) {
        FIELD(s32, object, 0x920) = 10;
        FIELD(s32, object, 0x934) = 0;
        FIELD(s32, object, 0x930) = 0;
        FIELD(s32, object, 0x91c) = 0;
        void *owner = FIELD(void *, object, 0x48);
        FIELD(s32, object, 0x4b4) = FIELD(s32, owner, 0x194) - 0xaa000;
        s32 side = ((genrand_int32() & 1) * 2) - 1;
        FIELD(s32, object, 0x4b8) += side * 70;
        func_ov041_02202a70(object);
    }
}
