#include "tingle/types.h"

extern void OS_Halt(void);
extern const u8 data_020ea650[];
extern const u8 data_020ea65c[];

/*
 * Find an identifier in the retail text/resource table. Records are borrowed
 * 0x62-byte entries. The loader caches a midpoint so identifiers at or above
 * its key skip the lower half; lookup failure is fatal in the original game.
 */
u8 *RetailTextTable_FindRecordById(void *self, u16 identifier)
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

/*
 * Map one of the 36 signed auxiliary identifiers to its localized text record
 * (retail 0x0207A00C). Each 0x18-byte mapping row supplies a text identifier;
 * return the borrowed UTF-16 payload after the record's identifier halfword.
 * An unknown auxiliary identifier is a retail invariant violation.
 */
const u16 *RetailTextTable_FindAuxiliaryText(void *text_table, s32 identifier)
{
    s32 index;

    for (index = 0; index < 0x24; ++index) {
        const u8 *mapping = data_020ea650 + index * 0x18;
        if (*(const s16 *)mapping == identifier) {
            u16 text_id = *(const u16 *)(data_020ea65c + index * 0x18);
            return (const u16 *)(RetailTextTable_FindRecordById(text_table, text_id) + 2);
        }
    }
    OS_Halt();
    return 0;
}
