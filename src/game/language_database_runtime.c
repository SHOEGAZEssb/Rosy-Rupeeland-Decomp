


/* Portable reconstruction of the retail language database at 0x02078AE4. */
#include "tingle/checked_fs.h"
#include "tingle/heap.h"
#include "tingle/system.h"
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);

extern u8 data_021f4090[];
extern u8 data_021f3ecc[];
extern u8 data_021f3d68[];
extern const char data_020ea5f8[];
extern const char data_020ea5d0[];
extern u8 data_020ed6e0[];

extern void func_02079d78(void *manager);
extern void func_02079694(void *manager);
extern void *LanguageResourceManager_FindById(void *manager, u32 identifier);
extern void OS_Halt(void);
void func_02078dd4(void *manager_pointer, u16 id, void *destination,
                   u32 destination_size);

typedef struct LanguageDatabaseEntry {
    u16 id;
    u16 byte_length;
    u32 file_offset;
} LanguageDatabaseEntry;

static u32 ReadU32(const u8 *bytes)
{
    return (u32)bytes[0] | ((u32)bytes[1] << 8) |
           ((u32)bytes[2] << 16) | ((u32)bytes[3] << 24);
}

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

/* Return the byte length for one language record, retail 0x02078D54. */
u32 LanguageDatabase_GetRecordLength(void *manager_pointer, u16 id)
{
    u8 *manager = (u8 *)manager_pointer;
    LanguageDatabaseEntry *entries = *(LanguageDatabaseEntry **)manager;
    u32 count = *(u32 *)(manager + 8);
    u32 bucket = 0;
    u32 index;

    if (id == 0) return 5;
    for (index = 5; index-- != 0;) {
        if (id >= *(u32 *)(manager + 0x10 + index * 4)) {
            bucket = index;
            break;
        }
    }
    for (index = *(u32 *)(manager + 0x24 + bucket * 4);
         index < count; ++index) {
        if (entries[index].id == id)
            return entries[index].byte_length;
    }
    return 0;
}

/* Assemble the shared message descriptor selected at retail 0x020795E8. */
void *func_020795e8(void *manager_pointer, s32 message_id)
{
    u8 *manager = (u8 *)manager_pointer;
    const u8 *records = *(const u8 **)manager;
    u32 count = *(u32 *)(manager + 8);
    u32 index;

    for (index = 0; index < count; ++index) {
        const u8 *record = records + index * 8;
        if (*(const u16 *)record == (u16)message_id) {
            u16 text_id = *(const u16 *)(record + 4);
            u16 resource_id = *(const u16 *)(record + 6);
            *(u16 *)(manager + 0xbc) = *(const u16 *)(record + 2);
            *(u32 *)(manager + 0xc0) =
                LanguageDatabase_GetRecordLength(data_021f4090, resource_id);
            func_02078dd4(data_021f4090, text_id, manager + 0x5c, 0x60);
            *(void **)(manager + 0xc4) = manager + 0x5c;
            *(void **)(manager + 0xc8) =
                LanguageResourceManager_FindById(data_021f4090, resource_id);
            return manager + 0xbc;
        }
    }
    OS_Halt();
    return manager + 0xbc;
}

/* Load one string by record index, matching retail 0x02078F3C. */
static u32 LanguageDatabase_LoadRecord(u8 *manager, u32 index)
{
    FSFile *file = (FSFile *)(manager + 0x48);
    FSFileID *file_id = (FSFileID *)(manager + 0x90);
    LanguageDatabaseEntry *entries = *(LanguageDatabaseEntry **)manager;
    u32 length = entries[index].byte_length;

    CheckedFS_OpenFileFast(file, *file_id);
    CheckedFS_SeekFile(file, (s32)entries[index].file_offset, 0);
    if (length > 0x1000)
        length = 0x1000;
    CheckedFS_ReadFile(file, manager + 0x98, (s32)length);
    CheckedFS_CloseFile(file);
    if (length == 0x1000)
        *(u16 *)(manager + 0x1096) = 0;
    return length;
}

