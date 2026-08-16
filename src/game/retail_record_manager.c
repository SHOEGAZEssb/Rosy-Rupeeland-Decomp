


/* Portable entry points for the retail record/menu manager aggregate. */
#include "tingle/heap.h"
#include "tingle/checked_fs.h"
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);
extern void *memset(void *destination, int value, u32 size);

extern u8 data_021f5138[];
extern u8 data_021f4090[];
extern u8 data_021f3ecc[];
extern const char data_020eeb54[];
extern const char data_020eebdc[];
extern const char data_020eebe4[];
extern const char data_020eebcc[];
extern const char data_020eebd4[];
extern const char data_020eebc4[];
extern const u8 data_020eeb4c[];
extern const u8 data_020eeb94[];
extern const u8 data_020eebb0[];
extern const u8 data_020ef028[];
extern const u8 data_020ef0a8[];
extern const u8 data_020eef68[];
extern const u8 data_020eefac[];
extern const u8 data_020eef28[];
extern const u8 data_020eefe8[];
extern const u8 data_020ef068[];
extern const u8 data_020ef0e4[];
extern const u8 data_020ef124[];
extern const u8 data_020ef164[];
extern const u8 data_020ef1a0[];
extern const u8 data_020ef1e0[];
extern const u8 data_020ef21c[];
extern const u8 data_020ef25c[];
extern const u8 data_020ef29c[];
extern const u8 data_020ef2dc[];
extern const u8 data_020ef31c[];
extern u8 data_021f5128[];
extern const char *data_020c9200[];
extern void OS_Halt(void);
extern void func_02078dd4(void *manager, u16 id, void *destination,
                          u32 destination_size);
extern void *func_02079fc4(void *manager, u16 id);
extern void *func_02063b90(void *database, u16 id);
extern u8 data_021e9ad0[];
extern void func_0207b944(void *database);
extern void func_0207bb94(void *database);
extern void func_0207be20(void *database);
extern void func_0207c084(void *database);
extern void *func_0207a2cc(void *manager);
extern void *gGameWork;

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

/* Resolve a menu record by retail ID at 0x0207B5DC. */
void *func_0207b5dc(void *database_pointer, u16 id)
{
    u8 *database = (u8 *)database_pointer;
    u8 *records = *(u8 **)database;
    u32 count = *(u32 *)(database + 0x20);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x8c;
        if (*(u16 *)record == id)
            return record;
    }
    OS_Halt();
    return 0;
}

/*
 * Resolve selector through the retail record database, then test the GameWork
 * availability bit indexed by record halfword +0x02. The first argument is a
 * borrowed caller context retained by the resident callback ABI but unused by
 * retail; selector selects the borrowed record. Returns normalized zero/one
 * and does not modify either database or save state.
 */
s32 func_0207a450(void *context, s32 selector)
{
    u8 *record;
    u32 index;

    (void)context;
    record = (u8 *)func_0207b5dc(data_021f5138, (u16)selector);
    index = *(u16 *)(record + 2);
    return (((u8 *)gGameWork)[0xf68 + index / 8] &
            (u8)(1u << (index % 8))) != 0;
}

/* Return the retail record bank selected by packed flag bits 8..11. */
u32 func_0207b334(u16 id)
{
    u8 *record = func_0207b5dc(data_021f5138, id);
    return ((*(u32 *)(record + 0x0c) >> 8) & 0x0f) == 1 ? 0 : 1;
}

/* Insert one menu record into a category's original two-bank slot arrays. */
void *func_0207acd0(void *category_pointer, u16 id)
{
    u8 *category = (u8 *)category_pointer;
    u8 *record = func_0207b5dc(data_021f5138, id);
    u32 bank = func_0207b334(id);
    u32 count = *(u32 *)(category + 8 + bank * 4);
    u8 *slots = *(u8 **)(category + 0x18 + bank * 4);
    u32 index;
    u8 *slot;

    if ((*(u32 *)(record + 0x0c) & 0xff) != *(u32 *)(category + 4))
        OS_Halt();
    for (index = 0; index < count; ++index) {
        if (*(u16 *)(*(u8 **)(slots + index * 0x10 + 4)) == id)
            return 0;
    }
    if (count >= 0x32)
        OS_Halt();
    slot = slots + count * 0x10;
    *(u8 **)(slot + 4) = record;
    *(u32 *)(slot + 8) = *(u32 *)(record + 8);
    *(u32 *)(category + 8 + bank * 4) = count + 1;
    return slot;
}

