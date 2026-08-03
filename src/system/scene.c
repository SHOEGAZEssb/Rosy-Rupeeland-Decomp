#include "tingle/scene.h"
#include "tingle/frame_task.h"

/*
 * Core scene lifetime and stack management. Scenes register themselves with
 * the global 32-entry stack, which covers the previous scene on push, reveals
 * the next scene on pop, and dispatches the active scene once per frame.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *TouchRegionManager_Init(void *embedded);
extern void TouchRegionManager_Destroy(void *embedded);
extern void *SceneTouchTask_Init(void *task);

/* These SDK routines directly clear and set the ARM IRQ-disable CPSR bit. */
extern u32 func_020b4f40(void);
extern u32 func_020b4f54(void);

/* Disable IRQs and enter the SDK's non-returning processor wait loop. */
extern void OS_Halt(void);

extern void *gHeapContext;
extern SceneManager *gSceneManager;

#ifdef __cplusplus
}
#endif

/*
 * Keep the vtable and tag together: standalone objects are liable to be
 * reordered by MWCC, while the retail image stores "TASK" after the vtable.
 */
SceneInitialData gSceneInitialData = {
    {
        Scene_Destructor,
        Scene_DeletingDestructor,
        0,
        Scene_NoopMethod0C,
        Scene_NoopMethod10,
        Scene_NoopMethod14,
        Scene_NoopMethod18,
        Scene_NoopMethod1C,
        Scene_NoopMethod20,
        Scene_OnRevealed,
        Scene_OnCovered,
    },
    "TASK",
};

/* Cleared when a manager is reset; its remaining consumers are still opaque. */
void *gSceneState020F4DFC;

/* The manager pointer occupies the next word after this still-unknown state. */
#define ACTIVE_SCENE_MANAGER                                                \
    (*(SceneManager **)((u8 *)&gSceneState020F4DFC + sizeof(void *)))

/*
 * Initialize the base fields and embedded object, then atomically push the new
 * scene. The repeated bit-1 clear preserves the retail constructor sequence.
 */
Scene *Scene_Init(Scene *scene)
{
    scene->vtable = &gSceneInitialData.vtable;
    scene->value04 = 0;
    scene->value08 = 0;
    scene->flags.raw = 0;
    TouchRegionManager_Init(scene->embedded10);

    func_020b4f54();
    scene->flags.bits.bit1 = 0;
    scene->flags.bits.bit0 = 0;
    scene->flags.bits.bit1 = 0;
    SceneManager_Push(ACTIVE_SCENE_MANAGER, scene);
    func_020b4f40();
    return scene;
}

/*
 * Remove this scene from the global stack under IRQ exclusion and destroy its
 * embedded object. Destroying a scene other than the active one is fatal.
 */
Scene *Scene_Destructor(Scene *scene)
{
    scene->vtable = &gSceneInitialData.vtable;
    func_020b4f54();
    if (SceneManager_GetCurrent(ACTIVE_SCENE_MANAGER) != scene) {
        OS_Halt();
    }
    SceneManager_Pop(ACTIVE_SCENE_MANAGER);
    func_020b4f40();
    TouchRegionManager_Destroy(scene->embedded10);
    return scene;
}

/* Destroy an active heap-owned scene and release its allocation. */
Scene *Scene_DeletingDestructor(Scene *scene)
{
    scene->vtable = &gSceneInitialData.vtable;
    func_020b4f54();
    if (SceneManager_GetCurrent(ACTIVE_SCENE_MANAGER) != scene) {
        OS_Halt();
    }
    SceneManager_Pop(ACTIVE_SCENE_MANAGER);
    func_020b4f40();
    TouchRegionManager_Destroy(scene->embedded10);
    Heap_Free(scene);
    return scene;
}

/* Base-destructor entry used explicitly by reconstructed derived scenes. */
Scene *Scene_Destroy(Scene *scene)
{
    scene->vtable = &gSceneInitialData.vtable;
    func_020b4f54();
    if (SceneManager_GetCurrent(ACTIVE_SCENE_MANAGER) != scene) {
        OS_Halt();
    }
    SceneManager_Pop(ACTIVE_SCENE_MANAGER);
    func_020b4f40();
    TouchRegionManager_Destroy(scene->embedded10);
    return scene;
}

