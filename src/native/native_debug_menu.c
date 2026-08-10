/*
 * Native presentation model for the recovered hidden debug menu.
 *
 * Directional navigation and A-button activation retain the retail update
 * order. Rendering is host-owned, while scene construction remains an explicit
 * boundary until the selected retail constructors have native dependencies.
 */
#include "tingle/native_debug_menu.h"

#include <stdio.h>

void TingleNativeDebugMenu_Init(TingleNativeDebugMenu *menu)
{
    menu->selection = 0;
    menu->last_activation = TINGLE_NATIVE_DEBUG_MENU_NO_ACTIVATION;
}

s32 TingleNativeDebugMenu_Update(TingleNativeDebugMenu *menu,
                                 const TingleNativeInput *input)
{
    u16 pressed = input->pressed;

    /* This priority and wrap behavior is identical to DebugMenu_Update. */
    if ((pressed & TINGLE_KEY_UP) != 0) {
        menu->selection -= 2;
        if (menu->selection < 0) menu->selection += TINGLE_NATIVE_DEBUG_MENU_ENTRY_COUNT;
    } else if ((pressed & TINGLE_KEY_DOWN) != 0) {
        menu->selection += 2;
        if (menu->selection >= TINGLE_NATIVE_DEBUG_MENU_ENTRY_COUNT)
            menu->selection -= TINGLE_NATIVE_DEBUG_MENU_ENTRY_COUNT;
    } else if ((pressed & (TINGLE_KEY_RIGHT | TINGLE_KEY_LEFT)) != 0) {
        if ((menu->selection & 1) != 0) menu->selection--;
        else menu->selection++;
    }

    if ((pressed & TINGLE_KEY_A) == 0) return TINGLE_NATIVE_DEBUG_MENU_NO_ACTIVATION;
    menu->last_activation = menu->selection;
    return menu->selection;
}

static void DrawEntry(const TingleNativeDebugMenu *menu, TingleNativeCanvas *canvas,
                      s32 entry, s32 x, s32 y)
{
    char label[20];
    u32 foreground = entry == menu->selection ? 0x00102028u : 0x00d8e0d0u;

    if (entry == menu->selection)
        TingleNativeCanvas_FillRect(canvas, x - 3, y - 2, 91, 11, 0x0078d878u);
    if (entry < TINGLE_NATIVE_DEBUG_MENU_ENTRY_COUNT)
        (void)snprintf(label, sizeof(label), "SCENE %02d", entry);
    else
        (void)snprintf(label, sizeof(label), "UNUSED %02d", entry);
    TingleNativeCanvas_DrawText(canvas, x, y, label, foreground, 1);
}

void TingleNativeDebugMenu_Draw(const TingleNativeDebugMenu *menu,
                                TingleNativeCanvas *canvas, s32 data_ready)
{
    s32 entry;
    char activation[32];

    TingleNativeCanvas_FillRect(canvas, 0, 0, canvas->width, canvas->height, 0x000c1420u);
    TingleNativeCanvas_FillRect(canvas, 0, TINGLE_SCREEN_HEIGHT, canvas->width,
                               TINGLE_SCREEN_HEIGHT, 0x00141820u);

    TingleNativeCanvas_DrawText(canvas, 12, 14, "TINGLE NATIVE", 0x0078d878u, 2);
    TingleNativeCanvas_DrawText(canvas, 12, 42, "EARLY DEBUG SCENE", 0x00e0e8e0u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 58,
        data_ready ? "GAME DATA: READY" : "GAME DATA: NOT LOADED",
        data_ready ? 0x0078d878u : 0x00e07070u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 78, "ARROWS: MOVE", 0x00a0b0b8u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 90, "Z: ACTIVATE", 0x00a0b0b8u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 118,
                               "SCENE CONSTRUCTORS: PENDING", 0x00e0b060u, 1);

    TingleNativeCanvas_DrawText(canvas, 12, 204, "DEBUG MENU", 0x0078d878u, 1);
    for (entry = 0; entry < 14; ++entry) {
        DrawEntry(menu, canvas, entry, 12 + (entry & 1) * 126,
                  224 + (entry / 2) * 14);
    }

    if (menu->last_activation != TINGLE_NATIVE_DEBUG_MENU_NO_ACTIVATION) {
        (void)snprintf(activation, sizeof(activation), "ACTIVATED %02d - HOST BARRIER",
                       menu->last_activation);
        TingleNativeCanvas_DrawText(canvas, 12, 332, activation, 0x00e0b060u, 1);
    }
    TingleNativeCanvas_DrawText(canvas, 12, 354, "SDK:3-2-30000", 0x00889098u, 1);
    TingleNativeCanvas_DrawText(canvas, 12, 366, "DATE: 2006/06/07 06:50:17",
                               0x00889098u, 1);
}
