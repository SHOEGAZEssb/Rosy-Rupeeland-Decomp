#include "tingle/heap.h"
#include "tingle/types.h"

/* Broadcast presentation callbacks and coordinate the manager's auxiliary renderer. */

typedef struct PresentationObject { void **vtable; u32 flags04; } PresentationObject;
typedef struct PresentationNode { struct PresentationNode *next; struct PresentationNode *previous; PresentationObject *object; } PresentationNode;
typedef struct PresentationList { void *vtable; PresentationNode *head; PresentationNode *tail; u32 count; } PresentationList;
typedef struct RuntimePresentationManager { PresentationList first; PresentationList second; u8 *auxiliary; } RuntimePresentationManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gRuntimePresentationListVTable;
extern void *data_021052fc;
extern void func_0201dc58(PresentationList *list);
extern void func_0201dde4(PresentationList *list, PresentationNode *node);
extern void func_020a2324(void *auxiliary);
extern void func_020a2348(void *auxiliary, s32 first, s32 second);
extern void func_020a23a8(void *auxiliary, s32 first, s32 second);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0Mode);
#ifdef __cplusplus
}
#endif

/* Broadcast argument through virtual 0x14 to every object in both lists. */
void func_0201dff0(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    for (node=self->first.head; node; node=node->next)
        ((void (*)(void *,s32))node->object->vtable[5])(node->object,argument);
    for (node=self->second.head; node; node=node->next)
        ((void (*)(void *,s32))node->object->vtable[5])(node->object,argument);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201e050(void) {}

/*
 * Broadcast argument through virtual 0x18 to both lists.  When the auxiliary
 * exists and byte 0x50a is set, select its enabled or disabled transition
 * helper according to argument.  Returns no value.
 */
void func_0201e054(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    for (node=self->first.head; node; node=node->next)
        ((void (*)(void *,s32))node->object->vtable[6])(node->object,argument);
    for (node=self->second.head; node; node=node->next)
        ((void (*)(void *,s32))node->object->vtable[6])(node->object,argument);
    if (self->auxiliary == 0 || self->auxiliary[0x50a] == 0) return;
    if (argument != 0) func_020a23a8(self->auxiliary,0,1);
    else func_020a2348(self->auxiliary,0,0);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201e0e8(void) {}

/* Return the manager's auxiliary object without changing state. */
void *func_0201e0ec(RuntimePresentationManager *self) { return self->auxiliary; }

/*
 * If recovered runtime selection flag bit 23 is set, reset the auxiliary,
 * select its mode (1,0), and program GX display mode 6 with BG modes zero.
 */
void func_0201e0f4(RuntimePresentationManager *self)
{
    u8 *runtime=(u8 *)data_021052fc;
    u8 *selection=**(u8 ***)(runtime+0x30bc);
    if (((s32)(*(u32 *)(selection+0x40)<<8)>>31)==0) return;
    func_020a2324(self->auxiliary);
    func_020a2348(self->auxiliary,1,0);
    GX_SetGraphicsMode(6,0,0);
}

/* Broadcast argument through virtual 0x1c to every object in both lists. */
void RuntimePresentationManager_BroadcastSlot1C(RuntimePresentationManager *self, s32 argument)
{
    PresentationNode *node;
    for (node=self->first.head; node; node=node->next)
        ((void (*)(void *,s32))node->object->vtable[7])(node->object,argument);
    for (node=self->second.head; node; node=node->next)
        ((void (*)(void *,s32))node->object->vtable[7])(node->object,argument);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201e1ac(void) {}

/* Remove nodes from both lists whose signed recovered flags04 bits 2..9 equal key. */
void func_0201e1b0(RuntimePresentationManager *self, s32 key)
{
    PresentationNode *node,*next;
    for(node=self->first.head;node;node=next){next=node->next;if(key==((s32)(node->object->flags04<<22)>>24))func_0201dde4(&self->first,node);}
    for(node=self->second.head;node;node=next){next=node->next;if(key==((s32)(node->object->flags04<<22)>>24))func_0201dde4(&self->second,node);}
}

/* Clear a list, free the list object itself, and return its old address. */
PresentationList *func_0201e228(PresentationList *self)
{
    self->vtable=gRuntimePresentationListVTable;
    func_0201dc58(self);
    Heap_Free(self);
    return self;
}
