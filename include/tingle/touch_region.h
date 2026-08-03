#ifndef TINGLE_TOUCH_REGION_H
#define TINGLE_TOUCH_REGION_H

#include "tingle/types.h"

typedef struct RectS16 {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} RectS16;

typedef struct TouchRegion TouchRegion;

typedef struct TouchRegionVTable {
    TouchRegion *(*destroy)(TouchRegion *region);
    TouchRegion *(*destroyAndFree)(TouchRegion *region);
    void (*tick)(TouchRegion *region);
    void (*beginPress)(TouchRegion *region);
    void (*endPress)(TouchRegion *region);
    void (*notify)(TouchRegion *region, s32 value);
} TouchRegionVTable;

struct TouchRegion {
    const TouchRegionVTable *vtable;
    s32 value;
    s32 pressState;
    u32 flags;
    s32 countdown;
    RectS16 bounds;
};

typedef struct TouchRegionArray {
    TouchRegion **items;
    s32 capacity;
} TouchRegionArray;

typedef struct TouchRegionManager {
    const void *vtable;
    TouchRegionArray regions;
    s32 count;
    u32 flags;
} TouchRegionManager;

typedef char RectS16SizeCheck[sizeof(RectS16) == 0x8 ? 1 : -1];
typedef char TouchRegionSizeCheck[sizeof(TouchRegion) == 0x1c ? 1 : -1];
typedef char TouchRegionManagerSizeCheck[sizeof(TouchRegionManager) == 0x14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void func_02004ac8(void);
TouchRegion *TouchRegion_Init(TouchRegion *region, s32 value,
                              const RectS16 *bounds, s32 enabled);
void RectS16_Copy(RectS16 *destination, const RectS16 *source);
TouchRegion *TouchRegion_Destroy(TouchRegion *region);
TouchRegion *TouchRegion_DestroyAndFree(TouchRegion *region);
void func_02004b54(void *object);
s32 TouchRegion_ContainsPoint(const TouchRegion *region, s32 x, s32 y);
void TouchRegion_BeginPress(TouchRegion *region);
void TouchRegion_EndPress(TouchRegion *region);
void TouchRegion_SetEnabled(TouchRegion *region, s32 enabled);
void TouchRegion_Tick(TouchRegion *region);
void TouchRegion_Notify(TouchRegion *region, s32 value);

TouchRegionManager *TouchRegionManager_Init(TouchRegionManager *manager);
TouchRegionArray *TouchRegionArray_Destroy(TouchRegionArray *array);
void TouchRegionArray_Reset(TouchRegionArray *array);
TouchRegionManager *TouchRegionManager_Destroy(TouchRegionManager *manager);
TouchRegionManager *TouchRegionManager_DestroyAndFree(TouchRegionManager *manager);
void TouchRegionManager_Allocate(TouchRegionManager *manager, s32 capacity);
void TouchRegionManager_Add(TouchRegionManager *manager, TouchRegion *region);
void TouchRegionManager_Clear(TouchRegionManager *manager);
s32 TouchRegionManager_BeginPressAt(TouchRegionManager *manager, s32 x, s32 y);
s32 TouchRegionManager_EndPressOutside(TouchRegionManager *manager, s32 x, s32 y);
void TouchRegionManager_Tick(TouchRegionManager *manager);
void TouchRegionManager_SetEnabled(TouchRegionManager *manager, s32 enabled);
void TouchRegionManager_NotifyAll(TouchRegionManager *manager, s32 value);

#ifdef __cplusplus
}
#endif

#endif
