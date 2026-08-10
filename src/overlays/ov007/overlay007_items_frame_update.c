#include "tingle/types.h"

/*
 * Overlay 7 item-frame update. This recovered callback initializes graphics on
 * demand, advances object scale/visibility timers, updates palettes, and drives
 * a sub-background phase from owner motion.
 */

typedef struct Overlay007ItemsFrameState {
    u8 bytes[0xdc];
} Overlay007ItemsFrameState;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 data_020c9670[];
extern void func_ov007_021fbaf0(void *state);
extern void GraphicsSpriteState_SetAnimationIndex(void *member, s32 value);
extern void func_02005030(void *destination, const void *source);
extern s32 func_020adc40(s32 value);
extern void func_02005058(void *member);
#ifdef __cplusplus
}
#endif

/* Resolve the owner object retained at +0x48 through its confirmed +0x08 link. */
static void *overlay007_frame_owner(Overlay007ItemsFrameState *state)
{
    return FIELD(void *, FIELD(void *, state, 0x048), 0x08);
}

/* Clear both transient trigger bytes and restore the primary palette to zero. */
static void overlay007_clear_primary_trigger(Overlay007ItemsFrameState *state)
{
    void *primary = FIELD(void *, state, 0x04c);

    GraphicsSpriteState_SetAnimationIndex((u8 *)primary + 0x0c, 0);
    FIELD(u8, state, 0x0a1) = 0;
    FIELD(u8, state, 0x0a0) = 0;
    FIELD(u16, state, 0x0d8) = 0;
}

