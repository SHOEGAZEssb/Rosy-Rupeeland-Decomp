#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Adapt an overlay-94 0x2c-byte component to the common presentation base.
 * The wrapper owns the component and an embedded helper configured with ID
 * 0x5e, and forwards its two observable presentation operations.
 */

typedef struct Overlay2cComponentPresentation {
    void **vtable00;
    u32 field04;
    void *component08;
    u8 helper0c[0x10];
} Overlay2cComponentPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d695c;
extern const char data_020d69cc[];
extern void func_0201e250(void *self);
extern void func_0201e28c(void *self);
extern void OverlaySlot_Init(void *helper);
extern void OverlaySlot_Destroy(void *helper);
extern void OverlaySlot_LoadOverlay(void *helper, s32 id);
extern void OverlaySlot_UnloadOverlay(void *helper);
extern void *func_ov094_02217c74(void *component);
extern void func_ov094_02217d20(void *component);
extern s32 func_ov094_02217d64(void *component);
extern s32 func_ov094_02217e94(void *component);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the common base and helper at offset 0x0c, configure helper ID
 * 0x5e, allocate the overlay component with 4-byte alignment, construct it
 * when allocation succeeds, store it at offset 8, and return self.
 */
Overlay2cComponentPresentation *func_02023fa0(
    Overlay2cComponentPresentation *self)
{
    func_0201e250(self);
    self->vtable00 = (void **)data_020d695c;
    OverlaySlot_Init(self->helper0c);
    OverlaySlot_LoadOverlay(self->helper0c, 0x5e);
    self->component08 = Heap_Alloc(0x2c, data_020d69cc, 4, &gHeapContext);
    if (self->component08 != 0) {
        self->component08 = func_ov094_02217c74(self->component08);
    }
    return self;
}

/*
 * Destroy and free the owned overlay component when present, perform both
 * helper teardown stages, tear down the common base, and return self.
 */
Overlay2cComponentPresentation *func_02024004(
    Overlay2cComponentPresentation *self)
{
    self->vtable00 = (void **)data_020d695c;
    if (self->component08 != 0) {
        func_ov094_02217d20(self->component08);
        Heap_Free(self->component08);
    }
    OverlaySlot_UnloadOverlay(self->helper0c);
    OverlaySlot_Destroy(self->helper0c);
    func_0201e28c(self);
    return self;
}

/* Perform func_02024004 teardown, free self, and return its old address. */
Overlay2cComponentPresentation *func_02024054(
    Overlay2cComponentPresentation *self)
{
    func_02024004(self);
    Heap_Free(self);
    return self;
}

/* Forward the first presentation operation to the owned overlay component. */
s32 func_020240ac(Overlay2cComponentPresentation *self)
{
    return func_ov094_02217d64(self->component08);
}

/* Forward the second presentation operation to the owned overlay component. */
s32 func_020240bc(Overlay2cComponentPresentation *self)
{
    return func_ov094_02217e94(self->component08);
}
