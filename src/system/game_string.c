#include "tingle/game_string.h"

/*
 * Eight-byte, heap-owning string used by the game-side resource and file
 * wrappers. The object stores only a virtual table pointer and a nullable
 * NUL-terminated buffer. Replacement supports either full C strings or an
 * explicit byte count; append uses a temporary copy because it frees the old
 * allocation before constructing the combined buffer.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_AllocAlternateEntry(u32 size, const void *tag, u32 alignment,
                           void *heapContext);
extern void Heap_Free(void *allocation);
extern void Heap_FreeAlternateEntry(void *allocation);
extern u32 strlen(const char *string);
extern char *strcpy(char *destination, const char *source);
extern char *strncpy(char *destination, const char *source, u32 length);
extern char *strcat(char *destination, const char *source);
extern s32 strcmp(const char *left, const char *right);

extern u8 gHeapContext[];

#ifdef __cplusplus
}
#endif

/* Initialize an empty string with no allocation and return the object. */
GameString *GameString_Init(GameString *string)
{
    string->vtable = &gGameStringVTable;
    string->data = 0;
    return string;
}

/* Initialize from source, using length zero to request a full C-string copy. */
GameString *GameString_InitCString(GameString *string, const char *source,
                                  u32 length)
{
    string->vtable = &gGameStringVTable;
    string->data = 0;
    GameString_Assign(string, source, length);
    return string;
}

/*
 * Initialize by fully copying another object's buffer. A null source buffer
 * leaves the result empty.
 */
GameString *GameString_InitFromOther(GameString *string,
                                    const GameString *source)
{
    string->vtable = &gGameStringVTable;
    string->data = 0;
    if (source->data != 0)
        GameString_Assign(string, source->data, 0);
    return string;
}

/* Release the owned buffer, restore this class's vtable, and return this. */
GameString *GameString_Destroy(GameString *string)
{
    string->vtable = &gGameStringVTable;
    GameString_Clear(string);
    return string;
}

/* Destroy the string, free the object itself, and return its original address. */
GameString *GameString_DestroyAndFree(GameString *string)
{
    string->vtable = &gGameStringVTable;
    GameString_Clear(string);
    Heap_Free(string);
    return string;
}

/*
 * Replace the buffer unless source already is the owned buffer. With length
 * zero the whole source is copied; a null or empty source still produces an
 * allocated one-byte empty string. A nonzero length always gets an explicit
 * terminator at data[length].
 */
void GameString_Assign(GameString *string, const char *source, u32 length)
{
    u32 sourceLength;

    if (string->data == source)
        return;
    if (string->data != 0)
        GameString_Clear(string);

    sourceLength = strlen(source);
    if (sourceLength == 0) {
        string->data = (char *)Heap_AllocAlternateEntry(1, gGameStringHeapTag, 4,
                                            gHeapContext);
        string->data[0] = 0;
        return;
    }

    if (length == 0) {
        string->data = (char *)Heap_AllocAlternateEntry(sourceLength + 1,
                                            gGameStringHeapTag, 4,
                                            gHeapContext);
        strcpy(string->data, source);
    } else {
        string->data = (char *)Heap_AllocAlternateEntry(length + 1, gGameStringHeapTag,
                                            4, gHeapContext);
        strncpy(string->data, source, length);
        string->data[length] = 0;
    }
}

/*
 * Append suffix. The old contents are copied to temporary heap storage before
 * GameString_Clear invalidates the original allocation, then the final buffer
 * is allocated and populated. The underlying copy call is retained even when
 * the temporary pointer is null, matching the recovered control flow.
 */
#ifndef MATCHING
void GameString_Append(GameString *string, const char *suffix)
{
    u32 totalLength;
    char *temporary;
    char *oldData;

    totalLength = strlen(suffix);
    oldData = string->data;
    totalLength = strlen(oldData) + totalLength;

    if (totalLength == 0)
        return;
    temporary = 0;

    if (string->data != 0) {
        temporary = (char *)Heap_AllocAlternateEntry(strlen(oldData) + 1,
                                         gGameStringHeapTag, 4,
                                         gHeapContext);
        strcpy(temporary, string->data);
    }
    if (string->data != 0)
        GameString_Clear(string);

    string->data = (char *)Heap_AllocAlternateEntry(totalLength + 1,
                                        gGameStringHeapTag, 4,
                                        gHeapContext);
    strcpy(string->data, temporary);
    strcat(string->data, suffix);
    if (temporary != 0)
        Heap_FreeAlternateEntry(temporary);
}
#else
/* MWCC commutes the length addition in the equivalent portable expression. */
asm void GameString_Append(GameString *string, const char *suffix)
{
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl strlen
    ldr r8, [r5, #4]
    mov r6, r0
    mov r0, r8
    bl strlen
    adds r6, r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r5, #4]
    mov r7, #0
    cmp r0, #0
    beq no_old_copy
    mov r0, r8
    bl strlen
    ldr r1, =gGameStringHeapTag
    ldr r3, =gHeapContext
    add r0, r0, #1
    mov r2, #4
    bl Heap_AllocAlternateEntry
    ldr r1, [r5, #4]
    mov r7, r0
    bl strcpy
no_old_copy:
    ldr r0, [r5, #4]
    cmp r0, #0
    beq allocate_combined
    mov r0, r5
    bl GameString_Clear
allocate_combined:
    ldr r1, =gGameStringHeapTag
    ldr r3, =gHeapContext
    add r0, r6, #1
    mov r2, #4
    bl Heap_AllocAlternateEntry
    str r0, [r5, #4]
    mov r1, r7
    bl strcpy
    ldr r0, [r5, #4]
    mov r1, r4
    bl strcat
    cmp r7, #0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    bl Heap_FreeAlternateEntry
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
}
#endif

/* Free the owned buffer if present and reset the data pointer to null. */
void GameString_Clear(GameString *string) throw()
{
    if (string->data == 0)
        return;
    Heap_FreeAlternateEntry(string->data);
    string->data = 0;
}

/* Initialize with at most length bytes when length is positive. */
void GameString_InitPrefix(GameString *string, const GameString *source,
                           s32 length)
{
    string->vtable = &gGameStringVTable;
    string->data = 0;
    if (length > 0)
        GameString_Assign(string, source->data, (u32)length);
}

/* Copy-assign from source unless both arguments are the same object. */
GameString *GameString_AssignCopy(GameString *string,
                                 const GameString *source)
{
    const char *sourceData;

    if (source == string)
        return string;
    sourceData = source->data;
    if (sourceData != 0)
        GameString_Assign(string, sourceData, 0);
    return string;
}

/* Construct result as a copy of left followed by right. */
void GameString_Concat(GameString *result, const GameString *left,
                       const GameString *right)
{
    result->vtable = &gGameStringVTable;
    result->data = 0;
    GameString_AssignCopy(result, left);
    GameString_Append(result, right->data);
}

/* Return one only when both buffers exist and their C strings compare equal. */
s32 GameString_Equals(const GameString *left, const GameString *right)
{
    s32 equal = 0;
    s32 bothPresent = 0;

    if (left->data != 0 && right->data != 0)
        bothPresent = 1;
    if (bothPresent && strcmp(left->data, right->data) == 0)
        equal = 1;
    return equal;
}
