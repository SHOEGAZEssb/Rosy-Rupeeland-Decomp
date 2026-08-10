/*
 * Native Nintendo DS graphics-resource boundary.
 *
 * This reconstructs the archive lookup, Nintendo LZ10 expansion, VCG/VCL
 * graphics parsing, VCS text backgrounds, and VCE/OAM cell drawing used by
 * recovered scenes. Retail resources remain the source of pixels and layout;
 * the host only replaces DS VRAM uploads and display hardware with a software
 * framebuffer.
 */
#include "tingle/native_graphics.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum {
    NATIVE_VCG_SIGNATURE = 0x56434720,
    NATIVE_VCL_SIGNATURE = 0x56434c20,
    NATIVE_VCS_SIGNATURE = 0x56534320,
    NATIVE_VCE_SIGNATURE = 0x56434520
};

/* Reads a little-endian halfword without assuming host alignment. */
static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

/* Reads a little-endian word without assuming host alignment. */
static u32 ReadU32(const u8 *bytes)
{
    return (u32)bytes[0] | ((u32)bytes[1] << 8) |
           ((u32)bytes[2] << 16) | ((u32)bytes[3] << 24);
}

/* Returns nonzero when an offset and byte count fit within a buffer. */
static s32 RangeValid(size_t offset, size_t size, size_t limit)
{
    return offset <= limit && size <= limit - offset;
}

/* Expands one 0x10 stream exactly as the Nitro SDK decompressor does. */
s32 TingleNativeGraphics_DecodeLz10(const void *source, size_t source_size,
                                    void **result, size_t *result_size)
{
    const u8 *input = (const u8 *)source;
    u8 *output;
    size_t input_at = 4;
    size_t output_at = 0;
    size_t output_size;

    if (result == NULL || result_size == NULL) return 0;
    *result = NULL;
    *result_size = 0;
    if (input == NULL || source_size < 4 || input[0] != 0x10) return 0;
    output_size = (size_t)input[1] | ((size_t)input[2] << 8) |
                  ((size_t)input[3] << 16);
    if (output_size == 0) return 0;
    output = (u8 *)malloc(output_size);
    if (output == NULL) return 0;

    while (output_at < output_size) {
        u8 flags;
        u32 bit;

        if (input_at >= source_size) goto fail;
        flags = input[input_at++];
        for (bit = 0; bit < 8 && output_at < output_size; ++bit) {
            if ((flags & (0x80u >> bit)) == 0) {
                if (input_at >= source_size) goto fail;
                output[output_at++] = input[input_at++];
            } else {
                size_t length;
                size_t distance;
                size_t copy;

                if (!RangeValid(input_at, 2, source_size)) goto fail;
                length = (size_t)(input[input_at] >> 4) + 3;
                distance = (size_t)((input[input_at] & 0x0f) << 8) |
                           input[input_at + 1];
                distance += 1;
                input_at += 2;
                if (distance > output_at || length > output_size - output_at)
                    goto fail;
                for (copy = 0; copy < length; ++copy) {
                    output[output_at] = output[output_at - distance];
                    ++output_at;
                }
            }
        }
    }
    *result = output;
    *result_size = output_size;
    return 1;
fail:
    free(output);
    return 0;
}

/* Copies or expands one indexed entry from an already-open retail archive. */
static s32 LoadArchiveEntry(const u8 *archive, size_t archive_size,
                            const u8 *information, size_t information_size,
                            u32 resource_id, u8 **bytes, size_t *size)
{
    size_t entry = (size_t)(resource_id & 0x0fff) * 8;
    size_t offset;
    u32 stored_size;
    size_t compressed_size;

    *bytes = NULL;
    *size = 0;
    if (!RangeValid(entry, 8, information_size)) return 0;
    offset = ReadU32(information + entry);
    stored_size = ReadU32(information + entry + 4);
    compressed_size = stored_size & 0x7fffffffu;
    if (compressed_size == 0 || !RangeValid(offset, compressed_size, archive_size))
        return 0;
    if ((stored_size & 0x80000000u) != 0) {
        void *expanded = NULL;

        if (!TingleNativeGraphics_DecodeLz10(archive + offset, compressed_size,
                                              &expanded, size)) return 0;
        *bytes = (u8 *)expanded;
        return 1;
    }
    *bytes = (u8 *)malloc(compressed_size);
    if (*bytes == NULL) return 0;
    memcpy(*bytes, archive + offset, compressed_size);
    *size = compressed_size;
    return 1;
}

