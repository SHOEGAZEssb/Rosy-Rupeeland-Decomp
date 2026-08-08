#include "tingle/types.h"

/*
 * Overlay 42 base-object lifecycle. These recovered routines copy three-word
 * vectors, initialize and destroy a 32-element embedded array, and construct
 * the overlay's randomized 18-by-18 field plus 32 motion records.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
u32 genrand_int32(void);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern u8 data_ov042_0220b500[];
extern u16 data_ov042_0220ac58[];
}

/*
 * Copy three 32-bit words from source to destination. Both pointers must refer
 * to at least 12 bytes; destination is changed and no value is returned.
 */
extern "C" void func_ov042_021fce00(void *destination, const void *source)
{
    FIELD(s32, destination, 0) = FIELD(s32, source, 0);
    FIELD(s32, destination, 4) = FIELD(s32, source, 4);
    FIELD(s32, destination, 8) = FIELD(s32, source, 8);
}

/*
 * Initialize one 12-byte embedded element with its address-derived table
 * pointer at word zero and clear its remaining two words. No SDK state changes.
 */
extern "C" void func_ov042_021fcf80(void *element)
{
    FIELD(void *, element, 0) = data_ov042_0220b500;
    FIELD(s32, element, 4) = 0;
    FIELD(s32, element, 8) = 0;
}

/*
 * Embedded-element destructor. The recovered implementation intentionally has
 * no observable state change and returns no value.
 */
extern "C" void func_ov042_021fcf9c(void *element)
{
    (void)element;
}

/*
 * Construct the overlay-42 base object and return object. Store table at word
 * zero, clear its control fields, initialize 32 embedded 12-byte elements at
 * object+0x53C, fill the 18-by-18 signed grid at object+8 with random values
 * from -31 through zero, and clear the vector at object+0x518. Each of 32
 * records receives a random X in [-250,249] fixed-point units, Y=-0x226000, a
 * quadratic value i*i*60+0x2000, and one of four table halfwords selected by
 * i modulo four. The global PRNG is consumed 356 times.
 */
extern "C" void *func_ov042_021fce1c(void *object, void *table)
{
    for (s32 i = 0; i < 32; ++i)
        func_ov042_021fcf80((u8 *)object + 0x53c + i * 12);
    FIELD(void *, object, 0) = table;
    FIELD(s32, object, 4) = 0;
    for (s32 row = 17; row >= 0; --row) {
        for (s32 column = 17; column >= 0; --column) {
            FIELD(s32, object, 8 + row * 72 + column * 4) =
                -(s32)(genrand_int32() & 31);
        }
    }
    s32 zero[3] = {0, 0, 0};
    func_ov042_021fce00((u8 *)object + 0x518, zero);
    FIELD(s32, object, 0x524) = 0;
    FIELD(s32, object, 0x530) = 0;
    FIELD(s32, object, 0x528) = 0;
    FIELD(s32, object, 0x534) = 0;
    FIELD(s32, object, 0x538) = 0;
    for (s32 i = 31; i >= 0; --i) {
        FIELD(s32, object, 0x540 + i * 12) =
            ((s32)(genrand_int32() % 500) - 250) << 12;
        FIELD(s32, object, 0x544 + i * 12) = -0x226000;
        FIELD(s32, object, 0x6bc + i * 4) = i * i * 60 + 0x2000;
        FIELD(u16, object, 0x73c + i * 2) =
            data_ov042_0220ac58[i % 4];
    }
    return object;
}

/*
 * Destroy the 32 embedded elements at object+0x53C in reverse order and return
 * object. The element destructor is currently a confirmed no-op; no memory is
 * freed and no SDK or hardware state changes.
 */
extern "C" void *func_ov042_021fcfa0(void *object)
{
    for (s32 i = 31; i >= 0; --i)
        func_ov042_021fcf9c((u8 *)object + 0x53c + i * 12);
    return object;
}

