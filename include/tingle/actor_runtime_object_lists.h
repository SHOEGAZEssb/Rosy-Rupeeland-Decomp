#ifndef TINGLE_ACTOR_RUNTIME_OBJECT_LISTS_H
#define TINGLE_ACTOR_RUNTIME_OBJECT_LISTS_H

#include "tingle/actor_runtime_collection.h"
#include "tingle/animation_resource.h"

typedef ActorRuntimeOwnedList ActorRuntimeAnimationResourceList;

typedef struct ActorRuntimeAnimationResourceRecord {
    void *resource0;
    void *resource1;
    void *resource2;
} ActorRuntimeAnimationResourceRecord;

typedef struct ActorRuntimeAnimationResourceLists {
    const void *vtable;
    ActorRuntimeAnimationResourceList category0;
    ActorRuntimeAnimationResourceList category1;
    ActorRuntimeAnimationResourceList otherCategory;
} ActorRuntimeAnimationResourceLists;

typedef char ActorRuntimeAnimationResourceListsSizeCheck[
    sizeof(ActorRuntimeAnimationResourceLists) == 0x34 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

ActorRuntimeAnimationResourceLists *ActorRuntimeAnimationResourceLists_Init(ActorRuntimeAnimationResourceLists *self);
ActorRuntimeAnimationResourceList *ActorRuntimeAnimationResourceList_Init(ActorRuntimeAnimationResourceList *self);
ActorRuntimeAnimationResourceList *ActorRuntimeAnimationResourceList_Destroy(ActorRuntimeAnimationResourceList *self);
void ActorRuntimeAnimationResourceList_Clear(ActorRuntimeAnimationResourceList *self);
ActorRuntimeAnimationResourceLists *ActorRuntimeAnimationResourceLists_Destroy(ActorRuntimeAnimationResourceLists *self);
ActorRuntimeAnimationResourceLists *ActorRuntimeAnimationResourceLists_DestroyAndFree(ActorRuntimeAnimationResourceLists *self);
void ActorRuntimeAnimationResourceLists_ClearCategory0(ActorRuntimeAnimationResourceLists *self);
void ActorRuntimeAnimationResourceLists_ClearCategory1(ActorRuntimeAnimationResourceLists *self);
void ActorRuntimeAnimationResourceLists_ClearOtherCategory(ActorRuntimeAnimationResourceLists *self);
void ActorRuntimeAnimationResourceLists_AppendRecords(
    ActorRuntimeAnimationResourceLists *self,
    const ActorRuntimeAnimationResourceRecord *records, u32 count,
    s16 category);
void ActorRuntimeAnimationResourceLists_AppendRecord(
    ActorRuntimeAnimationResourceLists *self, void *resource0,
    void *resource1, void *resource2, s16 category);
ActorRuntimeAnimationResourceList *ActorRuntimeAnimationResourceList_DestroyAndFree(ActorRuntimeAnimationResourceList *self);

extern const void *gActorRuntimeAnimationResourceListVTable[];
extern const void *gActorRuntimeAnimationResourceListsVTable[];

#ifdef __cplusplus
}
#endif

#endif
