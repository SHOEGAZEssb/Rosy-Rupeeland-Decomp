#include "tingle/field_effect.h"
#include "tingle/heap.h"

/* Manage two intrusive lists of field effects and an auxiliary renderer. */

typedef struct PresentationNode {
    struct PresentationNode *next;
    struct PresentationNode *previous;
    FieldEffect *effect;
} PresentationNode;
typedef struct PresentationList {
    void *vtable;
    PresentationNode *head;
    PresentationNode *tail;
    u32 count;
} PresentationList;
typedef struct RuntimePresentationManager {
    PresentationList first;
    PresentationList second;
    u8 *auxiliary;
} RuntimePresentationManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gRuntimePresentationListVTable;
extern char gRuntimePresentationListNodeAllocationTag[];
extern char gRuntimePresentationAuxiliaryAllocationTag[];
extern void *data_021052fc;
extern void *func_020a1f80(void *self, s32 value);
extern void func_020a20d4(void *self);
extern void func_020a214c(void *self, void *value, s32 argument);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern PresentationList *func_0201dc18(PresentationList *self);
extern void func_0201dc58(PresentationList *self);
extern void func_0201dde4(PresentationList *self, PresentationNode *node);
extern PresentationNode *func_0201dee0(PresentationList *list,
                                        FieldEffect *effect);
extern void func_0201df64(RuntimePresentationManager *self);
#ifdef __cplusplus
}
#endif

/* Initialize both lists, allocate/construct the 0x50c-byte auxiliary object, and return self. */
RuntimePresentationManager *func_0201dbc8(RuntimePresentationManager *self)
{
    void *auxiliary;
    func_0201dc18(&self->first);
    func_0201dc18(&self->second);
    auxiliary = Heap_Alloc(0x50c, gRuntimePresentationAuxiliaryAllocationTag, 4, &gHeapContext);
    if (auxiliary != 0)
        auxiliary = func_020a1f80(auxiliary, 1);
    self->auxiliary = (u8 *)auxiliary;
    return self;
}

/* Install the recovered list vtable, clear head/tail/count, and return self. */
PresentationList *func_0201dc18(PresentationList *self)
{
    self->vtable = gRuntimePresentationListVTable;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    return self;
}

/* Install the list vtable, clear all nodes, and return self. */
PresentationList *func_0201dc38(PresentationList *self)
{
    self->vtable = gRuntimePresentationListVTable;
    func_0201dc58(self);
    return self;
}

/* Free every node without destroying its FieldEffect, then clear head/tail/count. */
void func_0201dc58(PresentationList *self)
{
    PresentationNode *node = self->head;
    while (node != 0) {
        PresentationNode *next = node->next;
        Heap_Free(node);
        node = next;
    }
    self->head = 0;
    self->tail = 0;
    self->count = 0;
}

/* Destroy all field effects/lists and the optional auxiliary, then return self. */
RuntimePresentationManager *func_0201dc98(RuntimePresentationManager *self)
{
    func_0201df64(self);
    if (self->auxiliary != 0) {
        func_020a20d4(self->auxiliary);
        Heap_Free(self->auxiliary);
    }
    self->second.vtable = gRuntimePresentationListVTable;
    func_0201dc58(&self->second);
    self->first.vtable = gRuntimePresentationListVTable;
    func_0201dc58(&self->first);
    return self;
}

/*
 * Poll both lists through effect virtual 0x08; completed effects are deleted
 * through virtual 0x04 and their nodes removed.  If the auxiliary's byte 0x50a
 * is set, refresh it from runtime field 0x2fbc with argument.  Returns zero.
 */
s32 RuntimePresentationManager_Update(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    PresentationNode *next;
    void *value;

    node = self->first.head;
    while (node != 0) {
        next = node->next;
        if (((s32 (*)(void *))node->effect->vtable[2])(node->effect) != 0) {
            if (node->effect != 0)
                ((void (*)(void *))node->effect->vtable[1])(node->effect);
            func_0201dde4(&self->first, node);
        }
        node = next;
    }
    node = self->second.head;
    while (node != 0) {
        next = node->next;
        if (((s32 (*)(void *))node->effect->vtable[2])(node->effect) != 0) {
            if (node->effect != 0)
                ((void (*)(void *))node->effect->vtable[1])(node->effect);
            func_0201dde4(&self->second, node);
        }
        node = next;
    }
    if (self->auxiliary != 0 && self->auxiliary[0x50a] != 0) {
        value = ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
        func_020a214c(self->auxiliary, value, argument);
    }
    return 0;
}

/* Unlink/free node, decrement count, and fully clear the list when it becomes empty. */
void func_0201dde4(PresentationList *self, PresentationNode *node)
{
    if (node == self->head) self->head = node->next;
    else node->previous->next = node->next;
    if (node == self->tail) self->tail = node->previous;
    else node->next->previous = node->previous;
    if (node != 0) Heap_Free(node);
    self->count--;
    if (self->count == 0) func_0201dc58(self);
}

/* Dispatch virtual 0x0c to second-list effects whose dispatch-state bit 1 is set. */
void func_0201de4c(RuntimePresentationManager *self)
{
    PresentationNode *node;
    for (node = self->second.head; node != 0; node = node->next)
        if ((s32)(node->effect->dispatchState << 30) >> 31)
            ((void (*)(void *))node->effect->vtable[3])(node->effect);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201de88(void) {}

/* Dispatch argument through virtual 0x10 to second-list effects with dispatch-state bit 0 set. */
void func_0201de8c(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    for (node = self->second.head; node != 0; node = node->next)
        if ((s32)(node->effect->dispatchState << 31) >> 31)
            ((void (*)(void *, s32))node->effect->vtable[4])(
                node->effect, argument);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201ded0(void) {}

/* Append a field effect via func_0201dee0 and return the new node. */
PresentationNode *PresentationList_AppendObject(PresentationList *list, FieldEffect *effect)
{
    return func_0201dee0(list, effect);
}

/* Allocate a node, append it to list, increment count, and return the node. */
PresentationNode *func_0201dee0(PresentationList *list, FieldEffect *effect)
{
    PresentationNode *node = (PresentationNode *)Heap_Alloc(
        sizeof(PresentationNode), gRuntimePresentationListNodeAllocationTag, 4, &gHeapContext);
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
PresentationNode *func_0201df44(RuntimePresentationManager *self,
                                 FieldEffect *effect)
{
    return func_0201dee0(&self->second, effect);
}

/* Return the node's field effect; the first recovered argument is unused. */
FieldEffect *func_0201df54(void *unused, PresentationNode *node)
{
    return node->effect;
}

/* Return the node's field effect; this duplicate preserves address identity. */
FieldEffect *func_0201df5c(void *unused, PresentationNode *node)
{
    return node->effect;
}

/* Destroy every field effect, remove all nodes, and leave both lists empty. */
void func_0201df64(RuntimePresentationManager *self)
{
    PresentationNode *node;
    PresentationNode *next;
    node = self->first.head;
    while (node != 0) {
        next = node->next;
        if (node->effect != 0)
            ((void (*)(void *))node->effect->vtable[1])(node->effect);
        func_0201dde4(&self->first, node);
        node = next;
    }
    func_0201dc58(&self->first);
    node = self->second.head;
    while (node != 0) {
        next = node->next;
        if (node->effect != 0)
            ((void (*)(void *))node->effect->vtable[1])(node->effect);
        func_0201dde4(&self->second, node);
        node = next;
    }
    func_0201dc58(&self->second);
}
