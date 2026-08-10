/* Copyright-free synthetic coverage for the native DS graphics boundary. */
#include "tingle/native_graphics.h"

#include <stdlib.h>
#include <string.h>

/* Writes a little-endian halfword into a test resource. */
static void WriteU16(u8 *bytes, u16 value)
{
    bytes[0] = (u8)value;
    bytes[1] = (u8)(value >> 8);
}

/* Writes a little-endian word into a test resource. */
static void WriteU32(u8 *bytes, u32 value)
{
    bytes[0] = (u8)value;
    bytes[1] = (u8)(value >> 8);
    bytes[2] = (u8)(value >> 16);
    bytes[3] = (u8)(value >> 24);
}

/* Confirms literal and back-reference LZ10 tokens produce exact output. */
static int TestLz10(void)
{
    static const u8 literal[] = {0x10, 4, 0, 0, 0, 1, 2, 3, 4};
    static const u8 copied[] = {0x10, 6, 0, 0, 0x10, 'A', 'B', 'C', 0, 2};
    void *output = NULL;
    size_t size = 0;
    int ok;

    ok = TingleNativeGraphics_DecodeLz10(literal, sizeof(literal),
                                          &output, &size) &&
         size == 4 && memcmp(output, "\1\2\3\4", 4) == 0;
    free(output);
    output = NULL;
    ok = ok && TingleNativeGraphics_DecodeLz10(copied, sizeof(copied),
                                                &output, &size) &&
         size == 6 && memcmp(output, "ABCABC", 6) == 0;
    free(output);
    output = NULL;
    ok = ok && !TingleNativeGraphics_DecodeLz10(copied, sizeof(copied) - 1,
                                                 &output, &size);
    return ok;
}

/* Confirms VCS tile selection, palette lookup, and horizontal flipping. */
static int TestTextBackground(void)
{
    u8 character[12 + 32] = {0};
    u8 palette[8 + 32] = {0};
    u8 layout[20 + 2] = {0};
    u32 pixels[64] = {0};
    TingleNativeGraphicsResourceSet resources = {
        character, sizeof(character), palette, sizeof(palette),
        layout, sizeof(layout)
    };
    TingleNativeCanvas canvas = {pixels, 8, 8, 8};
    int x;

    WriteU32(character, 0x56434720);
    WriteU32(character + 4, 0);
    WriteU32(character + 8, 32);
    for (x = 0; x < 4; ++x) character[12 + x] = (u8)((x * 2 + 2) << 4 | (x * 2 + 1));
    WriteU32(palette, 0x56434c20);
    WriteU16(palette + 4, 16);
    WriteU16(palette + 8 + 2, 0x001f);
    WriteU16(palette + 8 + 16, 0x7c00);
    WriteU32(layout, 0x56534320);
    WriteU32(layout + 12, 1);
    WriteU32(layout + 16, 1);
    WriteU16(layout + 20, 0x0400);
    return TingleNativeGraphics_DrawTextBackground(&resources, &canvas, 0) &&
           pixels[0] == 0x000000ff && pixels[7] == 0x00ff0000;
}

/* Runs all deterministic host graphics tests. */
int main(void)
{
    if (!TestLz10()) return 1;
    if (!TestTextBackground()) return 2;
    return 0;
}
