/*
 * Common scene touch-input pipeline. It samples the touch manager, maintains
 * packed one-frame event flags and counters, then invokes the scene update.
 */
#include "tingle/system.h"
#include "tingle/types.h"

typedef struct TouchPointValue {
    void *vtable;
    s32 x;
    s32 y;
} TouchPointValue;

typedef struct SceneInputFlags {
    s32 bit0 : 1;
    s32 active : 1;
    s32 rawMovement : 1;
    s32 hardwareTouch : 1;
    s32 touching : 1;
    s32 pressed : 1;
    s32 released : 1;
    s32 tapped : 1;
    s32 idleWindow : 1;
    s32 moved : 1;
    s32 bit10 : 1;
    s32 reserved : 21;
} SceneInputFlags;

typedef struct SceneInputBase SceneInputBase;

typedef struct SceneInputVTable {
    s32 (*update)(SceneInputBase *scene);
} SceneInputVTable;

struct SceneInputBase {
    SceneInputVTable *volatile vtable;
    u32 field04;
    u32 field08;
    s32 tapDurationLimit;
    s32 idleWindowStart;
    s32 idleWindowEnd;
    s32 touchFrames;
    s32 idleFrames;
    SceneInputFlags flags;
    u32 callbackFunction;
    s32 callbackAdjustment;
    void *padState;
    TouchPointValue previousPoint;
    TouchPointValue deltaPoint;
    s32 field48;
    s32 field4c;
    s32 padIndex;
};

typedef struct TouchPanelManagerPrefix {
    u8 reserved00[0x44];
    u16 touching;
} TouchPanelManagerPrefix;

extern TouchPanelManagerPrefix *gTouchPanelManager;
extern u8 data_021f5ed0[];
extern TouchPointValue *TouchPanelManager_GetPoint(
    TouchPointValue *point, TouchPanelManagerPrefix *manager);
extern void ActorQuery_CopyCoordinates(TouchPointValue *destination,
                                       const TouchPointValue *source);

/* Sample touch state, update one-frame events, and dispatch the scene update. */
s32 SceneInputBase_Update(SceneInputBase *scene, s32 active)
{
    TouchPointValue point;
    s32 touching;
    s32 difference;
    s32 movementX;
    s32 movementY;
    u32 flags;

    TouchPanelManager_GetPoint(&point, gTouchPanelManager);
    scene->deltaPoint.x = 0;
    scene->deltaPoint.y = 0;
    scene->flags.active = scene->flags.pressed = scene->flags.released =
        scene->flags.tapped = scene->flags.idleWindow = scene->flags.moved = 0;

    if (active != 0) {
        scene->flags.active = 1;
#ifdef _MSC_VER
        scene->padState = (u8 *)&gSystemState.pads[0].held +
                          scene->padIndex * sizeof(PadState);
#else
        scene->padState =
            (u8 *)&gPadStates + scene->padIndex * sizeof(PadState);
#endif
        touching = 0;
        if (gTouchPanelManager->touching == 1)
            touching = 1;
        if (touching != 0) {
            if (!scene->flags.hardwareTouch) {
                scene->flags.pressed = 1;
                if (scene->idleFrames >= scene->idleWindowStart &&
                    scene->idleFrames <= scene->idleWindowEnd)
                    scene->flags.idleWindow = 1;
                ActorQuery_CopyCoordinates(&scene->previousPoint, &point);
            } else {
                s32 deltaX = scene->previousPoint.x - point.x;
                s32 deltaY = scene->previousPoint.y - point.y;

                if (!scene->flags.rawMovement) {
                    difference = deltaX;
                    if (difference < 0)
                        difference = -difference;
                    if (difference <= 1)
                        point.x = scene->previousPoint.x;
                    difference = deltaY;
                    if (difference < 0)
                        difference = -difference;
                    if (difference <= 1)
                        point.y = scene->previousPoint.y;
                }
                movementX = point.x - scene->previousPoint.x;
                movementY = point.y - scene->previousPoint.y;

                scene->deltaPoint.x = movementX;
                scene->deltaPoint.y = movementY;
                if (scene->deltaPoint.x != 0 || scene->deltaPoint.y != 0)
                    scene->flags.moved = 1;
                ActorQuery_CopyCoordinates(&scene->previousPoint, &point);
            }
            scene->flags.touching = 1;
            scene->idleFrames = 0;
            ++scene->touchFrames;
            if (scene->touchFrames > 0x1000)
                scene->touchFrames = 0x1000;
        } else {
            if (scene->flags.hardwareTouch) {
                scene->flags.released = 1;
                if (scene->touchFrames <= scene->tapDurationLimit)
                    scene->flags.tapped = 1;
            }
            scene->flags.touching = 0;
            scene->touchFrames = 0;
            ++scene->idleFrames;
            if (scene->idleFrames > 0x1000)
                scene->idleFrames = 0x1000;
        }
    } else {
        scene->padState = data_021f5ed0;
        scene->flags.touching = 0;
        scene->previousPoint.x = 0;
        scene->previousPoint.y = 0;
    }

    touching = gTouchPanelManager->touching;
    if (touching == 1)
        touching = 1;
    else
        touching = 0;
    flags = *(u32 *)&scene->flags;
    if (touching != 0)
        flags |= 8;
    else
        flags &= ~8;
    *(u32 *)&scene->flags = flags;
    return (**(s32 (***)(SceneInputBase *))scene)(scene);
}
