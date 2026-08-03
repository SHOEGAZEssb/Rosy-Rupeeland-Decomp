#ifndef TINGLE_CHECKED_FS_H
#define TINGLE_CHECKED_FS_H

#include "tingle/types.h"

typedef struct FSFile FSFile;

typedef struct FSFileID {
    u32 archive;
    u32 fileId;
} FSFileID;

#ifdef __cplusplus
extern "C" {
#endif

s32 CheckedFS_ReadFile(FSFile *file, void *destination, s32 length);
void CheckedFS_ValidateResult(s32 result);
s32 CheckedFS_OpenFile(FSFile *file, const char *path);
s32 CheckedFS_OpenFileFast(FSFile *file, FSFileID fileId);
s32 CheckedFS_GetFileLength(FSFile *file);
s32 CheckedFS_CloseFile(FSFile *file);
s32 CheckedFS_ConvertPathToFileID(FSFileID *fileId, const char *path);
s32 CheckedFS_SeekFile(FSFile *file, s32 offset, s32 origin);
s32 CheckedFS_RewindFile(FSFile *file);
void CheckedFS_InitFile(FSFile *file);
s32 CheckedFS_LoadOverlay(u32 processor, u32 overlayId);
s32 CheckedFS_UnloadOverlay(u32 processor, u32 overlayId);

#ifdef __cplusplus
}
#endif

#endif
