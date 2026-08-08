#include "tingle/types.h"

/*
 * Overlay 41 effect proximity testing. This recovered routine rejects effect
 * modes that cannot interact, then tests either the leading moving record or
 * seven spaced records against a caller-supplied fixed-point position.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020adc40(s32);
extern s16 data_020c9670[];
}

/*
 * Return one when an eligible effect record lies within its fixed-point hit
 * radius of (x,y), otherwise zero. Modes 0,3,4,6,8,9 and 11 are excluded. When
 * record zero's auxiliary value is zero, its position is projected 0x30 units
 * along the direction table and tested at radius 0x20000; otherwise seven
 * records spaced 13 entries apart are tested at radius 0x24000 while their
 * auxiliary value is at most 0x4B0. A hit in mode 12 also sets object+0x950.
 * The direction-table interpretation is confirmed by the accesses, while the
 * gameplay meaning of the auxiliary values remains inferred.
 */
extern "C" s32 func_ov041_022015b0(void *object, s32 x, s32 y)
{
    s32 mode = FIELD(s32, object, 0x920);
    if (mode == 0 || mode == 3 || mode == 4 || mode == 6 || mode == 8 ||
        mode == 9 || mode == 11)
        return 0;

    if (FIELD(s32, object, 0x624) == 0) {
        s32 direction = (FIELD(s32, object, 0x4b8) >> 4) * 2;
        s32 recordX =
            FIELD(s32, object, 0x6c) + data_020c9670[direction] * 0x30;
        s32 recordY =
            FIELD(s32, object, 0x70) + data_020c9670[direction + 1] * 0x30;
        s32 dx = recordX - x;
        s32 dy = recordY - y;
        if ((dx < 0 ? -dx : dx) <= 0x20000 &&
            (dy < 0 ? -dy : dy) <= 0x20000) {
            s32 distanceSquared =
                (s32)(((s64)dx * dx + 0x800) >> 12) +
                (s32)(((s64)dy * dy + 0x800) >> 12);
            if (func_020adc40(distanceSquared) < 0x20000) {
                if (mode == 12)
                    FIELD(s32, object, 0x950) = 1;
                return 1;
            }
        }
    }

    for (s32 index = 0; index < 91; index += 13) {
        if (FIELD(s32, object, 0x624 + index * 4) <= 0x4b0) {
            s32 dx = FIELD(s32, object, 0x6c + index * 12) - x;
            s32 dy = FIELD(s32, object, 0x70 + index * 12) - y;
            if ((dx < 0 ? -dx : dx) <= 0x24000 &&
                (dy < 0 ? -dy : dy) <= 0x24000) {
                s32 distanceSquared =
                    (s32)(((s64)dx * dx + 0x800) >> 12) +
                    (s32)(((s64)dy * dy + 0x800) >> 12);
                if (func_020adc40(distanceSquared) < 0x24000) {
                    if (mode == 12)
                        FIELD(s32, object, 0x950) = 1;
                    return 1;
                }
            }
        }
    }
    return 0;
}
