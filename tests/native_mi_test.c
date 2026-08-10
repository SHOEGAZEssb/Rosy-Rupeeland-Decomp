/* Copyright-free tests for the native NitroSDK LZ8 compatibility boundary. */
#include "tingle/native_mi.h"

#include <string.h>

/* Verifies literals, backward copies, and malformed-stream rejection. */
int main(void)
{
    static const u8 literal[] = {0x10, 4, 0, 0, 0, 1, 2, 3, 4};
    static const u8 copied[] = {0x10, 6, 0, 0, 0x10, 'A', 'B', 'C', 0, 2};
    u8 output[6] = {0};
    size_t written = 0;

    if (!TingleNativeMI_UncompressLZ8Checked(
            literal, sizeof(literal), output, sizeof(output), &written) ||
        written != 4 || memcmp(output, "\1\2\3\4", 4) != 0) return 1;
    memset(output, 0, sizeof(output));
    if (!TingleNativeMI_UncompressLZ8Checked(
            copied, sizeof(copied), output, sizeof(output), &written) ||
        written != 6 || memcmp(output, "ABCABC", 6) != 0) return 2;
    if (TingleNativeMI_UncompressLZ8Checked(
            copied, sizeof(copied) - 1, output, sizeof(output), &written) ||
        TingleNativeMI_UncompressLZ8Checked(
            copied, sizeof(copied), output, 5, &written)) return 3;
    memset(output, 0, sizeof(output));
    MI_UncompressLZ8(copied, output);
    return memcmp(output, "ABCABC", 6) == 0 ? 0 : 4;
}
