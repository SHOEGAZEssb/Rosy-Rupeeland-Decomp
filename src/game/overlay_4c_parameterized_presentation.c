#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Wrap an overlay-94 0x4c-byte component that requires two constructor
 * arguments.  The wrapper owns the component, manages a helper configured with
 * ID 0x5e, and forwards two presentation operations.
 */
typedef struct Overlay4cParameterizedPresentation {
    void **vtable00;
    u32 dispatchState;
    void *component08;
    u8 helper0c[0x10];
} Overlay4cParameterizedPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d68bc;
extern const char gOverlay4cParameterizedComponentAllocationTag[];

extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void OverlaySlot_LoadOverlay(void *, s32);
extern void OverlaySlot_UnloadOverlay(void *);
extern void *func_ov094_02219568(void *, void *, void *);
extern void func_ov094_022196a4(void *);
extern s32 func_ov094_022196e8(void *);
extern s32 data_ov089_022198e8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base/helper, set helper ID 0x5e, allocate the component, pass its
 * two recovered pointer arguments to the overlay constructor, and return self.
 */
Overlay4cParameterizedPresentation *Overlay4cParameterizedPresentation_Init(
    Overlay4cParameterizedPresentation *self, void *first, void *second)
{
    FieldEffect_Init(self);self->vtable00=(void **)data_020d68bc;
    OverlaySlot_Init(self->helper0c);OverlaySlot_LoadOverlay(self->helper0c,0x5e);
    self->component08=Heap_Alloc(0x4c,gOverlay4cParameterizedComponentAllocationTag,4,&gHeapContext);
    if(self->component08)self->component08=func_ov094_02219568(self->component08,first,second);
    return self;
}

/* Destroy/free the component, tear down its helper and FieldEffect base, and return self. */
Overlay4cParameterizedPresentation *Overlay4cParameterizedPresentation_Destroy(
    Overlay4cParameterizedPresentation *self)
{
    self->vtable00=(void **)data_020d68bc;
    if(self->component08){func_ov094_022196a4(self->component08);Heap_Free(self->component08);}
    OverlaySlot_UnloadOverlay(self->helper0c);OverlaySlot_Destroy(self->helper0c);FieldEffect_DestroyBase(self);
    return self;
}

/* Perform Overlay4cParameterizedPresentation_Destroy teardown, free self, and return its old address. */
Overlay4cParameterizedPresentation *Overlay4cParameterizedPresentation_DestroyAndFree(
    Overlay4cParameterizedPresentation *self)
{Overlay4cParameterizedPresentation_Destroy(self);Heap_Free(self);return self;}

/* Tail-forward the first operation to the owned overlay component. */
s32 Overlay4cParameterizedPresentation_InvokeComponentOperation0(Overlay4cParameterizedPresentation *self)
{return func_ov094_022196e8(self->component08);}

/*
 * Tail-forward the second operation.  The address-derived symbol is labeled as
 * data because overlays share its address; this call behavior is confirmed.
 */
s32 Overlay4cParameterizedPresentation_InvokeComponentOperation1(Overlay4cParameterizedPresentation *self)
{return data_ov089_022198e8(self->component08);}