/*
 * Advance the base object's scrolling 18-by-18 signed field and its associated
 * motion controls. The phase at object+0x520 advances by eight; after passing
 * 64 it wraps, cycles object+0x524 modulo four, shifts rows 1..17 upward, and
 * fills row 17 with fresh values from -31 through zero (18 PRNG draws).
 *
 * The routine then updates object+0x528 toward the value at object+0x52C via
 * the signed division helper. When object+0x538 is negative, the replacement
 * input is instead read through the confirmed pointer chain
 * object[0]->+8->+0x98 and divided by -100. Positive object+0x538 also drives
 * the offset at +0x534 downward by min(410, value*4), then changes the control
 * by one according to the -0x6000 threshold. No value is returned. The exact
 * higher-level meanings of these offset-derived fields remain unknown.
 */
extern "C" void func_ov042_021fcfcc(void *object)
{
    s32 phase = FIELD(s32, object, 0x520) + 8;
    FIELD(s32, object, 0x520) = phase;
    if (phase > 64) {
        FIELD(s32, object, 0x520) = phase - 64;
        FIELD(s32, object, 0x524) =
            (FIELD(s32, object, 0x524) + 1) % 4;
        for (s32 row = 0; row < 17; ++row) {
            for (s32 column = 17; column >= 0; --column)
                FIELD(s32, object, 8 + row * 72 + column * 4) =
                    FIELD(s32, object, 0x50 + row * 72 + column * 4);
        }
        for (s32 column = 17; column >= 0; --column)
            FIELD(s32, object, 0x4d0 + column * 4) =
                -(s32)(genrand_int32() & 31);
    }

    s32 difference = FIELD(s32, object, 0x52c) -
                     FIELD(s32, object, 0x528);
    if (FIELD(s32, object, 0x538) >= 0) {
        s32 velocity = FIELD(s32, object, 0x530);
        velocity -= func_020befec(velocity, 10);
        velocity += func_020befec(difference, 130);
        FIELD(s32, object, 0x530) = velocity;
        s32 value = FIELD(s32, object, 0x528) + velocity;
        FIELD(s32, object, 0x528) = value;
        if (value < 10 && value > -10)
            FIELD(s32, object, 0x528) = 0;
    } else {
        void *level1 = FIELD(void *, object, 0);
        void *level2 = FIELD(void *, level1, 8);
        FIELD(s32, object, 0x528) =
            func_020befec(FIELD(s32, level2, 0x98), -100);
    }

    s32 control = FIELD(s32, object, 0x538);
    if (control <= 0)
        return;
    s32 step = control * 4;
    if (step > 0x19a)
        step = 0x19a;
    s32 offset = FIELD(s32, object, 0x534) - step;
    FIELD(s32, object, 0x534) = offset;
    if (offset < -0x6000) {
        control--;
        FIELD(s32, object, 0x538) = control;
        if (control == 1)
            FIELD(s32, object, 0x538) = -1;
    } else {
        FIELD(s32, object, 0x538) = control + 1;
    }
}

/*
 * Initialize destination as an embedded element and copy source payload words
 * +4 and +8. Word zero is always replaced with the confirmed overlay element
 * table; destination changes and no value is returned.
 */
extern "C" void func_ov042_02203658(void *destination, const void *source)
{
    FIELD(void *, destination, 0) = data_ov042_0220b500;
    FIELD(s32, destination, 4) = FIELD(s32, source, 4);
    FIELD(s32, destination, 8) = FIELD(s32, source, 8);
}

/*
 * Initialize one embedded element directly from two payload values. Install
 * the confirmed table at word zero, store value0/value1 at +4/+8, and return
 * no value. No SDK or hardware state changes.
 */
extern "C" void func_ov042_02203678(void *destination, s32 value0, s32 value1)
{
    FIELD(void *, destination, 0) = data_ov042_0220b500;
    FIELD(s32, destination, 4) = value0;
    FIELD(s32, destination, 8) = value1;
}

/*
 * Initialize destination as an embedded element, then store the component-wise
 * difference first-second in payload words +4 and +8. All pointers must refer
 * to 12-byte elements; destination changes and no value is returned.
 */
extern "C" void func_ov042_0220368c(void *destination, const void *first,
                                    const void *second)
{
    func_ov042_021fcf80(destination);
    FIELD(s32, destination, 4) =
        FIELD(s32, first, 4) - FIELD(s32, second, 4);
    FIELD(s32, destination, 8) =
        FIELD(s32, first, 8) - FIELD(s32, second, 8);
}
