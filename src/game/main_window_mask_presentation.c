#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Install a fixed main-engine display/window-mask state through a minimal
 * presentation object. The object has no per-frame work; its separate hardware
 * callback selects DISPCNT display bit 15 and configures WINOUT masks.
 */
typedef struct MainWindowMaskPresentation {
    void **vtable_00;
    u32 baseFlags_04;
} MainWindowMaskPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020de838[];
extern const char data_020de858[];
extern u8 *data_021052fc;
extern void TimedSpritePresentation_InitBase(void *);
extern void func_0201e28c(void *);
extern void func_0201df44(void *, void *);

/* Initialize the presentation, install its vtable, and set base flag bit one. */
MainWindowMaskPresentation *func_02028778(MainWindowMaskPresentation *self)
{
    TimedSpritePresentation_InitBase(self);
    self->vtable_00 = (void **)data_020de838;
    self->baseFlags_04 |= 2;
    return self;
}

/* Tear down the presentation base and return self. */
MainWindowMaskPresentation *func_020287a4(MainWindowMaskPresentation *self)
{
    func_0201e28c(self);
    return self;
}

/* Tear down, free the presentation, and return its old address. */
MainWindowMaskPresentation *func_020287b8(MainWindowMaskPresentation *self)
{
    func_0201e28c(self);
    Heap_Free(self);
    return self;
}

/* Perform no per-frame state change and return zero to remain active. */
s32 func_020287d4(MainWindowMaskPresentation *self)
{
    (void)self;
    return 0;
}

/*
 * Replace DISPCNT bits 13..15 with bit 15, then set WINOUT's outside-window
 * plane mask to 0x3f and OBJ-window plane mask to 0x1d.
 */
void func_020287dc(void)
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
void func_02028814(void)
{
    void *manager = data_021052fc + 0x2f7c;
    MainWindowMaskPresentation *self =
        (MainWindowMaskPresentation *)Heap_Alloc(
            sizeof(MainWindowMaskPresentation), data_020de858, 4,
            &gHeapContext);
    if (self)
        self = func_02028778(self);
    func_0201df44(manager, self);
}

#ifdef __cplusplus
}
#endif
