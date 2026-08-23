#include "tingle/heap.h"
#include "tingle/runtime_presentation_manager.h"

/* Broadcast field-effect callbacks and coordinate the manager's 3D presentation. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gRuntimePresentationListVTable;
extern void *data_021052fc;
extern void func_0201dc58(FieldEffectList *list);
extern void func_0201dde4(FieldEffectList *list, FieldEffectListNode *node);
extern void func_020a2324(void *presentation);
extern void func_020a2348(void *presentation, s32 first, s32 second);
extern void func_020a23a8(void *presentation, s32 first, s32 second);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0Mode);
#ifdef __cplusplus
}
#endif

/* Broadcast argument through virtual 0x14 to every field effect in both lists. */
void func_0201dff0(RuntimePresentationManager *self, s32 argument)
{
    FieldEffectListNode *node;
    for (node=self->firstEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[5])(node->effect,argument);
    for (node=self->secondEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[5])(node->effect,argument);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201e050(void) {}

/*
 * Broadcast argument through virtual 0x18 to both lists. When the 3D
 * presentation exists and byte 0x50a is set, select its enabled or disabled
 * transition helper according to argument. Returns no value.
 */
void func_0201e054(RuntimePresentationManager *self, s32 argument)
{
    FieldEffectListNode *node;
    for (node=self->firstEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[6])(node->effect,argument);
    for (node=self->secondEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[6])(node->effect,argument);
    if (self->graphics3dPresentation == 0 ||
        ((u8 *)self->graphics3dPresentation)[0x50a] == 0) return;
    if (argument != 0) func_020a23a8(self->graphics3dPresentation,0,1);
    else func_020a2348(self->graphics3dPresentation,0,0);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201e0e8(void) {}

/* Return the manager's borrowed 3D presentation without changing state. */
Graphics3dPresentation *RuntimePresentationManager_GetGraphics3dPresentation(
    RuntimePresentationManager *self)
{
    return self->graphics3dPresentation;
}

/*
 * If recovered runtime selection flag bit 23 is set, reset the 3D presentation,
 * select its mode (1,0), and program GX display mode 6 with BG modes zero.
 */
void func_0201e0f4(RuntimePresentationManager *self)
{
    u8 *runtime=(u8 *)data_021052fc;
    u8 *selection=**(u8 ***)(runtime+0x30bc);
    if (((s32)(*(u32 *)(selection+0x40)<<8)>>31)==0) return;
    func_020a2324(self->graphics3dPresentation);
    func_020a2348(self->graphics3dPresentation,1,0);
    GX_SetGraphicsMode(6,0,0);
}

/* Broadcast argument through virtual 0x1c to every field effect in both lists. */
void RuntimePresentationManager_BroadcastSlot1C(RuntimePresentationManager *self, s32 argument)
{
    FieldEffectListNode *node;
    for (node=self->firstEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[7])(node->effect,argument);
    for (node=self->secondEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[7])(node->effect,argument);
}

/* Recovered no-op callback; inputs and state are ignored. */
void func_0201e1ac(void) {}

/* Remove effects from both lists whose signed dispatch bits 2..9 equal key. */
void func_0201e1b0(RuntimePresentationManager *self, s32 key)
{
    FieldEffectListNode *node,*next;
    for(node=self->firstEffects.head;node;node=next){next=node->next;if(key==((s32)(node->effect->dispatchState<<22)>>24))func_0201dde4(&self->firstEffects,node);}
    for(node=self->secondEffects.head;node;node=next){next=node->next;if(key==((s32)(node->effect->dispatchState<<22)>>24))func_0201dde4(&self->secondEffects,node);}
}

/* Clear a list, free the list object itself, and return its old address. */
FieldEffectList *func_0201e228(FieldEffectList *self)
{
    self->vtable=gRuntimePresentationListVTable;
    func_0201dc58(self);
    Heap_Free(self);
    return self;
}
