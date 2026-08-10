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
    unsigned char header[0x50];
    size_t fnt_offset;
    size_t fat_offset;
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
    data->arm9_offset = ReadU32(header + 0x20);
    data->arm9_address = ReadU32(header + 0x28);
    data->arm9_size = ReadU32(header + 0x2c);
    if ((data->fat_size & 7) != 0 || data->fnt_size < 9 ||
        data->arm9_size == 0 ||
        !RangeValid(data->arm9_offset, data->arm9_size, data->rom_size) ||
        !LoadTable(data->rom, fnt_offset, data->fnt_size, data->rom_size, &data->fnt) ||
        !LoadTable(data->rom, fat_offset, data->fat_size, data->rom_size, &data->fat)) goto fail;
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
