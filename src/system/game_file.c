#include "tingle/game_file.h"

/*
 * Object wrapper around the checked NitroSDK FSFile interface. It embeds the
 * 0x48-byte SDK handle after a game-side vtable pointer, forwards ordinary
 * operations to the fail-stop CheckedFS layer, and closes an active handle
 * during either form of destruction.
 */

#define FS_FILE_STATUS_OPEN 0x10
#define FS_FILE_STATUS_FLAG01 0x01

#ifdef __cplusplus
extern "C" {
#endif

extern void Heap_Free(void *allocation);
extern u32 gGameFileVTable[];

#ifdef __cplusplus
}
#endif

/* Initialize the embedded SDK handle, install the vtable, and return this. */
GameFile *GameFile_Init(GameFile *file)
{
    file->vtable = gGameFileVTable;
    CheckedFS_InitFile(&file->file);
    return file;
}

/*
 * Close the embedded handle when its SDK open bit is set, restore the vtable,
 * and return this. CheckedFS_CloseFile enters the terminal path on failure.
 */
#ifndef MATCHING
GameFile *GameFile_Destroy(GameFile *file)
{
    file->vtable = gGameFileVTable;
    if (file->file.flags & FS_FILE_STATUS_OPEN)
        CheckedFS_CloseFile(&file->file);
    return file;
}
#else
/* Preserve the original Boolean normalization around the SDK status bit. */
asm GameFile *GameFile_Destroy(GameFile *file)
{
    stmdb sp!, {r4, lr}
    ldr r1, =gGameFileVTable
    mov r4, r0
    str r1, [r4]
    ldr r0, [r4, #0x10]
    tst r0, #0x10
    movne r0, #1
    moveq r0, #0
    cmp r0, #1
    bne done
    add r0, r4, #4
    bl CheckedFS_CloseFile
done:
    mov r0, r4
    ldmia sp!, {r4, pc}
}
#endif

/* Destroy the embedded handle, free the wrapper object, and return its address. */
#ifndef MATCHING
GameFile *GameFile_DestroyAndFree(GameFile *file)
{
    file->vtable = gGameFileVTable;
    if (file->file.flags & FS_FILE_STATUS_OPEN)
        CheckedFS_CloseFile(&file->file);
    Heap_Free(file);
    return file;
}
#else
/* As above, retain the compiler-sensitive status normalization before free. */
asm GameFile *GameFile_DestroyAndFree(GameFile *file)
{
    stmdb sp!, {r4, lr}
    ldr r1, =gGameFileVTable
    mov r4, r0
    str r1, [r4]
    ldr r0, [r4, #0x10]
    tst r0, #0x10
    movne r0, #1
    moveq r0, #0
    cmp r0, #1
    bne free_object
    add r0, r4, #4
    bl CheckedFS_CloseFile
free_object:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
}
#endif

/* Open path into the embedded handle and return the checked SDK result. */
s32 GameFile_Open(GameFile *file, const char *path)
{
    return CheckedFS_OpenFile(&file->file, path);
}

/* Read length bytes into destination and return the checked transfer count. */
s32 GameFile_Read(GameFile *file, void *destination, s32 length)
{
    return CheckedFS_ReadFile(&file->file, destination, length);
}

/* Close the embedded SDK handle and return its checked Boolean result. */
s32 GameFile_Close(GameFile *file)
{
    return CheckedFS_CloseFile(&file->file);
}

/* Return the embedded file's end-minus-start length. */
s32 GameFile_GetLength(GameFile *file)
{
    return CheckedFS_GetFileLength(&file->file);
}

/* Seek the embedded handle back to its start and return the checked result. */
s32 GameFile_Rewind(GameFile *file)
{
    return CheckedFS_RewindFile(&file->file);
}

/* Seek by offset and SDK origin, returning the checked Boolean result. */
s32 GameFile_Seek(GameFile *file, s32 offset, s32 origin)
{
    return CheckedFS_SeekFile(&file->file, offset, origin);
}

/* Return one when the embedded SDK handle's still-unidentified flag 0x01 is set. */
s32 GameFile_HasStatusFlag01(const GameFile *file)
{
    return (file->file.flags & FS_FILE_STATUS_FLAG01) != 0;
}
