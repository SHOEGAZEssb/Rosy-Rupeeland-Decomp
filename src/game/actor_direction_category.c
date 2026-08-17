#include "tingle/types.h"

/* Recovered classification of retail area/direction codes for actor effects. */

/* Return the presentation-table group (zero through five) for one code. */
s32 func_0207a19c(s32 value)
{
    if ((value >= 0x28 && value <= 0x2f) || value == 0x20 || value == 0x25)
        return 0;
    if (value >= 0x30 && value <= 0x3b)
        return 1;
    if ((value >= 0x3e && value <= 0x43) ||
        (value >= 0x65 && value <= 0x6d) || value == 0x4f)
        return 2;
    if ((value >= 0x6e && value <= 0x73) || value == 0x50 || value == 0x51)
        return 3;
    if ((value >= 0x0a && value <= 0x11) ||
        (value >= 0xcb && value <= 0xd1) ||
        (value >= 0x9c && value <= 0xa9))
        return 4;
    return 5;
}
