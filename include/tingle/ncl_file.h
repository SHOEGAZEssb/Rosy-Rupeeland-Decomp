#ifndef TINGLE_NCL_FILE_H
#define TINGLE_NCL_FILE_H

#include "tingle/nitro_file.h"

typedef struct NclFile {
    NitroFile base;
} NclFile;

typedef struct NclFileVTable {
    NclFile *(*destroy)(NclFile *self);
    NclFile *(*destroyAndFree)(NclFile *self);
} NclFileVTable;

typedef char NclFileSizeCheck[sizeof(NclFile) == 0xc ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern NclFileVTable data_020d40ec;

NclFile *NclFile_Init(NclFile *self);
NclFile *NclFile_Destroy(NclFile *self);
NclFile *NclFile_DestroyAndFree(NclFile *self);
s32 NclFile_ParseResource(NclFile *self, const void *resource);
s32 NclFile_LoadCompressedFromFile(NclFile *self, GameFile *file,
                                   s32 offset, u32 compressedSize);
u32 NclFile_GetSignature(const NclFile *self);

#ifdef __cplusplus
}
#endif

#endif
