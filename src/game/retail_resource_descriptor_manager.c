


/* Portable reconstruction of the retail grouped resource descriptor loader. */
#include "tingle/checked_fs.h"
#include "tingle/heap.h"
#include "tingle/types.h"


extern void *memset(void *destination, int value, u32 size);

extern const char *data_020c4744;
extern const char data_020e6a34[];
extern const char data_020e6a14[];
extern u8 data_021e9ad0[];
extern u8 data_021f38d8[];
extern u8 data_021f38e8[];
extern u8 data_021f38fc[];
extern void OS_Halt(void);
extern void *func_02063b90(void *database, u16 id);
extern void func_02022fbc(void *configuration);

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

/* Allocate the retail fixed record and pointer pools at 0x02077FB4. */
void func_02077fb4(u32 count)
{
    *(u32 *)(data_021f38d8 + 0) = count;
    *(u32 *)(data_021f38d8 + 8) = count;
    *(void **)(data_021f38d8 + 4) =
        Heap_Alloc(count * 0x2c, data_020e6a14, 4, &gHeapContext);
    *(void **)(data_021f38d8 + 0x0c) =
        Heap_Alloc(count * 4, data_020e6a14, 4, &gHeapContext);
}

/* Consume one fixed 0x2c-byte descriptor from the retail linear pool. */
static u8 *AllocateDescriptor(void)
{
    u8 *result = *(u8 **)(data_021f38d8 + 4);

    *(u8 **)(data_021f38d8 + 4) = result + 0x2c;
    --*(u32 *)(data_021f38d8 + 8);
    return result;
}

/* Consume one group header from the preallocated unique-group pool. */
void *func_0207829c(u32 size)
{
    u8 *result = *(u8 **)data_021f38e8;

    (void)size;
    *(u8 **)data_021f38e8 = result + 8;
    --*(u32 *)(data_021f38e8 + 4);
    return result;
}

/* Consume count pointer slots from the retail linear pointer pool. */
void *func_02078014(u32 count)
{
    void *result = *(void **)(data_021f38d8 + 0x0c);

    *(u8 **)(data_021f38d8 + 0x0c) = (u8 *)result + count * 4;
    *(u32 *)data_021f38d8 -= count;
    return result;
}

/* Construct and insert one grouped descriptor at retail 0x020782F0. */
void func_020782f0(void *group_pointer, u32 slot, s32 value8, u32 actor_id,
                   u32 value6, u32 value7)
{
    u8 *group = (u8 *)group_pointer;
    u8 *entry = AllocateDescriptor();
    u8 *runtime = entry + 8;

    func_02022fbc(runtime);
    *(u16 *)(entry + 2) = 0;
    *(u16 *)(entry + 6) = 0;
    entry[0] = (u8)value6;
    entry[1] = (u8)value7;
    *(u16 *)(entry + 4) = (u16)(value8 << 4);
    *(u16 *)(runtime + 0) = (u16)actor_id;
    *(u16 *)(runtime + 4) = 0;
    *(void **)(runtime + 8) = func_02063b90(data_021e9ad0, (u16)actor_id);
    *(u32 *)(runtime + 0x0c) = 0;
    *(u32 *)(runtime + 0x20) = 0;
    (*(u8 ***)group)[slot] = entry;
}

/* Load grouped 10-byte descriptor records exactly as retail 0x02078428. */
void *func_02078428(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    FSFile file;
    FSFileID file_id;
    u8 header[0x10];
    u8 input[0x0a];
    u8 occurrences[0x10f];
    u32 count;
    u32 unique_count = 0;
    u32 index;

    memset(manager, 0, 0x43c);
    *(u32 *)(manager + 0x43c) = 0;
    *(u16 *)(manager + 0x444) = 0;
    *(u32 *)(manager + 0x440) = 0;
    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020c4744);
    CheckedFS_OpenFileFast(&file, file_id);
    if (CheckedFS_ReadFile(&file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    count = ReadU16(header);
    if (count > 0x78)
        OS_Halt();
    memset(occurrences, 0, sizeof(occurrences));
    for (index = 0; index < count; ++index) {
        u16 group;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        group = ReadU16(input + 2);
        if (occurrences[group] == 0)
            ++unique_count;
        ++occurrences[group];
    }
    if (!CheckedFS_SeekFile(&file, 0x10, 0))
        OS_Halt();
    func_02077fb4(count);
    *(u32 *)(data_021f38e8 + 4) = unique_count;
    *(void **)data_021f38e8 =
        Heap_Alloc(unique_count * 8, data_020e6a34, 4, &gHeapContext);
    for (index = 0; index < count; ++index) {
        u16 group_index;
        u8 *group;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        group_index = ReadU16(input + 2);
        if (input[6] > 0x64 || input[7] > 0x0c)
            OS_Halt();
        group = *(u8 **)(manager + group_index * 4);
        if (group == 0) {
            group = (u8 *)func_0207829c(8);
            if (group != 0) {
                *(u32 *)(group + 4) = occurrences[group_index];
                *(void **)group = func_02078014(occurrences[group_index]);
            }
            *(u8 **)(manager + group_index * 4) = group;
        }
        func_020782f0(group, input[9], (s8)input[8], ReadU16(input + 4),
                      input[6], input[7]);
    }
    CheckedFS_CloseFile(&file);
    return manager;
}

/* Initialize the fixed retail grouped resource manager at 0x02078370. */
void func_02078370(void)
{
    func_02078428(data_021f38fc);
}





