/*
 * Native game-data filesystem.
 *
 * The directory backend reads from an extracted NitroFS tree. The ROM backend
 * resolves the same relative paths through the Nintendo DS filename and file
 * allocation tables, validating every offset before returning owned bytes.
 */
#include "tingle/native_data.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum { DATA_DIRECTORY, DATA_ROM };

struct TingleNativeData {
    int kind;
    char *root;
    FILE *rom;
    unsigned char *fnt;
    size_t fnt_size;
    unsigned char *fat;
    size_t fat_size;
    unsigned char *overlay_table;
    size_t overlay_table_size;
    size_t rom_size;
    size_t arm9_offset;
    size_t arm9_size;
    u32 arm9_address;
    char *arm9_path;
    int extracted_layout;
};

static unsigned short ReadU16(const unsigned char *p)
{
    return (unsigned short)(p[0] | ((unsigned short)p[1] << 8));
}

static unsigned int ReadU32(const unsigned char *p)
{
    return (unsigned int)p[0] | ((unsigned int)p[1] << 8) |
           ((unsigned int)p[2] << 16) | ((unsigned int)p[3] << 24);
}

static int RangeValid(size_t offset, size_t size, size_t limit)
{
    return offset <= limit && size <= limit - offset;
}

static char *CopyString(const char *text)
{
    size_t size = strlen(text) + 1;
    char *copy = (char *)malloc(size);
    if (copy != NULL) memcpy(copy, text, size);
    return copy;
}

static char *JoinPath(const char *root, const char *path)
{
    size_t root_size = strlen(root);
    size_t path_size = strlen(path);
    char *joined = (char *)malloc(root_size + path_size + 2);

    if (joined == NULL) return NULL;
    memcpy(joined, root, root_size);
    joined[root_size] = '/';
    memcpy(joined + root_size + 1, path, path_size + 1);
    return joined;
}

static int FileExists(const char *path)
{
    FILE *file = fopen(path, "rb");
    if (file == NULL) return 0;
    fclose(file);
    return 1;
}

static int ReadExtractedArm9Mapping(TingleNativeData *data)
{
    char *config_path = JoinPath(data->root, "arm9/arm9.yaml");
    char *arm9_path = JoinPath(data->root, "arm9/arm9.bin");
    FILE *config;
    FILE *arm9;
    char line[256];
    long arm9_size;
    unsigned long address = 0;

    if (config_path == NULL || arm9_path == NULL || !FileExists(arm9_path)) goto fail;
    config = fopen(config_path, "r");
    if (config == NULL) goto fail;
    while (fgets(line, sizeof(line), config) != NULL) {
        if (strncmp(line, "base_address:", 13) == 0) {
            char *end;
            address = strtoul(line + 13, &end, 0);
            if (end != line + 13) break;
            address = 0;
        }
    }
    fclose(config);
    if (address > 0xffffffffUL) goto fail;
    arm9 = fopen(arm9_path, "rb");
    if (arm9 == NULL || fseek(arm9, 0, SEEK_END) != 0) {
        if (arm9 != NULL) fclose(arm9);
        goto fail;
    }
    arm9_size = ftell(arm9);
    fclose(arm9);
    if (address == 0 || arm9_size <= 0) goto fail;
    data->arm9_address = (u32)address;
    data->arm9_size = (size_t)arm9_size;
    data->arm9_path = arm9_path;
    data->extracted_layout = 1;
    free(config_path);
    return 1;
fail:
    free(config_path);
    free(arm9_path);
    return 0;
}

static int SafeRelativePath(const char *path)
{
    const char *part = path;
    if (path == NULL || *path == '\0' || *path == '/' || *path == '\\') return 0;
    if (path[0] != '\0' && path[1] == ':') return 0;
    while (*part != '\0') {
        const char *end = part;
        while (*end != '\0' && *end != '/' && *end != '\\') ++end;
        if (end == part || (end - part == 1 && part[0] == '.') ||
            (end - part == 2 && part[0] == '.' && part[1] == '.')) return 0;
        part = *end == '\0' ? end : end + 1;
    }
    return 1;
}

