#ifndef TINGLE_ACTOR_H
#define TINGLE_ACTOR_H

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

struct GraphicsSpriteState;

enum {
    ACTOR_FORCE_PRESENTATION_REFRESH_FLAG = 0x00001000
};

typedef struct Actor Actor;
/* The first two vtable entries perform the same teardown, but only the second
 * frees the actor allocation. Both return the actor's former address. */
typedef Actor *(*ActorDestructor)(Actor *self);
typedef void (*ActorStatePresentationCallback)(Actor *self);
typedef void (*ActorLandingCallback)(Actor *self);
typedef s32 (*ActorStatePredicate)(const Actor *self);

/* Verified base-actor virtual slots through the landing callback. Bytes for
 * unresolved intervening and trailing slots stay opaque so this contract does
 * not assign them speculative purposes. */
typedef struct ActorVTable {
    ActorDestructor destroyWithoutFree;
    ActorDestructor destroyAndFree;
    u8 opaqueSlots08[0x54];
    ActorStatePresentationCallback updatePresentationForState;
    u8 opaqueSlot60[4];
    ActorStatePredicate isPreviousState9Or10;
    ActorStatePredicate isCurrentState5Or6;
    u8 opaqueSlots6c[0x20];
    ActorLandingCallback handleLanding;
    u8 opaqueSlots90[0x30];
} ActorVTable;

/* Shared base actor state verified by collection ownership, motion, contact,
 * presentation users, the base initializer, and the default 0x1ec-byte
 * allocation. Derived actors extend this base. */
struct Actor {
    ActorVTable *vtable;
    u8 opaqueState04[0x0c];
    u32 flags;
    u32 motionFlags;
    VecFx32Object position;
    VecFx32Object previousPosition;
    VecFx32Object velocity;
    s8 collectionSlot;
    u8 contactEdges;
    u8 pairStateBytes[2];
    u8 activeContactCount;
    u8 type;
    u16 subtype;
    s16 groupId;
    u8 padding52[2];
    struct GraphicsSpriteState *primaryAttachment;
    struct GraphicsSpriteState *secondaryAttachment;
    u8 opaqueState5c[0x74];
    u32 runtimeFlags;
    u8 direction;
    u8 previousDirection;
    s16 state;
    s16 previousState;
    s16 substate;
    s16 previousSubstate;
    s16 presentationScaleZ;
    u8 opaqueStatee0[4];
    s16 runtimeId;
    u8 opaqueStatee6[2];
    u8 opaqueStatee8[0x104];
};

typedef char ActorVTableSizeCheck[sizeof(ActorVTable) == 0xc0 ? 1 : -1];
typedef char ActorSizeCheck[sizeof(Actor) == 0x1ec ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void Actor_HandleLanding(Actor *self);
void Actor_SynchronizeStatePresentation(Actor *self);
void Actor_UpdatePresentationForState(Actor *self);
s32 Actor_IsCurrentState5Or6(const Actor *self);
s32 Actor_IsPreviousState9Or10(const Actor *self);

void ActorModeNibble_UpdatePresentationForState(Actor *self);
void ActorTableRecord_UpdatePresentationForState(Actor *self);
void ActorRegisteredSubclass_HandleLanding(Actor *self);
void ActorRegisteredSubclass_UpdatePresentationForState(Actor *self);
void ActorExtendedType2_UpdatePresentationForState(Actor *self);
void ActorExtendedType2_HandleLanding(Actor *self);
s32 ActorExtendedType2_IsCurrentState5Or6(const Actor *self);
s32 ActorExtendedType2_IsPreviousState9Or10(const Actor *self);
void Type7Actor_UpdatePresentationForState(Actor *self);

#ifdef __cplusplus
}
#endif

#endif
