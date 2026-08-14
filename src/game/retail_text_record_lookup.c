#include "tingle/types.h"

extern void OS_Halt(void);

/*
 * Find an identifier in the retail text/resource table. Records are borrowed
 * 0x62-byte entries. The loader caches a midpoint so identifiers at or above
 * its key skip the lower half; lookup failure is fatal in the original game.
 */
u8 *func_02079f3c(void *self, u16 identifier)
{
    u8 *table = (u8 *)self;
    u8 *records = *(u8 **)(table + 0x1b0);
    s32 count = *(s32 *)(table + 0x1b8);
    s32 index = 0;

    if (identifier >= *(u16 *)(table + 0x1c0))
        index = *(s32 *)(table + 0x1bc);
    while (index < count) {
        u8 *record = records + index * 0x62;

        if (*(u16 *)record == identifier)
            return record;
        ++index;
    }
    OS_Halt();
    return 0;
}