/* Opens the paired archive and index files and resolves three resource IDs. */
s32 TingleNativeGraphics_LoadResourceSet(
    TingleNativeData *data, const char *archive_name,
    u32 character_id, u32 palette_id, u32 layout_id,
    TingleNativeGraphicsResourceSet *resources)
{
    char archive_path[128];
    char information_path[128];
    void *archive = NULL;
    void *information = NULL;
    size_t archive_size = 0;
    size_t information_size = 0;
    int archive_path_size;
    int information_path_size;
    s32 loaded = 0;

    if (resources == NULL) return 0;
    memset(resources, 0, sizeof(*resources));
    if (data == NULL || archive_name == NULL || *archive_name == '\0') return 0;
    archive_path_size = snprintf(archive_path, sizeof(archive_path),
                                 "data/anmLib/%s", archive_name);
    information_path_size = snprintf(information_path, sizeof(information_path),
                                     "data/anmLib/%s.inf", archive_name);
    if (archive_path_size < 0 || (size_t)archive_path_size >= sizeof(archive_path) ||
        information_path_size < 0 ||
        (size_t)information_path_size >= sizeof(information_path)) return 0;
    if (!TingleNativeData_ReadFile(data, archive_path, &archive, &archive_size) ||
        !TingleNativeData_ReadFile(data, information_path, &information,
                                   &information_size)) goto done;
    if (!LoadArchiveEntry((const u8 *)archive, archive_size,
                          (const u8 *)information, information_size,
                          character_id, &resources->character,
                          &resources->character_size) ||
        !LoadArchiveEntry((const u8 *)archive, archive_size,
                          (const u8 *)information, information_size,
                          palette_id, &resources->palette,
                          &resources->palette_size) ||
        !LoadArchiveEntry((const u8 *)archive, archive_size,
                          (const u8 *)information, information_size,
                          layout_id, &resources->layout,
                          &resources->layout_size)) goto done;
    loaded = 1;
done:
    free(information);
    free(archive);
    if (!loaded) TingleNativeGraphics_DestroyResourceSet(resources);
    return loaded;
}

/* Releases the three buffers returned for an archive resource set. */
void TingleNativeGraphics_DestroyResourceSet(
    TingleNativeGraphicsResourceSet *resources)
{
    if (resources == NULL) return;
    free(resources->character);
    free(resources->palette);
    free(resources->layout);
    memset(resources, 0, sizeof(*resources));
}

/* Converts the DS BGR555 palette encoding to host XRGB8888. */
static u32 ConvertColor(u16 color)
{
    u32 red = color & 31;
    u32 green = (color >> 5) & 31;
    u32 blue = (color >> 10) & 31;

    red = (red << 3) | (red >> 2);
    green = (green << 3) | (green >> 2);
    blue = (blue << 3) | (blue >> 2);
    return (red << 16) | (green << 8) | blue;
}

