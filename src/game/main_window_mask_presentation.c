#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Install a fixed main-engine display/window-mask state through a minimal
 * presentation object. The object has no per-frame work; its separate hardware
 * callback selects DISPCNT display bit 15 and configures WINOUT masks.
 */
typedef struct MainWindowMaskPresentation {
    void **vtable_00;
    u32 dispatchState;
} MainWindowMaskPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020de838[];
extern const char data_020de858[];
extern u8 *gGamePhaseRuntime;

extern void RuntimePresentationManager_AppendSecondListEffect(void *, void *);

/* Initialize the presentation, install its vtable, and set FieldEffect dispatch-state bit 1. */
MainWindowMaskPresentation *MainWindowMaskPresentation_Init(MainWindowMaskPresentation *self)
{
    FieldEffect_Init(self);
    self->vtable_00 = (void **)data_020de838;
    self->dispatchState |= 2;
    return self;
}

/* Tear down the FieldEffect base and return self. */
MainWindowMaskPresentation *MainWindowMaskPresentation_Destroy(MainWindowMaskPresentation *self)
{
    FieldEffect_DestroyBase(self);
    return self;
}

/* Tear down, free the presentation, and return its old address. */
MainWindowMaskPresentation *MainWindowMaskPresentation_DestroyAndFree(MainWindowMaskPresentation *self)
{
    FieldEffect_DestroyBase(self);
    Heap_Free(self);
    return self;
}

/* Perform no per-frame state change and return zero to remain active. */
s32 MainWindowMaskPresentation_Update(MainWindowMaskPresentation *self)
{
    (void)self;
    return 0;
}

/*
 * Replace DISPCNT bits 13..15 with bit 15, then set WINOUT's outside-window
 * plane mask to 0x3f and OBJ-window plane mask to 0x1d.
 */
void MainWindowMaskPresentation_ApplyHardwareState(void)
{
    u32 display = *(volatile u32 *)0x04000000;
    u16 winout;
    display = (display & ~0xe000u) | 0x8000;
    *(volatile u32 *)0x04000000 = display;
    winout = *(volatile u16 *)0x0400004a;
    winout = (winout & ~0x3f00u) | 0x1d00;
    winout = (winout & ~0x003fu) | 0x003f;
    *(volatile u16 *)0x0400004a = winout;
}

/* Allocate an eight-byte instance and enqueue it at global offset 0x2f7c. */
void MainWindowMaskPresentation_CreateAndRegister(void)
{
    void *manager = gGamePhaseRuntime + 0x2f7c;
    MainWindowMaskPresentation *self =
        (MainWindowMaskPresentation *)Heap_Alloc(
            sizeof(MainWindowMaskPresentation), data_020de858, 4,
            &gHeapContext);
    if (self)
        self = MainWindowMaskPresentation_Init(self);
    RuntimePresentationManager_AppendSecondListEffect(manager, self);
}

#ifdef __cplusplus
}
#endif