static int LoadTable(FILE *file, size_t offset, size_t size,
                     size_t file_size, unsigned char **table)
{
    if (!RangeValid(offset, size, file_size) || size == 0) return 0;
    *table = (unsigned char *)malloc(size);
    if (*table == NULL || fseek(file, (long)offset, SEEK_SET) != 0 ||
        fread(*table, 1, size, file) != size) {
        free(*table);
        *table = NULL;
        return 0;
    }
    return 1;
}

TingleNativeData *TingleNativeData_OpenDirectory(const char *root)
{
    TingleNativeData *data;
    if (root == NULL || *root == '\0') return NULL;
    data = (TingleNativeData *)calloc(1, sizeof(*data));
    if (data == NULL) return NULL;
    data->root = CopyString(root);
    if (data->root == NULL) {
        free(data);
        return NULL;
    }
    data->kind = DATA_DIRECTORY;
    (void)ReadExtractedArm9Mapping(data);
    return data;
}

TingleNativeData *TingleNativeData_OpenRom(const char *path)
{
    unsigned char header[0x58];
    size_t fnt_offset;
    size_t fat_offset;
    size_t overlay_table_offset;
    long rom_size;
    TingleNativeData *data = (TingleNativeData *)calloc(1, sizeof(*data));
    if (data == NULL || path == NULL || *path == '\0') {
        free(data);
        return NULL;
    }
    data->rom = fopen(path, "rb");
    if (data->rom == NULL || fseek(data->rom, 0, SEEK_END) != 0) goto fail;
    rom_size = ftell(data->rom);
    if (rom_size < 0) goto fail;
    data->rom_size = (size_t)rom_size;
    if (data->rom_size < sizeof(header) || fseek(data->rom, 0, SEEK_SET) != 0 ||
        fread(header, 1, sizeof(header), data->rom) != sizeof(header)) goto fail;
    fnt_offset = ReadU32(header + 0x40);
    data->fnt_size = ReadU32(header + 0x44);
    fat_offset = ReadU32(header + 0x48);
    data->fat_size = ReadU32(header + 0x4c);
    overlay_table_offset = ReadU32(header + 0x50);
    data->overlay_table_size = ReadU32(header + 0x54);
    data->arm9_offset = ReadU32(header + 0x20);
    data->arm9_address = ReadU32(header + 0x28);
    data->arm9_size = ReadU32(header + 0x2c);
    if ((data->fat_size & 7) != 0 || (data->overlay_table_size & 31) != 0 ||
        data->fnt_size < 9 ||
        data->arm9_size == 0 ||
        !RangeValid(data->arm9_offset, data->arm9_size, data->rom_size) ||
        !LoadTable(data->rom, fnt_offset, data->fnt_size, data->rom_size, &data->fnt) ||
        !LoadTable(data->rom, fat_offset, data->fat_size, data->rom_size, &data->fat) ||
        (data->overlay_table_size != 0 &&
         !LoadTable(data->rom, overlay_table_offset, data->overlay_table_size,
                    data->rom_size, &data->overlay_table))) goto fail;
    data->kind = DATA_ROM;
    return data;
fail:
    TingleNativeData_Close(data);
    return NULL;
}

void TingleNativeData_Close(TingleNativeData *data)
{
    if (data == NULL) return;
    if (data->rom != NULL) fclose(data->rom);
    free(data->root);
    free(data->fnt);
    free(data->fat);
    free(data->overlay_table);
    free(data->arm9_path);
    free(data);
}

static int ReadStreamRange(FILE *file, size_t offset, size_t size,
                           void **bytes, size_t *result_size)
{
    void *buffer = malloc(size == 0 ? 1 : size);
    if (buffer == NULL || fseek(file, (long)offset, SEEK_SET) != 0 ||
        fread(buffer, 1, size, file) != size) {
        free(buffer);
        return 0;
    }
    *bytes = buffer;
    *result_size = size;
    return 1;
}

