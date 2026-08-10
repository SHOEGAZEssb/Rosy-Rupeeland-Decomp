/* Copyright-free coverage for directory and Nintendo DS FNT/FAT reads. */
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
    TingleNativeOverlayImage overlay = {0};
    int ok;
    WriteU32(rom + 0x40, 0x200);
    WriteU32(rom + 0x44, 18);
    WriteU32(rom + 0x48, 0x220);
    WriteU32(rom + 0x4c, 8);
    WriteU32(rom + 0x20, 0x100);
    WriteU32(rom + 0x28, 0x02000000);
    WriteU32(rom + 0x2c, 4);
    WriteU32(rom + 0x50, 0x180);
    WriteU32(rom + 0x54, 32);
    memcpy(rom + 0x100, "CODE", 4);
    WriteU32(rom + 0x180, 106);
    WriteU32(rom + 0x184, 0x0221d6c0);
    WriteU32(rom + 0x188, 4);
    WriteU32(rom + 0x18c, 4);
    WriteU32(rom + 0x190, 0x0221d6c4);
    WriteU32(rom + 0x194, 0x0221d6c4);
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
    bytes = NULL;
    ok = ok && TingleNativeData_ReadArm9(data, 0x02000001, 2, &bytes) &&
         memcmp(bytes, "OD", 2) == 0;
    free(bytes);
    bytes = NULL;
    ok = ok && !TingleNativeData_ReadArm9(data, 0x01ffffff, 1, &bytes) &&
         !TingleNativeData_ReadArm9(data, 0x02000003, 2, &bytes);
    ok = ok && TingleNativeData_ReadOverlay(data, 106, &overlay) &&
         overlay.load_address == 0x0221d6c0 && overlay.code_size == 4 &&
         overlay.bss_size == 4 && overlay.size == 8 &&
         memcmp(overlay.bytes, "TEST\0\0\0\0", 8) == 0;
    TingleNativeData_CloseOverlay(&overlay);
    TingleNativeData_Close(data);
    remove(path);
    return ok;
}

static int WriteFile(const char *path, const void *bytes, size_t size)
{
    FILE *file = fopen(path, "wb");
    int ok;

    if (file == NULL) return 0;
    ok = fwrite(bytes, 1, size, file) == size;
    fclose(file);
    return ok;
}

static int TestExtractedLayout(void)
{
    const char *root = "native_data_extract_test";
    const char config[] = "base_address: 33554432\n";
    const char overlays[] =
        "overlays:\n  - id: 106\n    base_address: 35772096\n"
        "    code_size: 4\n    bss_size: 4\n"
        "    ctor_start: 35772100\n    ctor_end: 35772100\n"
        "    compressed: false\n    file_name: ov106.bin\n";
    TingleNativeData *data = NULL;
    void *bytes = NULL;
    size_t size = 0;
    int ok = 0;

    (void)MakeDirectory(root);
    (void)MakeDirectory("native_data_extract_test/files");
    (void)MakeDirectory("native_data_extract_test/arm9");
    (void)MakeDirectory("native_data_extract_test/arm9_overlays");
    if (!WriteFile("native_data_extract_test/arm9/arm9.yaml", config, sizeof(config) - 1) ||
        !WriteFile("native_data_extract_test/arm9/arm9.bin", "ARM9DATA", 8) ||
        !WriteFile("native_data_extract_test/files/test.bin", "FILE", 4) ||
        !WriteFile("native_data_extract_test/arm9_overlays/ov106.bin", "OVLY", 4) ||
        !WriteFile("native_data_extract_test/arm9_overlays/overlays.yaml",
                   overlays, sizeof(overlays) - 1)) goto done;
    data = TingleNativeData_OpenDirectory(root);
    if (data == NULL ||
        !TingleNativeData_ReadFile(data, "test.bin", &bytes, &size) ||
        size != 4 || memcmp(bytes, "FILE", 4) != 0) goto done;
    free(bytes);
    bytes = NULL;
    if (!TingleNativeData_ReadArm9(data, 0x02000004, 4, &bytes) ||
        memcmp(bytes, "DATA", 4) != 0) goto done;
    free(bytes);
    bytes = NULL;
    {
        TingleNativeOverlayImage overlay = {0};
        if (!TingleNativeData_ReadOverlay(data, 106, &overlay) ||
            overlay.load_address != 35772096 || overlay.size != 8 ||
            memcmp(overlay.bytes, "OVLY\0\0\0\0", 8) != 0) {
            TingleNativeData_CloseOverlay(&overlay);
            goto done;
        }
        TingleNativeData_CloseOverlay(&overlay);
    }
    ok = 1;
done:
    free(bytes);
    TingleNativeData_Close(data);
    remove("native_data_extract_test/files/test.bin");
    remove("native_data_extract_test/arm9/arm9.bin");
    remove("native_data_extract_test/arm9/arm9.yaml");
    remove("native_data_extract_test/arm9_overlays/ov106.bin");
    remove("native_data_extract_test/arm9_overlays/overlays.yaml");
    (void)RemoveDirectory("native_data_extract_test/files");
    (void)RemoveDirectory("native_data_extract_test/arm9");
    (void)RemoveDirectory("native_data_extract_test/arm9_overlays");
    (void)RemoveDirectory(root);
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

static int ProbeArm9(const char *kind, const char *source,
                     const char *address_text, const char *size_text)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    u32 address = (u32)strtoul(address_text, NULL, 0);
    size_t size = (size_t)strtoul(size_text, NULL, 0);
    void *bytes = NULL;
    int ok = data != NULL && TingleNativeData_ReadArm9(data, address, size, &bytes);

    if (ok) printf("ARM9 0x%08X: %zu bytes\n", address, size);
    free(bytes);
    TingleNativeData_Close(data);
    return ok ? 0 : 1;
}

