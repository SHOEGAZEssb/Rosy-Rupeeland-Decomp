/*
 * Native harness entry point.
 *
 * This owns the platform-neutral frame loop used while reconstructed scenes
 * are moved off the Nintendo DS runtime. It presents the first host rendering
 * of the recovered debug-menu behavior and consumes DS-compatible input.
 */
#include "tingle/native_debug_menu.h"
#include "tingle/native_platform.h"
#include "tingle/native_data.h"

#include <stdlib.h>
#include <string.h>

/* Runs until the platform requests shutdown; returns failure only on setup errors. */
int TingleNative_Run(int argc, char **argv)
{
    TingleNativePlatform *platform = TingleNativePlatform_Create();
    TingleNativeData *data = NULL;
    TingleNativeInput input = {0};
    void *probe = NULL;
    size_t probe_size = 0;
    u32 *pixels;
    TingleNativeCanvas canvas;
    TingleNativeDebugMenu menu;
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

    canvas.pixels = pixels;
    canvas.width = TINGLE_SCREEN_WIDTH;
    canvas.height = TINGLE_FRAMEBUFFER_HEIGHT;
    canvas.stride = TINGLE_SCREEN_WIDTH;
    TingleNativeDebugMenu_Init(&menu);

    while (TingleNativePlatform_Poll(platform, &input)) {
        (void)TingleNativeDebugMenu_Update(&menu, &input);
        TingleNativeDebugMenu_Draw(&menu, &canvas, data_ready);
        TingleNativePlatform_Present(platform, pixels);
        TingleNativePlatform_WaitFrame(platform);
    }

    free(pixels);
    TingleNativeData_Close(data);
    TingleNativePlatform_Destroy(platform);
    return EXIT_SUCCESS;
}
