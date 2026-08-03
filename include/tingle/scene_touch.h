#ifndef TINGLE_SCENE_TOUCH_H
#define TINGLE_SCENE_TOUCH_H

#include "tingle/scene.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct SceneTouchTask SceneTouchTask;
typedef struct TouchPoint TouchPoint;

typedef struct SceneTouchTaskVTable {
    SceneTouchTask *(*destroy)(SceneTouchTask *task);
    SceneTouchTask *(*destroyAndFree)(SceneTouchTask *task);
    int (*update)(SceneTouchTask *task);
} SceneTouchTaskVTable;

typedef struct TouchPointVTable {
    TouchPoint *(*destroy)(TouchPoint *point);
    TouchPoint *(*destroyAndFree)(TouchPoint *point);
    void *reserved08;
    void *typeInfo;
} TouchPointVTable;

struct SceneTouchTask {
    SceneTouchTaskVTable *vtable;
    u32 baseField04;
    s32 previousTouchState;
};

struct TouchPoint {
    TouchPointVTable *vtable;
    u32 x;
    u32 y;
};

typedef struct SceneTouchInitialData {
    TouchPointVTable pointVTable;
    SceneTouchTaskVTable taskVTable;
} SceneTouchInitialData;

typedef char SceneTouchTaskSizeCheck[
    sizeof(SceneTouchTask) == 0xC ? 1 : -1];
typedef char TouchPointSizeCheck[sizeof(TouchPoint) == 0xC ? 1 : -1];
typedef char SceneTouchInitialDataSizeCheck[
    sizeof(SceneTouchInitialData) == 0x1C ? 1 : -1];

extern SceneTouchInitialData gSceneTouchInitialData;

SceneTouchTask *SceneTouchTask_Init(SceneTouchTask *task);
SceneTouchTask *SceneTouchTask_Destroy(SceneTouchTask *task);
SceneTouchTask *SceneTouchTask_DestroyAndFree(SceneTouchTask *task);
int SceneTouchTask_Update(SceneTouchTask *task);

TouchPoint *TouchPoint_Init(TouchPoint *point, u32 x, u32 y);
TouchPoint *TouchPoint_Destroy(TouchPoint *point);
TouchPoint *TouchPoint_DestroyAndFree(TouchPoint *point);

#ifdef __cplusplus
}
#endif

#endif
