/* Copyright-free coverage for extracted-directory and NDS NitroFS reads. */
#include "tingle/native_data.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef _WIN32
#include <direct.h>
#define MakeDirectory(path) _mkdir(path)
#define RemoveDirectory(path) _rmdir(path)
#else
#include <sys/stat.h>
#include <unistd.h>
#define MakeDirectory(path) mkdir(path, 0700)
#define RemoveDirectory(path) rmdir(path)
#endif

/* Writes one little-endian word into a synthetic NDS image. */
static void WriteU32(unsigned char *bytes, unsigned int value)
{
    bytes[0] = (unsigned char)value;
    bytes[1] = (unsigned char)(value >> 8);
    bytes[2] = (unsigned char)(value >> 16);
    bytes[3] = (unsigned char)(value >> 24);
}

/* Confirms that passing the NitroFS directory itself remains supported. */
static int TestDirectDirectory(void)
{
    TingleNativeData *data = TingleNativeData_OpenDirectory(TINGLE_TEST_SOURCE_DIR);
    void *bytes = NULL;
    size_t size = 0;
    int ok = data != NULL &&
             TingleNativeData_ReadFile(data, "CMakeLists.txt", &bytes, &size) &&
             size > 13 && memcmp(bytes, "cmake_minimum", 13) == 0;

    free(bytes);
    TingleNativeData_Close(data);
    return ok;
}

/* Writes one complete test file or returns zero on any stream failure. */
static int WriteFile(const char *path, const void *bytes, size_t size)
{
    FILE *file = fopen(path, "wb");
    int ok;

    if (file == NULL) return 0;
    ok = fwrite(bytes, 1, size, file) == size;
    fclose(file);
    return ok;
}

/* Confirms that an extracted-ROM root automatically resolves through files/. */
static int TestExtractedRoot(void)
{
    const char *root = "native_data_extract_test";
    TingleNativeData *data = NULL;
    void *bytes = NULL;
    size_t size = 0;
    int ok = 0;

    (void)MakeDirectory(root);
    (void)MakeDirectory("native_data_extract_test/files");
    if (!WriteFile("native_data_extract_test/files/test.bin", "FILE", 4))
        goto done;
    data = TingleNativeData_OpenDirectory(root);
    ok = data != NULL &&
         TingleNativeData_ReadFile(data, "test.bin", &bytes, &size) &&
         size == 4 && memcmp(bytes, "FILE", 4) == 0;
    free(bytes);
    bytes = NULL;
    ok = ok && !TingleNativeData_ReadFile(data, "../test.bin", &bytes, &size) &&
         !TingleNativeData_ReadFile(data, "/test.bin", &bytes, &size);
done:
    free(bytes);
    TingleNativeData_Close(data);
    remove("native_data_extract_test/files/test.bin");
    (void)RemoveDirectory("native_data_extract_test/files");
    (void)RemoveDirectory(root);
    return ok;
}

/* Confirms FNT name resolution, FAT bounds, and caller ownership for ROM data. */
static int TestRom(void)
{
    unsigned char rom[0x22c] = {0};
    const char *path = "native_data_test.nds";
    FILE *file;
    TingleNativeData *data;
    void *bytes = NULL;
    size_t size = 0;
    int ok;

    WriteU32(rom + 0x40, 0x200);
    WriteU32(rom + 0x44, 18);
    WriteU32(rom + 0x48, 0x220);
    WriteU32(rom + 0x4c, 8);
    WriteU32(rom + 0x200, 8);
    rom[0x206] = 1;
    rom[0x208] = 8;
    memcpy(rom + 0x209, "test.bin", 8);
    WriteU32(rom + 0x220, 0x228);
    WriteU32(rom + 0x224, 0x22c);
    memcpy(rom + 0x228, "TEST", 4);
    file = fopen(path, "wb");
    if (file == NULL) return 0;
    ok = fwrite(rom, 1, sizeof(rom), file) == sizeof(rom);
    fclose(file);
    if (!ok) return 0;

    data = TingleNativeData_OpenRom(path);
    ok = data != NULL &&
         TingleNativeData_ReadFile(data, "test.bin", &bytes, &size) &&
         size == 4 && memcmp(bytes, "TEST", 4) == 0;
    free(bytes);
    bytes = NULL;
    ok = ok && !TingleNativeData_ReadFile(data, "missing.bin", &bytes, &size);
    TingleNativeData_Close(data);
    remove(path);
    return ok;
}

/* Supports a manual read probe without adding executable-code loading modes. */
static int ProbeProvider(const char *kind, const char *source, const char *path)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    void *bytes = NULL;
    size_t size = 0;
    int ok = data != NULL &&
             TingleNativeData_ReadFile(data, path, &bytes, &size) && size != 0;

    if (ok) printf("%s: %zu bytes\n", path, size);
    free(bytes);
    TingleNativeData_Close(data);
    return ok ? 0 : 1;
}

/* Runs deterministic tests or the explicitly requested manual file probe. */
int main(int argc, char **argv)
{
    if (argc == 4 &&
        (strcmp(argv[1], "--rom") == 0 || strcmp(argv[1], "--data") == 0))
        return ProbeProvider(argv[1], argv[2], argv[3]);
    if (!TestDirectDirectory()) return 1;
    if (!TestExtractedRoot()) return 2;
    if (!TestRom()) return 3;
    return 0;
}
