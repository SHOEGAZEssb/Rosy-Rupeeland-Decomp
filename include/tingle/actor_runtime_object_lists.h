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

ActorRuntimeObjectLists *ActorRuntimeObjectLists_Init(ActorRuntimeObjectLists *self);
ActorRuntimePayloadList *ActorRuntimePayloadList_Init(ActorRuntimePayloadList *self);
ActorRuntimePayloadList *ActorRuntimePayloadList_Destroy(ActorRuntimePayloadList *self);
void ActorRuntimePayloadList_Clear(ActorRuntimePayloadList *self);
ActorRuntimeObjectLists *ActorRuntimeObjectLists_Destroy(ActorRuntimeObjectLists *self);
ActorRuntimeObjectLists *ActorRuntimeObjectLists_DestroyAndFree(ActorRuntimeObjectLists *self);
void ActorRuntimeObjectLists_ClearFirst(ActorRuntimeObjectLists *self);
void ActorRuntimeObjectLists_ClearSecond(ActorRuntimeObjectLists *self);
void ActorRuntimeObjectLists_ClearThird(ActorRuntimeObjectLists *self);
void ActorRuntimeObjectLists_AddRecords(ActorRuntimeObjectLists *self, const u32 *triples,
                   u32 count, s16 category);
void ActorRuntimeObjectLists_AddRecord(ActorRuntimeObjectLists *self, u32 first, u32 second,
                   u32 third, s16 category);
ActorRuntimePayloadList *ActorRuntimePayloadList_DestroyAndFree(ActorRuntimePayloadList *self);

#ifdef __cplusplus
}
#endif

#endif
