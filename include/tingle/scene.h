#ifndef TINGLE_SCENE_H
#define TINGLE_SCENE_H

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

#define SCENE_STACK_CAPACITY 32

typedef struct Scene Scene;
typedef struct SceneManager SceneManager;

typedef struct SceneVTable {
    Scene *(*destroy)(Scene *scene);
    Scene *(*destroyAndFree)(Scene *scene);
    int (*update)(Scene *scene);
    int (*method0C)(Scene *scene);
    int (*method10)(Scene *scene);
    int (*method14)(Scene *scene);
    int (*method18)(Scene *scene);
    int (*method1C)(Scene *scene);
    int (*method20)(Scene *scene);
    int (*onRevealed)(Scene *scene);
    int (*onCovered)(Scene *scene);
} SceneVTable;

typedef union SceneFlags {
    u32 raw;
    struct {
        u32 bit0 : 1;
        u32 bit1 : 1;
        u32 remaining : 30;
    } bits;
} SceneFlags;

struct Scene {
    SceneVTable *vtable;
    u32 value04;
    u32 value08;
    SceneFlags flags;
    u8 embedded10[0x14];
};

struct SceneManager {
    Scene *stack[SCENE_STACK_CAPACITY];
    s32 count;
    u32 flags;
    u32 poppedSceneValue04;
    void *updateTask;
};

typedef struct SceneInitialData {
    SceneVTable vtable;
    char taskTag[8];
} SceneInitialData;

typedef char SceneSizeCheck[sizeof(Scene) == 0x24 ? 1 : -1];
typedef char SceneVTableSizeCheck[sizeof(SceneVTable) == 0x2C ? 1 : -1];
typedef char SceneFlagsSizeCheck[sizeof(SceneFlags) == 4 ? 1 : -1];
typedef char SceneManagerSizeCheck[sizeof(SceneManager) == 0x90 ? 1 : -1];
typedef char SceneInitialDataSizeCheck[
    sizeof(SceneInitialData) == 0x34 ? 1 : -1];

extern SceneInitialData gSceneInitialData;
extern void *gSceneState020F4DFC;
extern SceneManager *gSceneManager;

Scene *Scene_Init(Scene *scene);
Scene *Scene_Destructor(Scene *scene);
Scene *Scene_DeletingDestructor(Scene *scene);
Scene *Scene_Destroy(Scene *scene);

int Scene_NoopMethod0C(Scene *scene);
int Scene_NoopMethod10(Scene *scene);
int Scene_NoopMethod14(Scene *scene);
int Scene_NoopMethod18(Scene *scene);
int Scene_NoopMethod1C(Scene *scene);
int Scene_NoopMethod20(Scene *scene);
int Scene_OnRevealed(Scene *scene);
int Scene_OnCovered(Scene *scene);

void Scene_SetFlags03(Scene *scene);
void Scene_ClearFlags03(Scene *scene);
int Scene_HasFlags03(Scene *scene);
void Scene_ClearFlag02(Scene *scene);
void *Scene_GetEmbedded10(Scene *scene);

SceneManager *SceneManager_Init(SceneManager *manager);
void SceneManager_Reset(SceneManager *manager);
void SceneManager_Push(SceneManager *manager, Scene *scene);
Scene *SceneManager_Pop(SceneManager *manager);
Scene *SceneManager_GetCurrent(SceneManager *manager);
int SceneManager_IsEmpty(SceneManager *manager);
void SceneManager_SetUpdateEnabled(SceneManager *manager, int enabled);
int SceneManager_UpdateCurrent(SceneManager *manager);

#ifdef __cplusplus
}
#endif

#endif