static int ReadDirectoryFile(TingleNativeData *data, const char *path,
                             void **bytes, size_t *size)
{
    char *relative = NULL;
    char *joined;
    FILE *file;
    long file_size;
    int result;
    if (data->extracted_layout) {
        size_t path_size = strlen(path);
        relative = (char *)malloc(path_size + 7);
        if (relative == NULL) return 0;
        memcpy(relative, "files/", 6);
        memcpy(relative + 6, path, path_size + 1);
    }
    joined = JoinPath(data->root, relative != NULL ? relative : path);
    free(relative);
    if (joined == NULL) return 0;
    file = fopen(joined, "rb");
    free(joined);
    if (file == NULL || fseek(file, 0, SEEK_END) != 0) {
        if (file != NULL) fclose(file);
        return 0;
    }
    file_size = ftell(file);
    result = file_size >= 0 && ReadStreamRange(file, 0, (size_t)file_size, bytes, size);
    fclose(file);
    return result;
}

static int ComponentEqual(const unsigned char *name, size_t name_size,
                          const char *component, size_t component_size)
{
    return name_size == component_size && memcmp(name, component, name_size) == 0;
}

static int ResolveRomFile(TingleNativeData *data, const char *path,
                          unsigned short *resolved_file)
{
    unsigned short directory = 0xf000;
    const char *component = path;
    unsigned short directory_count = ReadU16(data->fnt + 6);
    while (*component != '\0') {
        const char *end = component;
        size_t directory_index = directory & 0x0fff;
        size_t cursor;
        unsigned short file_id;
        int matched = 0;
        while (*end != '\0' && *end != '/' && *end != '\\') ++end;
        if (directory_index >= directory_count ||
            !RangeValid(directory_index * 8, 8, data->fnt_size)) return 0;
        cursor = ReadU32(data->fnt + directory_index * 8);
        file_id = ReadU16(data->fnt + directory_index * 8 + 4);
        while (cursor < data->fnt_size) {
            unsigned char tag = data->fnt[cursor++];
            size_t name_size = tag & 0x7f;
            int is_directory = (tag & 0x80) != 0;
            unsigned short child = 0;
            if (tag == 0) break;
            if (!RangeValid(cursor, name_size + (is_directory ? 2 : 0), data->fnt_size)) return 0;
            if (is_directory) child = ReadU16(data->fnt + cursor + name_size);
            if (ComponentEqual(data->fnt + cursor, name_size, component, (size_t)(end - component))) {
                if (*end == '\0' && !is_directory) {
                    *resolved_file = file_id;
                    return 1;
                }
                if (*end != '\0' && is_directory) {
                    directory = child;
                    matched = 1;
                    break;
                }
            }
            cursor += name_size + (is_directory ? 2 : 0);
            if (!is_directory) ++file_id;
        }
        if (!matched) return 0;
        component = end + 1;
    }
    return 0;
}

static int ReadRomFile(TingleNativeData *data, const char *path,
                       void **bytes, size_t *size)
{
    unsigned short file_id;
    size_t fat_entry;
    size_t start;
    size_t end;
    if (!ResolveRomFile(data, path, &file_id)) return 0;
    fat_entry = (size_t)file_id * 8;
    if (!RangeValid(fat_entry, 8, data->fat_size)) return 0;
    start = ReadU32(data->fat + fat_entry);
    end = ReadU32(data->fat + fat_entry + 4);
    if (end < start || !RangeValid(start, end - start, data->rom_size)) return 0;
    return ReadStreamRange(data->rom, start, end - start, bytes, size);
}

static int ReadRomFileById(TingleNativeData *data, u32 file_id,
                           void **bytes, size_t *size)
{
    size_t fat_entry = (size_t)file_id * 8;
    size_t start;
    size_t end;

    if (!RangeValid(fat_entry, 8, data->fat_size)) return 0;
    start = ReadU32(data->fat + fat_entry);
    end = ReadU32(data->fat + fat_entry + 4);
    if (end < start || !RangeValid(start, end - start, data->rom_size)) return 0;
    return ReadStreamRange(data->rom, start, end - start, bytes, size);
}

