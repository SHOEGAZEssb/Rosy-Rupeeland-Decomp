


/*
 * Portable reconstructions of assembly-selected retail database loaders and
 * the randomized selection-history operations backed by those databases.
 */
#include "tingle/game_file.h"
#include "tingle/checked_fs.h"
#include "tingle/heap.h"
#include "tingle/random.h"
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);
extern void *memset(void *destination, int value, u32 size);

extern const char *data_020c6cfc;
extern const char data_020ea5c0[];
extern const char data_020ea5b8[];
extern const char data_020ea63c[];
extern const char data_020ea608[];
extern const char data_020ea618[];
extern const char data_020ea62c[];
extern const char data_020ea5c8[];
extern const char data_020ea5d8[];
extern const char data_020ea5e0[];
extern u8 gLanguageDatabase[];
extern u8 data_021f4020[];
extern u8 data_021f5f18[];
extern u8 data_021f3ecc[];
extern const u32 data_020c6d14;
extern u8 data_020c6d18[];

extern void LanguageDatabase_CopyRecordById(void *manager, u16 id, void *destination,
                          u32 destination_size);
extern void *LanguageDatabase_GetRecordById(void *manager, u32 identifier);
extern void *RetailSelectionDatabase_GetMessageRecordById(void *manager, u16 identifier);
extern void RetailSelectionHistoryEntry_Init(void *entry, u16 identifier);
extern void OS_Halt(void);

typedef struct RetailSelectionGroup {
    u32 index;
    u32 count;
    u32 identifiers[20];
} RetailSelectionGroup;

typedef struct RetailSelectionEntry {
    u16 identifier;
    u16 active;
    u8 *record;
} RetailSelectionEntry;

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

/* Rebuild the ten retail selection groups at 0x02097F94. */
void func_02097f94(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *records = *(u8 **)(data_021f3ecc + 0x154);
    u32 count = *(u32 *)(data_021f3ecc + 0x15c);
    u32 index;

    for (index = 0; index < 10; ++index)
        *(u32 *)(manager + index * 0x58) = index;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x66;
        s8 group;

        if (record[2] != 1)
            continue;
        group = *(s8 *)(record + 3);
        if (group >= 0) {
            u8 *destination = manager + (u32)group * 0x58;
            u32 destination_count = *(u32 *)(destination + 4);

            *(u32 *)(destination + 8 + destination_count * 4) =
                *(u16 *)record;
            *(u32 *)(destination + 4) = destination_count + 1;
        }
    }
}

/* Resolve the borrowed message record selected by an eight-byte history
 * entry's leading identifier. The database retains ownership. */
void *RetailSelectionHistory_GetMessageRecord(void *entry_pointer)
{
    RetailSelectionEntry *entry = (RetailSelectionEntry *)entry_pointer;

    return RetailSelectionDatabase_GetMessageRecordById(data_021f4020, entry->identifier);
}

/* Return the borrowed text field at +6 in the database record referenced by
 * an eight-byte selection-history entry. Neither object is modified. */
void *RetailSelectionHistory_GetText(void *entry_pointer)
{
    RetailSelectionEntry *entry = (RetailSelectionEntry *)entry_pointer;

    return entry->record + 6;
}

/*
 * Choose one identifier from a group while excluding `previous_identifier`.
 * The group storage remains owned by the selection manager. Retail callers
 * ensure at least one eligible identifier exists.
 */
s32 RetailSelectionGroup_ChooseDifferentId(void *group_pointer, s32 previous_identifier)
{
    RetailSelectionGroup *group = (RetailSelectionGroup *)group_pointer;
    u32 eligible[20];
    u32 eligible_count = 0;
    u32 index;

    for (index = 0; index < group->count; ++index) {
        if (group->identifiers[index] != (u32)previous_identifier)
            eligible[eligible_count++] = group->identifiers[index];
    }
    /* Retail's division helper returns the quotient in r0 and remainder in
     * r1; this caller consumes r1, which portable C expresses directly. */
    index = genrand_int32() % eligible_count;
    return (s32)eligible[index];
}

/* Copy one manager-owned eight-byte selection-history record. */
static void CopySelectionEntry(RetailSelectionEntry *destination,
                               const RetailSelectionEntry *source)
{
    destination->identifier = source->identifier;
    destination->active = source->active;
    destination->record = source->record;
}

/*
 * Advance the randomized selection history using the active group at +0x464.
 * A nonnegative group on the current record replaces the head while excluding
 * its prior identifier; otherwise the existing borrowed record pointers move
 * down by one slot and a new head is inserted. The manager owns all history
 * slots, while the referenced database records remain database-owned.
 */
