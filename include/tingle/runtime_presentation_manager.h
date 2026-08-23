#ifndef TINGLE_RUNTIME_PRESENTATION_MANAGER_H
#define TINGLE_RUNTIME_PRESENTATION_MANAGER_H

#include "tingle/field_effect.h"

/*
 * Runtime owner for two CList<CFieldEffect *> instances and one separately
 * allocated 3D presentation. List primitives own and free only their nodes.
 * Manager update/teardown paths destroy effects before unlinking those nodes,
 * while keyed removal only unlinks nodes. The list-order distinction is
 * retained because only the second list receives the two bit-gated callbacks,
 * while otherwise valid second-list effects may leave both callback bits
 * clear.
 */
typedef struct FieldEffectListNode {
    struct FieldEffectListNode *next;
    struct FieldEffectListNode *previous;
    FieldEffect *effect;
} FieldEffectListNode;

typedef struct FieldEffectList {
    void *vtable;
    FieldEffectListNode *head;
    FieldEffectListNode *tail;
    u32 count;
} FieldEffectList;

typedef struct Graphics3dPresentation Graphics3dPresentation;

typedef struct RuntimePresentationManager {
    FieldEffectList firstEffects;
    FieldEffectList secondEffects;
    Graphics3dPresentation *graphics3dPresentation;
} RuntimePresentationManager;

#ifdef __cplusplus
extern "C" {
#endif

extern u8 gFieldEffectListVtable[];
extern const char gFieldEffectListNodeAllocationTag[];
extern const char gGraphics3dPresentationAllocationTag[];

FieldEffectList *FieldEffectList_Init(FieldEffectList *self);
FieldEffectList *FieldEffectList_Destroy(FieldEffectList *self);
void FieldEffectList_Clear(FieldEffectList *self);
void FieldEffectList_RemoveNode(FieldEffectList *self,
                                FieldEffectListNode *node);
FieldEffectListNode *RuntimePresentationManager_AppendFirstListEffect(
    RuntimePresentationManager *self, FieldEffect *effect);
FieldEffectListNode *FieldEffectList_Append(FieldEffectList *list,
                                            FieldEffect *effect);
FieldEffectList *FieldEffectList_DestroyAndFree(FieldEffectList *self);

RuntimePresentationManager *RuntimePresentationManager_Init(
    RuntimePresentationManager *self);
RuntimePresentationManager *RuntimePresentationManager_Destroy(
    RuntimePresentationManager *self);
void RuntimePresentationManager_DestroyAllEffects(
    RuntimePresentationManager *self);
s32 RuntimePresentationManager_UpdatePresentations(
    RuntimePresentationManager *self, s32 graphicsUpdateArgument);
void RuntimePresentationManager_DispatchVBlankCallbacks(
    RuntimePresentationManager *self);
void RuntimePresentationManager_DispatchHBlankCallbacks(
    RuntimePresentationManager *self, s32 vcount);
FieldEffectListNode *RuntimePresentationManager_AppendSecondListEffect(
    RuntimePresentationManager *self, FieldEffect *effect);
FieldEffect *RuntimePresentationManager_GetFirstListNodeEffect(
    RuntimePresentationManager *unused, FieldEffectListNode *node);
FieldEffect *RuntimePresentationManager_GetSecondListNodeEffect(
    RuntimePresentationManager *unused, FieldEffectListNode *node);
Graphics3dPresentation *RuntimePresentationManager_GetGraphics3dPresentation(
    RuntimePresentationManager *self);
void RuntimePresentationManager_NotifyScreenModeChanged(
    RuntimePresentationManager *self, s32 screenMode);
void RuntimePresentationManager_SetEnabled(RuntimePresentationManager *self,
                                           s32 enabled);
void RuntimePresentationManager_DisableGraphics3dForActivePhase(
    RuntimePresentationManager *self);
void RuntimePresentationManager_DetachEffectsByKey(
    RuntimePresentationManager *self, s32 effectKey);

#ifdef __cplusplus
}
#endif

#endif