static void PopulateRecordCategory(u8 *category, u16 excluded0,
                                   u16 excluded1)
{
    u8 *records = *(u8 **)data_021f5138;
    u32 count = *(u32 *)(data_021f5138 + 0x20);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x8c;
        u32 flags = *(u32 *)(record + 0x0c);
        u16 id = *(u16 *)record;

        if ((flags & 0xff) == *(u32 *)(category + 4) &&
            ((flags >> 8) & 0x0f) == 0 && id != excluded0 &&
            id != excluded1)
            func_0207acd0(category, id);
    }
}

void func_0207e0e8(void *self)
{
    PopulateRecordCategory((u8 *)self, 0x2f, 0xffff);
}

void func_0207e270(void *self)
{
    PopulateRecordCategory((u8 *)self, 0x23, 0xffff);
}

void func_0207aae4(void *self)
{
    PopulateRecordCategory((u8 *)self, 0xffff, 0xffff);
}

void func_0207dbcc(void *self)
{
    PopulateRecordCategory((u8 *)self, 0x18, 0xffff);
}

void func_0207deb4(void *self)
{
    PopulateRecordCategory((u8 *)self, 0x48, 0x4a);
}

void func_0207e3cc(void *self)
{
    (void)self;
}

void func_0207b55c(void *self)
{
    (void)self;
}

static u32 ReadHeaderCount(u8 *database, u32 file_offset, u32 id_offset,
                           const char *path)
{
    FSFile *file = (FSFile *)(database + file_offset);
    FSFileID *file_id = (FSFileID *)(database + id_offset);
    u8 header[0x10];

    CheckedFS_InitFile(file);
    if (!CheckedFS_ConvertPathToFileID(file_id, path))
        OS_Halt();
    if (!CheckedFS_OpenFileFast(file, *file_id))
        OS_Halt();
    if (CheckedFS_ReadFile(file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    CheckedFS_CloseFile(file);
    return ReadU16(header);
}

void func_0207b668(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    *(u32 *)(database + 0x24) =
        ReadHeaderCount(database, 0x78, 0x158, data_020c9200[4]);
}

void func_0207b6ec(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    *(u32 *)(database + 0x28) =
        ReadHeaderCount(database, 0xc0, 0x160, data_020c9200[7]);
}

void func_0207b770(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    *(u32 *)(database + 0x2c) =
        ReadHeaderCount(database, 0x108, 0x168, data_020c9200[3]);
}

/* Load the fixed 18 localized record-category rows at 0x0207B7F4. */
void func_0207b7f4(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile *file = (FSFile *)(database + 0x30);
    FSFileID *file_id = (FSFileID *)(database + 0x150);
    u8 header[0x10];
    u8 input[0x20];
    u32 index;
    u32 subindex;

    CheckedFS_InitFile(file);
    if (!CheckedFS_ConvertPathToFileID(file_id, data_020c9200[1]))
        OS_Halt();
    if (!CheckedFS_OpenFileFast(file, *file_id))
        OS_Halt();
    if (CheckedFS_ReadFile(file, header, sizeof(header)) < sizeof(header) ||
        ReadU16(header) != 0x12)
        OS_Halt();
    for (index = 0; index < 0x12; ++index) {
        u8 *record = database + 0x170 + index * 0x9c;

        if (CheckedFS_ReadFile(file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        func_02078dd4(data_021f4090, ReadU16(input), record, 0x60);
        *(void **)(record + 0x8c) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 2));
        *(u16 *)(record + 0x90) = ReadU16(input + 4);
        *(void **)(record + 0x94) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 6));
        *(u16 *)(record + 0x98) = ReadU16(input + 8);
        for (subindex = 0; subindex < 11; ++subindex)
            *(u16 *)(record + 0x60 + subindex * 4) =
                ReadU16(input + 0x0a + subindex * 2);
    }
    CheckedFS_CloseFile(file);
}

