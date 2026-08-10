#ifndef TINGLE_NCG_FILE_H
#define TINGLE_NCG_FILE_H

#include "tingle/nitro_file.h"

typedef struct NcgFile {
    NitroFile base;
    s16 width;
    s16 height;
    s32 format;
} NcgFile;

typedef char NcgFileSizeCheck[sizeof(NcgFile) == 0x14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern NitroFileVTable gNcgFileVTable;

NcgFile *NcgFile_Init(NcgFile *self);
NcgFile *NcgFile_Destroy(NcgFile *self);
NcgFile *NcgFile_DestroyAndFree(NcgFile *self);
s32 NcgFile_ParseResource(NcgFile *self, const void *resource);
s32 NcgFile_LoadCompressedFromFile(NcgFile *self, GameFile *file,
                                   s32 offset, u32 compressedSize);
u32 NcgFile_GetPayloadSize(const NcgFile *self);
u32 NcgFile_GetSignature(const NcgFile *self);

#ifdef __cplusplus
}
#endif

#endif
