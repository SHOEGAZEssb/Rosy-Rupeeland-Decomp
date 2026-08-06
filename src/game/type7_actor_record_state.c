#include "tingle/types.h"

/*
 * Recovered type-seven record-state persistence and lookup helpers. They copy
 * eight runtime words to/from game work and search two parallel record tables.
 */

extern u8 *gGameWork;
extern u8 data_020e16b0[];
extern u8 data_020ea9b0[];
extern u8 data_020ea650[];

/*
 * No inputs. Copy eight words from data_020e16b0 offsets +0x2b4..+0x2d0 to
 * game-work offsets +0x51d0..+0x51ec. Both globals change/read respectively;
 * no value is returned and there are no SDK or hardware effects.
 */
void func_0204c42c(void)
{
    s32 index;
    for (index = 0; index < 8; ++index)
        *(u32 *)(gGameWork + 0x51d0 + index * 4) =
            *(u32 *)(data_020e16b0 + 0x2b4 + index * 4);
}

/*
 * No inputs. Restore eight words from game-work offsets +0x51d0..+0x51ec to
 * data_020e16b0 offsets +0x2b4..+0x2d0. Both globals change/read respectively;
 * no value is returned and there are no SDK or hardware effects.
 */
void func_0204c4c0(void)
{
    s32 index;
    for (index = 0; index < 8; ++index)
        *(u32 *)(data_020e16b0 + 0x2b4 + index * 4) =
            *(u32 *)(gGameWork + 0x51d0 + index * 4);
}

/*
 * Input is a signed record identifier. Search 36 records of size 0x68 at
 * data_020ea9b0 by their leading signed halfword. Return the matching record
 * address or null. The table is read only; there are no SDK/hardware effects.
 */
void *func_0204c51c(s32 identifier)
{
    s32 index;
    for (index = 0; index < 0x24; ++index) {
        u8 *record = data_020ea9b0 + index * 0x68;
        if (identifier == *(s16 *)record)
            return record;
    }
    return 0;
}

/*
 * Input is a signed record identifier. Search 36 records of size 0x18 at
 * data_020ea650 by their leading signed halfword. Return the matching record
 * address or null. The table is read only; there are no SDK/hardware effects.
 */
void *func_0204c55c(s32 identifier)
{
    s32 index;
    for (index = 0; index < 0x24; ++index) {
        u8 *record = data_020ea650 + index * 0x18;
        if (identifier == *(s16 *)record)
            return record;
    }
    return 0;
}
