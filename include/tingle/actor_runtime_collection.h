#ifndef TINGLE_ACTOR_RUNTIME_COLLECTION_H
#define TINGLE_ACTOR_RUNTIME_COLLECTION_H

#include "tingle/game_phase_script_vm.h"
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

typedef struct ActorRuntimePrimaryScriptState {
    GamePhaseActorScriptVm scriptVm;
    void *selectedObject;
} ActorRuntimePrimaryScriptState;

enum ActorRuntimeCollectionFlags {
    ACTOR_RUNTIME_COLLECTION_HAS_ATTACHED_OBJECT = 1 << 0,
    ACTOR_RUNTIME_COLLECTION_HAS_SELECTED_OBJECT = 1 << 1,
    ACTOR_RUNTIME_COLLECTION_RELEASE_DISPATCHED = 1 << 2,
    ACTOR_RUNTIME_COLLECTION_ATTACHMENT_PENDING = 1 << 3
};

typedef struct ActorRuntimeCollection {
    u32 flags;
    void *attachedObject;
    ActorRuntimePrimaryScriptState primaryScriptState;
    GamePhaseActorScriptVm secondaryScriptVm;
    u32 pendingQueueValue;
    ActorRuntimeOwnedList ownedList;
} ActorRuntimeCollection;

typedef char ActorRuntimePrimaryScriptStateSizeCheck[
    sizeof(ActorRuntimePrimaryScriptState) == 0x98 ? 1 : -1];
typedef char ActorRuntimeCollectionSizeCheck[
    sizeof(ActorRuntimeCollection) == 0x148 ? 1 : -1];

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
GamePhaseActorScriptVm *ActorRuntimeCollection_CopyPrimaryContainerState(
    ActorRuntimeCollection *self, const GamePhaseActorScriptVm *source);
GamePhaseActorScriptVm *ActorRuntimeCollection_GetPrimaryContainer(
    ActorRuntimeCollection *self);
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
ActorRuntimeOwnedList *ActorRuntimeOwnedList_DestroyAndFree(
    ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *ActorRuntimeListBase_DestroyAndFree(
    ActorRuntimeOwnedList *self);
ActorRuntimeOwnedList *ActorRuntimeListBase_Destroy(
    ActorRuntimeOwnedList *self);

extern const void *gActorRuntimeOwnedListVTable[];
extern const void *gActorRuntimeListBaseVTable[];

#ifdef __cplusplus
}
#endif

#endif