void RetailSelectionManager_AdvanceHistory(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    RetailSelectionGroup *group = (RetailSelectionGroup *)(
        manager + *(u32 *)(manager + 0x464) * 0x58);
    RetailSelectionEntry *history = (RetailSelectionEntry *)(manager + 0x370);
    s32 count = *(s32 *)(manager + 0x460);
    s32 identifier;

    if (count == 0) {
        identifier = RetailSelectionGroup_ChooseDifferentId(group, -1);
        RetailSelectionHistoryEntry_Init(history, (u16)identifier);
        *(s32 *)(manager + 0x460) = count + 1;
        return;
    }

    if ((s8)history[0].record[3] >= 0) {
        identifier = RetailSelectionGroup_ChooseDifferentId(group, history[0].identifier);
        RetailSelectionHistoryEntry_Init(history, (u16)identifier);
        return;
    }

    while (count > 0) {
        CopySelectionEntry(&history[count], &history[count - 1]);
        --count;
    }
    identifier = RetailSelectionGroup_ChooseDifferentId(group, -1);
    RetailSelectionHistoryEntry_Init(history, (u16)identifier);
    ++*(s32 *)(manager + 0x460);
}

/*
 * Return whether the history contains an inactive record from the special
 * negative group. Record pointers are borrowed from the loaded selection
 * database; this query does not mutate either owner.
 */
s32 RetailSelectionManager_HasInactiveSpecialRecord(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    RetailSelectionEntry *history = (RetailSelectionEntry *)(manager + 0x370);
    s32 count = *(s32 *)(manager + 0x460);
    s32 index;

    for (index = 0; index < count; ++index) {
        if ((s8)history[index].record[3] < 0 && history[index].active != 1)
            return 1;
    }
    return 0;
}

/* Release one retail heap array whose pointer/count occupy the first 8 bytes. */
static void ReleaseArray(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;

    if (*(void **)manager != 0) {
        Heap_Free(*(void **)manager);
        *(void **)manager = 0;
    }
    *(u32 *)(manager + 4) = 0;
}

/* Release the language lookup database's owned record array. */
void LanguageLookupDatabase_Destroy(void *manager_pointer)
{
    ReleaseArray(manager_pointer);
}

/* Load the five-bucket four-byte lookup database at retail 0x02078FFC. */
void LanguageLookupDatabase_Load(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    FSFile *file = (FSFile *)(manager + 0x38);
    FSFileID *file_id = (FSFileID *)(manager + 0x80);
    u8 header[0x10];
    u8 input[4];
    u32 count;
    u32 index;
    u32 bucket_size;
    u8 *records;

    CheckedFS_InitFile(file);
    CheckedFS_ConvertPathToFileID(file_id, data_020ea608);
    CheckedFS_OpenFileFast(file, *file_id);
    CheckedFS_ReadFile(file, header, sizeof(header));
    count = ReadU16(header);
    *(u32 *)(manager + 8) = count;
    if (*(void **)manager != 0)
        LanguageLookupDatabase_Destroy(manager);
    records = Heap_Alloc(count * 4, data_020ea5c8, 4, &gHeapContext);
    *(u8 **)manager = records;
    *(u32 *)(manager + 4) = count;
    for (index = 0; index < count; ++index) {
        CheckedFS_ReadFile(file, input, sizeof(input));
        *(u16 *)(records + index * 4) = ReadU16(input);
        *(u16 *)(records + index * 4 + 2) = ReadU16(input + 2);
    }
    CheckedFS_CloseFile(file);
    *(s32 *)(manager + 0x0c) = -1;
    bucket_size = count / 5;
    for (index = 0; index < 5; ++index) {
        u32 start = bucket_size * index;
        *(u32 *)(manager + 0x24 + index * 4) = start;
        *(u32 *)(manager + 0x10 + index * 4) =
            *(u16 *)(records + start * 4);
    }
}

/* Release the selection database's owned 0x66-byte record array. */
void RetailSelectionDatabase_Destroy(void *manager_pointer)
{
    ReleaseArray(manager_pointer);
}

