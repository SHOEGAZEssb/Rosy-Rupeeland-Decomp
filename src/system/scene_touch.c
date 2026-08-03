#include "tingle/scene_touch.h"
#include "tingle/touch_panel.h"

/*
 * Per-frame touch dispatcher for the active scene. It converts the touch
 * manager's press/hold/release states into scene virtual callbacks and carries
 * coordinates in a small polymorphic point object used by those callbacks.
 */

typedef int (*SceneTouchPointCallback)(Scene *scene, TouchPoint *point);
typedef int (*SceneTouchTargetCallback)(Scene *scene, int targetIndex);

typedef struct SceneTouchDispatchVTable {
    void *destroy;
    void *destroyAndFree;
    void *update;
    void *method0C;
    void *method10;
    SceneTouchPointCallback onTouchDown;
    SceneTouchPointCallback onTouchUp;
    SceneTouchPointCallback onTouchHeld;
    SceneTouchTargetCallback onTouchTarget;
} SceneTouchDispatchVTable;

typedef struct SceneTouchUpdateFrame {
    TPData previousSample;
    TouchPoint heldPoint;
    TouchPoint releasedPoint;
    TouchPoint pressedPoint;
} SceneTouchUpdateFrame;

typedef char SceneTouchUpdateFrameSizeCheck[
    sizeof(SceneTouchUpdateFrame) == 0x2C ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern void *func_02006108(void *task);
extern void func_02006138(void *task);
extern int func_02004dfc(void *embedded, u32 x, u32 y);
extern void func_02004e84(void *embedded, u32 x, u32 y);
extern void Heap_Free(void *allocation);

extern void *gSceneState020F4DFC;
#ifdef __cplusplus
}
#endif

/* The scene-manager pointer follows the still-opaque state word at 0x020F4DFC. */
#define ACTIVE_SCENE_MANAGER                                                \
    (*(SceneManager **)((u8 *)&gSceneState020F4DFC + sizeof(void *)))

/* Initialize the task base, install the dispatcher vtable, and clear history. */
SceneTouchTask *SceneTouchTask_Init(SceneTouchTask *task)
{
    func_02006108(task);
    task->vtable = &gSceneTouchInitialData.taskVTable;
    task->previousTouchState = TOUCH_STATE_RELEASED;
    return task;
}

/* Destroy the dispatcher task base without freeing its allocation. */
SceneTouchTask *SceneTouchTask_Destroy(SceneTouchTask *task)
{
    func_02006138(task);
    return task;
}

/* Destroy and release a heap-owned dispatcher task. */
SceneTouchTask *SceneTouchTask_DestroyAndFree(SceneTouchTask *task)
{
    func_02006138(task);
    Heap_Free(task);
    return task;
}

/*
 * Dispatch one touch transition to the current scene. Updates can be disabled
 * with scene-manager flag 0x1. A new press first queries the scene's embedded
 * hit-region collection: no hit invokes vtable offset 0x14 with coordinates,
 * while a hit invokes offset 0x20 with the returned region index. Release and
 * held events invoke offsets 0x18 and 0x1C respectively.
 */
#ifndef MATCHING
int SceneTouchTask_Update(SceneTouchTask *task)
{
    SceneTouchUpdateFrame frame;
    TouchPanelManager *touch;
    Scene *scene;
    int state;
    int i;

    if ((ACTIVE_SCENE_MANAGER->flags & 1) == 0) {
        return 0;
    }

    touch = gTouchPanelManager;
    for (i = 0; i < 4; i++) {
        ((u16 *)&frame.previousSample)[i] =
            ((u16 *)&touch->previousSample)[i];
    }

    scene = SceneManager_GetCurrent(ACTIVE_SCENE_MANAGER);
    state = gTouchPanelManager->state;

    switch (state) {
    case TOUCH_STATE_PRESSED: {
        int target = func_02004dfc(scene->embedded10,
                                  touch->currentSample.x,
                                  touch->currentSample.y);
        if (target == -1) {
            TouchPoint_Init(&frame.pressedPoint,
                            touch->currentSample.x,
                            touch->currentSample.y);
            ((SceneTouchDispatchVTable *)scene->vtable)->onTouchDown(
                scene, &frame.pressedPoint);
        } else {
            ((SceneTouchDispatchVTable *)scene->vtable)->onTouchTarget(
                scene, target);
        }
        break;
    }

    case TOUCH_STATE_RELEASED:
        /* Suppress repeated release callbacks while the panel stays idle. */
        if ((u32)(task->previousTouchState - TOUCH_STATE_PRESSED) <= 1) {
            TouchPoint_Init(&frame.releasedPoint,
                            frame.previousSample.x,
                            frame.previousSample.y);
            scene = SceneManager_GetCurrent(ACTIVE_SCENE_MANAGER);
            ((SceneTouchDispatchVTable *)scene->vtable)->onTouchUp(
                scene, &frame.releasedPoint);
        }
        break;

    case TOUCH_STATE_HELD:
        TouchPoint_Init(&frame.heldPoint, touch->currentSample.x,
                        touch->currentSample.y);
        {
            Scene *current = SceneManager_GetCurrent(ACTIVE_SCENE_MANAGER);
            ((SceneTouchDispatchVTable *)current->vtable)->onTouchHeld(
                current, &frame.heldPoint);
        }
        func_02004e84(scene->embedded10, touch->currentSample.x,
                      touch->currentSample.y);
        break;
    }

    task->previousTouchState = state;
    return 0;
}
#else
/*
 * MWCC lowers the small history copy differently from the retail build and
 * consequently reallocates registers throughout the function. This body is
 * the matching form of the portable implementation above.
 */
