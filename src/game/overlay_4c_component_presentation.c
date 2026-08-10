#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Adapt an overlay-94 0x4c-byte component to the common presentation base.
 * The wrapper owns the component and an embedded helper configured with ID
 * 0x5e, and forwards the component's update and completion operations.
 */
typedef struct Overlay4cComponentPresentation {
    void **vtable00;
    u32 field04;
    void *component08;
    u8 helper0c[0x10];
} Overlay4cComponentPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d690c;
extern const char gOverlay4cComponentAllocationTag[];
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void OverlaySlot_LoadOverlay(void *, s32);
extern void OverlaySlot_UnloadOverlay(void *);
extern void *func_ov094_02218f14(void *);
extern void func_ov094_0221900c(void *);
extern s32 func_ov094_02219050(void *);
extern s32 func_ov094_022191fc(void *);
#ifdef __cplusplus
}
#endif

/* Initialize base/helper, allocate and construct the component, and return self. */
Overlay4cComponentPresentation *func_02024200(Overlay4cComponentPresentation *self)
{
    func_0201e250(self); self->vtable00=(void **)data_020d690c;
    OverlaySlot_Init(self->helper0c); OverlaySlot_LoadOverlay(self->helper0c,0x5e);
    self->component08=Heap_Alloc(0x4c,gOverlay4cComponentAllocationTag,4,&gHeapContext);
    if(self->component08)self->component08=func_ov094_02218f14(self->component08);
    return self;
}

/* Destroy/free the component, tear down helper and base, and return self. */
Overlay4cComponentPresentation *func_02024264(Overlay4cComponentPresentation *self)
{
    self->vtable00=(void **)data_020d690c;
    if(self->component08){func_ov094_0221900c(self->component08);Heap_Free(self->component08);}
    OverlaySlot_UnloadOverlay(self->helper0c);OverlaySlot_Destroy(self->helper0c);func_0201e28c(self);
    return self;
}

/* Perform func_02024264 teardown, free self, and return its old address. */
Overlay4cComponentPresentation *func_020242b4(Overlay4cComponentPresentation *self)
{func_02024264(self);Heap_Free(self);return self;}

/* Tail-forward the first operation to the owned overlay component. */
s32 func_0202430c(Overlay4cComponentPresentation *self)
{return func_ov094_02219050(self->component08);}

/* Tail-forward the second operation to the owned overlay component. */
s32 func_0202431c(Overlay4cComponentPresentation *self)
{return func_ov094_022191fc(self->component08);}
