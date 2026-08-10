#ifndef TINGLE_NITRO_FILE_H
#define TINGLE_NITRO_FILE_H

#include "tingle/game_file.h"
#include "tingle/types.h"

typedef struct NitroFile NitroFile;

typedef struct NitroFileVTable {
    NitroFile *(*destroy)(NitroFile *self);
    NitroFile *(*destroyAndFree)(NitroFile *self);
    void *unknown08;
    const void *rtti;
} NitroFileVTable;

struct NitroFile {
    const NitroFileVTable *vtable;
    void *data;
    u32 size;
};

typedef char NitroFileSizeCheck[sizeof(NitroFile) == 0xc ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern NitroFileVTable gNitroFileVTable;

NitroFile *NitroFile_Init(NitroFile *self);
NitroFile *NitroFile_Destroy(NitroFile *self);
NitroFile *NitroFile_DestroyAndFree(NitroFile *self);
NitroFile *NitroFile_DestroyBase(NitroFile *self);
void NitroFile_Clear(NitroFile *self);
void *NitroFile_ReadCompressedLz8(NitroFile *self, GameFile *file, s32 offset,
                    u32 compressedSize);

#ifdef __cplusplus
}
#endif

#endif