int TingleNativeData_ReadFile(TingleNativeData *data, const char *path,
                              void **bytes, size_t *size)
{
    if (data == NULL || bytes == NULL || size == NULL || !SafeRelativePath(path)) return 0;
    *bytes = NULL;
    *size = 0;
    return data->kind == DATA_DIRECTORY
        ? ReadDirectoryFile(data, path, bytes, size)
        : ReadRomFile(data, path, bytes, size);
}

int TingleNativeData_ReadArm9(TingleNativeData *data, u32 address,
                              size_t size, void **bytes)
{
    size_t relative;
    FILE *file;
    size_t ignored_size;
    int result;

    if (data == NULL || bytes == NULL || address < data->arm9_address) return 0;
    *bytes = NULL;
    relative = (size_t)(address - data->arm9_address);
    if (!RangeValid(relative, size, data->arm9_size)) return 0;
    if (data->kind == DATA_ROM) {
        return ReadStreamRange(data->rom, data->arm9_offset + relative,
                               size, bytes, &ignored_size);
    }
    if (data->arm9_path == NULL) return 0;
    file = fopen(data->arm9_path, "rb");
    if (file == NULL) return 0;
    result = ReadStreamRange(file, relative, size, bytes, &ignored_size);
    fclose(file);
    return result;
}

static int ParseUnsignedField(const char *line, const char *field, u32 *value)
{
    size_t field_size = strlen(field);
    char *end;
    unsigned long parsed;

    while (*line == ' ') ++line;
    if (strncmp(line, field, field_size) != 0) return 0;
    parsed = strtoul(line + field_size, &end, 0);
    if (end == line + field_size || parsed > 0xffffffffUL) return 0;
    *value = (u32)parsed;
    return 1;
}

static int OverlayMetadataValid(const TingleNativeOverlayImage *overlay)
{
    u32 code_end = overlay->load_address + overlay->code_size;
    u32 image_end = code_end + overlay->bss_size;

    if (overlay->load_address == 0 || overlay->code_size == 0 ||
        code_end < overlay->load_address || image_end < code_end) return 0;
    if (overlay->constructor_start == 0 && overlay->constructor_end == 0) return 1;
    return overlay->constructor_start >= overlay->load_address &&
           overlay->constructor_start <= overlay->constructor_end &&
           overlay->constructor_end <= code_end;
}

static int ParseExtractedOverlay(TingleNativeData *data, u32 overlay_id,
                                 TingleNativeOverlayImage *overlay,
                                 char *file_name, size_t file_name_size)
{
    char *table_path = JoinPath(data->root, "arm9_overlays/overlays.yaml");
    FILE *table;
    char line[256];
    u32 current_id = 0xffffffffu;
    int compressed = 0;
    int found = 0;

    if (table_path == NULL) return 0;
    table = fopen(table_path, "r");
    free(table_path);
    if (table == NULL) return 0;
    while (fgets(line, sizeof(line), table) != NULL) {
        u32 value;
        char *text = line;

        while (*text == ' ') ++text;
        if (strncmp(text, "- id:", 5) == 0) {
            if (found) break;
            current_id = (u32)strtoul(text + 5, NULL, 0);
            found = current_id == overlay_id;
            continue;
        }
        if (!found) continue;
        if (ParseUnsignedField(text, "base_address:", &value)) overlay->load_address = value;
        else if (ParseUnsignedField(text, "code_size:", &value)) overlay->code_size = value;
        else if (ParseUnsignedField(text, "bss_size:", &value)) overlay->bss_size = value;
        else if (ParseUnsignedField(text, "ctor_start:", &value)) overlay->constructor_start = value;
        else if (ParseUnsignedField(text, "ctor_end:", &value)) overlay->constructor_end = value;
        else if (strncmp(text, "compressed:", 11) == 0) compressed = strstr(text + 11, "true") != NULL;
        else if (strncmp(text, "file_name:", 10) == 0) {
            char *name = text + 10;
            size_t length;
            while (*name == ' ') ++name;
            length = strcspn(name, "\r\n");
            if (length == 0 || length >= file_name_size) {
                found = 0;
                break;
            }
            memcpy(file_name, name, length);
            file_name[length] = '\0';
        }
    }
    fclose(table);
    overlay->id = overlay_id;
    return found && !compressed && OverlayMetadataValid(overlay) &&
           file_name[0] != '\0' &&
           SafeRelativePath(file_name);
}

