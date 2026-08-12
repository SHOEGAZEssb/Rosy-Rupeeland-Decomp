#include "tingle/types.h"

/* Overlay 94 construction for the title/menu auxiliary effect list. */

extern const u8 data_ov094_02219e70[];

/*
 * Installs the overlay list dispatch record and clears the three pointer/count
 * fields at +0x04/+0x08/+0x0C. Returns no value and performs no allocation.
 */
extern "C" void func_ov094_02217c34(void *list)
{
    *(const void **)list = data_ov094_02219e70;
    *(s32 *)((u8 *)list + 0x08) = 0;
    *(s32 *)((u8 *)list + 0x04) = 0;
    *(s32 *)((u8 *)list + 0x0c) = 0;
}
