#include "tingle/actor_runtime_grid_canvas.h"

/* Configure sub-screen BG2 and bind the grid canvas to its 16-bit pixel buffer. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GXS_SetGraphicsMode(s32 mode);
extern void GX_SetBankForSubBG(s32 bank);
extern u16 *func_020afaec(void);
extern void func_020afd28(volatile void *registers, const s32 *matrix,
                          s32 centerX, s32 centerY);
#ifdef __cplusplus
}
#endif

/*
 * Select sub graphics mode 5 and sub-BG bank 4, configure sub BG2 control and
 * display-control fields, install an identity affine transform, obtain the
 * sub-BG pixel buffer, copy a temporary 256-stride SoftwareCanvas binding into
 * self, clear a 256x256 region, and draw the initial grid via func_0200c178.
 * Returns no value and directly writes Nintendo DS sub-engine registers at
 * 0x04001000/0x0400100c in addition to SDK graphics calls.
 */
void func_0200bf20(ActorRuntimeGridCanvas *self)
{
    volatile u16 *bg2Control = (volatile u16 *)0x0400100c;
    volatile u32 *displayControl = (volatile u32 *)0x04001000;
    s32 matrix[4] = {0x1000, 0, 0, 0x1000};
    SoftwareCanvas temporary;
    u16 *pixels;

    GXS_SetGraphicsMode(5);
    GX_SetBankForSubBG(4);
    *bg2Control = (*bg2Control & 0x43) | 0x4084;
    *displayControl = (*displayControl & ~0x1f00) | 0x1400;
    func_020afd28((volatile u8 *)bg2Control + 0x14, matrix, 0, 0);

    pixels = func_020afaec();
    func_02005dac(&temporary, 0, pixels, 0x100, 0);
    self->base.field_04 = temporary.field_04;
    self->base.pixels = temporary.pixels;
    self->base.stride = temporary.stride;
    self->base.field_10 = temporary.field_10;
    func_02005dc8(&temporary);
    func_02005f38(&self->base, 0, 0, 0x100, 0x100, 0);
    func_0200c178(self);
}