/*
 * Return immediately when primary +0x4C is null or hidden marker +0xD0 is set.
 * When +0xD4 equals one, run func_ov007_021fbaf0 once (which advances it to
 * two) and finish the frame. Otherwise read owner +0xB0 as a 16-bit angle,
 * use data_020c9670 at `(angle>>4)*2`, multiply by -0xB4000 with 20.12
 * rounding, and store +0x88. If owner +0xAC equals 10, set primary member +0x0C
 * to value 2 and trigger byte +0xA0.
 *
 * When scale timer +0x9C is nonzero, subtract 16. Values >=0x100 are written
 * to +0x78 halfwords +0x3C/+0x3E. Values 0..0xFF are advanced back by 8 and
 * clamp both halfwords to 0x100; negative values clamp the timer to zero and
 * set object +0x78 flag bit 2 at +0x42. Decrement positive halfword +0xD8.
 * Restore the primary palette/triggers when +0xA0 is set and owner +0xAC is
 * zero, when +0xA1 is set and owner +0xB6 is zero, or when +0xD8 equals one.
 *
 * For ten item counters +0xA4, increment positive entries and hide their
 * matching +0x50 objects after the new value exceeds eight; count non-positive
 * entries. Countdown +0x94 decrements when positive and, on reaching zero,
 * sets +0x7C member +0x0C to `10-+0x90`. Otherwise, when +0x90 differs from
 * the inactive count, decrement +0x90, set +0x94 to 24 if it now equals the
 * count or 13 otherwise, and set that palette to `21-+0x90`.
 *
 * Copy owner member +0x84 to a temporary through func_02005030, square its
 * +0x04/+0x08 components with 20.12 rounding, sum them, pass the sum through
 * func_020adc40, multiply the result by five, shift by 12, and add one. Subtract
 * this step from +0xCC, retain signed remainder modulo 256, write its low nine
 * bits to sub register 0x04001010, destroy the temporary, and return no value.
 * Fixed-point arithmetic, thresholds, flags, and MMIO are confirmed; owner and
 * member semantic names remain inferred.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fbcd8(Overlay007ItemsFrameState *state)
{
    void *owner;
    s32 index;
    s32 inactive = 0;
    u8 temporary[0x10];

    if (FIELD(void *, state, 0x04c) == 0 || FIELD(u8, state, 0x0d0) != 0) {
        return;
    }
    if (FIELD(s32, state, 0x0d4) == 1) {
        func_ov007_021fbaf0(state);
        return;
    }

    owner = overlay007_frame_owner(state);
    {
        u16 angle = FIELD(u16, owner, 0x0b0);
        s32 coefficient = data_020c9670[(angle >> 4) * 2];
        s64 product = (s64)coefficient * -0xb4000;

        FIELD(s32, state, 0x088) = (s32)((product + 0x800) >> 12);
    }

    if (FIELD(s32, owner, 0x0ac) == 10) {
        GraphicsSpriteState_SetAnimationIndex((u8 *)FIELD(void *, state, 0x04c) + 0x0c, 2);
        FIELD(u8, state, 0x0a0) = 1;
    }

    if (FIELD(s32, state, 0x09c) != 0) {
        s32 scale = FIELD(s32, state, 0x09c) - 16;
        void *object = FIELD(void *, state, 0x078);

        FIELD(s32, state, 0x09c) = scale;
        if (scale >= 0x100) {
            FIELD(u16, object, 0x3c) = (u16)scale;
            FIELD(u16, object, 0x3e) =
                (u16)FIELD(s32, state, 0x09c);
        } else if (scale >= 0) {
            FIELD(s32, state, 0x09c) = scale + 8;
            FIELD(u16, object, 0x3c) = 0x100;
            FIELD(u16, object, 0x3e) = 0x100;
        } else {
            FIELD(s32, state, 0x09c) = 0;
            FIELD(u16, object, 0x42) |= 4;
        }
    }

    if (FIELD(s16, state, 0x0d8) > 0) {
        FIELD(s16, state, 0x0d8)--;
    }
    if ((FIELD(u8, state, 0x0a0) && FIELD(s32, owner, 0x0ac) == 0) ||
        (FIELD(u8, state, 0x0a1) && FIELD(s16, owner, 0x0b6) == 0) ||
        FIELD(s16, state, 0x0d8) == 1) {
        overlay007_clear_primary_trigger(state);
    }

    for (index = 9; index >= 0; index--) {
        s32 *counter = (s32 *)((u8 *)state + 0x0a4 + index * 4);

        if (*counter > 0) {
            (*counter)++;
            if (*counter > 8) {
                void *object = FIELD(void *, state, 0x050 + index * 4);
                FIELD(u16, object, 0x42) |= 4;
            }
        } else {
            inactive++;
        }
    }

    if (FIELD(s32, state, 0x094) > 0) {
        FIELD(s32, state, 0x094)--;
        if (FIELD(s32, state, 0x094) == 0) {
            GraphicsSpriteState_SetAnimationIndex((u8 *)FIELD(void *, state, 0x07c) + 0x0c,
                          (10 - FIELD(s32, state, 0x090)) & 0xff);
        }
    } else if (FIELD(s32, state, 0x090) != inactive) {
        FIELD(s32, state, 0x090)--;
        FIELD(s32, state, 0x094) =
            FIELD(s32, state, 0x090) == inactive ? 24 : 13;
        GraphicsSpriteState_SetAnimationIndex((u8 *)FIELD(void *, state, 0x07c) + 0x0c,
                      (21 - FIELD(s32, state, 0x090)) & 0xff);
    }

    func_02005030(temporary, (u8 *)owner + 0x84);
    {
        s32 first = FIELD(s32, temporary, 0x04);
        s32 second = FIELD(s32, temporary, 0x08);
        s32 magnitudeSquared =
            (s32)(((s64)first * first + 0x800) >> 12) +
            (s32)(((s64)second * second + 0x800) >> 12);
        s32 step = ((func_020adc40(magnitudeSquared) * 5) >> 12) + 1;
        s32 phase = FIELD(s32, state, 0x0cc) - step;

        FIELD(s32, state, 0x0cc) = phase % 256;
        *(volatile u32 *)0x04001010 = FIELD(s32, state, 0x0cc) & 0x1ff;
    }
    func_02005058(temporary);
}

#undef FIELD
