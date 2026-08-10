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
s32 func_0200920c(ActorMotion *self, s32 xIndex, s32 yIndex,
                  s32 divisor, s32 useDirectionTable);
u32 func_020093ac(const VecFx32Object *from, const VecFx32Object *to);
s32 func_020093cc(ActorMotion *self, s32 divisor,
                  s32 useDirectionTable);
void func_02009514(VecFx32Object *result, const ActorMotion *self);
void func_020095cc(ActorMotion *self, s32 xAmplitude, s32 yAmplitude,
                   s32 duration);
ActorMotionTriple *func_0200964c(ActorMotionTriple *result, s32 first,
                                 s32 second, s32 duration);
void func_02009694(ActorMotion *self);
void func_020096b0(ActorMotion *self);
s32 func_020096f0(const ActorMotionTriple *state, s32 time, s32 tableMode);
VecFx32Object *func_02009780(ActorMotion *self,
                             const VecFx32Object *target);
ActorMotionJitter *func_02009790(ActorMotionJitter *self);
ActorMotionJitter *func_020097bc(ActorMotionJitter *self);
ActorMotionJitter *func_020097d0(ActorMotionJitter *self);
void func_020097ec(ActorMotionJitter *self, const s16 *bounds);
void func_020099c0(ActorMotionJitter *self, s32 minimumFrames,
                   s32 minimumRadius);
ActorMotion *func_020099dc(ActorMotion *self);
ActorMotion *func_020099fc(ActorMotion *self);
ActorMotion *func_02009a10(ActorMotion *self);
s32 func_02009a2c(ActorMotion *self, const s16 *bounds);
s32 func_02009c20(ActorMotion *self);
VecFx32Object *func_02009d0c(ActorMotion *self);
ActorMotionAreaFollower *func_02009d14(ActorMotionAreaFollower *self,
                                       void *areaContext);
ActorMotionAreaFollower *func_02009d58(ActorMotionAreaFollower *self);
VecFx32Object *func_02009d78(ActorMotionAreaFollower *self);
s32 func_02009d80(ActorMotionAreaFollower *self, const s16 *bounds);
void func_0200a114(ActorMotion *self, void *actor);
s32 func_0200a124(ActorMotionAreaFollower *self, void *actor, s32 area);
void func_0200a1a0(ActorMotionAreaFollower *self, s32 area,
                   const s16 *fallbackBounds);
void func_0200a2dc(s16 *rectangle, s32 x, s32 y);
void func_0200a310(ActorMotionAreaFollower *self);
void func_0200a35c(ActorMotionAreaFollower *self);
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
