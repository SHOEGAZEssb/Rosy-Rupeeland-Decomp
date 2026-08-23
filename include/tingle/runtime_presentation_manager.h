#ifndef TINGLE_RUNTIME_PRESENTATION_MANAGER_H
#define TINGLE_RUNTIME_PRESENTATION_MANAGER_H

#include "tingle/field_effect.h"

/*
 * Runtime owner for two CList<CFieldEffect *> instances and one separately
 * allocated 3D presentation. The list-order distinction is retained because
 * only the second list receives the two bit-gated callbacks, while otherwise
 * valid second-list effects may leave both callback bits clear.
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

FieldEffectListNode *RuntimePresentationManager_AppendFirstListEffect(
    RuntimePresentationManager *self, FieldEffect *effect);
FieldEffectListNode *FieldEffectList_Append(FieldEffectList *list,
                                             FieldEffect *effect);
FieldEffectListNode *RuntimePresentationManager_AppendSecondListEffect(
    RuntimePresentationManager *self, FieldEffect *effect);
FieldEffect *RuntimePresentationManager_GetFirstListNodeEffect(
    RuntimePresentationManager *unused, FieldEffectListNode *node);
FieldEffect *RuntimePresentationManager_GetSecondListNodeEffect(
    RuntimePresentationManager *unused, FieldEffectListNode *node);
Graphics3dPresentation *RuntimePresentationManager_GetGraphics3dPresentation(
    RuntimePresentationManager *self);

#ifdef __cplusplus
}
#endif

#endif
