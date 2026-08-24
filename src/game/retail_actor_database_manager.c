


/* Portable reconstructions for the retail actor/database manager bootstrap. */
#include "tingle/heap.h"
#include "tingle/checked_fs.h"
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);

extern u8 data_021e9ad0[];
extern u8 data_021e9ac0[];
extern u8 data_021e9e00[];
extern const char data_020e4f80[];
extern const char data_020e4f88[];
extern const char data_020e4f90[];
extern const char data_020e4f98[];
extern const char data_020e4fa0[];
extern const char data_020e4fa8[];
extern const char data_020e4fec[];
extern const char data_020e5000[];
extern const char data_020e5048[];
extern const char data_020e5050[];
extern const char data_020e5058[];
extern const char *data_020c45a4[];
extern u8 data_021f3ecc[];
extern u8 data_021f4090[];
extern void OS_Halt(void);
extern void SelfLinkedSpriteConfig_Init(void *descriptor);
extern void LanguageDatabase_CopyRecordById(void *manager, u16 id, void *destination,
                          u32 destination_size);
extern void *func_02079fc4(void *manager, u16 id);
extern void func_02063cd0(void *database);
extern void *func_0206330c(void *manager);

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

static u32 ReadU32(const u8 *bytes)
{
    return (u32)bytes[0] | ((u32)bytes[1] << 8) |
           ((u32)bytes[2] << 16) | ((u32)bytes[3] << 24);
}

