#include "tingle/types.h"

/*
 * Runtime record-table lookup recovered from ARM9 0x02079A7C.
 *
 * The borrowed table stores its record array at offset zero, its active count
 * at offset 0x108, and fixed 0x78-byte records keyed by the first halfword.
 * A missing key is a retail invariant violation: the function halts and only
 * returns null if the halt boundary itself returns.
 */

extern void OS_Halt(void);
extern void *gGameWork;
extern void GameWork_SetFlag(void *work, u32 flag);

/* Return the record whose leading halfword equals key. */
u8 *RuntimeRecordTable_FindByKey(void *table, u32 key)
{
    u8 *records = *(u8 **)table;
    s32 count = *(s32 *)((u8 *)table + 0x108);
    s32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x78;
        if (*(u16 *)record == key)
            return record;
    }
    OS_Halt();
    return 0;
}

/*
 * Return one when any of the active pointer slots beginning at offset eight
 * references a record whose leading halfword equals key.  Null slots are
 * skipped and the active slot count is the word at offset 0x10c.
 */
s32 RuntimeRecordTable_IsKeyActive(void *table, u32 key)
{
    s32 count = *(s32 *)((u8 *)table + 0x10c);
    s32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = *(u8 **)((u8 *)table + 8 + index * 4);
        if (record != 0 && *(u16 *)record == key)
            return 1;
    }
    return 0;
}

/* Activate the loaded record selected by key, preserving record-index slots. */
void RuntimeRecordTable_ActivateByKey(void *table_pointer, u32 key)
{
    u8 *table = (u8 *)table_pointer;
    u8 *record;
    u32 index;

    if (RuntimeRecordTable_IsKeyActive(table, key))
        return;
    record = RuntimeRecordTable_FindByKey(table, key);
    index = (u32)(record - *(u8 **)table) / 0x78;
    GameWork_SetFlag(gGameWork, 0x47);
    *(u8 **)(table + 8 + index * 4) = record;
    if (*(u32 *)(table + 0x10c) < index + 1)
        *(u32 *)(table + 0x10c) = index + 1;
    ++*(u32 *)(table + 0x110);
    *(u16 *)((u8 *)gGameWork + 0x108) = (u16)*(u32 *)(table + 0x110);
}

/* Activate every loaded runtime record. */
void RuntimeRecordTable_ActivateAll(void *table_pointer)
{
    u8 *table = (u8 *)table_pointer;
    u32 index;

    for (index = 0; index < *(u32 *)(table + 0x108); ++index)
        RuntimeRecordTable_ActivateByKey(
            table, *(u16 *)(*(u8 **)table + index * 0x78));
}

/* Clear all 64 active pointers and both active-range/count fields. */
void RuntimeRecordTable_ClearActive(void *table_pointer)
{
    u8 *table = (u8 *)table_pointer;
    u32 index;

    for (index = 0; index < 64; ++index)
        *(void **)(table + 8 + index * 4) = 0;
    *(u32 *)(table + 0x10c) = 0;
    *(u32 *)(table + 0x110) = 0;
}
