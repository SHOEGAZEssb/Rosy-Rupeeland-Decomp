#ifndef TINGLE_ACTOR_RUNTIME_SCENE_H
#define TINGLE_ACTOR_RUNTIME_SCENE_H

#include "tingle/types.h"
#include "tingle/scene.h"
#include "tingle/scene_touch.h"
#include "tingle/vec_fx32.h"

typedef struct ActorRuntimeScene {
    Scene base;
    void *attachedObject;
} ActorRuntimeScene;

typedef char ActorRuntimeSceneSizeCheck[
    sizeof(ActorRuntimeScene) == 0x28 ? 1 : -1];

extern SceneVTable gActorRuntimeSceneVTable;

#ifdef __cplusplus
extern "C" {
#endif

VecFx32Value *VecFx32Object_SetComponents(VecFx32Object *object, fx32 x,
                                         fx32 y, fx32 z);
ActorRuntimeScene *ActorRuntimeScene_Init(ActorRuntimeScene *self, void *object);
ActorRuntimeScene *ActorRuntimeScene_Destroy(ActorRuntimeScene *self);
ActorRuntimeScene *ActorRuntimeScene_DestroyAndFree(ActorRuntimeScene *self);
s32 ActorRuntimeScene_Update(ActorRuntimeScene *self);
s32 ActorRuntimeScene_Begin(ActorRuntimeScene *self);
s32 ActorRuntimeScene_Leave(ActorRuntimeScene *self);
s32 ActorRuntimeScene_TouchBegin(ActorRuntimeScene *self, const TouchPoint *point);
TouchPoint *TouchPoint_InitCopy(TouchPoint *result, const TouchPoint *source);
s32 ActorRuntimeScene_TouchMove(ActorRuntimeScene *self, const TouchPoint *point);
s32 ActorRuntimeScene_TouchEnd(ActorRuntimeScene *self, const TouchPoint *point);
void ActorRuntimeScene_DeactivateNonType1Actors(ActorRuntimeScene *self);
void ActorRuntimeScene_ActivateFlaggedNonType1Actors(ActorRuntimeScene *self);

#ifdef __cplusplus
}
#endif

#endif
