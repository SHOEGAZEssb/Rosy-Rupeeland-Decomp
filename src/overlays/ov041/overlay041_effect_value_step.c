#include "tingle/types.h"

/*
 * Overlay 41 effect value stepping. This recovered helper integrates a signed
 * per-frame delta into one effect value and manages the related phase field.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Add object+0x928 to object+0x624. Positive motion clamps at 0x1000 and stops;
 * nonpositive motion accelerates downward below 0xFEB, then clamps at zero,
 * stops, and writes phase six to object+0x938. No value is returned and no
 * hardware or SDK state is touched.
 */
extern "C" void func_ov041_02201784(void *object)
{
    s32 delta = FIELD(s32, object, 0x928);
    s32 value = FIELD(s32, object, 0x624) + delta;
    FIELD(s32, object, 0x624) = value;
    if (delta > 0) {
        if (value > 0x1000) {
            FIELD(s32, object, 0x624) = 0x1000;
            FIELD(s32, object, 0x928) = 0;
        }
        return;
    }

    if (value < 0xfeb)
        FIELD(s32, object, 0x928) = delta - 1;
    if (FIELD(s32, object, 0x624) < 0) {
        FIELD(s32, object, 0x624) = 0;
        FIELD(s32, object, 0x928) = 0;
        FIELD(s32, object, 0x938) = 6;
    }
}
