
/*
 * Portable reconstruction of the assembly-selected graphics archive
 * constructor at retail ARM9 address 0x02071294.
 *
 * The returned 0x108-byte manager is caller-owned.  This function initializes
 * its seven intrusive resource-cache heads, records all fifteen NitroFS file
 * IDs, and owns one heap allocation containing each opened archive.  The
 * matching recovered destructor releases those buffers through the same heap.
 * Missing or short files remain fatal through the recovered CheckedFS facade.
 */
#include "tingle/checked_fs.h"
#include "tingle/heap.h"
#include "tingle/system.h"
#include "tingle/types.h"

extern const char *data_020e5a20[15];
extern const char *data_020e5a5c[];
extern const char data_020e68e8[];

extern void FS_InitFile(FSFile *file);
extern void func_020b44e8(void);

/* Initialize the three-word intrusive-list head exactly as 0x02070230. */
void func_02070230(void *list)
{
    u32 *words = (u32 *)list;

    words[0] = 0;
    words[1] = 0;
    words[2] = 0;
}

void *func_02071294(void *manager)
{
    u8 *bytes = (u8 *)manager;
    const char *const *language_paths;
    FSFile file;
    u32 language = gSystemState.language;
    int index;

    for (index = 0; index < 7; ++index)
        func_02070230(bytes + 0xb4 + index * 0x0c);

    if (language >= 6)
        language = 5;
    language_paths = data_020e5a5c + language * 15;

    for (index = 0; index < 15; ++index) {
        s32 length;
        void *allocation;

        if (data_020e5a20[index] == 0)
            continue;
        CheckedFS_ConvertPathToFileID(
            (FSFileID *)(bytes + index * sizeof(FSFileID)),
            data_020e5a20[index]);
        FS_InitFile(&file);
        CheckedFS_OpenFile(&file, language_paths[index]);
        length = CheckedFS_GetFileLength(&file);
        allocation = Heap_Alloc((u32)length, data_020e68e8, 4,
                                &gHeapContext);
        *(void **)(bytes + 0x78 + index * sizeof(void *)) = allocation;
        CheckedFS_ReadFile(&file, allocation, length);
        CheckedFS_CloseFile(&file);
    }
    func_020b44e8();
    return manager;
}

