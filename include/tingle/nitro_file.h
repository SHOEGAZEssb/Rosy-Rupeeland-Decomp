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

extern NitroFileVTable data_020d40dc;

NitroFile *func_02005118(NitroFile *self);
NitroFile *func_02005134(NitroFile *self);
NitroFile *func_02005160(NitroFile *self);
NitroFile *func_02005194(NitroFile *self);
void func_020051c0(NitroFile *self);
void *func_020051ec(NitroFile *self, GameFile *file, s32 offset,
                    u32 compressedSize);

#ifdef __cplusplus
}
#endif

#endif
