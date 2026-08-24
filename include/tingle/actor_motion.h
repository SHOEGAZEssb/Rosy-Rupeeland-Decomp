#ifndef TINGLE_ACTOR_MOTION_H
#define TINGLE_ACTOR_MOTION_H

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

typedef struct GamePhaseRegionTable GamePhaseRegionTable;
typedef struct RectS16 RectS16;

typedef struct ActorMotionTriple {
    s32 halfRange;
    s32 midpoint;
    s32 phaseIncrement;
} ActorMotionTriple;

typedef struct ActorMotionState {
    ActorMotionTriple xOscillation;
    ActorMotionTriple yOscillation;
    s32 sampledOffsetX;
    s32 sampledOffsetY;
} ActorMotionState;

enum ActorMotionFlags {
    ACTOR_MOTION_FLAG_MOVING = 1 << 0,
    ACTOR_MOTION_FLAG_OSCILLATION = 1 << 1,
    ACTOR_MOTION_FLAG_ALTERNATE_TARGET_Y = 1 << 3
};

typedef struct ActorMotion {
    const void *vtable;
    void *actor;
    VecFx32Object position;
    s32 mode;
    s32 velocityX;
    s32 velocityY;
    s32 destinationX;
    s32 destinationY;
    s32 remainingSteps;
    u32 flags;
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
    GamePhaseRegionTable *areaContext;
    VecFx32Object smoothedPosition;
    s32 smoothingActive;
    s32 smoothingWeight;
    s32 currentAreaIndex;
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
void RectS16_Translate(RectS16 *rectangle, s32 x, s32 y);
void ActorMotionAreaFollower_RefreshCurrentArea(ActorMotionAreaFollower *self);
void ActorMotionAreaFollower_Reset(ActorMotionAreaFollower *self);
void ActorCollision_ResolveCornerContacts(void *actor, void *collisionContext);
s32 ActorCollision_TestPoint(void *collisionContext, s32 x, s32 y, s32 z,
                  s32 actorHeight);

typedef struct ActorCollisionRange {
    s32 minX;
    s32 minY;
    s32 maxX;
    s32 maxY;
} ActorCollisionRange;

typedef struct ActorCollisionBoundsS8 {
    s8 left;
    s8 top;
    s8 right;
    s8 bottom;
} ActorCollisionBoundsS8;

ActorCollisionBoundsS8 *Actor_GetCollisionBounds(void *actor);

enum ActorCollisionDirection {
    ACTOR_COLLISION_DIRECTION_LEFT = 1 << 0,
    ACTOR_COLLISION_DIRECTION_RIGHT = 1 << 1,
    ACTOR_COLLISION_DIRECTION_UP = 1 << 2,
    ACTOR_COLLISION_DIRECTION_DOWN = 1 << 3
};

void ActorCollision_ScanDirectionalRange(ActorCollisionRange *result, void *collisionContext,
                   const ActorCollisionRange *input, s32 direction,
                   s32 z, s32 actorHeight);
s32 ActorCollision_ResolveRangeOverlap(void *actor, s32 deltaX, s32 deltaY,
                  const ActorCollisionRange *other);
s32 ActorBounds_GetWidth(const ActorCollisionBoundsS8 *bounds);
s32 ActorBounds_GetHeight(const ActorCollisionBoundsS8 *bounds);
void ActorCollision_ApplyOverlapResponse(void *actor, s32 deltaX, s32 deltaY, u8 edgeFlags,
                   const ActorCollisionRange *intersection);
void ActorCollision_ResolveSweptMovement(void *actor, void *collisionContext);

#ifdef __cplusplus
}
#endif

#endif