static int ReadExtractedOverlay(TingleNativeData *data, u32 overlay_id,
                                TingleNativeOverlayImage *overlay)
{
    char file_name[128] = {0};
    char relative[160];
    char *path;
    FILE *file;
    long file_size;

    if (!data->extracted_layout ||
        !ParseExtractedOverlay(data, overlay_id, overlay, file_name, sizeof(file_name)))
        return 0;
    if (snprintf(relative, sizeof(relative), "arm9_overlays/%s", file_name) < 0)
        return 0;
    path = JoinPath(data->root, relative);
    if (path == NULL) return 0;
    file = fopen(path, "rb");
    free(path);
    if (file == NULL || fseek(file, 0, SEEK_END) != 0) {
        if (file != NULL) fclose(file);
        return 0;
    }
    file_size = ftell(file);
    if (file_size < 0 || (u32)file_size != overlay->code_size ||
        fseek(file, 0, SEEK_SET) != 0) {
        fclose(file);
        return 0;
    }
    overlay->size = (size_t)overlay->code_size + overlay->bss_size;
    if (overlay->size < overlay->code_size) {
        fclose(file);
        return 0;
    }
    overlay->bytes = calloc(overlay->size == 0 ? 1 : overlay->size, 1);
    if (overlay->bytes == NULL ||
        fread(overlay->bytes, 1, overlay->code_size, file) != overlay->code_size) {
        fclose(file);
        TingleNativeData_CloseOverlay(overlay);
        return 0;
    }
    fclose(file);
    return 1;
}

static int ReadRomOverlay(TingleNativeData *data, u32 overlay_id,
                          TingleNativeOverlayImage *overlay)
{
    size_t offset;

    for (offset = 0; offset < data->overlay_table_size; offset += 32) {
        const u8 *entry = data->overlay_table + offset;
        u32 flags;
        u32 file_id;
        void *code = NULL;
        size_t code_size = 0;

        if (ReadU32(entry) != overlay_id) continue;
        flags = ReadU32(entry + 28);
        if ((flags & 0x01000000u) != 0) return 0;
        overlay->id = overlay_id;
        overlay->load_address = ReadU32(entry + 4);
        overlay->code_size = ReadU32(entry + 8);
        overlay->bss_size = ReadU32(entry + 12);
        overlay->constructor_start = ReadU32(entry + 16);
        overlay->constructor_end = ReadU32(entry + 20);
        file_id = ReadU32(entry + 24);
        if (!OverlayMetadataValid(overlay)) return 0;
        if (!ReadRomFileById(data, file_id, &code, &code_size) ||
            code_size != overlay->code_size) {
            free(code);
            return 0;
        }
        overlay->size = (size_t)overlay->code_size + overlay->bss_size;
        if (overlay->size < overlay->code_size) {
            free(code);
            return 0;
        }
        overlay->bytes = calloc(overlay->size == 0 ? 1 : overlay->size, 1);
        if (overlay->bytes == NULL) {
            free(code);
            return 0;
        }
        memcpy(overlay->bytes, code, code_size);
        free(code);
        return 1;
    }
    return 0;
}

int TingleNativeData_ReadOverlay(TingleNativeData *data, u32 overlay_id,
                                 TingleNativeOverlayImage *overlay)
{
    if (data == NULL || overlay == NULL) return 0;
    memset(overlay, 0, sizeof(*overlay));
    return data->kind == DATA_ROM
        ? ReadRomOverlay(data, overlay_id, overlay)
        : ReadExtractedOverlay(data, overlay_id, overlay);
}

void TingleNativeData_CloseOverlay(TingleNativeOverlayImage *overlay)
{
    if (overlay == NULL) return;
    free(overlay->bytes);
    memset(overlay, 0, sizeof(*overlay));
}
