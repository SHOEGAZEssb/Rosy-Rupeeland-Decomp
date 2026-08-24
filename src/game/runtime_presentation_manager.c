#include "tingle/heap.h"
#include "tingle/runtime_presentation_manager.h"

/* Manage two linked lists of field effects and the owned 3D presentation. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern VecFx32Object *ActorMotionAreaFollower_GetPosition(void *object);
#ifdef __cplusplus
}
#endif

/* Initialize both lists, allocate/construct the 0x50c-byte 3D presentation, and return self. */
RuntimePresentationManager *RuntimePresentationManager_Init(RuntimePresentationManager *self)
{
    Graphics3dPresentation *graphics3dPresentation;
    FieldEffectList_Init(&self->firstEffects);
    FieldEffectList_Init(&self->secondEffects);
    graphics3dPresentation = (Graphics3dPresentation *)Heap_Alloc(
        sizeof(Graphics3dPresentation), gGraphics3dPresentationAllocationTag,
        4, &gHeapContext);
    if (graphics3dPresentation != 0)
        graphics3dPresentation = Graphics3dPresentation_Init(graphics3dPresentation, 1);
    self->graphics3dPresentation = graphics3dPresentation;
    return self;
}

/* Install the CList<CFieldEffect *> vtable and initialize an empty list. */
FieldEffectList *FieldEffectList_Init(FieldEffectList *self)
{
    self->vtable = gFieldEffectListVtable;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    return self;
}

/* Restore the list vtable, free its nodes without destroying effects, and return self. */
FieldEffectList *FieldEffectList_Destroy(FieldEffectList *self)
{
    self->vtable = gFieldEffectListVtable;
    FieldEffectList_Clear(self);
    return self;
}

/* Free every node without destroying its FieldEffect, then clear head/tail/count. */
void FieldEffectList_Clear(FieldEffectList *self)
{
    FieldEffectListNode *node = self->head;
    while (node != 0) {
        FieldEffectListNode *next = node->next;
        Heap_Free(node);
        node = next;
    }
    self->head = 0;
    self->tail = 0;
    self->count = 0;
}

/* Destroy all effects and the optional 3D presentation, then destroy both embedded lists. */
RuntimePresentationManager *RuntimePresentationManager_Destroy(RuntimePresentationManager *self)
{
    RuntimePresentationManager_DestroyAllEffects(self);
    if (self->graphics3dPresentation != 0) {
        Graphics3dPresentation_Destroy(self->graphics3dPresentation);
        Heap_Free(self->graphics3dPresentation);
    }
    self->secondEffects.vtable = gFieldEffectListVtable;
    FieldEffectList_Clear(&self->secondEffects);
    self->firstEffects.vtable = gFieldEffectListVtable;
    FieldEffectList_Clear(&self->firstEffects);
    return self;
}

/*
 * Poll both lists through effect virtual 0x08; completed effects are deleted
 * through virtual 0x04 and their nodes removed. If the 3D presentation is
 * enabled, refresh it from runtime field 0x2fbc and forward the caller's frame
 * buffer-swap request. Returns zero.
 */
s32 RuntimePresentationManager_UpdatePresentations(
    RuntimePresentationManager *self, s32 graphicsUpdateArgument)
{
    FieldEffectListNode *node;
    FieldEffectListNode *next;
    VecFx32Object *worldPosition;

    node = self->firstEffects.head;
    while (node != 0) {
        next = node->next;
        if (((s32 (*)(void *))node->effect->vtable[2])(node->effect) != 0) {
            if (node->effect != 0)
                ((void (*)(void *))node->effect->vtable[1])(node->effect);
            FieldEffectList_RemoveNode(&self->firstEffects, node);
        }
        node = next;
    }
    node = self->secondEffects.head;
    while (node != 0) {
        next = node->next;
        if (((s32 (*)(void *))node->effect->vtable[2])(node->effect) != 0) {
            if (node->effect != 0)
                ((void (*)(void *))node->effect->vtable[1])(node->effect);
            FieldEffectList_RemoveNode(&self->secondEffects, node);
        }
        node = next;
    }
    if (self->graphics3dPresentation != 0 &&
        self->graphics3dPresentation->enabled != 0) {
        worldPosition = ActorMotionAreaFollower_GetPosition(
            (u8 *)gGamePhaseRuntime + 0x2fbc);
        Graphics3dPresentation_UpdateFrame(self->graphics3dPresentation,
                                            worldPosition,
                                            graphicsUpdateArgument);
    }
    return 0;
}