asm int SceneTouchTask_Update(SceneTouchTask *task)
{
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    ldr r1, =gSceneState020F4DFC
    mov r7, r0
    ldr r0, [r1, #4]
    ldr r1, [r0, #0x84]
    tst r1, #1
    moveq r0, #0
    beq touch_update_return
    ldr r1, =gTouchPanelManager
    add r3, sp, #0
    ldr r5, [r1]
    mov r2, #4
    add r4, r5, #0x38
    ldrh r1, [r4], #2
    subs r2, r2, #1
    strh r1, [r3], #2
    DCD 0x1afffffb
    bl SceneManager_GetCurrent
    ldr r1, =gTouchPanelManager
    mov r4, r0
    ldr r0, [r1]
    ldr r6, [r0, #4]
    cmp r6, #0
    beq touch_released
    cmp r6, #1
    beq touch_pressed
    cmp r6, #2
    beq touch_held
    b touch_update_done
touch_pressed:
    ldrh r1, [r5, #0x40]
    ldrh r2, [r5, #0x42]
    add r0, r4, #0x10
    bl func_02004dfc
    mov r1, r0
    mvn r0, #0
    cmp r1, r0
    bne touch_target
    ldrh r1, [r5, #0x40]
    ldrh r2, [r5, #0x42]
    add r0, sp, #0x20
    bl TouchPoint_Init
    mov r0, r4
    ldr r2, [r0]
    add r1, sp, #0x20
    ldr r2, [r2, #0x14]
    blx r2
    b touch_update_done
touch_target:
    mov r0, r4
    ldr r2, [r0]
    ldr r2, [r2, #0x20]
    blx r2
    b touch_update_done
touch_released:
    ldr r0, [r7, #8]
    sub r0, r0, #1
    cmp r0, #1
    bhi touch_update_done
    ldrh r1, [sp]
    ldrh r2, [sp, #2]
    add r0, sp, #0x14
    bl TouchPoint_Init
    ldr r0, =gSceneState020F4DFC
    ldr r0, [r0, #4]
    bl SceneManager_GetCurrent
    ldr r2, [r0]
    add r1, sp, #0x14
    ldr r2, [r2, #0x18]
    blx r2
    b touch_update_done
touch_held:
    ldrh r1, [r5, #0x40]
    ldrh r2, [r5, #0x42]
    add r0, sp, #8
    bl TouchPoint_Init
    ldr r0, =gSceneState020F4DFC
    ldr r0, [r0, #4]
    bl SceneManager_GetCurrent
    ldr r2, [r0]
    add r1, sp, #8
    ldr r2, [r2, #0x1c]
    blx r2
    ldrh r1, [r5, #0x40]
    ldrh r2, [r5, #0x42]
    add r0, r4, #0x10
    bl func_02004e84
touch_update_done:
    str r6, [r7, #8]
    mov r0, #0
touch_update_return:
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
}
#endif

/* Initialize a point with its vtable and zero-extended touch coordinates. */
TouchPoint *TouchPoint_Init(TouchPoint *point, u32 x, u32 y)
{
    point->vtable = &gSceneTouchInitialData.pointVTable;
    point->x = x;
    point->y = y;
    return point;
}

/* The point object owns no resources, so destruction is a no-op. */
TouchPoint *TouchPoint_Destroy(TouchPoint *point)
{
    return point;
}

/* Release a heap-owned point object and return its former address. */
TouchPoint *TouchPoint_DestroyAndFree(TouchPoint *point)
{
    Heap_Free(point);
    return point;
}
