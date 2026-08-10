#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Adapt an overlay-94 0x18-byte component to the common presentation base.
 * The wrapper owns the component and an embedded helper configured with ID
 * 0x5e, and forwards two component operations.
 */
typedef struct Overlay18ComponentPresentation {
    void **vtable00;
    u32 field04;
    void *component08;
    u8 helper0c[0x10];
} Overlay18ComponentPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6984;
extern const char data_020d69ec[];
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void OverlaySlot_LoadOverlay(void *, s32);
extern void OverlaySlot_UnloadOverlay(void *);
extern void *func_ov094_0221991c(void *);
extern void func_ov094_022199e0(void *);
extern s32 data_ov089_02219ad4(void *);
extern s32 data_ov089_02219b78(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the common base and helper, select helper ID 0x5e, allocate and
 * construct the 0x18-byte overlay component, store it, and return self.
 */
Overlay18ComponentPresentation *func_02024468(
    Overlay18ComponentPresentation *self)
{
    func_0201e250(self);
    self->vtable00 = (void **)data_020d6984;
    OverlaySlot_Init(self->helper0c);
    OverlaySlot_LoadOverlay(self->helper0c, 0x5e);
    self->component08 = Heap_Alloc(0x18, data_020d69ec, 4, &gHeapContext);
    if (self->component08 != 0) {
        self->component08 = func_ov094_0221991c(self->component08);
    }
    return self;
}

/* Destroy/free the component, tear down helper and base, and return self. */
Overlay18ComponentPresentation *func_020244cc(
    Overlay18ComponentPresentation *self)
{
    self->vtable00 = (void **)data_020d6984;
    if (self->component08 != 0) {
        func_ov094_022199e0(self->component08);
        Heap_Free(self->component08);
    }
    OverlaySlot_UnloadOverlay(self->helper0c);
    OverlaySlot_Destroy(self->helper0c);
    func_0201e28c(self);
    return self;
}

/* Perform func_020244cc teardown, free self, and return its old address. */
Overlay18ComponentPresentation *func_0202451c(
    Overlay18ComponentPresentation *self)
{
    func_020244cc(self);
    Heap_Free(self);
    return self;
}

/*
 * Tail-forward the first operation.  The address-derived symbol is labeled as
 * data because multiple overlays share its address; call behavior is confirmed.
 */
s32 func_02024574(Overlay18ComponentPresentation *self)
{
    return data_ov089_02219ad4(self->component08);
}

/* Tail-forward the second operation under the same shared-address condition. */
s32 func_02024584(Overlay18ComponentPresentation *self)
{
    return data_ov089_02219b78(self->component08);
}
