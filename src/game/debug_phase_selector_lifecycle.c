#include "tingle/debug_phase_selector.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Construct and destroy the hidden debug scene used to select a game phase. */

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_020d52c8;
extern void GXx_SetMasterBrightness_(volatile void *registerAddress,
                                     s32 brightness);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0As);
extern void DisplayBrightness_StartMainTransition(s32 screen, s32 frames);
extern void DisplayBrightness_StartSubTransition(s32 screen, s32 frames);
extern void func_020ae90c(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the Scene and embedded grid, darken both engines to -16, select
 * main graphics mode 1/BG mode 0 and enable BG0, initialize sub-screen grid
 * graphics, start two screen-1 fades, reset GameWork, and route the sub engine
 * to the selected LCD. State starts at 0, selectedPhase at -1, and row/column
 * at zero. Returns self; SDK calls and display registers are modified.
 */
DebugPhaseSelector *func_0200c244(DebugPhaseSelector *self)
{
    volatile u32 *displayControl = (volatile u32 *)0x04000000;

    Scene_Init(&self->base);
    self->base.vtable = &data_020d52c8;
    self->state = 0;
    self->selectedPhase = -1;
    ActorRuntimeGridCanvas_Init(&self->grid);
    GXx_SetMasterBrightness_((volatile void *)0x0400006c, -16);
    GXx_SetMasterBrightness_((volatile void *)0x0400106c, -16);
    GX_SetGraphicsMode(1, 0, 0);
    *displayControl = (*displayControl & ~0x1f00) | 0x1000;
    self->column = 0;
    self->row = 0;
    ActorRuntimeGridCanvas_SetupSubBg2(&self->grid);
    DisplayBrightness_StartMainTransition(1, 0x10);
    DisplayBrightness_StartSubTransition(1, 0x10);
    GameWork_Reset();
    NdsDisplay_SetScreenSwap(1);
    return self;
}

/*
 * Restore the scene vtable, run address-derived debug cleanup, destroy the
 * embedded canvas and Scene base, and return self without freeing it.
 */
DebugPhaseSelector *func_0200c2f8(DebugPhaseSelector *self)
{
    self->base.vtable = &data_020d52c8;
    func_020ae90c();
    SoftwareCanvas_Destroy(&self->grid.base);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform func_0200c2f8's teardown, free self, and return its old address. */
DebugPhaseSelector *func_0200c328(DebugPhaseSelector *self)
{
    func_0200c2f8(self);
    Heap_Free(self);
    return self;
}
