/*
 * Recovered language/resource lookup chain. The managers own indexed records,
 * a fast-file identifier, and a retained 0x1000-byte cache; CheckedFS remains
 * the platform boundary while lookup, truncation, and fallbacks are game code.
 */
#include "tingle/checked_fs.h"
#include "tingle/types.h"

typedef struct LanguageLookupRecord {
    u16 identifier;
    u16 resource;
} LanguageLookupRecord;

typedef struct ResourceFileRecord {
    u16 identifier;
    u16 size;
    u32 offset;
} ResourceFileRecord;

typedef struct LookupIndexPrefix {
    void *records;
    u32 field_04;
    s32 count;
    s32 cachedIdentifier;
    s32 thresholds[5];
    s32 starts[5];
} LookupIndexPrefix;

typedef struct ResourceFileManager {
    ResourceFileRecord *records;
    u32 field_04;
    s32 count;
    s32 cachedIdentifier;
    s32 thresholds[5];
    s32 starts[5];
    u8 padding_38[0x10];
    FSFile file;
    FSFileID fileId;
    u8 cache[0x1002];
} ResourceFileManager;

extern u8 data_021f4090[];
extern u8 data_021f5138[];
extern void OS_Halt(void);
extern u32 LanguageDatabase_GetRecordLength(void *manager, u16 identifier);
void *LanguageDatabase_GetRecordById(ResourceFileManager *manager, u32 identifier);

typedef struct DescriptorMessageRecord {
    u16 identifier;
    u16 resources[7];
} DescriptorMessageRecord;

typedef struct DescriptorMessageTable {
    u8 padding_00[8];
    DescriptorMessageRecord *primaryRecords;
    u32 field_0c;
    DescriptorMessageRecord *secondaryRecords;
    u8 padding_14[0x10];
    s32 primaryCount;
    s32 secondaryCount;
} DescriptorMessageTable;

/* Maps a language message identifier to the byte length of its resource via
 * the global resource manager. A missing record has length zero. */
u32 LanguageLookup_GetResourceSize(const LookupIndexPrefix *table, s32 identifier)
{
    const LanguageLookupRecord *records =
        (const LanguageLookupRecord *)table->records;
    s32 group = 0;
    s32 recordIndex;

    for (group = 4; group >= 0; --group) {
        if (identifier >= table->thresholds[group]) {
            break;
        }
    }
    if (group < 0) {
        group = 0;
    }
    for (recordIndex = table->starts[group];
         recordIndex < table->count; ++recordIndex) {
        if (records[recordIndex].identifier == identifier) {
            return LanguageDatabase_GetRecordLength(data_021f4090,
                                 records[recordIndex].resource);
        }
    }
    return 0;
}

/* Resolve one resource ID from the selected 0x9C-byte message group. */
const void *RecordMessageTable_GetGroupMessage(const void *table, s32 group, s32 index)
{
    const u8 *record = (const u8 *)table + group * 0x9c +
                       index * 4 + 0x1d0;

    return LanguageDatabase_GetRecordById((ResourceFileManager *)data_021f4090,
                         *(const u16 *)record);
}

/* Resolve one descriptor message slot. IDs below 2000 use the primary
 * 16-byte record bank and IDs 2000..2999 use the secondary bank. Retail-valid
 * callers provide a present ID and slot 0..6; invalid IDs request a fatal halt.
 * The returned language payload is borrowed from the global resource cache. */
const void *DescriptorMessageTable_GetMessage(const void *table_pointer, s32 identifier,
                          s32 slot)
{
    const DescriptorMessageTable *table =
        (const DescriptorMessageTable *)table_pointer;
    const DescriptorMessageRecord *records;
    s32 count;
    s32 index;

    if (identifier >= 3000) {
        OS_Halt();
        return 0;
    }
    if (identifier >= 2000) {
        records = table->secondaryRecords;
        count = table->secondaryCount;
    } else {
        records = table->primaryRecords;
        count = table->primaryCount;
    }
    identifier = (u16)identifier;
    for (index = 0; index < count; ++index) {
        if (records[index].identifier == identifier) {
            return LanguageDatabase_GetRecordById((ResourceFileManager *)data_021f4090,
                                 records[index].resources[slot]);
        }
    }
    OS_Halt();
    return 0;
}

/* Return one message payload owned by a type-one descriptor. The descriptor
 * and its record are borrowed; invalid descriptor types preserve retail's
 * fatal assertion path and return null only if that boundary continues. */
