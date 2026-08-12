


/* Portable reconstructions of assembly-selected retail database loaders. */
#include "tingle/game_file.h"
#include "tingle/checked_fs.h"
#include "tingle/heap.h"
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
extern u8 data_021f4090[];
extern u8 data_021f5f18[];
extern u8 data_021f3ecc[];
extern const u32 data_020c6d14;
extern u8 data_020c6d18[];

extern void func_02078dd4(void *manager, u16 id, void *destination,
                          u32 destination_size);
extern void OS_Halt(void);

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

/* Load the five-bucket four-byte lookup database at retail 0x02078FFC. */
void func_02078ffc(void *manager_pointer)
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
        ReleaseArray(manager);
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

/* Load the localized 0x66-byte selection database at retail 0x02079264. */
void func_02079264(void *manager_pointer)
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
        ReleaseArray(manager);
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
        func_02078dd4(data_021f4090, ReadU16(input + 6), record + 6, 0x60);
        if (input[4] == 1 && (s8)input[5] == -1)
            ++special_count;
    }
    if (special_count > 30)
        OS_Halt();
    CheckedFS_CloseFile(file);
    func_02097f94(data_021f5f18);
}

/* Load the four-u16 relationship database at retail 0x020794A4. */
void func_020794a4(void *manager_pointer)
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
        ReleaseArray(manager);
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
        func_02078dd4(data_021f4090, ReadU16(input + 2), record + 2, 0x60);
    }
    GameFile_Close(&file);
    *(u32 *)(manager + 0x1bc) = count / 2;
    *(u16 *)(manager + 0x1c0) =
        *(u16 *)(records + (count / 2) * 0x62);
    func_02078ffc(manager);
    func_020794a4(manager + 0x88);
    func_02079264(manager + 0x154);
    GameFile_Destroy(&file);
}

/* Copy one 0x78-byte database record. */
static void CopyRecord78(u8 *destination, const u8 *source)
{
    memcpy(destination, source, 0x78);
}

/* Load and sort the 0x78-byte artifact database at retail 0x02079694. */
void func_02079694(void *manager_pointer)
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
            func_02079fc4(data_021f4090, ReadU16(input + 0x04));
        *(void **)(record + 0x08) =
            func_02079fc4(data_021f4090, ReadU16(input + 0x08));
        *(u8 *)(record + 0x0c) = (u8)ReadU16(input + 0x06);
        *(u8 *)(record + 0x0d) = (u8)ReadU16(input + 0x0a);
        *(u16 *)(record + 0x0e) = ReadU16(input + 0x10);
        *(u16 *)(record + 0x10) = ReadU16(input + 0x02);
        *(u16 *)(record + 0x12) = ReadU16(input + 0x12);
        *(u16 *)(record + 0x14) = ReadU16(input + 0x14);
        *(s16 *)(record + 0x16) = (s16)ReadU16(input + 0x16);
        func_02078dd4(data_021f4090, ReadU16(input + 0x0c),
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






