/* Verifies the native phase selector against its recovered input contract. */
#include "tingle/native_phase_selector.h"

#include <stdlib.h>

int main(void)
{
    TingleNativePhaseSelector selector;
    TingleNativeInput input = {0};
    TingleNativeCanvas canvas;
    u32 *pixels;
    s32 frame;

    TingleNativePhaseSelector_Init(&selector);
    input.repeated = TINGLE_KEY_LEFT;
    (void)TingleNativePhaseSelector_Update(&selector, &input);
    if (selector.column != 9) return EXIT_FAILURE;
    input.repeated = TINGLE_KEY_UP;
    (void)TingleNativePhaseSelector_Update(&selector, &input);
    if (selector.row != 8) return EXIT_FAILURE;

    input.repeated = 0;
    input.pressed = TINGLE_KEY_R;
    (void)TingleNativePhaseSelector_Update(&selector, &input);
    (void)TingleNativePhaseSelector_Update(&selector, &input);
    (void)TingleNativePhaseSelector_Update(&selector, &input);
    if (selector.page != 0) return EXIT_FAILURE;

    selector.page = 2;
    selector.column = 9;
    selector.row = 8;
    input.pressed = TINGLE_KEY_A;
    if (TingleNativePhaseSelector_Update(&selector, &input) !=
            TINGLE_NATIVE_PHASE_EVENT_NONE ||
        selector.selected_phase != 269 || selector.state != 1)
        return EXIT_FAILURE;
    input.pressed = 0;
    for (frame = 1; frame < 16; ++frame) {
        if (TingleNativePhaseSelector_Update(&selector, &input) !=
            TINGLE_NATIVE_PHASE_EVENT_NONE) return EXIT_FAILURE;
    }
    if (TingleNativePhaseSelector_Update(&selector, &input) !=
        TINGLE_NATIVE_PHASE_EVENT_START_PHASE) return EXIT_FAILURE;

    TingleNativePhaseSelector_Init(&selector);
    input.touching = 1;
    input.touch_x = 248;
    input.touch_y = 185;
    if (TingleNativePhaseSelector_Update(&selector, &input) !=
            TINGLE_NATIVE_PHASE_EVENT_NONE ||
        selector.column != 9 || selector.row != 8 || selector.selected_phase != 89 ||
        selector.state != 1) return EXIT_FAILURE;

    TingleNativePhaseSelector_Init(&selector);
    input.touching = 0;
    input.pressed = TINGLE_KEY_SELECT;
    if (TingleNativePhaseSelector_Update(&selector, &input) !=
        TINGLE_NATIVE_PHASE_EVENT_DEBUG_OBJECT) return EXIT_FAILURE;
    input.pressed = TINGLE_KEY_B;
    if (TingleNativePhaseSelector_Update(&selector, &input) !=
        TINGLE_NATIVE_PHASE_EVENT_BACK) return EXIT_FAILURE;

    pixels = (u32 *)malloc(sizeof(*pixels) * TINGLE_SCREEN_WIDTH *
                           TINGLE_FRAMEBUFFER_HEIGHT);
    if (pixels == NULL) return EXIT_FAILURE;
    canvas.pixels = pixels;
    canvas.width = TINGLE_SCREEN_WIDTH;
    canvas.height = TINGLE_FRAMEBUFFER_HEIGHT;
    canvas.stride = TINGLE_SCREEN_WIDTH;
    TingleNativePhaseSelector_Draw(&selector, &canvas);
    if (pixels[0] != 0x000b1118u ||
        pixels[TINGLE_SCREEN_HEIGHT * TINGLE_SCREEN_WIDTH] != 0x00141b20u ||
        pixels[14 * TINGLE_SCREEN_WIDTH + 12] != 0x0078d878u) {
        free(pixels);
        return EXIT_FAILURE;
    }
    free(pixels);
    return EXIT_SUCCESS;
}
