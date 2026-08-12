


/* Portable reconstruction of the retail phase descriptor aggregate. */
#include "tingle/checked_fs.h"
#include "tingle/heap.h"
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);
extern void *memset(void *destination, int value, u32 size);

extern const char data_020e5908[];
extern const char data_020e5910[];
extern const char data_020e5920[];
extern const char data_020e5050[];
extern u8 data_021e9ac0[];
extern u8 data_021e9ad0[];
extern u8 data_021e9de8[];
extern u8 data_021e9e00[];
extern u8 data_021e9e1c[];
extern void OS_Halt(void);
extern void *func_02063b90(void *database, u16 id);
extern void func_020634b0(void *manager);

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

static void InitializeActorEntry(u8 *entry, u16 actor_id, u16 quantity,
                                 u16 field6)
{
    memset(entry, 0, 0x24);
    *(u16 *)(entry + 0) = actor_id;
    *(u16 *)(entry + 4) = quantity > 99 ? 99 : quantity;
    *(u16 *)(entry + 6) = field6;
    *(void **)(entry + 8) = func_02063b90(data_021e9ad0, actor_id);
}

/* Load, filter, and sort 0x10c-byte phase records at retail 0x0206F3A4. */
void func_0206f3a4(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 header[0x10];
    u8 input[0x20];
    u32 file_count;
    u32 stored_count = 0;
    u32 file_index;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020e5910);
    CheckedFS_OpenFileFast(&file, file_id);
    if (CheckedFS_ReadFile(&file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    file_count = ReadU16(header);
    if (*(void **)database != 0)
        Heap_Free(*(void **)database);
    records = Heap_Alloc((file_count - 3) * 0x10c, data_020e5908, 4,
                         &gHeapContext);
    *(u8 **)database = records;
    *(u32 *)(database + 4) = file_count - 3;
    for (file_index = 0; file_index < file_count; ++file_index) {
        u16 phase_id;
        u8 *record;
        u32 actor_count = 0;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        phase_id = ReadU16(input + 0);
        if (phase_id == 0x1c || phase_id == 0x1e || phase_id == 0x22)
            continue;
        record = records + stored_count * 0x10c;
        memset(record, 0, 0x10c);
        *(u16 *)(record + 0) = phase_id;
        *(u16 *)(record + 2) = ReadU16(input + 0x1c);
        InitializeActorEntry(record + 4, ReadU16(input + 2), 1, 1);
        for (index = 0; index < 6; ++index) {
            u16 actor_id = ReadU16(input + 4 + index * 4);

            if (actor_id == 0x55)
                break;
            InitializeActorEntry(record + 0x28 + index * 0x24, actor_id,
                                 ReadU16(input + 6 + index * 4), 0);
            ++actor_count;
        }
        *(u32 *)(record + 0x100) = actor_count;
        ++stored_count;
    }
    CheckedFS_CloseFile(&file);
    *(u32 *)(database + 8) = file_count - 3;
    for (index = 0; index < file_count - 3; ++index)
        *(u32 *)(records + index * 0x10c + 0x104) = index;
    for (index = 1; index < file_count - 3; ++index) {
        u32 position = index;

        while (position != 0 &&
               *(u16 *)(records + position * 0x10c + 2) <
                   *(u16 *)(records + (position - 1) * 0x10c + 2)) {
            u8 temporary[0x10c];

            memcpy(temporary, records + position * 0x10c, sizeof(temporary));
            memcpy(records + position * 0x10c,
                   records + (position - 1) * 0x10c, sizeof(temporary));
            memcpy(records + (position - 1) * 0x10c, temporary,
                   sizeof(temporary));
            --position;
        }
    }
    for (index = 0; index < file_count - 3; ++index)
        *(u32 *)(records + index * 0x10c + 0x108) = index;
}

/* Construct the fixed 15-entry phase runtime pool at 0x0206FC00. */
void func_0206fc00(void *container_pointer)
{
    u8 *container = (u8 *)container_pointer;
    u32 index;
    u8 *entries = Heap_Alloc(15 * 0x24, data_020e5050, 4, &gHeapContext);

    *(u32 *)(container + 4) = 0;
    *(u8 **)(container + 8) = entries;
    *(s32 *)(container + 0x0c) = -1;
    *(u32 *)(container + 0x10) = 15;
    *(u32 *)(container + 0x14) = 0;
    *(u32 *)(container + 0x18) = 0;
    for (index = 0; index < 15; ++index)
        memset(entries + index * 0x24, 0, 0x24);
}

/* Build the phase-record pointer view at retail 0x0206F7BC. */
void func_0206f7bc(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *records = *(u8 **)data_021e9de8;
    u32 count = *(u32 *)(data_021e9de8 + 8);
    u32 index;
    u8 *allocation;
    void **pointers;

    *(u32 *)manager = count;
    allocation = Heap_Alloc(count * 4 + 8, data_020e5920, 4,
                            &gHeapContext);
    *(u32 *)allocation = 4;
    *(u32 *)(allocation + 4) = count;
    pointers = (void **)(allocation + 8);
    *(void ***)(manager + 8) = pointers;
    *(u32 *)(manager + 0x0c) = count;
    *(u32 *)(manager + 4) = 0;
    for (index = 0; index < count; ++index)
        pointers[index] = records + index * 0x10c;
}

/* Execute the exact retail phase database aggregate order at 0x0206F780. */
void func_0206f780(void)
{
    func_0206f3a4(data_021e9de8);
    func_0206fc00(data_021e9e1c);
    func_0206f7bc(data_021e9e00);
    func_020634b0(*(void **)data_021e9ac0);
}







