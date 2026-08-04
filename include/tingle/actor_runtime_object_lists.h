#ifndef TINGLE_ACTOR_RUNTIME_OBJECT_LISTS_H
#define TINGLE_ACTOR_RUNTIME_OBJECT_LISTS_H

#include "tingle/actor_runtime_collection.h"

typedef ActorRuntimeOwnedList ActorRuntimePayloadList;

typedef struct ActorRuntimeObjectLists {
    const void *vtable;
    ActorRuntimePayloadList first;
    ActorRuntimePayloadList second;
    ActorRuntimePayloadList third;
} ActorRuntimeObjectLists;

typedef char ActorRuntimeObjectListsSizeCheck[
    sizeof(ActorRuntimeObjectLists) == 0x34 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

ActorRuntimeObjectLists *func_0200bb34(ActorRuntimeObjectLists *self);
ActorRuntimePayloadList *func_0200bb68(ActorRuntimePayloadList *self);
ActorRuntimePayloadList *func_0200bb88(ActorRuntimePayloadList *self);
void func_0200bba8(ActorRuntimePayloadList *self);
ActorRuntimeObjectLists *func_0200bbe8(ActorRuntimeObjectLists *self);
ActorRuntimeObjectLists *func_0200bc4c(ActorRuntimeObjectLists *self);
void func_0200bcb8(ActorRuntimeObjectLists *self);
void func_0200bd10(ActorRuntimeObjectLists *self);
void func_0200bd6c(ActorRuntimeObjectLists *self);
void func_0200bdc4(ActorRuntimeObjectLists *self, const u32 *triples,
                   u32 count, s16 category);
void func_0200be14(ActorRuntimeObjectLists *self, u32 first, u32 second,
                   u32 third, s16 category);
ActorRuntimePayloadList *func_0200bedc(ActorRuntimePayloadList *self);

#ifdef __cplusplus
}
#endif

#endif
