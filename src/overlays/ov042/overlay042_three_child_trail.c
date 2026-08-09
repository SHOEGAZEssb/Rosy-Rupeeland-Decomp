#include "tingle/types.h"

/*
 * Overlay 42 three-child trail update. This recovered helper controls three
 * linked presentation children and advances a 24-word history used to choose
 * two resource frames from caller timing and a decaying scene value.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void func_02072b68(void *resource, u8 mode);

/*
 * Given object, source payload, numerator, and divisor, return immediately when
 * +0xE8 is zero; otherwise decrement it. When the countdown expires or the
 * numerator is nonpositive, hide all three +0x5C children and fill the entire
 * 24-word history from +0xEC. Otherwise reveal and position all three children
 * at source X-0x20000/source Y, derive frame=(numerator*64)/divisor, update the
 * first child's visibility/frame, shift history entries 23..2, clamp +0xF0 to
 * the frame, decay +0xEC toward +0x14C, and update the second tracked child's
 * visibility/frame. Child and object state change; no value is returned.
 */
extern "C" void func_ov042_022009a0(void *object, const void *source,
                                      s32 numerator, s32 divisor)
{
    if (FIELD(s32, object, 0xe8) == 0)
        return;
    FIELD(s32, object, 0xe8)--;
    if (FIELD(s32, object, 0xe8) == 0 || numerator <= 0) {
        for (s32 i = 2; i >= 0; --i) {
            void *child = FIELD(void *, object, 0x5c + i * 4);
            FIELD(u16, child, 0x42) |= 4;
        }
        for (s32 i = 23; i >= 0; --i)
            FIELD(s32, object, 0xf0 + i * 4) = FIELD(s32, object, 0xec);
        return;
    }

    for (s32 i = 2; i >= 0; --i) {
        void *child = FIELD(void *, object, 0x5c + i * 4);
        FIELD(u16, child, 0x42) &= (u16)~4;
        FIELD(s32, child, 0x30) = FIELD(s32, source, 4) - 0x20000;
        FIELD(s32, child, 0x34) = FIELD(s32, source, 8);
    }
    s32 frame = func_020befec(numerator << 6, divisor);
    void *first = FIELD(void *, object, 0x60);
    if (frame <= 0)
        FIELD(u16, first, 0x42) |= 4;
    else
        func_02072b68(FIELD(void *, first, 0xc), (u8)(0x41 - frame));

    for (s32 i = 23; i >= 2; --i)
        FIELD(s32, object, 0xf0 + i * 4) = FIELD(s32, object, 0xec + i * 4);
    if (FIELD(s32, object, 0xf0) > frame)
        FIELD(s32, object, 0xf0) = frame;
    if (FIELD(s32, object, 0xec) > FIELD(s32, object, 0x14c))
        FIELD(s32, object, 0xec)--;

    s32 tail = FIELD(s32, object, 0xec);
    void *second = FIELD(void *, object, 0x64);
    if (tail <= 0)
        FIELD(u16, second, 0x42) |= 4;
    else
        func_02072b68(FIELD(void *, second, 0xc), (u8)(0x81 - tail));
}
