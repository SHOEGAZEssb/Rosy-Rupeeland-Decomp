/*
 * Native harness entry point.
 *
 * This owns the platform-neutral frame loop used while reconstructed scenes
 * are moved off the Nintendo DS runtime. It presents the first host rendering
 * of the recovered debug-menu behavior and consumes DS-compatible input.
 */
#include "tingle/native_debug_menu.h"
#include "tingle/native_game_phase.h"
#include "tingle/native_game_work.h"
#include "tingle/native_phase_selector.h"
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
    TingleNativePhaseSelector phase_selector;
    TingleNativeGamePhaseBoundary game_phase = {0};
    TingleNativeGameWork game_work;
    enum { NATIVE_SCENE_DEBUG_MENU, NATIVE_SCENE_PHASE_SELECTOR,
           NATIVE_SCENE_GAME_PHASE } scene =
        NATIVE_SCENE_DEBUG_MENU;
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
    TingleNativePhaseSelector_Init(&phase_selector);
    TingleNativeGameWork_Init(&game_work);

    while (TingleNativePlatform_Poll(platform, &input)) {
        if (scene == NATIVE_SCENE_DEBUG_MENU) {
            s32 activation = TingleNativeDebugMenu_Update(&menu, &input);

            if (activation == 0) {
                /* The recovered phase-selector constructor resets GameWork. */
                TingleNativeGameWork_Reset(&game_work);
                TingleNativePhaseSelector_Init(&phase_selector);
                scene = NATIVE_SCENE_PHASE_SELECTOR;
            }
        } else if (scene == NATIVE_SCENE_PHASE_SELECTOR) {
            TingleNativePhaseSelectorEvent event =
                TingleNativePhaseSelector_Update(&phase_selector, &input);

            if (event == TINGLE_NATIVE_PHASE_EVENT_BACK) {
                TingleNativeDebugMenu_Init(&menu);
                scene = NATIVE_SCENE_DEBUG_MENU;
            } else if (event == TINGLE_NATIVE_PHASE_EVENT_START_PHASE) {
                (void)TingleNativeGamePhaseBoundary_Start(
                    &game_phase, data, &game_work,
                    phase_selector.selected_phase + 1);
                scene = NATIVE_SCENE_GAME_PHASE;
            }
        } else if (TingleNativeGamePhaseBoundary_Update(&game_phase, &input)) {
            TingleNativeGamePhaseBoundary_Destroy(&game_phase);
            TingleNativePhaseSelector_Init(&phase_selector);
            scene = NATIVE_SCENE_PHASE_SELECTOR;
        }

        if (scene == NATIVE_SCENE_DEBUG_MENU)
            TingleNativeDebugMenu_Draw(&menu, &canvas, data_ready);
        else if (scene == NATIVE_SCENE_PHASE_SELECTOR)
            TingleNativePhaseSelector_Draw(&phase_selector, &canvas);
        else
            TingleNativeGamePhaseBoundary_Draw(&game_phase, &canvas);
        TingleNativePlatform_Present(platform, pixels);
        TingleNativePlatform_WaitFrame(platform);
    }

    free(pixels);
    TingleNativeGamePhaseBoundary_Destroy(&game_phase);
    TingleNativeData_Close(data);
    TingleNativePlatform_Destroy(platform);
    return EXIT_SUCCESS;
}
