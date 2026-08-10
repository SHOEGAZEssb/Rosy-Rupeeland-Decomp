#include "tingle/game_phase_visual_effect.h"
#include "tingle/heap.h"

/* Initialize and destroy the phase state's resource-backed visual-effect helper. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d55e0;
#ifdef __cplusplus
}
#endif

/*
 * Install the vtable, initialize the resource set, four vectors, and stepper,
 * clear three owned pointers and scalar controls, set field_1e to 31, and set
 * flags_94 bit 3 while clearing its low/high nibbles. Returns self.
 */
GamePhaseVisualEffect *func_0200fa40(GamePhaseVisualEffect *self)
{
    s32 i;
    self->vtable = data_020d55e0;
    GraphicsResourceSet_Init(&self->resources);
    self->field_10 = 0;
    self->field_14 = 0;
    self->field_18 = 0;
    self->field_1c = 0;
    self->field_1e = 0x1f;
    for (i = 0; i < 4; i++)
        func_02004fe0(&self->vectors[i]);
    VecFx32Stepper_Init(&self->stepper);
    self->flags_94 = (self->flags_94 & ~0xff) | 8;
    self->field_98 = 0;
    self->field_9c = 0;
    self->field_9e = 0;
    self->field_a0 = 0;
    self->field_a2 = 0;
    return self;
}

/*
 * Disable the effect, release transient graphics resources, remove BG1 from
 * DISPCNT's enabled-plane mask, clear BLDCNT, and destroy the stepper, vectors,
 * and resource set. Returns self without freeing its storage.
 */
GamePhaseVisualEffect *func_0200fb34(GamePhaseVisualEffect *self)
{
    u32 display;
    s32 i;
    self->vtable = data_020d55e0;
    self->flags_94 &= ~1;
    self->field_18 = 0;
    func_02072000(&self->resources);
    display = *(volatile u32 *)0x04000000;
    display = (display & ~0x1f00) |
              ((((display & 0x1f00) >> 8) & ~2) << 8);
    *(volatile u32 *)0x04000000 = display;
    *(volatile u16 *)0x04000050 = 0;
    VecFx32Stepper_Destroy(&self->stepper);
    for (i = 3; i >= 0; i--)
        func_02005058(&self->vectors[i]);
    GraphicsResourceSet_Destroy(&self->resources);
    return self;
}

/* Perform full effect cleanup, free its allocation, and return its old address. */
GamePhaseVisualEffect *func_0200fbc8(GamePhaseVisualEffect *self)
{
    func_0200fb34(self);
    Heap_Free(self);
    return self;
}
