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

#ifdef __cplusplus
extern "C" {
#endif

ActorMotion *func_02008f90(ActorMotion *self);
ActorMotionState *func_0200901c(ActorMotionState *self);
ActorMotionTriple *func_02009044(ActorMotionTriple *self);
ActorMotion *func_02009058(ActorMotion *self);
ActorMotion *func_02009078(ActorMotion *self);
ActorMotion *func_020090a0(ActorMotion *self);
void func_020090c0(ActorMotion *self);
void func_02009154(ActorMotionState *self);
ActorMotionTriple *func_0200919c(ActorMotionTriple *self,
                                 const ActorMotionTriple *source);
void func_020091c0(ActorMotion *self, void *actor);
void *func_020091d0(const ActorMotion *self);
VecFx32Object *func_020091d8(ActorMotion *self,
                             const VecFx32Object *position);
void func_020091e8(ActorMotion *self);
void func_020091f4(ActorMotion *self);
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

#ifdef __cplusplus
}
#endif

#endif
