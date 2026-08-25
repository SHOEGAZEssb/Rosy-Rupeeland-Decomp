#include "tingle/types.h"

/*
 * Overlay 47 transition-controller construction. The recovered controller
 * owns a model/animation pair and derives a screen-space quadrilateral used
 * by the overlay's capture and geometry-engine transition effect. Exact
 * assembly retains the original switch layout and SDK resource call schedule.
 */

/*
 * Initialize caller-owned `controller` for transition `kind`, origin `x/y`,
 * and terminal frame count supplied as the fifth argument; return the same
 * pointer. It clears resource/current-state fields, conditionally reads a
 * GameWork halfword for kinds 11..14, loads the appropriate model/animation
 * pair for kinds 1..14, configures their SDK render objects and animation
 * offsets, stores origin +8/+0xC, and chooses initial rectangle endpoints
 * +0x10..+0x1C from the transition kind. Resource-manager and 3D SDK state
 * change; no direct MMIO occurs here. Constants and switch cases are confirmed
 * from control flow, while the semantic names of transition kinds are unknown.
 */
typedef struct Overlay047Controller {
    void *model00;
    void *animation04;
    s32 originX08, originY0c;
    s32 left10, top14, right18, bottom1c;
    s32 kind20, frame24, terminalFrame28, repeatCount2c;
    s32 textureOffset30, paletteOffset34;
    u32 textureParam38, textureWidth3c, textureHeight40;
} Overlay047Controller;

extern "C" void *data_020f4e18;
extern "C" void *gGameWork;
extern "C" void *GraphicsArchive_AcquireCharacterResource(void *, u32);
extern "C" void *GraphicsArchive_AcquirePaletteResource(void *, u32);
extern "C" s32 func_0207043c(void *);
extern "C" s32 func_02070888(void *);
extern "C" u32 func_02070474(void *);
extern "C" u32 func_020704c8(void *);
extern "C" u32 func_02070580(void *);
extern "C" void func_020b239c(void);
extern "C" void func_020b2238(void *, s32, s32);
extern "C" void func_020b21c8(void);
extern "C" void func_020b2180(void);
extern "C" void *GraphicsBgResourceData_GetDecoded(void *);
extern "C" void func_020b210c(void *, s32, s32);
extern "C" void func_020b20b4(void);
extern "C" void GraphicsSpriteResource_ReleaseTexture(void *);

extern "C" void *func_ov047_0220b740(void *controller, s32 kind, s32 x,
                                      s32 y, s32 terminalFrame)
{
    Overlay047Controller *self = (Overlay047Controller *)controller;
    self->kind20 = kind;
    self->terminalFrame28 = terminalFrame;
    self->frame24 = self->repeatCount2c = 0;
    self->model00 = self->animation04 = 0;

    if ((u32)(kind - 11) <= 3)
        self->repeatCount2c = *(s16 *)((u8 *)gGameWork + 0x202);

    if (kind == 1 || kind == 2 || (u32)(kind - 11) <= 3) {
        u32 modelId = (kind == 13 || kind == 14) ? 0x6128 : 0x6126;
        u32 animationId = (kind == 13 || kind == 14) ? 0x6129 : 0x6127;
        self->model00 = GraphicsArchive_AcquireCharacterResource(data_020f4e18, modelId);
        self->animation04 = GraphicsArchive_AcquirePaletteResource(data_020f4e18, animationId);
        self->textureOffset30 = 0x20000 - func_0207043c(self->model00);
        self->paletteOffset34 = 0x4000 - func_02070888(self->animation04);
        self->textureParam38 = func_02070474(self->model00);
        self->textureWidth3c = func_020704c8(self->model00);
        self->textureHeight40 = func_02070580(self->model00);
        func_020b239c();
        func_020b2238(*(void **)((u8 *)self->model00 + 0x24),
                       self->textureOffset30, func_0207043c(self->model00));
        func_020b21c8();
        func_020b2180();
        func_020b210c(GraphicsBgResourceData_GetDecoded(self->animation04),
                       self->paletteOffset34, func_02070888(self->animation04));
        func_020b20b4();
        GraphicsSpriteResource_ReleaseTexture(self->model00);
        self->originX08 = x < 0 ? 0 : (x > 0x100 ? 0x100 : x);
        self->originY0c = y < 0 ? 0 : (y > 0xc0 ? 0xc0 : y);
        if (kind == 1 || kind == 11 || kind == 13) {
            self->left10 = self->originX08 - 0x180;
            self->top14 = self->originY0c - 0x180;
            self->right18 = self->originX08 + 0x180;
            self->bottom1c = self->originY0c + 0x180;
        } else {
            self->left10 = self->right18 = self->originX08;
            self->top14 = self->bottom1c = self->originY0c;
        }
    } else if (kind == 3) {
        self->left10 = self->top14 = self->right18 = 0; self->bottom1c = 0xc0;
    } else if (kind == 4) {
        self->left10 = self->right18 = 0x100; self->top14 = 0; self->bottom1c = 0xc0;
    } else if (kind == 5) {
        self->left10 = 0; self->right18 = 0x100; self->top14 = self->bottom1c = 0;
    } else if (kind == 6) {
        self->left10 = 0; self->right18 = 0x100;
        self->top14 = self->bottom1c = 0xc0;
    } else {
        self->left10 = self->top14 = 0; self->right18 = 0x100; self->bottom1c = 0xc0;
    }
    return self;
}