/* Validates common VCG/VCL fields and returns their decoded payload metadata. */
static s32 ParseTilesAndPalette(
    const TingleNativeGraphicsResourceSet *resources,
    const u8 **tiles, size_t *tile_size, u32 *format,
    const u8 **palette, size_t *color_count)
{
    size_t declared_tile_size;
    size_t declared_colors;

    if (resources == NULL || resources->character == NULL ||
        resources->palette == NULL || resources->character_size < 12 ||
        resources->palette_size < 8 ||
        ReadU32(resources->character) != NATIVE_VCG_SIGNATURE ||
        ReadU32(resources->palette) != NATIVE_VCL_SIGNATURE) return 0;
    *format = ReadU32(resources->character + 4) & 0x0f;
    if (*format > 1) return 0;
    declared_tile_size = ReadU32(resources->character + 8);
    declared_colors = ReadU16(resources->palette + 4);
    if (declared_colors == 0 || !RangeValid(12, declared_tile_size,
                                             resources->character_size) ||
        declared_colors > (resources->palette_size - 8) / 2) return 0;
    *tiles = resources->character + 12;
    *tile_size = declared_tile_size;
    *palette = resources->palette + 8;
    *color_count = declared_colors;
    return 1;
}

/* Reads one palette index from tiled VCG character data. */
static s32 ReadTilePixel(const u8 *tiles, size_t tile_size, u32 format,
                         size_t tile, s32 x, s32 y, u32 palette_bank,
                         u32 *color_index)
{
    size_t bytes_per_tile = format == 1 ? 64 : 32;
    size_t offset = tile * bytes_per_tile;

    if (format == 1) {
        offset += (size_t)y * 8 + (size_t)x;
        if (offset >= tile_size) return 0;
        *color_index = tiles[offset];
    } else {
        u8 packed;

        offset += (size_t)y * 4 + (size_t)x / 2;
        if (offset >= tile_size) return 0;
        packed = tiles[offset];
        *color_index = palette_bank * 16 +
                       ((x & 1) != 0 ? packed >> 4 : packed & 0x0f);
    }
    return 1;
}

/* Replaces a DS text-background upload and layer draw with host pixels. */
s32 TingleNativeGraphics_DrawTextBackground(
    const TingleNativeGraphicsResourceSet *resources,
    TingleNativeCanvas *canvas, s32 destination_y)
{
    const u8 *tiles;
    const u8 *palette;
    const u8 *map;
    size_t tile_size;
    size_t color_count;
    size_t map_entries;
    u32 format;
    u32 width;
    u32 height;
    s32 x;
    s32 y;

    if (canvas == NULL || canvas->pixels == NULL || resources == NULL ||
        resources->layout == NULL || resources->layout_size < 20 ||
        ReadU32(resources->layout) != NATIVE_VCS_SIGNATURE ||
        !ParseTilesAndPalette(resources, &tiles, &tile_size, &format,
                              &palette, &color_count)) return 0;
    width = ReadU32(resources->layout + 12);
    height = ReadU32(resources->layout + 16);
    if (width == 0 || height == 0 || (width & 7) != 0 || (height & 7) != 0)
        return 0;
    map_entries = (size_t)(width / 8) * (height / 8);
    if (width / 8 != 0 && map_entries / (width / 8) != height / 8) return 0;
    if (!RangeValid(20, map_entries * 2, resources->layout_size)) return 0;
    map = resources->layout + 20;

    for (y = 0; y < (s32)height; ++y) {
        for (x = 0; x < (s32)width; ++x) {
            size_t map_index = (size_t)(y / 8) * (width / 8) + (size_t)(x / 8);
            u16 entry = ReadU16(map + map_index * 2);
            s32 tile_x = x & 7;
            s32 tile_y = y & 7;
            u32 color_index;
            s32 draw_y = destination_y + y;

            if ((entry & 0x0400) != 0) tile_x = 7 - tile_x;
            if ((entry & 0x0800) != 0) tile_y = 7 - tile_y;
            if (!ReadTilePixel(tiles, tile_size, format, entry & 0x03ff,
                               tile_x, tile_y, entry >> 12, &color_index) ||
                color_index >= color_count) return 0;
            if (x >= 0 && x < canvas->width && draw_y >= 0 &&
                draw_y < canvas->height) {
                canvas->pixels[draw_y * canvas->stride + x] =
                    ConvertColor(ReadU16(palette + color_index * 2));
            }
        }
    }
    return 1;
}

