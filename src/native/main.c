/*
 * Native harness entry point.
 *
 * This owns the platform-neutral frame loop used while reconstructed scenes
 * are moved off the Nintendo DS runtime. It currently presents a diagnostic
 * dual-screen image and consumes DS-compatible input snapshots.
 */
#include "tingle/native_platform.h"

#include <stdlib.h>

static void FillDiagnosticFrame(u32 *pixels, u32 frame, const TingleNativeInput *input)
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
}

/* Runs until the platform requests shutdown; returns failure only on setup errors. */
int TingleNative_Run(void)
{
    TingleNativePlatform *platform = TingleNativePlatform_Create();
    TingleNativeInput input = {0};
    u32 *pixels;
    u32 frame = 0;

    if (platform == NULL) {
        return EXIT_FAILURE;
    }

    pixels = (u32 *)malloc(sizeof(*pixels) * TINGLE_SCREEN_WIDTH * TINGLE_FRAMEBUFFER_HEIGHT);
    if (pixels == NULL) {
        TingleNativePlatform_Destroy(platform);
        return EXIT_FAILURE;
    }

    while (TingleNativePlatform_Poll(platform, &input)) {
        FillDiagnosticFrame(pixels, frame++, &input);
        TingleNativePlatform_Present(platform, pixels);
        TingleNativePlatform_WaitFrame(platform);
    }

    free(pixels);
    TingleNativePlatform_Destroy(platform);
    return EXIT_SUCCESS;
}