/* Unlink/free one node without destroying its effect, then maintain count/empty state. */
void FieldEffectList_RemoveNode(FieldEffectList *self, FieldEffectListNode *node)
{
    if (node == self->head) self->head = node->next;
    else node->previous->next = node->next;
    if (node == self->tail) self->tail = node->previous;
    else node->next->previous = node->previous;
    if (node != 0) Heap_Free(node);
    self->count--;
    if (self->count == 0) FieldEffectList_Clear(self);
}

/* Dispatch VBlank virtual 0x0c to second-list effects with dispatch bit 1 set. */
void RuntimePresentationManager_DispatchVBlankCallbacks(RuntimePresentationManager *self)
{
    FieldEffectListNode *node;
    for (node = self->secondEffects.head; node != 0; node = node->next)
        if ((s32)(node->effect->dispatchState << 30) >> 31)
            ((void (*)(void *))node->effect->vtable[3])(node->effect);
}

/* Default VBlank virtual 0x0c implementation; effect state is unchanged. */
void FieldEffect_VBlankCallbackNoOp(FieldEffect *self) { (void)self; }

/* Dispatch VCOUNT through HBlank virtual 0x10 to second-list effects with bit 0 set. */
void RuntimePresentationManager_DispatchHBlankCallbacks(
    RuntimePresentationManager *self, s32 vcount)
{
    FieldEffectListNode *node;
    for (node = self->secondEffects.head; node != 0; node = node->next)
        if ((s32)(node->effect->dispatchState << 31) >> 31)
            ((void (*)(void *, s32))node->effect->vtable[4])(
                node->effect, vcount);
}

/* Default HBlank virtual 0x10 implementation; VCOUNT and state are ignored. */
void FieldEffect_HBlankCallbackNoOp(FieldEffect *self, s32 vcount)
{
    (void)self;
    (void)vcount;
}

/* Append a field effect to the manager's first list and return the new node. */
FieldEffectListNode *RuntimePresentationManager_AppendFirstListEffect(
    RuntimePresentationManager *self, FieldEffect *effect)
{
    return FieldEffectList_Append(&self->firstEffects, effect);
}

/* Allocate a node, append it to list, increment count, and return the node. */
FieldEffectListNode *FieldEffectList_Append(FieldEffectList *list,
                                            FieldEffect *effect)
{
    FieldEffectListNode *node = (FieldEffectListNode *)Heap_Alloc(
        sizeof(FieldEffectListNode), gFieldEffectListNodeAllocationTag,
        4, &gHeapContext);
    if (node != 0) {
        node->next = 0;
        node->previous = 0;
        node->effect = effect;
    }
    if (list->tail != 0) {
        list->tail->next = node;
        node->previous = list->tail;
    } else {
        list->head = node;
    }
    list->tail = node;
    list->count++;
    return node;
}

/* Append a field effect to the manager's second list and return the new node. */
FieldEffectListNode *RuntimePresentationManager_AppendSecondListEffect(
    RuntimePresentationManager *self, FieldEffect *effect)
{
    return FieldEffectList_Append(&self->secondEffects, effect);
}

/* Return the node's field effect; the first recovered argument is unused. */
FieldEffect *RuntimePresentationManager_GetFirstListNodeEffect(
    RuntimePresentationManager *unused, FieldEffectListNode *node)
{
    return node->effect;
}

/* Return the node's field effect; this duplicate preserves address identity. */
FieldEffect *RuntimePresentationManager_GetSecondListNodeEffect(
    RuntimePresentationManager *unused, FieldEffectListNode *node)
{
    return node->effect;
}

/* Destroy every field effect, remove all nodes, and leave both lists empty. */
void RuntimePresentationManager_DestroyAllEffects(RuntimePresentationManager *self)
{
    FieldEffectListNode *node;
    FieldEffectListNode *next;
    node = self->firstEffects.head;
    while (node != 0) {
        next = node->next;
        if (node->effect != 0)
            ((void (*)(void *))node->effect->vtable[1])(node->effect);
        FieldEffectList_RemoveNode(&self->firstEffects, node);
        node = next;
    }
    FieldEffectList_Clear(&self->firstEffects);
    node = self->secondEffects.head;
    while (node != 0) {
        next = node->next;
        if (node->effect != 0)
            ((void (*)(void *))node->effect->vtable[1])(node->effect);
        FieldEffectList_RemoveNode(&self->secondEffects, node);
        node = next;
    }
    FieldEffectList_Clear(&self->secondEffects);
}