/* Copy a language string by ID, matching lookup/buffer behavior at 0x02078DD4. */
void func_02078dd4(void *manager_pointer, u16 id, void *destination,
                   u32 destination_size)
{
    u8 *manager = (u8 *)manager_pointer;
    LanguageDatabaseEntry *entries = *(LanguageDatabaseEntry **)manager;
    u32 count = *(u32 *)(manager + 8);
    u32 bucket;
    u32 index;

    if (id == 0) {
        memcpy(destination, (const void *)0x020c6d08, 5);
        return;
    }
    bucket = 0;
    for (index = 5; index-- != 0;) {
        if (id >= *(u32 *)(manager + 0x10 + index * 4)) {
            bucket = index;
            break;
        }
    }
    for (index = *(u32 *)(manager + 0x24 + bucket * 4);
         index < count; ++index) {
        if (entries[index].id == id) {
            u32 length = LanguageDatabase_LoadRecord(manager, index);

            if (length > destination_size)
                ((u16 *)destination)[destination_size / 2 - 1] = 0;
            *(u32 *)(manager + 0x0c) = id;
            memcpy(destination, manager + 0x98, length);
            return;
        }
    }
}

/* Load the selected language index and fixed title/runtime strings exactly as
 * the assembly-selected 0x02078B10 constructor. */
void func_02078b10(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    FSFile *file = (FSFile *)(manager + 0x48);
    FSFileID *file_id = (FSFileID *)(manager + 0x90);
    u8 header[0x60];
    u8 entry_bytes[4];
    LanguageDatabaseEntry *entries;
    u32 language = gSystemState.language;
    u32 count;
    u32 offset;
    u32 index;
    u32 bucket_size;

    *(u32 *)(manager + 0x38) = language;
    *(u32 *)(manager + 0x0c) = 0xffffffffu;
    CheckedFS_InitFile(file);
    CheckedFS_ConvertPathToFileID(file_id, data_020ea5f8);
    CheckedFS_OpenFileFast(file, *file_id);
    CheckedFS_ReadFile(file, header, 0x10);
    count = ReadU16(header + 2);
    *(u32 *)(manager + 8) = count;
    entries = (LanguageDatabaseEntry *)Heap_Alloc(
        count * sizeof(*entries), data_020ea5d0, 4, &gHeapContext);
    *(LanguageDatabaseEntry **)manager = entries;
    *(u32 *)(manager + 4) = count;
    CheckedFS_ReadFile(file, header, 0x60);
    *(u32 *)(manager + 0x3c) = ReadU32(header + 4 + language * 0x10);
    *(u32 *)(manager + 0x40) = ReadU32(header + 8 + language * 0x10);
    *(u32 *)(manager + 0x44) = ReadU32(header + 12 + language * 0x10);
    CheckedFS_SeekFile(file, *(s32 *)(manager + 0x3c), 0);
    offset = *(u32 *)(manager + 0x40);
    for (index = 0; index < count; ++index) {
        CheckedFS_ReadFile(file, entry_bytes, 4);
        entries[index].id = ReadU16(entry_bytes);
        entries[index].byte_length = ReadU16(entry_bytes + 2);
        entries[index].file_offset = offset;
        offset += entries[index].byte_length;
    }
    CheckedFS_CloseFile(file);

    bucket_size = count / 5;
    for (index = 0; index < 5; ++index) {
        u32 record = bucket_size * index;
        *(u32 *)(manager + 0x24 + index * 4) = record;
        *(u32 *)(manager + 0x10 + index * 4) = entries[record].id;
    }
    for (index = 0; index < 50; ++index) {
        u8 *record = data_020ed6e0 + index * 0x68;
        u16 id = *(u16 *)(record + 0x66);
        func_02078dd4(manager, id, record, 0x60);
    }
}

/* Preserve the retail order of the three global database constructors. */
void func_02078ae4(void)
{
    func_02078b10(data_021f4090);
    func_02079d78(data_021f3ecc);
    func_02079694(data_021f3d68);
}






