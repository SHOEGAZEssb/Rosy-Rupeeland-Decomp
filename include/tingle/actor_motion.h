#ifndef TINGLE_ACTOR_MOTION_H
#define TINGLE_ACTOR_MOTION_H

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

typedef struct ActorMotionTriple {
    s32 x;
    s32 y;
    s32 z;
} ActorMotionTriple;

typedef struct ActorMotionState {
    ActorMotionTriple first;
    ActorMotionTriple second;
    s32 field_18;
    s32 field_1c;
} ActorMotionState;

typedef struct ActorMotion {
    const void *vtable;
    void *actor;
    VecFx32Object position;
    s32 mode;
    s32 field_1c;
    s32 field_20;
    s32 field_24;
    s32 field_28;
    s32 field_2c;
    s32 field_30;
    VecFx32Object target;
    ActorMotionState state;
} ActorMotion;

typedef char ActorMotionStateSizeCheck[
    sizeof(ActorMotionState) == 0x20 ? 1 : -1];
typedef char ActorMotionSizeCheck[sizeof(ActorMotion) == 0x64 ? 1 : -1];

typedef struct ActorMotionJitter {
    ActorMotion base;
    s16 remainingFrames;
    s16 radius;
} ActorMotionJitter;

typedef char ActorMotionJitterSizeCheck[
    sizeof(ActorMotionJitter) == 0x68 ? 1 : -1];

typedef struct ActorMotionAreaFollower {
    ActorMotionJitter jitter;
    void *areaContext;
    VecFx32Object offset;
    s32 transitionActive;
    s32 transitionTimer;
    s32 previousArea;
} ActorMotionAreaFollower;

typedef char ActorMotionAreaFollowerSizeCheck[
    sizeof(ActorMotionAreaFollower) == 0x88 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

ActorMotion *ActorMotion_Init(ActorMotion *self);
ActorMotionState *ActorMotionState_Init(ActorMotionState *self);
ActorMotionTriple *ActorMotionTriple_Clear(ActorMotionTriple *self);
ActorMotion *ActorMotion_Destroy(ActorMotion *self);
ActorMotion *ActorMotion_DestroyAndFree(ActorMotion *self);
ActorMotion *ActorMotion_DestroyBase(ActorMotion *self);
void ActorMotion_Reset(ActorMotion *self);
void ActorMotionState_Reset(ActorMotionState *self);
ActorMotionTriple *ActorMotionTriple_Assign(ActorMotionTriple *self,
                                 const ActorMotionTriple *source);
void ActorMotion_BindActor(ActorMotion *self, void *actor);
void *ActorMotion_GetActor(const ActorMotion *self);
VecFx32Object *ActorMotion_SetPosition(ActorMotion *self,
                             const VecFx32Object *position);
void ActorMotion_SetMode2(ActorMotion *self);
void ActorMotion_SetMode1AndClearOutputs(ActorMotion *self);
s32 ActorMotion_ConfigureGridTarget(ActorMotion *self, s32 xIndex, s32 yIndex,
                  s32 divisor, s32 useDirectionTable);
u32 VecFx32_GetDirectionAngle(const VecFx32Object *from, const VecFx32Object *to);
s32 ActorMotion_ConfigureBoundActorTarget(ActorMotion *self, s32 divisor,
                  s32 useDirectionTable);
void ActorMotion_GetBoundActorTargetPosition(VecFx32Object *result, const ActorMotion *self);
void ActorMotion_SetOscillation(ActorMotion *self, s32 xAmplitude, s32 yAmplitude,
                   s32 duration);
ActorMotionTriple *ActorMotionOscillation_InitInterval(ActorMotionTriple *result, s32 first,
                                 s32 second, s32 duration);
void ActorMotion_ClearOscillation(ActorMotion *self);
void ActorMotion_UpdateOscillation(ActorMotion *self);
s32 ActorMotionOscillation_Sample(const ActorMotionTriple *state, s32 time, s32 tableMode);
VecFx32Object *ActorMotion_SetTarget(ActorMotion *self,
                             const VecFx32Object *target);
ActorMotionJitter *ActorMotionJitter_Init(ActorMotionJitter *self);
ActorMotionJitter *ActorMotionJitter_Destroy(ActorMotionJitter *self);
ActorMotionJitter *ActorMotionJitter_DestroyAndFree(ActorMotionJitter *self);
void ActorMotionJitter_Update(ActorMotionJitter *self, const s16 *bounds);
void ActorMotionJitter_EnsureMinimum(ActorMotionJitter *self, s32 minimumFrames,
                   s32 minimumRadius);
ActorMotion *ActorMotionGameWork_Init(ActorMotion *self);
ActorMotion *ActorMotionGameWork_Destroy(ActorMotion *self);
ActorMotion *ActorMotionGameWork_DestroyAndFree(ActorMotion *self);
s32 ActorMotionGameWork_Update(ActorMotion *self, const s16 *bounds);
s32 ActorMotion_UpdateFromBoundActor(ActorMotion *self);
VecFx32Object *ActorMotion_GetPosition(ActorMotion *self);
ActorMotionAreaFollower *ActorMotionAreaFollower_Init(ActorMotionAreaFollower *self,
                                       void *areaContext);
ActorMotionAreaFollower *ActorMotionAreaFollower_Destroy(ActorMotionAreaFollower *self);
VecFx32Object *ActorMotionAreaFollower_GetPosition(ActorMotionAreaFollower *self);
s32 ActorMotionAreaFollower_Update(ActorMotionAreaFollower *self, const s16 *bounds);
void ActorMotionAreaFollower_BindActor(ActorMotion *self, void *actor);
s32 ActorMotionAreaFollower_QueryCrossingDirection(ActorMotionAreaFollower *self, void *actor, s32 area);
void ActorMotionAreaFollower_ClampToAreaBounds(ActorMotionAreaFollower *self, s32 area,
                   const s16 *fallbackBounds);
void S16Rectangle_Translate(s16 *rectangle, s32 x, s32 y);
void ActorMotionAreaFollower_RefreshCurrentArea(ActorMotionAreaFollower *self);
void ActorMotionAreaFollower_Reset(ActorMotionAreaFollower *self);
void func_0200a3b8(void *actor, void *collisionContext);
s32 func_0200a63c(void *collisionContext, s32 x, s32 y, s32 z,
                  s32 actorHeight);

typedef struct ActorCollisionRange {
    s32 minX;
    s32 minY;
    s32 maxX;
    s32 maxY;
} ActorCollisionRange;

void func_0200a6ac(ActorCollisionRange *result, void *collisionContext,
                   const ActorCollisionRange *input, s32 direction,
                   s32 z, s32 actorHeight);
s32 func_0200a970(void *actor, s32 deltaX, s32 deltaY,
                  const ActorCollisionRange *other);
s32 ActorBounds_GetWidth(const s8 *bounds);
s32 ActorBounds_GetHeight(const s8 *bounds);
void func_0200ab48(void *actor, s32 deltaX, s32 deltaY, u8 edgeFlags,
                   const ActorCollisionRange *intersection);
void func_0200ac14(void *actor, void *collisionContext);

#ifdef __cplusplus
}
#endif

#endif
