#include "tingle/types.h"

/* Overlay 17 scene rendering, including 2D setup and ordered 3D object-list submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceOwner_RenderManagers(void *, void *);
extern void Graphics3DLight_Apply(void *, s32);
extern void Graphics3DSceneState_Apply(void *);
extern void Graphics3DRenderObject_Draw(void *);
extern void func_020b0558(void);
extern void Overlay017_RenderGridGeometry(void *);
extern void Overlay017_WritePolygonAttributes(s32, s32, s32, s32, s32, s32);
extern void Overlay017_ClearTextureParameters(void);
extern void Overlay017Transform_SubmitGeometry(void *);
extern s32 Overlay017_ResolveEffectResourceEntry(void *, s32);
extern void Overlay017_ExportEffectTransform(void *, void *);
extern void func_ov017_02200a8c(u16, u16, s32);
#ifndef MATCHING
extern void TingleNativeG3_Push(void);
extern void TingleNativeG3_Pop(u32 count);
#endif
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
extern "C" void Overlay017_RenderScene(void *state)
{
    s32 i;
    void *node;

    func_020b0558();
    Graphics3DRenderObject_Draw(FIELD(void *, state, 0x2bc));
    Graphics3DSceneState_Apply((u8 *)state + 0x310);

    for (i = 0; i < 4; i++) {
        Graphics3DLight_Apply((u8 *)state + 0x2d0 + i * 0x10, i);
    }

    *(volatile u32 *)0x040004c4 = 0;
    Overlay017_WritePolygonAttributes(0, 0, 2, 0, 0x1f, 0);
    Overlay017_ClearTextureParameters();

    *(volatile u32 *)0x04000444 = 0;
#ifndef MATCHING
    TingleNativeG3_Push();
#endif
    Overlay017Transform_SubmitGeometry((u8 *)state + 0x264);
    Overlay017_ResolveEffectResourceEntry((u8 *)state + 0x264,
                        FIELD(s32, data_ov017_022016e0, 0xc));
    *(volatile u32 *)0x04000448 = 1;
#ifndef MATCHING
    TingleNativeG3_Pop(1);
#endif

    Overlay017_WritePolygonAttributes(0, 0, 2, 0x20, 0x1f, 0);
    *(volatile u32 *)0x040004c0 = 0x2108ffff;
    node = FIELD(void *, data_ov017_022016e0, 0x78);
    while (node != 0) {
        *(volatile u32 *)0x04000444 = 0;
#ifndef MATCHING
        TingleNativeG3_Push();
#endif
        Overlay017Transform_SubmitGeometry((u8 *)node + 0xbc);
        Overlay017_ResolveEffectResourceEntry((u8 *)node + 0xbc, 0);
        *(volatile u32 *)0x04000448 = 1;
#ifndef MATCHING
        TingleNativeG3_Pop(1);
#endif
        node = FIELD(void *, node, 8);
    }

    Overlay017_WritePolygonAttributes(2, 0, 2, 4, 0x1f, 0);
    func_ov017_02200a8c(FIELD(u16, state, 0x43a),
                        FIELD(u16, state, 0x43c), 1);

    node = FIELD(void *, state, 0x3f0);
    while (node != 0) {
        *(volatile u32 *)0x04000444 = 0;
#ifndef MATCHING
        TingleNativeG3_Push();
#endif
        Overlay017_ExportEffectTransform(node, (u8 *)state + 0x290);
        *(volatile u32 *)0x04000448 = 1;
#ifndef MATCHING
        TingleNativeG3_Pop(1);
#endif
        node = FIELD(void *, node, 8);
    }

    func_ov017_02200a8c(FIELD(u16, state, 0x438), 0, 1);
    Overlay017_RenderGridGeometry(FIELD(void *, state, 0x2c0));
    *(volatile u32 *)0x04000444 = 0;
#ifndef MATCHING
    TingleNativeG3_Push();
#endif
    Graphics3DResourceOwner_RenderManagers(FIELD(void *, state, 0x240), (u8 *)state + 0x368);
    *(volatile u32 *)0x04000448 = 1;
#ifndef MATCHING
    TingleNativeG3_Pop(1);
#endif
    *(volatile u32 *)0x04000540 = 0;
}
