#ifndef TINGLE_GAME_FILE_H
#define TINGLE_GAME_FILE_H

#include "tingle/checked_fs.h"
#include "tingle/types.h"

typedef struct GameFile {
    const void *vtable;
    FSFile file;
} GameFile;

typedef char GameFileSizeCheck[sizeof(GameFile) == 0x4c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GameFile *GameFile_Init(GameFile *file);
GameFile *GameFile_Destroy(GameFile *file);
GameFile *GameFile_DestroyAndFree(GameFile *file);
s32 GameFile_Open(GameFile *file, const char *path);
s32 GameFile_Read(GameFile *file, void *destination, s32 length);
s32 GameFile_Close(GameFile *file);
s32 GameFile_GetLength(GameFile *file);
s32 GameFile_Rewind(GameFile *file);
s32 GameFile_Seek(GameFile *file, s32 offset, s32 origin);
s32 GameFile_HasStatusFlag01(const GameFile *file);

#ifdef __cplusplus
}
#endif

#endif