/* Default virtual hook at vtable offset 0x0C; it has no observable effect. */
int Scene_NoopMethod0C(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default virtual hook at vtable offset 0x10; it has no observable effect. */
int Scene_NoopMethod10(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default virtual hook at vtable offset 0x14; it has no observable effect. */
int Scene_NoopMethod14(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default virtual hook at vtable offset 0x18; it has no observable effect. */
int Scene_NoopMethod18(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default virtual hook at vtable offset 0x1C; it has no observable effect. */
int Scene_NoopMethod1C(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default hook called when a pop exposes this scene again. */
int Scene_OnRevealed(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default virtual hook at vtable offset 0x20; it has no observable effect. */
int Scene_NoopMethod20(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Default hook called before another scene is pushed over this scene. */
int Scene_OnCovered(Scene *scene)
{
    (void)scene;
    return 0;
}

/* Set the two low scene flags; no other fields or hardware state are changed. */
void Scene_SetFlags03(Scene *scene)
{
    scene->flags.raw |= 3;
}

/* Clear the two low scene flags while preserving all other flag bits. */
void Scene_ClearFlags03(Scene *scene)
{
    scene->flags.raw &= ~2;
    scene->flags.raw &= ~1;
}

/* Return one only when both low scene flags are set. */
int Scene_HasFlags03(Scene *scene)
{
    return (scene->flags.raw & 1) != 0 &&
           (scene->flags.raw & 2) != 0;
}

/* Clear scene flag 0x2 while leaving every other flag unchanged. */
void Scene_ClearFlag02(Scene *scene)
{
    scene->flags.raw &= ~2;
}

/* Return the embedded object beginning at scene offset 0x10. */
void *Scene_GetEmbedded10(Scene *scene)
{
    return scene->embedded10;
}

/*
 * Reset the stack and create its 12-byte TASK-tagged per-frame dispatcher.
 * The opaque task APIs retain address-derived names pending further evidence.
 */
SceneManager *SceneManager_Init(SceneManager *manager)
{
    void *task;

    SceneManager_Reset(manager);
    task = Heap_Alloc(0xC, gSceneInitialData.taskTag, 4, &gHeapContext);
    if (task != 0) {
        task = SceneTouchTask_Init(task);
    }
    task = FrameTaskList_Add((FrameTask *)task, 1);
    manager->updateTask = task;
    return manager;
}

/* Empty all 32 stack slots, clear adjacent global state, and enable updates. */
void SceneManager_Reset(SceneManager *manager)
{
    int i;

    manager->count = 0;
    for (i = 0; i < SCENE_STACK_CAPACITY; i++) {
        manager->stack[i] = 0;
    }
    gSceneState020F4DFC = 0;
    manager->flags = 1;
}

/*
 * Push a non-null scene if capacity remains. The previous active scene's
 * vtable offset-0x28 hook runs before the new scene becomes current.
 */
#ifndef MATCHING
void SceneManager_Push(SceneManager *manager, Scene *scene)
{
    SceneManager *self = manager;
    Scene *newScene = scene;
    int previousIndex;

    if (newScene == 0 || self->count >= SCENE_STACK_CAPACITY) {
        return;
    }

    previousIndex = self->count - 1;
    if (previousIndex >= 0) {
        Scene *previous = *(&self->stack[self->count] - 1);
        previous->vtable->onCovered(previous);
    }

    self->stack[self->count] = newScene;
    self->count++;
}
#else
/*
 * MWCC assigns the two preserved parameter registers in the opposite order
 * for the portable expression above. Keep this matching body synchronized
 * with that documented implementation.
 */
asm void SceneManager_Push(SceneManager *manager, Scene *scene)
{
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r1
    mov r4, r0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x80]
    cmp r1, #0x20
    ldmgeia sp!, {r3, r4, r5, pc}
    subs r0, r1, #1
    bmi push_scene
    add r0, r4, r1, lsl #2
    ldr r0, [r0, #-4]
    ldr r1, [r0]
    ldr r1, [r1, #0x28]
    blx r1
push_scene:
    ldr r0, [r4, #0x80]
    str r5, [r4, r0, lsl #2]
    ldr r0, [r4, #0x80]
    add r0, r0, #1
    str r0, [r4, #0x80]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif

/*
 * Remove and return the active scene. If another scene remains, save the
 * removed scene's offset-4 value and invoke the revealed scene's 0x24 hook.
 */
Scene *SceneManager_Pop(SceneManager *manager)
{
    int newCount = manager->count - 1;
    Scene *removed;

    if (newCount < 0) {
        return 0;
    }

    removed = manager->stack[newCount];
    manager->stack[newCount] = 0;
    manager->count = newCount;

    if (newCount > 0) {
        Scene *revealed;
        manager->poppedSceneValue04 = removed->value04;
        revealed = *(&manager->stack[manager->count] - 1);
        revealed->vtable->onRevealed(revealed);
    }
    return removed;
}

/* Return the active scene, or null when the stack is empty. */
Scene *SceneManager_GetCurrent(SceneManager *manager)
{
    if (manager->count <= 0) {
        return 0;
    }
    return *(&manager->stack[manager->count] - 1);
}

/* Return one when the scene stack contains no active scene. */
int SceneManager_IsEmpty(SceneManager *manager)
{
    return manager->count <= 0;
}

/* Toggle manager flag 0x1 without disturbing the unknown remaining bits. */
void SceneManager_SetUpdateEnabled(SceneManager *manager, int enabled)
{
    if (enabled != 0) {
        manager->flags |= 1;
    } else {
        manager->flags &= ~1;
    }
}

/* Dispatch vtable method 0x08 on the current scene and return its result. */
int SceneManager_UpdateCurrent(SceneManager *manager)
{
    Scene *scene = SceneManager_GetCurrent(manager);
    return scene->vtable->update(scene);
}
