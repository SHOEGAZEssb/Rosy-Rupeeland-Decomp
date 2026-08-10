#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Adapt an overlay-94 0x50-byte component to the common presentation base.
 * The wrapper owns that component, forwards one constructor argument, manages
 * an embedded helper configured with ID 0x5e, and exposes two thin operations.
 */

typedef struct Overlay50ComponentPresentation {
    void **vtable00;
    u32 field04;
    void *component08;
    u8 helper0c[0x10];
} Overlay50ComponentPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d69ac;
extern const char data_020d69d4[];
extern void func_0201e250(void *self);
extern void func_0201e28c(void *self);
extern void OverlaySlot_Init(void *helper);
extern void OverlaySlot_Destroy(void *helper);
extern void OverlaySlot_LoadOverlay(void *helper, s32 id);
extern void OverlaySlot_UnloadOverlay(void *helper);
extern void *func_ov094_022185e4(void *component, void *argument);
extern void func_ov094_022186dc(void *component);
extern s32 func_ov089_02218720(void *component);
extern s32 data_ov087_022189f8(void *component);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base and helper, configure helper ID 0x5e, allocate the 0x50-byte
 * overlay component, construct it with argument when allocation succeeds,
 * store the result at offset 8, and return self.
 */
Overlay50ComponentPresentation *func_020240cc(
    Overlay50ComponentPresentation *self, void *argument)
{
    func_0201e250(self);
    self->vtable00 = (void **)data_020d69ac;
    OverlaySlot_Init(self->helper0c);
    OverlaySlot_LoadOverlay(self->helper0c, 0x5e);
    self->component08 = Heap_Alloc(0x50, data_020d69d4, 4, &gHeapContext);
    if (self->component08 != 0) {
        self->component08 = func_ov094_022185e4(self->component08, argument);
    }
    return self;
}

/* Destroy/free the component, tear down helper and base, and return self. */
Overlay50ComponentPresentation *func_02024138(
    Overlay50ComponentPresentation *self)
{
    self->vtable00 = (void **)data_020d69ac;
    if (self->component08 != 0) {
        func_ov094_022186dc(self->component08);
        Heap_Free(self->component08);
    }
    OverlaySlot_UnloadOverlay(self->helper0c);
    OverlaySlot_Destroy(self->helper0c);
    func_0201e28c(self);
    return self;
}

/* Perform func_02024138 teardown, free self, and return its old address. */
Overlay50ComponentPresentation *func_02024188(
    Overlay50ComponentPresentation *self)
{
    func_02024138(self);
    Heap_Free(self);
    return self;
}

/*
 * Tail-forward the first operation to the component.  The relocation resolves
 * to the overlay-94 implementation even though the base symbol has an ov089
 * address-derived name in the recovered symbol set.
 */
s32 func_020241e0(Overlay50ComponentPresentation *self)
{
    return func_ov089_02218720(self->component08);
}

/*
 * Tail-forward the second operation.  The address-derived symbol is currently
 * typed as data because several overlays share that address; its call behavior
 * here is confirmed by the indirect branch sequence.
 */
s32 func_020241f0(Overlay50ComponentPresentation *self)
{
    return data_ov087_022189f8(self->component08);
}
