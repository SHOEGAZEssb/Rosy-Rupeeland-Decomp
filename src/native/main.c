/*
 * Native harness entry point.
 *
 * This owns the platform-neutral frame loop used while reconstructed scenes
 * are moved off the Nintendo DS runtime. It currently presents a diagnostic
 * dual-screen image and consumes DS-compatible input snapshots.
 */
#include "tingle/native_platform.h"
#include "tingle/native_data.h"

#include <stdlib.h>
#include <string.h>

static void FillDiagnosticFrame(u32 *pixels, u32 frame, const TingleNativeInput *input,
                                int data_ready)
{
    s32 x;
    s32 y;

    for (y = 0; y < TINGLE_FRAMEBUFFER_HEIGHT; ++y) {
        u32 base = y < TINGLE_SCREEN_HEIGHT ? 0x00182838u : 0x00381828u;
        for (x = 0; x < TINGLE_SCREEN_WIDTH; ++x) {
            u32 pulse = (u32)((x + y + (s32)frame) & 0x1f);
            pixels[y * TINGLE_SCREEN_WIDTH + x] = base + (pulse << 8);
        }
    }

    if (input->held != 0) {
        for (y = 8; y < 24; ++y) {
            for (x = 8; x < 24; ++x) {
                pixels[y * TINGLE_SCREEN_WIDTH + x] = 0x00ffffffu;
            }
        }
    }

    for (y = 8; y < 24; ++y) {
        for (x = TINGLE_SCREEN_WIDTH - 24; x < TINGLE_SCREEN_WIDTH - 8; ++x) {
            pixels[y * TINGLE_SCREEN_WIDTH + x] = data_ready ? 0x0000ff00u : 0x00ff2020u;
        }
    }
}

/* Runs until the platform requests shutdown; returns failure only on setup errors. */
int TingleNative_Run(int argc, char **argv)
{
    TingleNativePlatform *platform = TingleNativePlatform_Create();
    TingleNativeData *data = NULL;
    TingleNativeInput input = {0};
    void *probe = NULL;
    size_t probe_size = 0;
    u32 *pixels;
    u32 frame = 0;
    int data_ready = 0;
    int i;

    if (platform == NULL) {
        return EXIT_FAILURE;
    }

    for (i = 1; i < argc; ++i) {
        if (data != NULL) {
            TingleNativeData_Close(data);
            TingleNativePlatform_Destroy(platform);
            return EXIT_FAILURE;
        }
        if (i + 1 < argc && strcmp(argv[i], "--data") == 0) {
            data = TingleNativeData_OpenDirectory(argv[++i]);
        } else if (i + 1 < argc && strcmp(argv[i], "--rom") == 0) {
            data = TingleNativeData_OpenRom(argv[++i]);
        } else {
            TingleNativePlatform_Destroy(platform);
            return EXIT_FAILURE;
        }
        if (data == NULL) {
            TingleNativePlatform_Destroy(platform);
            return EXIT_FAILURE;
        }
    }
    if (data != NULL) {
        data_ready = TingleNativeData_ReadFile(data, "db/lang.bin", &probe, &probe_size) &&
                     probe_size != 0;
        free(probe);
    }

    pixels = (u32 *)malloc(sizeof(*pixels) * TINGLE_SCREEN_WIDTH * TINGLE_FRAMEBUFFER_HEIGHT);
    if (pixels == NULL) {
        TingleNativeData_Close(data);
        TingleNativePlatform_Destroy(platform);
        return EXIT_FAILURE;
    }

    while (TingleNativePlatform_Poll(platform, &input)) {
        FillDiagnosticFrame(pixels, frame++, &input, data_ready);
        TingleNativePlatform_Present(platform, pixels);
        TingleNativePlatform_WaitFrame(platform);
    }

    free(pixels);
    TingleNativeData_Close(data);
    TingleNativePlatform_Destroy(platform);
    return EXIT_SUCCESS;
}