static u32 ReadCount(FSFile *file)
{
    u8 header[0x10];

    if (CheckedFS_ReadFile(file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    return ReadU16(header);
}

static void ReleaseDatabaseArray(u8 *database, u32 pointer_offset)
{
    void **pointer = (void **)(database + pointer_offset);

    if (*pointer != 0) {
        Heap_Free(*pointer);
        *pointer = 0;
    }
    *(u32 *)(database + pointer_offset + 4) = 0;
}

static void *FindRecord(u8 *database, u32 count_offset, u32 records_offset,
                        u32 stride, u16 id)
{
    u8 *records = *(u8 **)(database + records_offset);
    u32 count = *(u32 *)(database + count_offset);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * stride;
        if (*(u16 *)record == id)
            return record;
    }
    return records;
}

static void *FindActorRecord(u8 *database, u16 id)
{
    return FindRecord(database, 0x29c, 0x2c0, 0x70, id);
}

/* Resolve one actor descriptor by retail ID at 0x02063B90. */
void *ActorDatabase_FindDescriptorById(void *database, u16 id)
{
    return FindActorRecord((u8 *)database, id);
}

static void InitializeRuntimeEntry(u8 *entry)
{
    SelfLinkedSpriteConfig_Init(entry);
}

/* Initialize the first 0x1c-byte retail runtime-entry container. */
static void InitializePrimaryContainer(u8 *container, u32 mode, u32 capacity,
                                       u32 extra)
{
    u32 index;
    u8 *entries = Heap_Alloc(capacity * 0x24, data_020e5050, 4,
                             &gHeapContext);

    *(const void **)(container + 0) = data_020e5048;
    *(u32 *)(container + 4) = mode;
    *(u8 **)(container + 8) = entries;
    *(u32 *)(container + 0x0c) = extra;
    *(u32 *)(container + 0x10) = capacity;
    *(u32 *)(container + 0x14) = 0;
    *(u32 *)(container + 0x18) = 0;
    for (index = 0; index < capacity; ++index)
        InitializeRuntimeEntry(entries + index * 0x24);
}

/* Initialize either 0x18-byte secondary retail runtime-entry container. */
static void InitializeSecondaryContainer(u8 *container, u32 mode,
                                         u32 capacity, u32 extra)
{
    u32 index;
    u8 *entries = Heap_Alloc(capacity * 0x24, data_020e5058, 4,
                             &gHeapContext);

    *(u32 *)(container + 0) = mode;
    *(u8 **)(container + 4) = entries;
    *(u32 *)(container + 8) = extra;
    *(u32 *)(container + 0x0c) = capacity;
    *(u32 *)(container + 0x10) = 0;
    *(u32 *)(container + 0x14) = 0;
    for (index = 0; index < capacity; ++index)
        InitializeRuntimeEntry(entries + index * 0x24);
}

/* Populate the retail default type-1 actor-entry set at 0x020633AC. */
void func_020633ac(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *actors = *(u8 **)(data_021e9ad0 + 0x2c0);
    u32 actor_count = *(u32 *)(data_021e9ad0 + 0x29c);
    u32 eligible_count = 0;
    u32 index;

    for (index = 0; index < actor_count; ++index) {
        u8 *actor = actors + index * 0x70;
        u16 id = *(u16 *)actor;

        if (id != 0xfb && id != 0xfd && id != 0x177 && actor[2] == 1 &&
            (*(u8 **)(actor + 8))[4] == 0)
            ++eligible_count;
    }
    InitializeSecondaryContainer(manager + 0x1c, 1, eligible_count, 0);
    for (index = 0; index < actor_count; ++index) {
        u8 *actor = actors + index * 0x70;
        u16 id = *(u16 *)actor;

        if (id != 0xfb && id != 0xfd && id != 0x177 && actor[2] == 1 &&
            (*(u8 **)(actor + 8))[4] == 0) {
            u32 used = *(u32 *)(manager + 0x1c + 0x10);
            u8 *entry = *(u8 **)(manager + 0x1c + 4) + used * 0x24;

            *(u16 *)(entry + 0) = id;
            *(u16 *)(entry + 4) = 0;
            *(u16 *)(entry + 6) = 2;
            *(u8 **)(entry + 8) = actor;
            *(u32 *)(entry + 0x0c) = 0;
            *(u32 *)(entry + 0x20) = 0;
            *(u32 *)(manager + 0x1c + 0x10) = used + 1;
        }
    }
}

/* Construct and publish the 0x4c-byte runtime manager at 0x0206330C. */
void *func_0206330c(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;

    InitializePrimaryContainer(manager, 0, 0xdc, 0);
    InitializeSecondaryContainer(manager + 0x34, 1, 0x64, 1);
    *(void **)data_021e9ac0 = manager;
    func_020633ac(manager);
    return manager;
}

static u32 FindPhaseActorRank(u16 actor_id)
{
    u32 count = *(u32 *)data_021e9e00;
    void **phases = *(void ***)(data_021e9e00 + 8);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *phase = (u8 *)phases[index];
        if (*(u16 *)(phase + 4) == actor_id)
            return *(u16 *)(phase + 2);
    }
    OS_Halt();
    return 0;
}

/* Rank and sort the retail default actor entries at 0x020634B0. */
void func_020634b0(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *entries = *(u8 **)(manager + 0x20);
    u32 count = *(u32 *)(manager + 0x28);
    u32 ranks[100];
    u32 index;

    if (count > sizeof(ranks) / sizeof(ranks[0]))
        OS_Halt();
    for (index = 0; index < count; ++index) {
        u8 *entry = entries + index * 0x24;

        ranks[index] = *(u16 *)entry == 0xec
                           ? 0
                           : FindPhaseActorRank(*(u16 *)entry);
        *(u32 **)(entry + 0x20) = &ranks[index];
    }
    for (index = 1; index < count; ++index) {
        u32 position = index;

        while (position != 0) {
            u8 *current = entries + position * 0x24;
            u8 *previous = current - 0x24;

            if (**(u32 **)(current + 0x20) >=
                **(u32 **)(previous + 0x20))
                break;
            {
                u8 temporary[0x24];
                memcpy(temporary, current, sizeof(temporary));
                memcpy(current, previous, sizeof(temporary));
                memcpy(previous, temporary, sizeof(temporary));
            }
            --position;
        }
    }
}

