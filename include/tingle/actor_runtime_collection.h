#ifndef TINGLE_ACTOR_RUNTIME_COLLECTION_H
#define TINGLE_ACTOR_RUNTIME_COLLECTION_H

#include "tingle/types.h"

typedef struct ActorRuntimeOwnedNode {
    struct ActorRuntimeOwnedNode *next;
    struct ActorRuntimeOwnedNode *previous;
    void *value;
} ActorRuntimeOwnedNode;

typedef struct ActorRuntimeOwnedList {
    const void *vtable;
    ActorRuntimeOwnedNode *head;
    ActorRuntimeOwnedNode *tail;
    u32 count;
} ActorRuntimeOwnedList;

typedef struct ActorRuntimeCollection {
    u32 flags;
    u32 field_04;
    u8 firstContainer[0x98];
    u8 secondContainer[0x94];
    u32 field_134;
    ActorRuntimeOwnedList ownedList;
} ActorRuntimeCollection;

#ifdef __cplusplus
extern "C" {
#endif

ActorRuntimeCollection *func_0200ad90(ActorRuntimeCollection *self);
ActorRuntimeOwnedList *func_0200adc8(ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *func_0200adf0(ActorRuntimeOwnedList *self);
ActorRuntimeCollection *func_0200ae10(ActorRuntimeCollection *self);
void func_0200ae4c(ActorRuntimeOwnedList *self);
void func_0200ae8c(ActorRuntimeCollection *self);
void func_0200aea8(ActorRuntimeCollection *self);
void *func_0200aef4(ActorRuntimeCollection *self, const void *source);
void *func_0200af04(ActorRuntimeCollection *self);
void func_0200af0c(ActorRuntimeCollection *self, void *candidate);
void func_0200af8c(ActorRuntimeCollection *self);
void func_0200afd0(ActorRuntimeCollection *self, void *object);
u32 func_0200b04c(const ActorRuntimeCollection *self);
s32 func_0200b058(ActorRuntimeCollection *self, void *object);
void func_0200b0d0(ActorRuntimeCollection *self, u32 value);
void func_0200b0d8(ActorRuntimeCollection *self);
void func_0200b100(ActorRuntimeOwnedList *list, void *value);
void func_0200b164(ActorRuntimeCollection *self, void *value);
s32 func_0200b180(ActorRuntimeCollection *self);
s32 func_0200b23c(const ActorRuntimeCollection *self, const void *value);
u32 func_0200b294(const ActorRuntimeCollection *self);
ActorRuntimeOwnedList *func_0200bac4(ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *func_0200baec(ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *func_0200bb14(ActorRuntimeOwnedList *self);

#ifdef __cplusplus
}
#endif

#endif
