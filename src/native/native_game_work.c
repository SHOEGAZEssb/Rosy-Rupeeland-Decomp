/*
 * Fixed-layout native storage for the game's 0x5F14-byte shared work object.
 * Offset writes reproduce the recovered reset without imposing the NDS
 * 32-bit pointer ABI on a host compiler.
 */
#include "tingle/native_game_work.h"

#include <string.h>

static void WriteU16(TingleNativeGameWork *work, u32 offset, u16 value)
{
    work->bytes[offset] = (u8)value;
    work->bytes[offset + 1] = (u8)(value >> 8);
}

static void WriteU32(TingleNativeGameWork *work, u32 offset, u32 value)
{
    work->bytes[offset] = (u8)value;
    work->bytes[offset + 1] = (u8)(value >> 8);
    work->bytes[offset + 2] = (u8)(value >> 16);
    work->bytes[offset + 3] = (u8)(value >> 24);
}

static void ClearPointerEntry(TingleNativeGameWork *work, u32 offset)
{
    WriteU16(work, offset, 0);
    WriteU16(work, offset + 2, 0);
    /* This is an opaque four-byte NDS pointer slot, not a host pointer. */
    WriteU32(work, offset + 4, 0);
}

/* Clears fresh storage, then installs all defaults confirmed in GameWork_Init. */
void TingleNativeGameWork_Init(TingleNativeGameWork *work)
{
    if (work == NULL) return;
    memset(work->bytes, 0, sizeof(work->bytes));
    TingleNativeGameWork_Reset(work);
}

/* Replays the recovered reset while retaining retail-untouched byte ranges. */
void TingleNativeGameWork_Reset(TingleNativeGameWork *work)
{
    static const u16 default_name[16] = {
        0x30C7, 0x30D0, 0x30C3, 0x30B0
    };
    u32 i;
    u32 j;

    if (work == NULL) return;

    WriteU32(work, 0x0040, 0);
    WriteU32(work, 0x0044, 0);
    WriteU32(work, 0x0048, 0);
    for (i = 0; i < 256; ++i) WriteU16(work, 0x004C + i * 2, 0);
    WriteU16(work, 0x004C + 218 * 2, 0x20);
    WriteU16(work, 0x004C + 213 * 2, 0x186);
    WriteU16(work, 0x004C + 212 * 2, 0x2AD);

    memset(work->bytes + TINGLE_NATIVE_GAME_WORK_FLAG_OFFSET, 0, 0x180);
    /* The two retail pointer banks contain 128 four-byte slots each. */
    memset(work->bytes + 0x03CC, 0, 2 * 128 * 4);
    for (i = 0; i < 32; ++i) WriteU32(work, 0x07CC + i * 4, 0);

    WriteU16(work, 0x084C, 1);
    WriteU16(work, 0x084E, 0);
    for (i = 0; i < 220; ++i) WriteU32(work, 0x0850 + i * 4, 0);
    for (i = 0; i < 100; ++i) WriteU32(work, 0x0BC0 + i * 4, 0);
    for (i = 0; i < 100; ++i) WriteU32(work, 0x0D50 + i * 4, 0);
    memset(work->bytes + 0x0EE0, 0, 8);
    memset(work->bytes + 0x0EE8, 0, 128);
    memset(work->bytes + 0x0F68, 0, 128);

    for (i = 0; i < 18; ++i) {
        u32 base = 0x0FE8 + i * 0x328;

        WriteU16(work, base, 0);
        for (j = 0; j < 50; ++j) ClearPointerEntry(work, base + 4 + j * 8);
        WriteU16(work, base + 0x194, 0);
        for (j = 0; j < 50; ++j)
            ClearPointerEntry(work, base + 0x198 + j * 8);
    }

    WriteU32(work, 0x48B8, 0);
    for (i = 0; i < 200; ++i) ClearPointerEntry(work, 0x48BC + i * 8);
    WriteU16(work, 0x4EFC, 0);
    for (i = 0; i < 120; ++i) {
        WriteU16(work, 0x4F00 + i * 6, 0);
        WriteU16(work, 0x4F02 + i * 6, 0);
        WriteU16(work, 0x4F04 + i * 6, 0);
    }

    WriteU16(work, 0x004C + 226 * 2, 0x400);
    WriteU16(work, 0x004C + 227 * 2, 0x400);
    WriteU32(work, 0x51D0, 0xFFFFFFFFu);
    for (i = 0; i < 256; ++i) {
        u32 base = 0x51F0 + i * 0x0C;

        WriteU16(work, base, 0);
        WriteU16(work, base + 2, 0);
        WriteU16(work, base + 4, 0);
        WriteU16(work, base + 6, 0);
        WriteU32(work, base + 8, 0);
    }

    for (i = 0; i < 16; ++i) WriteU16(work, 0x0010 + i * 2, default_name[i]);
    /* 0x5DF0..0x5E0F belongs to an unidentified initializer and is preserved. */
    WriteU32(work, 0x5E10, 0);
    for (i = 0; i < 30; ++i) {
        WriteU16(work, 0x5E14 + i * 4, 0);
        WriteU16(work, 0x5E16 + i * 4, 0);
    }
    memset(work->bytes + 0x5E8C, 0, 8);
    memset(work->bytes + 0x5E94, 0, 128);

    WriteU16(work, 0x004C + 95 * 2, 5);
    WriteU16(work, 0x004C + 96 * 2, 0);
    WriteU16(work, 0x004C + 97 * 2, 0);
    WriteU16(work, 0x004C + 98 * 2, 0);
    WriteU16(work, 0x004C + 34 * 2, 0);
}

/* Sets one flag after validating the unchecked retail index at the host boundary. */
s32 TingleNativeGameWork_SetFlag(TingleNativeGameWork *work, s32 flag)
{
    if (work == NULL || flag < 0 || flag >= TINGLE_NATIVE_GAME_WORK_FLAG_COUNT)
        return 0;
    work->bytes[TINGLE_NATIVE_GAME_WORK_FLAG_OFFSET + (u32)flag / 8] |=
        (u8)(1u << ((u32)flag & 7));
    return 1;
}

/* Returns 0/1 for a valid flag and -1 when the host-side request is invalid. */
s32 TingleNativeGameWork_TestFlag(const TingleNativeGameWork *work, s32 flag)
{
    if (work == NULL || flag < 0 || flag >= TINGLE_NATIVE_GAME_WORK_FLAG_COUNT)
        return -1;
    return (work->bytes[TINGLE_NATIVE_GAME_WORK_FLAG_OFFSET + (u32)flag / 8] &
            (u8)(1u << ((u32)flag & 7))) != 0;
}

/* Clears one flag after validating the unchecked retail index at the boundary. */
s32 TingleNativeGameWork_ClearFlag(TingleNativeGameWork *work, s32 flag)
{
    if (work == NULL || flag < 0 || flag >= TINGLE_NATIVE_GAME_WORK_FLAG_COUNT)
        return 0;
    work->bytes[TINGLE_NATIVE_GAME_WORK_FLAG_OFFSET + (u32)flag / 8] &=
        (u8)~(1u << ((u32)flag & 7));
    return 1;
}