/* Load the 0x0c-byte type-3 descriptors at retail 0x02063F30. */
void func_02063f30(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 input[0x0c];
    u32 count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020c45a4[1]);
    CheckedFS_OpenFileFast(&file, file_id);
    count = ReadCount(&file);
    *(u32 *)(database + 0x2a4) = count;
    if (*(void **)(database + 0x2d0) != 0)
        ReleaseDatabaseArray(database, 0x2d0);
    records = Heap_Alloc(count * 0x0c, data_020e4f90, 4, &gHeapContext);
    *(u8 **)(database + 0x2d0) = records;
    *(u32 *)(database + 0x2d4) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x0c;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u8 *)(record + 2) = (u8)ReadU16(input + 4);
        *(u8 *)(record + 3) = input[8];
        *(u16 *)(record + 4) = ReadU16(input + 6);
        *(void **)(record + 8) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 2));
    }
    CheckedFS_CloseFile(&file);
}

/* Load the 0x14-byte type-0 descriptors at retail 0x020640A4. */
void func_020640a4(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 input[0x10];
    u32 count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020e4fec);
    CheckedFS_OpenFileFast(&file, file_id);
    count = ReadCount(&file);
    *(u32 *)(database + 0x2a0) = count;
    if (*(void **)(database + 0x2c8) != 0)
        ReleaseDatabaseArray(database, 0x2c8);
    records = Heap_Alloc(count * 0x14, data_020e4f88, 4, &gHeapContext);
    *(u8 **)(database + 0x2c8) = records;
    *(u32 *)(database + 0x2cc) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x14;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = ReadU16(input + 6);
        *(u8 *)(record + 4) = input[8];
        *(u8 *)(record + 5) = input[9];
        *(u8 *)(record + 6) = input[10];
        *(u8 *)(record + 7) = input[11];
        *(void **)(record + 8) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 2));
        *(void **)(record + 0x0c) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 4));
        *(u32 *)(record + 0x10) = ReadU32(input + 0x0c);
    }
    CheckedFS_CloseFile(&file);
}

/* Load the localized 0x74-byte type-1 descriptors at retail 0x0206425C. */
void func_0206425c(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 input[0x20];
    u32 count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020e5000);
    CheckedFS_OpenFileFast(&file, file_id);
    count = ReadCount(&file);
    *(u32 *)(database + 0x2a8) = count;
    if (*(void **)(database + 0x2d8) != 0)
        ReleaseDatabaseArray(database, 0x2d8);
    records = Heap_Alloc(count * 0x74, data_020e4fa0, 4, &gHeapContext);
    *(u8 **)(database + 0x2d8) = records;
    *(u32 *)(database + 0x2dc) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x74;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u16 *)(record + 2) = ReadU16(input + 6);
        *(u8 *)(record + 4) = (u8)ReadU16(input + 2);
        *(u16 *)(record + 6) =
            (u16)(input[8] | ((u16)input[9] << 5) | ((u16)input[10] << 10));
        LanguageDatabase_CopyRecordById(data_021f4090, ReadU16(input + 4), record + 8, 0x60);
        *(void **)(record + 0x68) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 0x10));
        *(void **)(record + 0x6c) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 0x14));
        *(s16 *)(record + 0x70) = (s16)ReadU16(input + 0x18);
        *(u8 *)(record + 0x72) = (u8)ReadU16(input + 0x12);
        *(u8 *)(record + 0x73) = (u8)ReadU16(input + 0x16);
    }
    CheckedFS_CloseFile(&file);
}

/* Load the 0x0c-byte type-2 descriptors at retail 0x02064444. */
void func_02064444(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 input[0x0c];
    u32 count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020c45a4[2]);
    CheckedFS_OpenFileFast(&file, file_id);
    count = ReadCount(&file);
    *(u32 *)(database + 0x2ac) = count;
    if (*(void **)(database + 0x2e0) != 0)
        ReleaseDatabaseArray(database, 0x2e0);
    records = Heap_Alloc(count * 0x0c, data_020e4f98, 4, &gHeapContext);
    *(u8 **)(database + 0x2e0) = records;
    *(u32 *)(database + 0x2e4) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x0c;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u8 *)(record + 2) = (u8)ReadU16(input + 4);
        *(s16 *)(record + 4) = (s16)ReadU16(input + 6);
        *(u16 *)(record + 6) = ReadU16(input + 8);
        *(void **)(record + 8) =
            func_02079fc4(data_021f3ecc, ReadU16(input + 2));
    }
    CheckedFS_CloseFile(&file);
}

