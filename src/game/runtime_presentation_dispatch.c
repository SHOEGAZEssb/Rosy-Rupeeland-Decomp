#include "tingle/heap.h"
#include "tingle/runtime_presentation_manager.h"

/* Broadcast field-effect callbacks and coordinate the manager's 3D presentation. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_020a2324(void *presentation);
extern void func_020a2348(void *presentation, s32 first, s32 second);
extern void func_020a23a8(void *presentation, s32 first, s32 second);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0Mode);
#ifdef __cplusplus
}
#endif

/* Notify every effect of a screen-mode change through virtual 0x14. */
void RuntimePresentationManager_NotifyScreenModeChanged(
    RuntimePresentationManager *self, s32 screenMode)
{
    FieldEffectListNode *node;
    for (node=self->firstEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[5])(node->effect,screenMode);
    for (node=self->secondEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[5])(node->effect,screenMode);
}

/* Default screen-mode virtual 0x14 implementation; inputs are ignored. */
void FieldEffect_ScreenModeChangedCallbackNoOp(FieldEffect *self,
                                                s32 screenMode)
{
    (void)self;
    (void)screenMode;
}

/*
 * Broadcast argument through virtual 0x18 to both lists. When the 3D
 * presentation exists and byte 0x50a is set, select its enabled or disabled
 * transition helper according to enabled. Returns no value.
 */
void RuntimePresentationManager_SetEnabled(RuntimePresentationManager *self,
                                           s32 enabled)
{
    FieldEffectListNode *node;
    for (node=self->firstEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[6])(node->effect,enabled);
    for (node=self->secondEffects.head; node; node=node->next)
        ((void (*)(void *,s32))node->effect->vtable[6])(node->effect,enabled);
    if (self->graphics3dPresentation == 0 ||
        ((u8 *)self->graphics3dPresentation)[0x50a] == 0) return;
    if (enabled != 0) func_020a23a8(self->graphics3dPresentation,0,1);
    else func_020a2348(self->graphics3dPresentation,0,0);
}

/* Default enabled-state virtual 0x18 implementation; inputs are ignored. */
void FieldEffect_SetEnabledNoOp(FieldEffect *self, s32 enabled)
{
    (void)self;
    (void)enabled;
}

/* Return the manager's borrowed 3D presentation without changing state. */
Graphics3dPresentation *RuntimePresentationManager_GetGraphics3dPresentation(
    RuntimePresentationManager *self)
{
    return self->graphics3dPresentation;
}

/*
 * When the active phase configuration's 3D flag (bit 23) is set, tear down the
 * active 3D presentation state, select its disabled path, and program GX mode
 * 6 with BG0 in 2D mode.
 */
void RuntimePresentationManager_DisableGraphics3dForActivePhase(RuntimePresentationManager *self)
{
    u8 *runtimeRoot=(u8 *)data_021052fc;
    u8 *activePhaseConfig=**(u8 ***)(runtimeRoot+0x30bc);
    if (((s32)(*(u32 *)(activePhaseConfig+0x40)<<8)>>31)==0) return;
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

/* Unresolved virtual 0x1c default; all identified FieldEffect vtables use it. */
void func_0201e1ac(void) {}

/*
 * Detach nodes whose effects contain effectKey in signed dispatch-state bits
 * 2..9 without destroying the effects. Retail passes the first-list base when
 * removing a second-list match and advances through the freed node; this
 * portable recovery keeps the intended second-list base and saved-next walk.
 * The observed key 0x37 occurs only in the first list, so known valid behavior
 * is identical.
 */
void RuntimePresentationManager_DetachEffectsByKey(
    RuntimePresentationManager *self, s32 effectKey)
{
    FieldEffectListNode *node,*next;
    for(node=self->firstEffects.head;node;node=next){next=node->next;if(effectKey==((s32)(node->effect->dispatchState<<22)>>24))FieldEffectList_RemoveNode(&self->firstEffects,node);}
    for(node=self->secondEffects.head;node;node=next){next=node->next;if(effectKey==((s32)(node->effect->dispatchState<<22)>>24))FieldEffectList_RemoveNode(&self->secondEffects,node);}
}

/* Destroy the node-only list, free the list object, and return its old address. */
FieldEffectList *FieldEffectList_DestroyAndFree(FieldEffectList *self)
{
    self->vtable=gFieldEffectListVtable;
    FieldEffectList_Clear(self);
    Heap_Free(self);
    return self;
}