const void *RecordDescriptor_GetMessage(const void *descriptor_pointer, s32 slot)
{
    const u8 *descriptor = (const u8 *)descriptor_pointer;
    const u8 *record = *(const u8 *const *)(descriptor + 4);
    u32 type = (*(const u32 *)(record + 0x0c) >> 8) & 0x0f;

    if (type == 1) {
        return DescriptorMessageTable_GetMessage(data_021f5138, *(const u16 *)record, slot);
    }
    OS_Halt();
    return 0;
}

/* Resolve a mode-owned message key through the global message-group table. */
const void *RecordMode_GetMessage(const void *mode_record, s32 key)
{
    return RecordMessageTable_GetGroupMessage(data_021f5138,
                         *(const s32 *)((const u8 *)mode_record + 4), key);
}

/* Return the borrowed 0x9C-byte global group selected by a mode record. */
void *RecordMode_GetMessageGroup(const void *mode_record)
{
    s32 group = *(const s32 *)((const u8 *)mode_record + 4);

    return data_021f5138 + group * 0x9c;
}

/* Loads one indexed blob into the manager cache and returns the bytes read, or
 * zero after closing the file where possible on any filesystem failure. */
s32 LanguageDatabase_LoadRecordIntoCache(ResourceFileManager *manager,
                                         s32 recordIndex)
{
    const ResourceFileRecord *record = &manager->records[recordIndex];
    s32 size = record->size;

    if (!CheckedFS_OpenFileFast(&manager->file, manager->fileId)) {
        return 0;
    }
    if (!CheckedFS_SeekFile(&manager->file, (s32)record->offset, 0)) {
        CheckedFS_CloseFile(&manager->file);
        return 0;
    }
    if (size > 0x1000) {
        size = 0x1000;
    }
    if (CheckedFS_ReadFile(&manager->file, manager->cache, size) < size) {
        CheckedFS_CloseFile(&manager->file);
        return 0;
    }
    if (!CheckedFS_CloseFile(&manager->file)) {
        return 0;
    }
    if (size == 0x1000) {
        *(u16 *)(void *)(manager->cache + 0xffe) = 0;
    }
    return size;
}

/* Resolves an identifier through the five-way record index, returning cached
 * data on success or the confirmed retail missing/empty fallback pointers. */
void *LanguageDatabase_GetRecordById(ResourceFileManager *manager,
                                     u32 identifier)
{
    s32 group = 0;
    s32 recordIndex;

    if (identifier == 0) {
        return (void *)0x020c6d08;
    }
    if (manager->cachedIdentifier == (s32)identifier) {
        return manager->cache;
    }
    for (group = 4; group >= 0; --group) {
        if ((s32)identifier >= manager->thresholds[group]) {
            break;
        }
    }
    if (group < 0) {
        group = 0;
    }
    for (recordIndex = manager->starts[group];
         recordIndex < manager->count; ++recordIndex) {
        if (manager->records[recordIndex].identifier == identifier) {
            if (LanguageDatabase_LoadRecordIntoCache(manager, recordIndex) == 0) {
                return (void *)0x020c6d00;
            }
            manager->cachedIdentifier = (s32)identifier;
            return manager->cache;
        }
    }
    return (void *)0x020c6d00;
}

/* Exercise both language-record query paths for the resident debug menu. */
void *LanguageDatabase_DebugLoadRecord(ResourceFileManager *manager,
                                       u16 identifier)
{
    (void)LanguageDatabase_GetRecordLength(manager, identifier);
    return LanguageDatabase_GetRecordById(manager, identifier);
}

/* Maps a language message identifier to its resource payload via the global
 * resource manager, returning the retail missing-data pointer when absent. */
void *func_020791e0(const LookupIndexPrefix *table, s32 identifier)
{
    const LanguageLookupRecord *records =
        (const LanguageLookupRecord *)table->records;
    s32 group = 0;
    s32 recordIndex;

    for (group = 4; group >= 0; --group) {
        if (identifier >= table->thresholds[group]) {
            break;
        }
    }
    if (group < 0) {
        group = 0;
    }
    for (recordIndex = table->starts[group];
         recordIndex < table->count; ++recordIndex) {
        if (records[recordIndex].identifier == identifier) {
            return LanguageDatabase_GetRecordById((ResourceFileManager *)data_021f4090,
                                 records[recordIndex].resource);
        }
    }
    return (void *)0x020c6d00;
}
