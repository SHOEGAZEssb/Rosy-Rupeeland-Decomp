/* Verifies the recovered debug menu's portable input and activation rules. */
#include "tingle/native_debug_menu.h"

#include <stdio.h>
#include <stdlib.h>

static int ExpectSelection(TingleNativeDebugMenu *menu, u16 pressed, s32 expected)
{
    TingleNativeInput input = {0};

    input.pressed = pressed;
    (void)TingleNativeDebugMenu_Update(menu, &input);
    if (menu->selection == expected) return 1;
    (void)fprintf(stderr, "selection %d, expected %d\n", menu->selection, expected);
    return 0;
}

int main(void)
{
    TingleNativeDebugMenu menu;
    TingleNativeInput input = {0};
    TingleNativeCanvas canvas;
    u32 *pixels;

    TingleNativeDebugMenu_Init(&menu);
    if (menu.selection != 0 || menu.last_activation != TINGLE_NATIVE_DEBUG_MENU_NO_ACTIVATION)
        return EXIT_FAILURE;
    if (!ExpectSelection(&menu, TINGLE_KEY_UP, 11)) return EXIT_FAILURE;
    if (!ExpectSelection(&menu, TINGLE_KEY_DOWN, 0)) return EXIT_FAILURE;
    if (!ExpectSelection(&menu, TINGLE_KEY_RIGHT, 1)) return EXIT_FAILURE;
    if (!ExpectSelection(&menu, TINGLE_KEY_LEFT, 0)) return EXIT_FAILURE;

    menu.selection = 12;
    if (!ExpectSelection(&menu, TINGLE_KEY_RIGHT, 13)) return EXIT_FAILURE;
    if (!ExpectSelection(&menu, TINGLE_KEY_UP, 11)) return EXIT_FAILURE;
    menu.selection = 12;
    if (!ExpectSelection(&menu, TINGLE_KEY_DOWN, 1)) return EXIT_FAILURE;

    menu.selection = 0;
    input.pressed = TINGLE_KEY_DOWN | TINGLE_KEY_RIGHT | TINGLE_KEY_A;
    if (TingleNativeDebugMenu_Update(&menu, &input) != 2 || menu.last_activation != 2)
        return EXIT_FAILURE;
    input.pressed = 0;
    if (TingleNativeDebugMenu_Update(&menu, &input) !=
        TINGLE_NATIVE_DEBUG_MENU_NO_ACTIVATION) return EXIT_FAILURE;

    pixels = (u32 *)malloc(sizeof(*pixels) * TINGLE_SCREEN_WIDTH *
                           TINGLE_FRAMEBUFFER_HEIGHT);
    if (pixels == NULL) return EXIT_FAILURE;
    canvas.pixels = pixels;
    canvas.width = TINGLE_SCREEN_WIDTH;
    canvas.height = TINGLE_FRAMEBUFFER_HEIGHT;
    canvas.stride = TINGLE_SCREEN_WIDTH;
    TingleNativeDebugMenu_Draw(&menu, &canvas, 1);
    if (pixels[0] != 0x000c1420u ||
        pixels[TINGLE_SCREEN_HEIGHT * TINGLE_SCREEN_WIDTH] != 0x00141820u ||
        pixels[14 * TINGLE_SCREEN_WIDTH + 12] != 0x0078d878u) {
        free(pixels);
        return EXIT_FAILURE;
    }
    free(pixels);
    return EXIT_SUCCESS;
}
