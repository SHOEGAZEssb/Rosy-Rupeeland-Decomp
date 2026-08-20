#include "tingle/types.h"

/*
 * Overlay 47 capture-transition rendering. The recovered routine configures
 * display capture, clipping, texture state, and geometry FIFO commands for the
 * controller's animated quadrilateral. Exact assembly is retained because it
 * contains long sequences of volatile Nintendo DS MMIO writes.
 */

/*
 * Render one frame for `controller`. The routine resets shared 3D state,
 * installs an orthographic camera, configures capture through
 * func_ov047_0220c2c8, programs texture/polygon state from resource fields
 * +0x30/+0x34/+0x38..+0x40, submits rectangle edges +0x10..+0x1C to the
 * geometry FIFO, and conditionally draws the loaded model/animation according
 * to transition kind +0x20. It advances transition interpolation and returns
 * no value. This function directly affects capture, display, and geometry MMIO
 * plus SDK 3D state; its repeated command words are hardware packet encodings.
 */
typedef struct Overlay047RenderController {
    void *model00, *animation04;
    s32 originX08, originY0c;
    s32 left10, top14, right18, bottom1c;
    s32 kind20, frame24, terminalFrame28, repeatCount2c;
    s32 textureOffset30, paletteOffset34;
    u32 textureParam38, textureWidth3c, textureHeight40;
} Overlay047RenderController;

extern "C" void func_020b0a54(s32, s32, s32, s32, s32, s32, s32, s32, s32);
extern "C" void func_ov047_0220c2c8(u32, u32, u32, u32,
                                     u32, u32, u32, u32);
extern "C" void func_ov047_0220c308(s32, s32, s32);

static u32 pack_xy(s32 x, s32 y)
{
    return ((u32)(u16)y << 16) | (u16)x;
}

static void draw_untextured_quad(const Overlay047RenderController *self)
{
    volatile u32 *begin = (volatile u32 *)0x04000500;
    volatile u32 *xy = (volatile u32 *)0x04000494;
    *begin = 1;
    *(volatile u32 *)0x04000480 = 0;
    func_ov047_0220c308(self->left10, self->top14, -0x1000);
    *xy = pack_xy(self->left10, self->bottom1c);
    *xy = pack_xy(self->right18, self->bottom1c);
    *xy = pack_xy(self->right18, self->top14);
    *(volatile u32 *)0x04000504 = 0;
}

extern "C" void func_ov047_0220bda8(void *controller)
{
    Overlay047RenderController *self = (Overlay047RenderController *)controller;
    volatile u32 *matrixMode = (volatile u32 *)0x04000440;
    volatile u32 *matrixIdentity = (volatile u32 *)0x04000454;
    volatile u32 *matrixTranslate = (volatile u32 *)0x04000470;

    *(volatile u32 *)0x04000444 = 0;
    *(volatile u32 *)0x04000440 = 0;
    *(volatile u32 *)0x04000454 = 0;
    func_020b0a54(0, 0xc0000, 0, 0x100000, 0x1000,
                   0x8000, 0x1000, 1, 0);
    *matrixMode = 3;
    *matrixIdentity = 0;
    *matrixMode = 2;
    *matrixIdentity = 0;
    *matrixTranslate = 0x01000000;
    *matrixTranslate = 0x01000000;
    *matrixTranslate = 0x1000;
    *(volatile u32 *)0x040004a4 = 0x3c1f00c0;

    if (self->kind20 == 1 || self->kind20 == 2 ||
        (u32)(self->kind20 - 11) <= 3) {
        volatile u32 *texcoord = (volatile u32 *)0x04000488;
        volatile u32 *xy = (volatile u32 *)0x04000494;
        u32 paletteShift = self->textureParam38 == 2 ? 3 : 4;
        func_ov047_0220c2c8(self->textureParam38, (u32)self->kind20,
                            self->textureWidth3c,
                            self->textureHeight40, 3, 3, 1,
                            (u32)self->textureOffset30);
        *(volatile u32 *)0x040004ac = (u32)self->paletteOffset34 >> paletteShift;
        *(volatile u32 *)0x04000500 = 1;
        *(volatile u32 *)0x04000480 = 0;
        func_ov047_0220c308(self->left10, self->top14, -0x1000);
        *texcoord = 0x08000000;
        *xy = pack_xy(self->left10, self->bottom1c);
        *texcoord = 0x08000800;
        *xy = pack_xy(self->right18, self->bottom1c);
        *texcoord = 0x800;
        *xy = pack_xy(self->right18, self->top14);
        func_ov047_0220c2c8(0, 0, 0, 0, 0, 0, 0, 0);
        {
            volatile u32 *commands = (volatile u32 *)0x04000400;
            *commands = 0xfffefffe;
            *commands = 0x00c2fffe;
            *commands = 0x00c20000 | (u16)self->left10;
            *commands = 0xfffe0000 | (u16)self->left10;
            *commands = 0xfffe0000 | (u16)self->right18;
            *commands = 0x00c20000 | (u16)self->right18;
            *commands = 0x00c20102;
            *commands = 0xfffe0102;
            *commands = 0xfffe0000 | (u16)self->left10;
            *commands = pack_xy(self->left10, self->top14);
            *commands = pack_xy(self->right18, self->top14);
            *commands = 0xfffe0000 | (u16)self->right18;
            *commands = pack_xy(self->left10, self->bottom1c);
            *commands = 0x00c20000 | (u16)self->left10;
            *commands = 0x00c20000 | (u16)self->right18;
            *commands = pack_xy(self->right18, self->bottom1c);
            *(volatile u32 *)0x04000470 = 0;
        }
    } else if ((u32)(self->kind20 - 3) <= 7) {
        func_ov047_0220c2c8(0, 0, 0, 0, 0, 0, 0, 0);
        draw_untextured_quad(self);
    }
    *(volatile u32 *)0x04000448 = 1;
}