/* Load and cross-link the 0x70-byte actor descriptors at 0x02063CD0. */
void func_02063cd0(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile *file = (FSFile *)database;
    FSFileID *file_id = (FSFileID *)(database + 0x48);
    u8 input[0x10];
    u32 count;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(file);
    CheckedFS_ConvertPathToFileID(file_id, data_020c45a4[0]);
    CheckedFS_OpenFileFast(file, *file_id);
    count = ReadCount(file);
    *(u32 *)(database + 0x29c) = count;
    if (*(void **)(database + 0x2c0) != 0)
        ReleaseDatabaseArray(database, 0x2c0);
    records = Heap_Alloc(count * 0x70, data_020e4fa8, 4, &gHeapContext);
    *(u8 **)(database + 0x2c0) = records;
    *(u32 *)(database + 0x2c4) = count;
    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x70;
        u8 type;
        u16 descriptor_id;
        void *descriptor;

        if (CheckedFS_ReadFile(file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        type = input[2];
        descriptor_id = ReadU16(input + 4);
        *(u16 *)(record + 0) = ReadU16(input + 0);
        *(u8 *)(record + 2) = type;
        *(u8 *)(record + 3) = input[3] == 1 ? 1 : 0;
        *(u16 *)(record + 4) = descriptor_id;
        *(u16 *)(record + 6) = ReadU16(input + 0x0c);
        *(u32 *)(record + 0x0c) = ReadU32(input + 8);
        LanguageDatabase_CopyRecordById(data_021f4090, ReadU16(input + 6), record + 0x10,
                      0x60);
        if (type == 0) {
            descriptor = FindRecord(database, 0x2a0, 0x2c8, 0x14,
                                    descriptor_id);
            ++*(u32 *)(database + 0x2b0);
        } else if (type == 1) {
            descriptor = FindRecord(database, 0x2a8, 0x2d8, 0x74,
                                    descriptor_id);
            ++*(u32 *)(database + 0x2b8);
        } else if (type == 2) {
            descriptor = FindRecord(database, 0x2ac, 0x2e0, 0x0c,
                                    descriptor_id);
            ++*(u32 *)(database + 0x2bc);
        } else if (type == 3) {
            descriptor = FindRecord(database, 0x2a4, 0x2d0, 0x0c,
                                    descriptor_id);
            ++*(u32 *)(database + 0x2b4);
        } else {
            OS_Halt();
            descriptor = 0;
        }
        *(void **)(record + 8) = descriptor;
    }
    CheckedFS_CloseFile(file);
}

/* Construct the aggregate in the exact retail loader order at 0x02063B14. */
void ActorDatabase_Init(void *database)
{
    func_02063f30(database);
    func_020640a4(database);
    func_0206425c(database);
    func_02064444(database);
    func_02063cd0(database);
    *(void **)((u8 *)database + 0x254) = FindActorRecord(database, 0x3e);
    *(void **)((u8 *)database + 0x258) = FindActorRecord(database, 0x40);
    LanguageDatabase_CopyRecordById(data_021f4090, 0x11c5, (u8 *)database + 0x25c, 0x40);
}

/* Load the actor databases and allocate their 0x4c-byte runtime manager. */
void func_0206328c(void)
{
    void *manager;

    ActorDatabase_Init(data_021e9ad0);
    manager = Heap_Alloc(0x4c, data_020e4f80, 4, &gHeapContext);
    if (manager != 0)
        func_0206330c(manager);
}