/* Load the localized 0x66-byte selection database at retail 0x02079264. */
void RetailSelectionDatabase_Load(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    FSFile *file = (FSFile *)(manager + 0x0c);
    FSFileID *file_id = (FSFileID *)(manager + 0x54);
    u8 header[0x10];
    u8 input[8];
    u32 count;
    u32 index;
    u32 special_count = 1;
    u8 *records;

    CheckedFS_InitFile(file);
    CheckedFS_ConvertPathToFileID(file_id, data_020ea618);
    CheckedFS_OpenFileFast(file, *file_id);
    CheckedFS_ReadFile(file, header, sizeof(header));
    count = ReadU16(header);
    *(u32 *)(manager + 8) = count;
    if (*(void **)manager != 0)
        RetailSelectionDatabase_Destroy(manager);
    records = Heap_Alloc(count * 0x66, data_020ea5d8, 4, &gHeapContext);
    *(u8 **)manager = records;
    *(u32 *)(manager + 4) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x66;

        CheckedFS_ReadFile(file, input, sizeof(input));
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 4) = ReadU16(input + 2);
        *(u8 *)(record + 2) = input[4];
        *(s8 *)(record + 3) = (s8)input[5];
        LanguageDatabase_CopyRecordById(gLanguageDatabase, ReadU16(input + 6), record + 6, 0x60);
        if (input[4] == 1 && (s8)input[5] == -1)
            ++special_count;
    }
    if (special_count > 30)
        OS_Halt();
    CheckedFS_CloseFile(file);
    func_02097f94(data_021f5f18);
}

/* Resolve a selection record's borrowed message at retail 0x02079408.
 * `manager_pointer` borrows the loaded 0x66-byte record array and `id` selects
 * its leading ID. The returned descriptor remains owned by the language
 * database; retail halts when the requested selection record does not exist. */
void *RetailSelectionDatabase_GetMessageRecordById(void *manager_pointer, u16 id)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *records = *(u8 **)manager;
    u32 count = *(u32 *)(manager + 8);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x66;

        if (*(u16 *)record == id)
            return LanguageDatabase_GetRecordById(gLanguageDatabase, *(u16 *)(record + 4));
    }
    OS_Halt();
    return 0;
}

/* Return the manager-owned selection record with the requested leading ID.
 * Retail halts when the record does not exist. */
void *RetailSelectionDatabase_GetRecordById(void *manager_pointer, u16 id)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *records = *(u8 **)manager;
    u32 count = *(u32 *)(manager + 8);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x66;

        if (*(u16 *)record == id)
            return record;
    }
    OS_Halt();
    return 0;
}

/* Release the modal-message database's owned eight-byte record array. */
void ModalMessageDatabase_Destroy(void *manager_pointer)
{
    ReleaseArray(manager_pointer);
}

/* Load the four-u16 modal-message relationships at retail 0x020794A4. */
void ModalMessageDatabase_Load(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    FSFile *file = (FSFile *)(manager + 0x0c);
    FSFileID *file_id = (FSFileID *)(manager + 0x54);
    u8 header[0x10];
    u8 input[8];
    u32 count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(file);
    CheckedFS_ConvertPathToFileID(file_id, data_020ea62c);
    CheckedFS_OpenFileFast(file, *file_id);
    CheckedFS_ReadFile(file, header, sizeof(header));
    count = ReadU16(header);
    *(u32 *)(manager + 8) = count;
    if (*(void **)manager != 0)
        ModalMessageDatabase_Destroy(manager);
    records = Heap_Alloc(count * 8, data_020ea5e0, 4, &gHeapContext);
    *(u8 **)manager = records;
    *(u32 *)(manager + 4) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 8;

        CheckedFS_ReadFile(file, input, sizeof(input));
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = ReadU16(input + 2);
        *(u16 *)(record + 4) = ReadU16(input + 4);
        *(u16 *)(record + 6) = ReadU16(input + 6);
    }
    CheckedFS_CloseFile(file);
}

/* Resolve one shared 0x10-byte descriptor by its leading ID, as 0x02079FC4. */
void *func_02079fc4(void *language_manager, u16 id)
{
    u32 index;

    (void)language_manager;
    for (index = 0; index < data_020c6d14; ++index) {
        u8 *record = data_020c6d18 + index * 0x10;
        if (*(u16 *)record == id)
            return record;
    }
    return data_020c6d18;
}

