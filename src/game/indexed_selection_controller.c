#include "tingle/types.h"

/*
 * Indexed selection-controller construction and range setup recovered at
 * 0x02093a88..0x02093b1f. The caller owns the 0x38-byte state, while the
 * installed retail table remains static game data. No allocation, hardware
 * access, or failure path occurs.
 */

extern const u8 data_020f261c[];

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* Initialize a borrowed controller state to the retail defaults. */
void func_02093a88(void *controller)
{
    FIELD(const void *, controller, 0x00) = data_020f261c;
    FIELD(s32, controller, 0x04) = 0;
    FIELD(s32, controller, 0x08) = 0;
    FIELD(s32, controller, 0x0c) = 0;
    FIELD(s32, controller, 0x10) = 0;
    FIELD(s32, controller, 0x14) = 0;
    FIELD(s32, controller, 0x18) = 0;
    FIELD(s32, controller, 0x1c) = 0x10;
    FIELD(s32, controller, 0x20) = 0;
    FIELD(s32, controller, 0x24) = 0;
    FIELD(s32, controller, 0x28) = 0;
    FIELD(s32, controller, 0x2c) = 6;
    FIELD(s32, controller, 0x30) = 4;
    FIELD(s32, controller, 0x34) = 0;
}

/* Set inclusive bounds and the current value, clearing transition progress. */
void func_02093adc(void *controller, s32 lower, s32 upper, s32 current)
{
    FIELD(s32, controller, 0x04) = lower;
    FIELD(s32, controller, 0x08) = upper;
    FIELD(s32, controller, 0x0c) = current;
    FIELD(s32, controller, 0x10) = current;
    FIELD(s32, controller, 0x14) = 0;
    FIELD(s32, controller, 0x18) = 0;
}

/* Clamp a requested value to the configured bounds and snap both endpoints. */
void func_02093af8(void *controller, s32 value)
{
    if (value < FIELD(s32, controller, 0x04))
        value = FIELD(s32, controller, 0x04);
    else if (value > FIELD(s32, controller, 0x08))
        value = FIELD(s32, controller, 0x08);
    FIELD(s32, controller, 0x0c) = value;
    FIELD(s32, controller, 0x10) = value;
}

#undef FIELD