/* Load the primary 0x8c-byte selectable records at retail 0x0207B944. */
void func_0207b944(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 header[0x10];
    u8 input[0x10];
    u32 own_count;
    u32 total_count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020c9200[5]);
    CheckedFS_OpenFileFast(&file, file_id);
    if (CheckedFS_ReadFile(&file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    own_count = ReadU16(header);
    total_count = own_count + *(u32 *)(database + 0x24) +
                  *(u32 *)(database + 0x28) + *(u32 *)(database + 0x2c);
    *(u32 *)(database + 0x20) = total_count;
    if (*(void **)database != 0)
        Heap_Free(*(void **)database);
    records = Heap_Alloc(total_count * 0x8c, data_020eebdc, 4,
                         &gHeapContext);
    *(u8 **)database = records;
    *(u32 *)(database + 4) = total_count;
    for (index = 0; index < own_count; ++index) {
        u8 *record = records + index * 0x8c;
        u16 actor_id;
        u8 *actor;
        u32 flags;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        actor_id = ReadU16(input + 6);
        actor = func_02063b90(data_021e9ad0, actor_id);
        memset(record, 0, 0x8c);
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = (u16)index;
        *(u16 *)(record + 4) = 0;
        memcpy(record + 0x2c, actor + 0x10, 0x60);
        *(u32 *)(record + 8) = *(u32 *)(actor + 0x0c) +
                               ((u32)ReadU16(input + 8) |
                                ((u32)ReadU16(input + 0x0a) << 16));
        flags = input[2] | ((u32)input[4] << 16);
        if (input[5] == 1)
            flags |= 0x20000000;
        else if (input[5] == 2)
            flags |= 0x80000000;
        *(u32 *)(record + 0x0c) = flags;
        *(u32 *)(record + 0x10) = actor_id;
        *(u32 *)(record + 0x14) =
            (u32)ReadU16(input + 0x0c) |
            ((u32)ReadU16(input + 0x0e) << 16);
    }
    CheckedFS_CloseFile(&file);
}

/* Append localized 0x8c-byte menu records at retail 0x0207BB94. */
void func_0207bb94(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile *file = (FSFile *)(database + 0x78);
    FSFileID *file_id = (FSFileID *)(database + 0x158);
    u8 header[0x10];
    u8 input[0x40];
    u32 count;
    u32 start;
    u32 index;
    u8 *records = *(u8 **)database;
    u8 *auxiliary;

    CheckedFS_InitFile(file);
    if (!CheckedFS_ConvertPathToFileID(file_id, data_020c9200[6]))
        OS_Halt();
    if (!CheckedFS_OpenFileFast(file, *file_id))
        OS_Halt();
    if (CheckedFS_ReadFile(file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    count = ReadU16(header);
    *(u32 *)(database + 0x24) = count;
    if (*(void **)(database + 8) != 0)
        Heap_Free(*(void **)(database + 8));
    auxiliary = Heap_Alloc(count * 0x10, data_020eebe4, 4, &gHeapContext);
    *(u8 **)(database + 8) = auxiliary;
    *(u32 *)(database + 0x0c) = count;
    start = *(u32 *)(database + 0x20) - count -
            *(u32 *)(database + 0x28) - *(u32 *)(database + 0x2c);
    for (index = 0; index < count; ++index) {
        u8 *record = records + (start + index) * 0x8c;
        u8 *aux = auxiliary + index * 0x10;
        u32 list_count = 0;
        u32 subindex;
        u32 flags;

        if (CheckedFS_ReadFile(file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        memset(record, 0, 0x8c);
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = (u16)(start + index);
        *(u16 *)(record + 4) = ReadU16(input + 2);
        func_02078dd4(data_021f4090, ReadU16(input + 6), record + 0x2c,
                      0x60);
        flags = (u32)(s32)(s8)input[4] | 0x00010100u;
        if (input[5] == 1)
            flags |= 0x20000000u;
        else if (input[5] == 2)
            flags |= 0x80000000u;
        for (subindex = 0; subindex < 7; ++subindex) {
            u32 value = (u32)input[0x20 + subindex * 4] |
                        ((u32)input[0x21 + subindex * 4] << 8) |
                        ((u32)input[0x22 + subindex * 4] << 16) |
                        ((u32)input[0x23 + subindex * 4] << 24);
            if (value == 0xffffffffu)
                break;
            *(u32 *)(record + 0x10 + list_count * 4) = value;
            ++list_count;
        }
        *(u32 *)(record + 0x0c) = flags | (list_count << 12);
        *(u16 *)(aux + 0) = ReadU16(input + 0);
        for (subindex = 0; subindex < 7; ++subindex)
            *(u16 *)(aux + 2 + subindex * 2) =
                ReadU16(input + 0x10 + subindex * 2);
    }
    CheckedFS_CloseFile(file);
}

/* Append the second auxiliary record family at retail 0x0207BE20. */
void func_0207be20(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile *file = (FSFile *)(database + 0xc0);
    FSFileID *file_id = (FSFileID *)(database + 0x160);
    u8 header[0x10];
    u8 input[0x40];
    u32 count;
    u32 start;
    u32 index;
    u8 *records = *(u8 **)database;
    u8 *auxiliary;

    CheckedFS_InitFile(file);
    if (!CheckedFS_ConvertPathToFileID(file_id, data_020c9200[2]))
        OS_Halt();
    if (!CheckedFS_OpenFileFast(file, *file_id))
        OS_Halt();
    if (CheckedFS_ReadFile(file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    count = ReadU16(header);
    *(u32 *)(database + 0x28) = count;
    if (*(void **)(database + 0x10) != 0)
        Heap_Free(*(void **)(database + 0x10));
    auxiliary = Heap_Alloc(count * 0x10, data_020eebcc, 4, &gHeapContext);
    *(u8 **)(database + 0x10) = auxiliary;
    *(u32 *)(database + 0x14) = count;
    start = *(u32 *)(database + 0x20) - count - *(u32 *)(database + 0x2c);
    for (index = 0; index < count; ++index) {
        u8 *record = records + (start + index) * 0x8c;
        u8 *aux = auxiliary + index * 0x10;
        u32 list_count = 0;
        u32 subindex;
        u32 flags;

        if (CheckedFS_ReadFile(file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        memset(record, 0, 0x8c);
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = (u16)(start + index);
        *(u16 *)(record + 4) = ReadU16(input + 2);
        flags = (u32)(s32)(s8)input[4] | 0x00010100u;
        if (input[5] == 1)
            flags |= 0x20000000u;
        else if (input[5] == 2)
            flags |= 0x80000000u;
        for (subindex = 0; subindex < 7; ++subindex) {
            u32 value = (u32)input[8 + subindex * 4] |
                        ((u32)input[9 + subindex * 4] << 8) |
                        ((u32)input[10 + subindex * 4] << 16) |
                        ((u32)input[11 + subindex * 4] << 24);
            if (value == 0xffffffffu)
                break;
            *(u32 *)(record + 0x10 + list_count * 4) = value;
            ++list_count;
        }
        *(u32 *)(record + 0x0c) = flags | (list_count << 12);
        *(u16 *)(aux + 0) = ReadU16(input + 0);
        for (subindex = 0; subindex < 7; ++subindex)
            *(u16 *)(aux + 2 + subindex * 2) =
                ReadU16(input + 0x30 + subindex * 2);
    }
    CheckedFS_CloseFile(file);
}

/* Append the final one-item localized record family at 0x0207C084. */
void func_0207c084(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile *file = (FSFile *)(database + 0x108);
    FSFileID *file_id = (FSFileID *)(database + 0x168);
    u8 header[0x10];
    u8 input[4];
    u32 count;
    u32 start;
    u32 index;
    u8 *records = *(u8 **)database;
    u16 *ids;

    CheckedFS_InitFile(file);
    if (!CheckedFS_ConvertPathToFileID(file_id, data_020c9200[0]))
        OS_Halt();
    if (!CheckedFS_OpenFileFast(file, *file_id))
        OS_Halt();
    if (CheckedFS_ReadFile(file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    count = ReadU16(header);
    *(u32 *)(database + 0x2c) = count;
    if (*(void **)(database + 0x18) != 0)
        Heap_Free(*(void **)(database + 0x18));
    ids = Heap_Alloc(count * 2, data_020eebd4, 4, &gHeapContext);
    *(u16 **)(database + 0x18) = ids;
    *(u32 *)(database + 0x1c) = count;
    start = *(u32 *)(database + 0x20) - count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + (start + index) * 0x8c;

        if (CheckedFS_ReadFile(file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        memset(record, 0, 0x8c);
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = (u16)(start + index);
        *(u16 *)(record + 4) = 0;
        *(u32 *)(record + 8) = 0;
        *(u32 *)(record + 0x0c) = 0x00011107;
        *(u32 *)(record + 0x10) = 1;
        func_02078dd4(data_021f4090, ReadU16(input + 2), record + 0x2c,
                      0x60);
        ids[index] = ReadU16(input + 0);
    }
    CheckedFS_CloseFile(file);
}

static void InitializeRecordSlot(u8 *slot)
{
    *(const void **)slot = data_020eeb4c;
    *(u32 *)(slot + 4) = 0;
    *(u32 *)(slot + 8) = 0;
    *(u32 *)(slot + 0x0c) = 0;
}

static void InitializeRecordCategory(u8 *category, u32 category_index)
{
    u32 index;

    memset(category, 0, 0x670);
    *(const void **)category = data_020eeb94;
    *(u32 *)(category + 4) = category_index;
    *(u8 **)(category + 0x18) = category + 0x20;
    *(u8 **)(category + 0x1c) = category + 0x340;
    *(u32 *)(category + 0x10) = 0x32;
    *(u32 *)(category + 0x14) = 0x32;
    for (index = 0; index < 0x32; ++index) {
        InitializeRecordSlot(category + 0x20 + index * 0x10);
        InitializeRecordSlot(category + 0x340 + index * 0x10);
    }
    *(u8 **)(category + 0x660) = category;
    *(u32 *)(category + 0x664) = 0;
    *(u8 **)(category + 0x668) = category;
    *(u32 *)(category + 0x66c) = 1;
}

static void *CreateRecordCategory(u32 category_index)
{
    static const void *const vtables[18] = {
        data_020ef028, data_020ef0a8, data_020eef68, data_020eefac,
        data_020eef28, data_020eefe8, data_020ef068, data_020ef0e4,
        data_020eebb0, data_020ef124, data_020ef164, data_020ef1a0,
        data_020ef1e0, data_020ef21c, data_020ef25c, data_020ef29c,
        data_020ef2dc, data_020ef31c
    };
    u8 *category = Heap_Alloc(0x670, data_020eebc4, 4, &gHeapContext);

    if (category == 0)
        return 0;
    if (category_index >= 18)
        category_index = 8;
    InitializeRecordCategory(category, category_index);
    *(const void **)category = vtables[category_index];
    return category;
}

/* Construct and initialize all 18 retail record categories at 0x0207A2CC. */
void *func_0207a2cc(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u32 index;

    for (index = 0; index < 0xc8; ++index)
        InitializeRecordSlot(manager + 0x48 + index * 0x10);
    *(void **)data_021f5128 = manager;
    for (index = 0; index < 18; ++index) {
        u8 *category = CreateRecordCategory(index);

        *(u8 **)(manager + index * 4) = category;
        if (category == 0)
            OS_Halt();
        if (index == 0)
            func_0207e0e8(category);
        else if (index == 1)
            func_0207e270(category);
        else if (index == 4)
            func_0207dbcc(category);
        else if (index == 5)
            func_0207deb4(category);
        else if (index == 7)
            func_0207e3cc(category);
        else if (index == 8)
            func_0207b55c(category);
        else
            func_0207aae4(category);
    }
    *(u32 *)(manager + 0xcc8) = 0;
    return manager;
}

/* Load all eight record/menu databases in retail order at 0x0207B620. */
void func_0207b620(void *database)
{
    func_0207b7f4(database);
    func_0207b668(database);
    func_0207b6ec(database);
    func_0207b770(database);
    func_0207b944(database);
    func_0207bb94(database);
    func_0207be20(database);
    func_0207c084(database);
}

/* Load record data, allocate 0xccc bytes, and publish its runtime manager. */
void func_0207a268(void)
{
    void *manager;

    func_0207b620(data_021f5138);
    manager = Heap_Alloc(0xccc, data_020eeb54, 4, &gHeapContext);
    if (manager != 0)
        func_0207a2cc(manager);
}





