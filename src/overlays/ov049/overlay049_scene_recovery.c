#include "tingle/types.h"

/*
 * Overlay 49 scene/effect construction. The recovered routine allocates and
 * initializes the derived render object and controller, binds resources, and
 * installs scene callbacks. Exact assembly preserves allocation cleanup paths
 * and SDK ownership transitions.
 */

/*
 * Submit all ten controller records to the shared effect renderer. Idle
 * records render their five-point trails with phase-selected colors and
 * scales; positive-state records render a centered burst with state-selected
 * parameters. Temporary vectors are destroyed before return. Renderer state
 * changes through SDK helpers, while controller ownership is unchanged.
 */
extern "C" const s16 gFx32CosSinTable[];
extern "C" const u16 data_ov049_0220d31a[];
extern "C" void *gGamePhaseRuntime;
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void *RuntimePresentationManager_GetGraphics3dPresentation(void *);
extern "C" void *func_0209b7ec(void *, s32);
extern "C" void func_0209b880(void *, const void *, const void *, const void *,
                               s32, u16, s32);
extern "C" void GraphicsImmediateEffectRenderer_SetupProjection(void *);
extern "C" void GraphicsImmediateEffectRenderer_DrawTexturedQuad(void *, const void *, const void *, u16,
                               const void *, s32, const void *, s32, s32);
extern "C" void func_ov049_0220c21c(void *);
extern "C" void func_ov049_0220c23c(void *, const void *);

extern "C" void func_ov049_0220cf94(void *controller)
{
    u8 *state = (u8 *)controller;
    u16 colors[6];
    for (s32 i = 0; i < 6; ++i)
        colors[i] = data_ov049_0220d31a[i];

    static const s32 trailScales[10][2] = {
        {0x10000, 0x50000}, {0x30000, 0x50000},
        {0x10000, 0x40000}, {0x30000, 0x40000},
        {0x10000, 0x30000}, {0x30000, 0x30000},
        {0x10000, 0x20000}, {0x30000, 0x20000},
        {0x10000, 0x10000}, {0x30000, 0x10000},
    };
    u8 *graphicsRoot = (u8 *)gGamePhaseRuntime;
    void *renderer = func_0209b7ec(RuntimePresentationManager_GetGraphics3dPresentation(graphicsRoot + 0x2f7c), 0);
    for (s32 recordIndex = 9; recordIndex >= 0; --recordIndex) {
        s16 status = *(s16 *)(state + 0x644 + recordIndex * 2);
        if (status != 0)
            continue;
        u8 points[5 * 0xc];
        s32 weights[5];
        for (s32 point = 0; point < 5; ++point) {
            func_ov049_0220c21c(points + point * 0xc);
            weights[point] = 0xc000;
            func_ov049_0220c23c(points + point * 0xc,
                                state + 4 + recordIndex * 0x3c + point * 0xc);
            u16 turn = *(u16 *)(state + 0x658 + recordIndex * 2);
            *(s32 *)(points + point * 0xc + 8) +=
                gFx32CosSinTable[(turn >> 4) * 2] * -20;
        }
        s32 selector = recordIndex % 4;
        s16 hold = *(s16 *)(state + 0x694 + recordIndex * 2);
        if ((((hold + (hold < 0)) / 2) & 1) != 0)
            selector = 5;
        if (*(s16 *)(state + 0x66c + recordIndex * 2) > 0)
            selector = 4;
        func_0209b880(renderer, points, weights, trailScales, 5,
                      colors[selector], recordIndex - 0x1000);
    }

    u8 scale[0x10];
    VecFx32Object_InitComponents(scale, 0x1000, 0x1000, 0x1000);
    static const s32 burstParameters[5][4] = {
        {0, 0, 0x20000, 0x20000},
        {0, 0, 0x20000, 0x20000},
        {0x20000, 0, 0x40000, 0x20000},
        {0x40000, 0, 0x60000, 0x20000},
        {0x60000, 0, 0x80000, 0x20000},
    };
    const s32 shape[2] = {-20, -20};
    GraphicsImmediateEffectRenderer_SetupProjection(renderer);
    for (s32 recordIndex = 9; recordIndex >= 0; --recordIndex) {
        s16 status = *(s16 *)(state + 0x644 + recordIndex * 2);
        if (status > 0) {
            u8 position[0x10];
            VecFx32Object_Init(position);
            u8 *record = state + recordIndex * 0x3c;
            *(s32 *)(position + 4) = *(s32 *)(record + 0x20);
            *(s32 *)(position + 8) = *(s32 *)(record + 0x24);
            *(s32 *)(position + 0xc) = 0;
            GraphicsImmediateEffectRenderer_DrawTexturedQuad(renderer, position, scale,
                          *(u16 *)(state + 0x694 + recordIndex * 2),
                          shape, 0x1b, burstParameters[status], 0x7fff, 0x14);
            VecFx32Object_Destroy(position);
        }
    }
    VecFx32Object_Destroy(scale);
}