/* Resolves the standard DS OAM shape/size encoding to pixel dimensions. */
static s32 DecodeObjectDimensions(u16 attribute_zero, u16 attribute_one,
                                  s32 *width, s32 *height)
{
    static const u8 dimensions[3][4][2] = {
        {{8, 8}, {16, 16}, {32, 32}, {64, 64}},
        {{16, 8}, {32, 8}, {32, 16}, {64, 32}},
        {{8, 16}, {8, 32}, {16, 32}, {32, 64}}
    };
    u32 shape = attribute_zero >> 14;
    u32 size = attribute_one >> 14;

    if (shape >= 3) return 0;
    *width = dimensions[shape][size][0];
    *height = dimensions[shape][size][1];
    return 1;
}

/* Replaces the recovered VCE-to-OAM path for the first animation cell. */
s32 TingleNativeGraphics_DrawSpriteCell(
    const TingleNativeGraphicsResourceSet *resources,
    TingleNativeCanvas *canvas, s32 anchor_x, s32 anchor_y,
    s32 destination_y)
{
    const u8 *tiles;
    const u8 *palette;
    const u8 *oam;
    size_t tile_size;
    size_t color_count;
    size_t oam_count;
    size_t oam_offset;
    u32 format;
    size_t object_index;

    if (canvas == NULL || canvas->pixels == NULL || resources == NULL ||
        resources->layout == NULL || resources->layout_size < 0x24 ||
        ReadU32(resources->layout) != NATIVE_VCE_SIGNATURE ||
        !ParseTilesAndPalette(resources, &tiles, &tile_size, &format,
                              &palette, &color_count)) return 0;
    oam_count = ReadU32(resources->layout + 0x1c);
    oam_offset = ReadU32(resources->layout + 0x20);
    if (oam_count == 0 || !RangeValid(oam_offset, oam_count * 8,
                                      resources->layout_size)) return 0;
    oam = resources->layout + oam_offset;

    /* Lower OAM indices have hardware priority, so submit them last. */
    for (object_index = oam_count; object_index-- > 0;) {
        const u8 *entry = oam + object_index * 8;
        u16 attribute_zero = ReadU16(entry);
        u16 attribute_one = ReadU16(entry + 2);
        u16 attribute_two = ReadU16(entry + 4);
        s32 width;
        s32 height;
        s32 relative_x = attribute_one & 0x01ff;
        s32 relative_y = attribute_zero & 0x00ff;
        s32 x;
        s32 y;
        size_t base_byte = (size_t)(attribute_two & 0x03ff) * 128;
        size_t bytes_per_tile = format == 1 ? 64 : 32;

        if (!DecodeObjectDimensions(attribute_zero, attribute_one,
                                    &width, &height)) return 0;
        if (relative_x >= 256) relative_x -= 512;
        if (relative_y >= 192) relative_y -= 256;
        for (y = 0; y < height; ++y) {
            for (x = 0; x < width; ++x) {
                size_t tile = base_byte / bytes_per_tile +
                              (size_t)(y / 8) * (width / 8) + (size_t)(x / 8);
                u32 color_index;
                s32 draw_x = anchor_x + relative_x + x;
                s32 draw_y = destination_y + anchor_y + relative_y + y;

                if (!ReadTilePixel(tiles, tile_size, format, tile,
                                   x & 7, y & 7, attribute_two >> 12,
                                   &color_index) || color_index >= color_count)
                    return 0;
                if (color_index != 0 && draw_x >= 0 && draw_x < canvas->width &&
                    draw_y >= 0 && draw_y < canvas->height) {
                    canvas->pixels[draw_y * canvas->stride + draw_x] =
                        ConvertColor(ReadU16(palette + color_index * 2));
                }
            }
        }
    }
    return 1;
}
