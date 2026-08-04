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

NclFile *func_0200542c(NclFile *self);
NclFile *func_0200544c(NclFile *self);
NclFile *func_02005460(NclFile *self);
s32 func_0200547c(NclFile *self, const void *resource);
s32 func_020054e4(NclFile *self, GameFile *file, s32 offset,
                  u32 compressedSize);
u32 func_02005548(const NclFile *self);

#ifdef __cplusplus
}
#endif

#endif
