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

ActorRuntimeCollection *ActorRuntimeCollection_Init(ActorRuntimeCollection *self);
ActorRuntimeOwnedList *ActorRuntimeOwnedList_Init(ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *ActorRuntimeOwnedList_Destroy(ActorRuntimeOwnedList *self);
ActorRuntimeCollection *ActorRuntimeCollection_Destroy(ActorRuntimeCollection *self);
void ActorRuntimeOwnedList_Clear(ActorRuntimeOwnedList *self);
void ActorRuntimeCollection_Reset(ActorRuntimeCollection *self);
void ActorRuntimeCollection_DetachActiveObject(ActorRuntimeCollection *self);
void *ActorRuntimeCollection_CopyPrimaryContainerState(ActorRuntimeCollection *self, const void *source);
void *ActorRuntimeCollection_GetPrimaryContainer(ActorRuntimeCollection *self);
void ActorRuntimeCollection_SelectObject(ActorRuntimeCollection *self, void *candidate);
void ActorRuntimeCollection_ReleaseSelectedObject(ActorRuntimeCollection *self);
void ActorRuntimeCollection_AttachObject(ActorRuntimeCollection *self, void *object);
u32 ActorRuntimeCollection_GetPendingAttachmentFlag(const ActorRuntimeCollection *self);
s32 ActorRuntimeCollection_TryCompleteAttachment(ActorRuntimeCollection *self, void *object);
void ActorRuntimeCollection_SetPendingValue(ActorRuntimeCollection *self, u32 value);
void ActorRuntimeCollection_QueuePendingValue(ActorRuntimeCollection *self);
void ActorRuntimeOwnedList_Append(ActorRuntimeOwnedList *list, void *value);
void ActorRuntimeCollection_QueueValue(ActorRuntimeCollection *self, void *value);
s32 ActorRuntimeCollection_DispatchQueuedValue(ActorRuntimeCollection *self);
s32 ActorRuntimeCollection_IsQueuedValueMissing(const ActorRuntimeCollection *self, const void *value);
u32 ActorRuntimeCollection_GetBusyState(const ActorRuntimeCollection *self);
ActorRuntimeOwnedList *func_0200bac4(ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *func_0200baec(ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *func_0200bb14(ActorRuntimeOwnedList *self);

#ifdef __cplusplus
}
#endif

#endif
