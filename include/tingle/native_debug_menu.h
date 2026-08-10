#ifndef TINGLE_NATIVE_DEBUG_MENU_H
#define TINGLE_NATIVE_DEBUG_MENU_H

#include "tingle/native_platform.h"
#include "tingle/native_render.h"

enum {
    TINGLE_NATIVE_DEBUG_MENU_ENTRY_COUNT = 13,
    TINGLE_NATIVE_DEBUG_MENU_NO_ACTIVATION = -1
};

typedef struct TingleNativeDebugMenu {
    s32 selection;
    s32 last_activation;
} TingleNativeDebugMenu;

/* Initializes the portable model of the recovered retail debug menu. */
void TingleNativeDebugMenu_Init(TingleNativeDebugMenu *menu);

/* Applies one pressed-button snapshot and returns the selected activation. */
s32 TingleNativeDebugMenu_Update(TingleNativeDebugMenu *menu,
                                 const TingleNativeInput *input);

/* Draws the host menu and its currently unresolved scene-launch boundary. */
void TingleNativeDebugMenu_Draw(const TingleNativeDebugMenu *menu,
                                TingleNativeCanvas *canvas, s32 data_ready);

#endif
