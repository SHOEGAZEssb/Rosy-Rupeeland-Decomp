/*
 * Native retail-data provider.
 *
 * The directory backend reads an extracted NitroFS tree. The ROM backend
 * resolves the same paths through validated Nintendo DS filename and file
 * allocation tables. Executable ARM9 and overlay images are intentionally not
 * exposed: a recompilation links recovered code instead of loading ARM code.
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
};

/* Reads a little-endian halfword from NDS metadata. */
static unsigned short ReadU16(const unsigned char *bytes)
{
    return (unsigned short)(bytes[0] | ((unsigned short)bytes[1] << 8));
}

/* Reads a little-endian word from NDS metadata. */
static unsigned int ReadU32(const unsigned char *bytes)
{
    return (unsigned int)bytes[0] | ((unsigned int)bytes[1] << 8) |
           ((unsigned int)bytes[2] << 16) | ((unsigned int)bytes[3] << 24);
}

/* Returns nonzero when an offset and byte count fit within a buffer. */
static int RangeValid(size_t offset, size_t size, size_t limit)
{
    return offset <= limit && size <= limit - offset;
}

/* Copies one NUL-terminated provider path into owned storage. */
static char *CopyString(const char *text)
{
    size_t size = strlen(text) + 1;
    char *copy = (char *)malloc(size);

    if (copy != NULL) memcpy(copy, text, size);
    return copy;
}

/* Joins a provider root and safe relative path with one separator. */
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

/* Rejects absolute paths, empty components, and directory traversal. */
static int SafeRelativePath(const char *path)
{
    const char *part = path;

    if (path == NULL || *path == '\0' || *path == '/' || *path == '\\') return 0;
    if (path[1] == ':') return 0;
    while (*part != '\0') {
        const char *end = part;

        while (*end != '\0' && *end != '/' && *end != '\\') ++end;
        if (end == part || (end - part == 1 && part[0] == '.') ||
            (end - part == 2 && part[0] == '.' && part[1] == '.')) return 0;
        part = *end == '\0' ? end : end + 1;
    }
    return 1;
}

/* Loads one validated ROM metadata table into owned storage. */
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

/* Creates a directory-backed provider; existence is checked on file reads. */
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
    return data;
}

/* Opens a ROM and retains only the NitroFS tables needed by game file calls. */
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
    if ((data->fat_size & 7) != 0 || data->fnt_size < 9 ||
        !LoadTable(data->rom, fnt_offset, data->fnt_size,
                   data->rom_size, &data->fnt) ||
        !LoadTable(data->rom, fat_offset, data->fat_size,
                   data->rom_size, &data->fat)) goto fail;
    data->kind = DATA_ROM;
    return data;
fail:
    TingleNativeData_Close(data);
    return NULL;
}

/* Releases directory metadata or the open ROM and its NitroFS tables. */
void TingleNativeData_Close(TingleNativeData *data)
{
    if (data == NULL) return;
    if (data->rom != NULL) fclose(data->rom);
    free(data->root);
    free(data->fnt);
    free(data->fat);
    free(data);
}

/* Reads one exact stream range into newly allocated caller-owned storage. */
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

/* Attempts a read relative to one directory-root spelling. */
static int TryReadDirectoryPath(const char *root, const char *path,
                                void **bytes, size_t *size)
{
    char *joined = JoinPath(root, path);
    FILE *file;
    long file_size;
    int result;

    if (joined == NULL) return 0;
    file = fopen(joined, "rb");
    free(joined);
    if (file == NULL || fseek(file, 0, SEEK_END) != 0) {
        if (file != NULL) fclose(file);
        return 0;
    }
    file_size = ftell(file);
    result = file_size >= 0 &&
             ReadStreamRange(file, 0, (size_t)file_size, bytes, size);
    fclose(file);
    return result;
}

/* Supports both an extraction root containing files/ and files/ itself. */
static int ReadDirectoryFile(TingleNativeData *data, const char *path,
                             void **bytes, size_t *size)
{
    size_t path_size = strlen(path);
    char *prefixed = (char *)malloc(path_size + 7);
    int result = 0;

    if (prefixed != NULL) {
        memcpy(prefixed, "files/", 6);
        memcpy(prefixed + 6, path, path_size + 1);
        result = TryReadDirectoryPath(data->root, prefixed, bytes, size);
        free(prefixed);
    }
    return result || TryReadDirectoryPath(data->root, path, bytes, size);
}

/* Compares one FNT name component with one requested path component. */
static int ComponentEqual(const unsigned char *name, size_t name_size,
                          const char *component, size_t component_size)
{
    return name_size == component_size &&
           memcmp(name, component, name_size) == 0;
}

/* Walks the NitroFS filename table and returns a matching file identifier. */
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
            if (!RangeValid(cursor, name_size + (is_directory ? 2 : 0),
                            data->fnt_size)) return 0;
            if (is_directory) child = ReadU16(data->fnt + cursor + name_size);
            if (ComponentEqual(data->fnt + cursor, name_size, component,
                               (size_t)(end - component))) {
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

/* Resolves one NitroFS path and copies its validated FAT extent. */
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

/* Reads one safe relative game-data path through the selected provider. */
int TingleNativeData_ReadFile(TingleNativeData *data, const char *path,
                              void **bytes, size_t *size)
{
    if (data == NULL || bytes == NULL || size == NULL || !SafeRelativePath(path))
        return 0;
    *bytes = NULL;
    *size = 0;
    return data->kind == DATA_DIRECTORY
        ? ReadDirectoryFile(data, path, bytes, size)
        : ReadRomFile(data, path, bytes, size);
}
