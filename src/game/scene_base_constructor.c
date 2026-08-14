/*
 * Constructor for the common scene input base. It initializes two touch
 * points, default callback state, timing thresholds, and packed input flags.
 */
#include "tingle/types.h"

typedef struct TouchPointValue {
    void *vtable;
    s32 x;
    s32 y;
} TouchPointValue;

typedef struct MemberFunctionPointer {
    u32 function;
    s32 adjustment;
} MemberFunctionPointer;

typedef struct SceneInputFlags {
    s32 bit0 : 1;
    s32 bit1 : 1;
    s32 bit2 : 1;
    s32 bit3 : 1;
    s32 bit4 : 1;
    s32 bit5 : 1;
    s32 bit6 : 1;
    s32 bit7 : 1;
    s32 bit8 : 1;
    s32 bit9 : 1;
    s32 bit10 : 1;
    s32 reserved : 21;
} SceneInputFlags;

typedef struct SceneInputBase {
    void *vtable;
    u32 field04;
    u32 field08;
    s32 tapDurationLimit;
    s32 idleWindowStart;
    s32 idleWindowEnd;
    s32 touchFrames;
    s32 idleFrames;
    SceneInputFlags flags;
    MemberFunctionPointer callback;
    void *padState;
    TouchPointValue previousPoint;
    TouchPointValue currentPoint;
    s32 deltaX;
    s32 deltaY;
    s32 padIndex;
} SceneInputBase;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_020f2590[];
extern u8 data_021f5ed0[];
extern const MemberFunctionPointer data_020f2564;
extern void TouchPoint_InitZero(TouchPointValue *point);
extern void func_0206841c(SceneInputBase *scene,
                         MemberFunctionPointer callback);
#ifdef __cplusplus
}
#endif

/* Construct the common input base in caller-owned scene storage. */
#ifdef __cplusplus
extern "C"
#endif
void *func_02091e28(SceneInputBase *scene)
{
    scene->vtable = data_020f2590;
    TouchPoint_InitZero(&scene->previousPoint);
    TouchPoint_InitZero(&scene->currentPoint);
    scene->padIndex = 1;
    scene->padState = data_021f5ed0;
    func_0206841c(scene, data_020f2564);
    scene->deltaX = 0;
    scene->deltaY = 0;
    scene->flags.bit0 = scene->flags.bit1 = scene->flags.bit2 =
        scene->flags.bit4 = scene->flags.bit5 = scene->flags.bit6 =
            scene->flags.bit7 = scene->flags.bit8 = scene->flags.bit9 =
                scene->flags.bit10 = 0;
    scene->tapDurationLimit = 6;
    scene->idleWindowStart = 6;
    scene->idleWindowEnd = 12;
    scene->idleFrames = 0;
    scene->touchFrames = 0;
    return scene;
}