static int ProbeOverlay(const char *kind, const char *source, const char *id_text)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    u32 overlay_id = (u32)strtoul(id_text, NULL, 0);
    TingleNativeOverlayImage overlay = {0};
    int ok = data != NULL && TingleNativeData_ReadOverlay(data, overlay_id, &overlay);

    if (ok) printf("overlay %u: load=0x%08X code=%u bss=%u\n",
                   overlay.id, overlay.load_address, overlay.code_size, overlay.bss_size);
    TingleNativeData_CloseOverlay(&overlay);
    TingleNativeData_Close(data);
    return ok ? 0 : 1;
}

static int ProbeAllOverlays(const char *kind, const char *source)
{
    TingleNativeData *data = strcmp(kind, "--rom") == 0
        ? TingleNativeData_OpenRom(source)
        : TingleNativeData_OpenDirectory(source);
    u32 id;

    if (data == NULL) return 1;
    for (id = 0; id < 647; ++id) {
        TingleNativeOverlayImage overlay = {0};
        int ok = TingleNativeData_ReadOverlay(data, id, &overlay) && overlay.id == id;
        TingleNativeData_CloseOverlay(&overlay);
        if (!ok) {
            TingleNativeData_Close(data);
            return 1;
        }
    }
    printf("validated 647 overlays\n");
    TingleNativeData_Close(data);
    return 0;
}

int main(int argc, char **argv)
{
    if (argc == 4 && (strcmp(argv[1], "--rom") == 0 || strcmp(argv[1], "--data") == 0) &&
        strcmp(argv[3], "--all-overlays") == 0)
        return ProbeAllOverlays(argv[1], argv[2]);
    if (argc == 5 && (strcmp(argv[1], "--rom") == 0 || strcmp(argv[1], "--data") == 0) &&
        strcmp(argv[3], "--overlay") == 0)
        return ProbeOverlay(argv[1], argv[2], argv[4]);
    if (argc == 5 && (strcmp(argv[1], "--rom") == 0 || strcmp(argv[1], "--data") == 0))
        return ProbeArm9(argv[1], argv[2], argv[3], argv[4]);
    if (argc == 4 && (strcmp(argv[1], "--rom") == 0 || strcmp(argv[1], "--data") == 0))
        return ProbeProvider(argv[1], argv[2], argv[3]);
    if (!TestDirectory()) return 1;
    if (!TestRom()) return 2;
    if (!TestExtractedLayout()) return 3;
    return 0;
}
