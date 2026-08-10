/*
 * Native recompilation process shell.
 *
 * This owns only host process, data-source, frame-presentation, timing, and
 * input boundaries. It deliberately does not reproduce game scenes. Recovered
 * game startup will enter this loop once its SDK and ABI dependencies can be
 * linked against native replacements.
 */
#include "tingle/native_data.h"
#include "tingle/native_platform.h"

#include <stdlib.h>
#include <string.h>

/* Validates that the selected provider exposes the retail NitroFS data root. */
static s32 DataSourceReady(TingleNativeData *data)
{
    void *probe = NULL;
    size_t probe_size = 0;
    s32 ready = data != NULL &&
        TingleNativeData_ReadFile(data, "db/lang.bin", &probe, &probe_size) &&
        probe_size != 0;

    free(probe);
    return ready;
}

/* Parses the current ROM/data options without assigning game behavior to them. */
static TingleNativeData *OpenDataSource(int argc, char **argv)
{
    TingleNativeData *data = NULL;
    int index;

    for (index = 1; index < argc; ++index) {
        if (data != NULL || index + 1 >= argc) goto fail;
        if (strcmp(argv[index], "--data") == 0)
            data = TingleNativeData_OpenDirectory(argv[++index]);
        else if (strcmp(argv[index], "--rom") == 0)
            data = TingleNativeData_OpenRom(argv[++index]);
        else
            goto fail;
        if (data == NULL) goto fail;
    }
    if (data == NULL) data = TingleNativeData_OpenDirectory("build/source-rom");
    if (!DataSourceReady(data)) goto fail;
    return data;
fail:
    TingleNativeData_Close(data);
    return NULL;
}

/* Runs the platform shell until recovered game startup is linked into it. */
int TingleNative_Run(int argc, char **argv)
{
    TingleNativeData *data = OpenDataSource(argc, argv);
    TingleNativePlatform *platform;
    TingleNativeHostInput input = {0};
    u32 *pixels;

    if (data == NULL) return EXIT_FAILURE;
    platform = TingleNativePlatform_Create();
    if (platform == NULL) {
        TingleNativeData_Close(data);
        return EXIT_FAILURE;
    }
    pixels = (u32 *)calloc(TINGLE_SCREEN_WIDTH * TINGLE_FRAMEBUFFER_HEIGHT,
                           sizeof(*pixels));
    if (pixels == NULL) {
        TingleNativePlatform_Destroy(platform);
        TingleNativeData_Close(data);
        return EXIT_FAILURE;
    }

    while (TingleNativePlatform_Poll(platform, &input)) {
        /* Recompiled game frame execution will replace this empty boundary. */
        TingleNativePlatform_Present(platform, pixels);
        TingleNativePlatform_WaitFrame(platform);
    }

    free(pixels);
    TingleNativePlatform_Destroy(platform);
    TingleNativeData_Close(data);
    return EXIT_SUCCESS;
}
