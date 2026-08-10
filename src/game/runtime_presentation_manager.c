#include "tingle/heap.h"
#include "tingle/types.h"

/* Manage two intrusive lists of runtime presentation objects and an auxiliary renderer. */

typedef struct PresentationObject { void **vtable; u32 flags04; } PresentationObject;
typedef struct PresentationNode {
    struct PresentationNode *next;
    struct PresentationNode *previous;
    PresentationObject *object;
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
extern void *data_020d5e20;
extern char data_020d5e08[];
extern char data_020d5e40[];
extern void *data_021052fc;
extern void *func_020a1f80(void *self, s32 value);
extern void func_020a20d4(void *self);
extern void func_020a214c(void *self, void *value, s32 argument);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern PresentationList *func_0201dc18(PresentationList *self);
extern void func_0201dc58(PresentationList *self);
extern void func_0201dde4(PresentationList *self, PresentationNode *node);
extern PresentationNode *func_0201dee0(PresentationList *list,
                                        PresentationObject *object);
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
    auxiliary = Heap_Alloc(0x50c, data_020d5e40, 4, &gHeapContext);
    if (auxiliary != 0)
        auxiliary = func_020a1f80(auxiliary, 1);
    self->auxiliary = (u8 *)auxiliary;
    return self;
}

/* Install the recovered list vtable, clear head/tail/count, and return self. */
PresentationList *func_0201dc18(PresentationList *self)
{
    self->vtable = data_020d5e20;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    return self;
}

/* Install the list vtable, clear all nodes, and return self. */
PresentationList *func_0201dc38(PresentationList *self)
{
    self->vtable = data_020d5e20;
    func_0201dc58(self);
    return self;
}

/* Free every node without destroying its payload, then clear head/tail/count. */
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

/* Destroy all payloads/lists and the optional auxiliary object, then return self. */
RuntimePresentationManager *func_0201dc98(RuntimePresentationManager *self)
{
    func_0201df64(self);
    if (self->auxiliary != 0) {
        func_020a20d4(self->auxiliary);
        Heap_Free(self->auxiliary);
    }
    self->second.vtable = data_020d5e20;
    func_0201dc58(&self->second);
    self->first.vtable = data_020d5e20;
    func_0201dc58(&self->first);
    return self;
}

/*
 * Poll both lists through payload virtual 0x08; completed payloads are deleted
 * through virtual 0x04 and their nodes removed.  If the auxiliary's byte 0x50a
 * is set, refresh it from runtime field 0x2fbc with argument.  Returns zero.
 */
s32 func_0201dcec(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    PresentationNode *next;
    void *value;

    node = self->first.head;
    while (node != 0) {
        next = node->next;
        if (((s32 (*)(void *))node->object->vtable[2])(node->object) != 0) {
            if (node->object != 0)
                ((void (*)(void *))node->object->vtable[1])(node->object);
            func_0201dde4(&self->first, node);
        }
        node = next;
    }
    node = self->second.head;
    while (node != 0) {
        next = node->next;
        if (((s32 (*)(void *))node->object->vtable[2])(node->object) != 0) {
            if (node->object != 0)
                ((void (*)(void *))node->object->vtable[1])(node->object);
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

/* Dispatch virtual 0x0c to second-list objects whose recovered flag bit 1 is set. */
void func_0201de4c(RuntimePresentationManager *self)
{
    PresentationNode *node;
    for (node = self->second.head; node != 0; node = node->next)
        if ((s32)(node->object->flags04 << 30) >> 31)
            ((void (*)(void *))node->object->vtable[3])(node->object);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201de88(void) {}

/* Dispatch argument through virtual 0x10 to second-list objects with flag bit 0 set. */
void func_0201de8c(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    for (node = self->second.head; node != 0; node = node->next)
        if ((s32)(node->object->flags04 << 31) >> 31)
            ((void (*)(void *, s32))node->object->vtable[4])(
                node->object, argument);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201ded0(void) {}

/* Append object to list via func_0201dee0 and return the new node. */
PresentationNode *func_0201ded4(PresentationList *list, PresentationObject *object)
{
    return func_0201dee0(list, object);
}

/* Allocate a node, append it to list, increment count, and return the node. */
PresentationNode *func_0201dee0(PresentationList *list, PresentationObject *object)
{
    PresentationNode *node = (PresentationNode *)Heap_Alloc(
        sizeof(PresentationNode), data_020d5e08, 4, &gHeapContext);
    if (node != 0) {
        node->next = 0;
        node->previous = 0;
        node->object = object;
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

/* Append object to the manager's second list and return the new node. */
PresentationNode *func_0201df44(RuntimePresentationManager *self,
                                 PresentationObject *object)
{
    return func_0201dee0(&self->second, object);
}

/* Return node's payload; the first recovered argument is unused. */
PresentationObject *func_0201df54(void *unused, PresentationNode *node)
{
    return node->object;
}

/* Return node's payload; this duplicate accessor preserves its address identity. */
PresentationObject *func_0201df5c(void *unused, PresentationNode *node)
{
    return node->object;
}

/* Destroy every payload in both lists, remove all nodes, and leave both lists empty. */
void func_0201df64(RuntimePresentationManager *self)
{
    PresentationNode *node;
    PresentationNode *next;
    node = self->first.head;
    while (node != 0) {
        next = node->next;
        if (node->object != 0)
            ((void (*)(void *))node->object->vtable[1])(node->object);
        func_0201dde4(&self->first, node);
        node = next;
    }
    func_0201dc58(&self->first);
    node = self->second.head;
    while (node != 0) {
        next = node->next;
        if (node->object != 0)
            ((void (*)(void *))node->object->vtable[1])(node->object);
        func_0201dde4(&self->second, node);
        node = next;
    }
    func_0201dc58(&self->second);
}
