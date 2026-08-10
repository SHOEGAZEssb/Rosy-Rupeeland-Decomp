#include "tingle/types.h"

/* Overlay 17 scene rendering, including 2D setup and ordered 3D object-list submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceOwner_RenderManagers(void *, void *);
extern void Graphics3DLight_Apply(void *, s32);
extern void func_02077b44(void *);
extern void Graphics3DRenderObject_Draw(void *);
extern void func_020b0558(void);
extern void func_ov017_021fd414(void *);
extern void func_ov017_021fd60c(s32, s32, s32, s32, s32, s32);
extern void func_ov017_021fd638(void);
extern void func_ov017_021fd838(void *);
extern s32 func_ov017_021fd918(void *, s32);
extern void func_ov017_021fe33c(void *, void *);
extern void func_ov017_02200a8c(u16, u16, s32);
#ifdef __cplusplus
}
#endif

/*
 * Reset geometry state, update the scene's 2D objects, and submit its 3D
 * transform, global-object, effect-object, grid, and final 2D layers in the
 * recovered order. The global lists use link +0x08; their payload transforms
 * are at +0xBC. State and list nodes are read, SDK render state changes, and
 * the DS polygon, texture/palette, and display-control MMIO registers are
 * written directly. Returns void.
 */
extern "C" void func_ov017_022008ac(void *state)
{
    s32 i;
    void *node;

    func_020b0558();
    Graphics3DRenderObject_Draw(FIELD(void *, state, 0x2bc));
    func_02077b44((u8 *)state + 0x310);

    for (i = 0; i < 4; i++) {
        Graphics3DLight_Apply((u8 *)state + 0x2d0 + i * 0x10, i);
    }

    *(volatile u32 *)0x040004c4 = 0;
    func_ov017_021fd60c(0, 0, 2, 0, 0x1f, 0);
    func_ov017_021fd638();

    *(volatile u32 *)0x04000444 = 0;
    func_ov017_021fd838((u8 *)state + 0x264);
    func_ov017_021fd918((u8 *)state + 0x264,
                        FIELD(s32, data_ov017_022016e0, 0xc));
    *(volatile u32 *)0x04000448 = 1;

    func_ov017_021fd60c(0, 0, 2, 0x20, 0x1f, 0);
    *(volatile u32 *)0x040004c0 = 0x2108ffff;
    node = FIELD(void *, data_ov017_022016e0, 0x78);
    while (node != 0) {
        *(volatile u32 *)0x04000444 = 0;
        func_ov017_021fd838((u8 *)node + 0xbc);
        func_ov017_021fd918((u8 *)node + 0xbc, 0);
        *(volatile u32 *)0x04000448 = 1;
        node = FIELD(void *, node, 8);
    }

    func_ov017_021fd60c(2, 0, 2, 4, 0x1f, 0);
    func_ov017_02200a8c(FIELD(u16, state, 0x43a),
                        FIELD(u16, state, 0x43c), 1);

    node = FIELD(void *, state, 0x3f0);
    while (node != 0) {
        *(volatile u32 *)0x04000444 = 0;
        func_ov017_021fe33c(node, (u8 *)state + 0x290);
        *(volatile u32 *)0x04000448 = 1;
        node = FIELD(void *, node, 8);
    }

    func_ov017_02200a8c(FIELD(u16, state, 0x438), 0, 1);
    func_ov017_021fd414(FIELD(void *, state, 0x2c0));
    *(volatile u32 *)0x04000444 = 0;
    Graphics3DResourceOwner_RenderManagers(FIELD(void *, state, 0x240), (u8 *)state + 0x368);
    *(volatile u32 *)0x04000448 = 1;
    *(volatile u32 *)0x04000540 = 0;
}
