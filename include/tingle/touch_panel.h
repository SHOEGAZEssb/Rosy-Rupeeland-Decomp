#ifndef TINGLE_TOUCH_PANEL_H
#define TINGLE_TOUCH_PANEL_H

#include "tingle/scene_touch.h"

enum {
    TOUCH_STATE_RELEASED = 0,
    TOUCH_STATE_PRESSED = 1,
    TOUCH_STATE_HELD = 2,
};

typedef struct TPData {
    u16 x;
    u16 y;
    u16 touch;
    u16 validity;
} TPData;

typedef struct TPCalibrateParam {
    s16 x0;
    s16 y0;
    s16 xDotSize;
    s16 yDotSize;
} TPCalibrateParam;

typedef struct TouchPanelManager TouchPanelManager;

typedef struct TouchPanelManagerVTable {
    TouchPanelManager *(*destroy)(TouchPanelManager *manager);
    TouchPanelManager *(*destroyAndFree)(TouchPanelManager *manager);
} TouchPanelManagerVTable;

struct TouchPanelManager {
    TouchPanelManagerVTable *vtable;
    s32 state;
    TPCalibrateParam calibration;
    TPData autoSamples[5];
    TPData previousSample;
    TPData currentSample;
    s32 unknown48;
    s32 counter4C;
    s32 autoSamplingEnabled;
};

typedef char TPDataSizeCheck[sizeof(TPData) == 8 ? 1 : -1];
typedef char TouchPanelManagerSizeCheck[
    sizeof(TouchPanelManager) == 0x54 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern TouchPanelManagerVTable gTouchPanelManagerVTable;
extern TouchPanelManager *gTouchPanelManager;

TouchPanelManager *TouchPanelManager_Init(TouchPanelManager *manager);
TouchPanelManager *TouchPanelManager_Destroy(TouchPanelManager *manager);
TouchPanelManager *TouchPanelManager_DestroyAndFree(
    TouchPanelManager *manager);
void TouchPanelManager_Update(TouchPanelManager *manager);
TouchPoint *TouchPanelManager_GetPoint(TouchPoint *point,
                                      TouchPanelManager *manager);
void TouchPanelManager_SetAutoSampling(TouchPanelManager *manager,
                                       int enabled);

#ifdef __cplusplus
}
#endif

#endif