/* Load the 0x62-byte localized record database at retail 0x02079D78. */
void func_02079d78(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    GameFile file;
    u8 header[0x10];
    u8 input[4];
    u32 count;
    u32 index;
    u8 *records;

    GameFile_Init(&file);
    GameFile_Open(&file, data_020c6cfc);
    GameFile_Read(&file, header, sizeof(header));
    count = ReadU16(header);
    *(u32 *)(manager + 0x1b8) = count;
    records = (u8 *)Heap_Alloc(count * 0x62 + 8, data_020ea5c0, 4,
                               &gHeapContext) + 8;
    *(u32 *)(records - 8) = 0x62;
    *(u32 *)(records - 4) = count;
    *(u8 **)(manager + 0x1b0) = records;
    *(u32 *)(manager + 0x1b4) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x62;
        GameFile_Read(&file, input, sizeof(input));
        *(u16 *)record = ReadU16(input);
        LanguageDatabase_CopyRecordById(gLanguageDatabase, ReadU16(input + 2), record + 2, 0x60);
    }
    GameFile_Close(&file);
    *(u32 *)(manager + 0x1bc) = count / 2;
    *(u16 *)(manager + 0x1c0) =
        *(u16 *)(records + (count / 2) * 0x62);
    LanguageLookupDatabase_Load(manager);
    ModalMessageDatabase_Load(manager + 0x88);
    RetailSelectionDatabase_Load(manager + 0x154);
    GameFile_Destroy(&file);
}

/* Copy one 0x78-byte database record. */
static void CopyRecord78(u8 *destination, const u8 *source)
{
    memcpy(destination, source, 0x78);
}

/* Per-record destructor callback; runtime records own no nested allocations. */
void RuntimeRecordTable_RecordDestroyNoOp(void *record_pointer)
{
    (void)record_pointer;
}

/* Release the array allocation whose eight-byte header precedes the records. */
void RuntimeRecordTable_Destroy(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *records = *(u8 **)manager;

    if (records != 0) {
        Heap_Free(records - 8);
        *(void **)manager = 0;
    }
    *(u32 *)(manager + 4) = 0;
}

/* Load and sort the 0x78-byte runtime record table at retail 0x02079694. */
void RuntimeRecordTable_Load(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    GameFile file;
    u8 header[0x10];
    u8 input[0x18];
    u32 count;
    u32 index;
    u8 *records;

    GameFile_Init(&file);
    GameFile_Open(&file, data_020ea63c);
    GameFile_Read(&file, header, sizeof(header));
    count = ReadU16(header);
    *(u32 *)(manager + 0x108) = count;
    if (*(void **)manager != 0)
        RuntimeRecordTable_Destroy(manager);
    records = (u8 *)Heap_Alloc(count * 0x78 + 8, data_020ea5b8, 4,
                               &gHeapContext) + 8;
    *(u32 *)(records - 8) = 0x78;
    *(u32 *)(records - 4) = count;
    *(u8 **)manager = records;
    *(u32 *)(manager + 4) = count;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x78;

        GameFile_Read(&file, input, sizeof(input));
        *(u16 *)(record + 0x00) = ReadU16(input + 0x00);
        *(u16 *)(record + 0x02) = ReadU16(input + 0x0e);
        *(void **)(record + 0x04) =
            func_02079fc4(gLanguageDatabase, ReadU16(input + 0x04));
        *(void **)(record + 0x08) =
            func_02079fc4(gLanguageDatabase, ReadU16(input + 0x08));
        *(u8 *)(record + 0x0c) = (u8)ReadU16(input + 0x06);
        *(u8 *)(record + 0x0d) = (u8)ReadU16(input + 0x0a);
        *(u16 *)(record + 0x0e) = ReadU16(input + 0x10);
        *(u16 *)(record + 0x10) = ReadU16(input + 0x02);
        *(u16 *)(record + 0x12) = ReadU16(input + 0x12);
        *(u16 *)(record + 0x14) = ReadU16(input + 0x14);
        *(s16 *)(record + 0x16) = (s16)ReadU16(input + 0x16);
        LanguageDatabase_CopyRecordById(gLanguageDatabase, ReadU16(input + 0x0c),
                      record + 0x18, 0x60);
    }
    GameFile_Close(&file);

    for (index = 1; index < count; ++index) {
        u32 position = index;
        while (position != 0 &&
               *(u16 *)(records + position * 0x78 + 2) <
                   *(u16 *)(records + (position - 1) * 0x78 + 2)) {
            u8 temporary[0x78];
            CopyRecord78(temporary, records + position * 0x78);
            CopyRecord78(records + position * 0x78,
                         records + (position - 1) * 0x78);
            CopyRecord78(records + (position - 1) * 0x78, temporary);
            --position;
        }
    }
    memset(manager + 8, 0, 0x100);
    *(u32 *)(manager + 0x10c) = 0;
    *(u32 *)(manager + 0x110) = 0;
}
