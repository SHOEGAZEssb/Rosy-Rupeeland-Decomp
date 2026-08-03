#include "tingle/checked_fs.h"
#include "tingle/error_display.h"
#include "tingle/system.h"

/*
 * Fail-stop wrappers around NitroSDK file and overlay operations. Each
 * fallible operation runs the cartridge lock/maintenance sequence and enters
 * the terminal display if the SDK reports failure. Reads additionally reject
 * a short transfer unless the file cursor has reached the file end.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern u32 OS_GetLockID(void);
extern void OS_ReleaseLockID(u16 lockId);
extern void func_020bc05c(u16 lockId);
extern void func_020bc03c(u16 lockId);
extern void func_020bd658(void);

extern s32 FS_ReadFile(FSFile *file, void *destination, s32 length);
extern s32 FS_OpenFile(FSFile *file, const char *path);
extern s32 FS_OpenFileFast(FSFile *file, FSFileID fileId);
extern s32 FS_CloseFile(FSFile *file);
extern s32 FS_ConvertPathToFileID(FSFileID *fileId, const char *path);
extern s32 FS_SeekFile(FSFile *file, s32 offset, s32 origin);
extern void FS_InitFile(FSFile *file);
extern s32 FS_LoadOverlay(u32 processor, u32 overlayId);
extern s32 FS_UnloadOverlay(u32 processor, u32 overlayId);

#ifdef __cplusplus
}
#endif

/*
 * Complete the cartridge lock/maintenance sequence, then halt if the global
 * terminal flag is set or result is zero. The exact purpose of the middle
 * SDK maintenance call remains unconfirmed.
 */
void CheckedFS_ValidateResult(s32 result)
{
    u32 lockId = OS_GetLockID();

    func_020bc05c((u16)lockId);
    func_020bd658();
    func_020bc03c((u16)lockId);
    OS_ReleaseLockID((u16)lockId);

    if (gSystemState.flags & 1)
        ErrorDisplay_ShowDefaultAndHalt();
    if (!result)
        ErrorDisplay_ShowDefaultAndHalt();
}

/*
 * Read length bytes and return the SDK byte count. A short read is accepted
 * only at end-of-file; any other short transfer enters the terminal display.
 */
#ifndef MATCHING
s32 CheckedFS_ReadFile(FSFile *file, void *destination, s32 length)
{
    s32 result = FS_ReadFile(file, destination, length);

    CheckedFS_ValidateResult(1);
    if (result < length &&
        file->currentOffset - file->startOffset <
            file->endOffset - file->startOffset) {
        ErrorDisplay_ShowDefaultAndHalt();
    }
    return result;
}
#else
/* MWCC folds the two base-relative offset calculations in portable C. */
asm s32 CheckedFS_ReadFile(FSFile *file, void *destination, s32 length)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r2
    bl FS_ReadFile
    mov r4, r0
    mov r0, #1
    bl CheckedFS_ValidateResult
    cmp r4, r5
    bge done
    ldr r2, [r6, #0x24]
    ldr r1, [r6, #0x2c]
    ldr r0, [r6, #0x28]
    sub r1, r1, r2
    sub r0, r0, r2
    cmp r1, r0
    mov r0, #0
    movcs r0, #1
    cmp r0, #0
    bne done
    bl ErrorDisplay_ShowDefaultAndHalt
done:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
}
#endif

/* Open path, halt on failure, and return the SDK Boolean result. */
s32 CheckedFS_OpenFile(FSFile *file, const char *path)
{
    s32 result = FS_OpenFile(file, path);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Open fileId, halt on failure, and return the SDK Boolean result. */
s32 CheckedFS_OpenFileFast(FSFile *file, FSFileID fileId)
{
    s32 result = FS_OpenFileFast(file, fileId);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Return the file length derived from the confirmed start/end offsets. */
s32 CheckedFS_GetFileLength(FSFile *file)
{
    return file->endOffset - file->startOffset;
}

/* Close file, halt on failure, and return the SDK Boolean result. */
s32 CheckedFS_CloseFile(FSFile *file)
{
    s32 result = FS_CloseFile(file);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Resolve path to an ID, halt on failure, and return the SDK Boolean result. */
s32 CheckedFS_ConvertPathToFileID(FSFileID *fileId, const char *path)
{
    s32 result = FS_ConvertPathToFileID(fileId, path);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Seek using the SDK origin value, halting if the request is rejected. */
s32 CheckedFS_SeekFile(FSFile *file, s32 offset, s32 origin)
{
    s32 result = FS_SeekFile(file, offset, origin);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Seek to offset zero from the file start and halt if it fails. */
s32 CheckedFS_RewindFile(FSFile *file)
{
    s32 result = FS_SeekFile(file, 0, 0);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Initialize an FSFile in place; this infallible wrapper returns nothing. */
void CheckedFS_InitFile(FSFile *file)
{
    FS_InitFile(file);
}

/* Load and start an overlay, halting if NitroSDK reports failure. */
s32 CheckedFS_LoadOverlay(u32 processor, u32 overlayId)
{
    s32 result = FS_LoadOverlay(processor, overlayId);
    CheckedFS_ValidateResult(result);
    return result;
}

/* Stop and unload an overlay, halting if NitroSDK reports failure. */
s32 CheckedFS_UnloadOverlay(u32 processor, u32 overlayId)
{
    s32 result = FS_UnloadOverlay(processor, overlayId);
    CheckedFS_ValidateResult(result);
    return result;
}
