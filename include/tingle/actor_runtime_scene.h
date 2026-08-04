#ifndef TINGLE_ACTOR_RUNTIME_SCENE_H
#define TINGLE_ACTOR_RUNTIME_SCENE_H

#include "tingle/types.h"
#include "tingle/scene.h"
#include "tingle/scene_touch.h"

typedef struct ActorRuntimeScene {
    Scene base;
    void *object;
} ActorRuntimeScene;

typedef char ActorRuntimeSceneSizeCheck[
    sizeof(ActorRuntimeScene) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

u32 *func_0200b2c0(void *object, u32 first, u32 second, u32 third);
ActorRuntimeScene *func_0200b2d0(ActorRuntimeScene *self, void *object);
ActorRuntimeScene *func_0200b41c(ActorRuntimeScene *self);
ActorRuntimeScene *func_0200b56c(ActorRuntimeScene *self);
s32 func_0200b6c4(ActorRuntimeScene *self);
s32 func_0200b7b4(ActorRuntimeScene *self);
s32 func_0200b7e0(ActorRuntimeScene *self);
s32 func_0200b804(ActorRuntimeScene *self, const TouchPoint *point);
TouchPoint *func_0200b83c(TouchPoint *result, const TouchPoint *source);
s32 func_0200b85c(ActorRuntimeScene *self, const TouchPoint *point);
s32 func_0200b894(ActorRuntimeScene *self, const TouchPoint *point);
void func_0200b8cc(ActorRuntimeScene *self);
void func_0200ba00(ActorRuntimeScene *self);

#ifdef __cplusplus
}
#endif

#endif
