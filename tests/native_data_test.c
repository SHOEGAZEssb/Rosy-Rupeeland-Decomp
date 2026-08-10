/* Copyright-free coverage for directory and Nintendo DS FNT/FAT reads. */
#include "tingle/native_data.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void WriteU32(unsigned char *p, unsigned int value)
{
    p[0] = (unsigned char)value;
    p[1] = (unsigned char)(value >> 8);
    p[2] = (unsigned char)(value >> 16);
    p[3] = (unsigned char)(value >> 24);
}

static int TestDirectory(void)
{
    TingleNativeData *data = TingleNativeData_OpenDirectory(TINGLE_TEST_SOURCE_DIR);
    void *bytes = NULL;
    size_t size = 0;
    int ok = data != NULL && TingleNativeData_ReadFile(data, "CMakeLists.txt", &bytes, &size) &&
             size > 10 && memcmp(bytes, "cmake_minimum", 13) == 0;
    free(bytes);
    TingleNativeData_Close(data);
    return ok;
}

static int TestRom(void)
{
    unsigned char rom[0x244] = {0};
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
    WriteU32(rom + 0x220, 0x240);
    WriteU32(rom + 0x224, 0x244);
    memcpy(rom + 0x240, "TEST", 4);
    file = fopen(path, "wb");
    if (file == NULL) return 0;
    ok = fwrite(rom, 1, sizeof(rom), file) == sizeof(rom);
    fclose(file);
    if (!ok) return 0;
    data = TingleNativeData_OpenRom(path);
    ok = data != NULL && TingleNativeData_ReadFile(data, "test.bin", &bytes, &size) &&
         size == 4 && memcmp(bytes, "TEST", 4) == 0 &&
         !TingleNativeData_ReadFile(data, "../test.bin", &bytes, &size);
    free(bytes);
    TingleNativeData_Close(data);
    remove(path);
    return ok;
}

static int ProbeProvider(const char *kind, const char *source, const char *path)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    void *bytes = NULL;
    size_t size = 0;
    int ok = data != NULL && TingleNativeData_ReadFile(data, path, &bytes, &size) && size != 0;
    if (ok) printf("%s: %zu bytes\n", path, size);
    free(bytes);
    TingleNativeData_Close(data);
    return ok ? 0 : 1;
}

int main(int argc, char **argv)
{
    if (argc == 4 && (strcmp(argv[1], "--rom") == 0 || strcmp(argv[1], "--data") == 0))
        return ProbeProvider(argv[1], argv[2], argv[3]);
    if (!TestDirectory()) return 1;
    if (!TestRom()) return 2;
    return 0;
}
