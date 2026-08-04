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

extern NitroFileVTable data_020d40cc;

NcgFile *func_02005284(NcgFile *self);
NcgFile *func_020052b0(NcgFile *self);
NcgFile *func_020052c4(NcgFile *self);
s32 func_020052e0(NcgFile *self, const void *resource);
s32 func_02005354(NcgFile *self, GameFile *file, s32 offset,
                  u32 compressedSize);
u32 func_020053b8(const NcgFile *self);
u32 func_020053f4(const NcgFile *self);

#ifdef __cplusplus
}
#endif

#endif
