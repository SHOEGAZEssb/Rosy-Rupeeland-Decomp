/* Verifies the host-safe GameWork reset and checked flag accessors. */
#include "tingle/native_game_work.h"

#include <stdlib.h>
#include <string.h>

static u16 ReadU16(const TingleNativeGameWork *work, u32 offset)
{
    return (u16)(work->bytes[offset] | (work->bytes[offset + 1] << 8));
}

static u32 ReadU32(const TingleNativeGameWork *work, u32 offset)
{
    return (u32)work->bytes[offset] |
           ((u32)work->bytes[offset + 1] << 8) |
           ((u32)work->bytes[offset + 2] << 16) |
           ((u32)work->bytes[offset + 3] << 24);
}

int main(void)
{
    static const u16 default_name[4] = {0x30C7, 0x30D0, 0x30C3, 0x30B0};
    TingleNativeGameWork work;
    u32 i;

    memset(&work, 0xA5, sizeof(work));
    TingleNativeGameWork_Reset(&work);
    if (ReadU32(&work, 0x0000) != 0xA5A5A5A5u ||
        ReadU32(&work, 0x5DF0) != 0xA5A5A5A5u ||
        ReadU16(&work, 0x0010) != 0x30C7 ||
        ReadU16(&work, 0x0016) != 0x30B0 ||
        ReadU16(&work, 0x0030) != 0xA5A5 || ReadU16(&work, 0x0200) != 0x20 ||
        ReadU16(&work, 0x01F6) != 0x186 || ReadU16(&work, 0x01F4) != 0x2AD ||
        ReadU16(&work, 0x0210) != 0x400 || ReadU16(&work, 0x0212) != 0x400 ||
        ReadU16(&work, 0x010A) != 5 || ReadU32(&work, 0x51D0) != 0xFFFFFFFFu)
        return EXIT_FAILURE;
    /* Reset intentionally leaves structure padding untouched. */
    if (ReadU16(&work, 0x0FEA) != 0xA5A5 ||
        ReadU16(&work, 0x117E) != 0xA5A5 || ReadU16(&work, 0x4EFE) != 0xA5A5)
        return EXIT_FAILURE;

    TingleNativeGameWork_Init(&work);
    for (i = 0; i < 16; ++i) {
        u16 expected = i < 4 ? default_name[i] : 0;
        if (ReadU16(&work, 0x0010 + i * 2) != expected) return EXIT_FAILURE;
    }
    if (TingleNativeGameWork_TestFlag(&work, 0) != 0 ||
        !TingleNativeGameWork_SetFlag(&work, 0) ||
        !TingleNativeGameWork_SetFlag(&work, 3071) ||
        TingleNativeGameWork_TestFlag(&work, 0) != 1 ||
        TingleNativeGameWork_TestFlag(&work, 3071) != 1 ||
        !TingleNativeGameWork_ClearFlag(&work, 0) ||
        TingleNativeGameWork_TestFlag(&work, 0) != 0)
        return EXIT_FAILURE;
    if (TingleNativeGameWork_SetFlag(&work, -1) ||
        TingleNativeGameWork_ClearFlag(&work, 3072) ||
        TingleNativeGameWork_TestFlag(NULL, 0) != -1)
        return EXIT_FAILURE;
    return EXIT_SUCCESS;
}
