#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/palette_buffer.h"
#include "tingle/types.h"

/*
 * Implement a fixed-resource main-engine BG0 renderer. It configures BG0,
 * loads resource triplet 0xa00c..0xa00e, uploads graphics and tile-map data,
 * and routes a palette slice into the global main BG palette buffer.
 */
typedef struct MainBg0ResourceRenderer { void **vtable_00; } MainBg0ResourceRenderer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gMainBg0ResourceRendererVtable;
extern void *data_020f4e18;
extern PaletteBuffer gMainBgPaletteBuffer;
extern void DualLayerTileRendererBase_InitBase(void *);
extern void DualLayerTileRendererBase_Destroy(void *);
extern void DualLayerTileRenderer_LoadFromConfig(void *, const void *, s32,
                                                 s32);
extern void DualLayerTileRenderer_ActivateLayers(void *, s32);
extern void func_020b44e8(void);
extern void func_02070638(void *, s32, s32);
extern void func_02070e0c(void *, s32, s32);
extern u8 *GraphicsBgResourceData_GetDecoded(void *);
void MainBg0ResourceRenderer_LoadBgResources(MainBg0ResourceRenderer *);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
MainBg0ResourceRenderer *MainBg0ResourceRenderer_Init(MainBg0ResourceRenderer *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gMainBg0ResourceRendererVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
MainBg0ResourceRenderer *MainBg0ResourceRenderer_DestroyComplete(MainBg0ResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
MainBg0ResourceRenderer *MainBg0ResourceRenderer_DestroyAndFree(MainBg0ResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Forward the caller-owned config and mode selectors through the first common
 * activation path, then load and upload the BG0 resources. */
void MainBg0ResourceRenderer_ActivatePrimary(
    MainBg0ResourceRenderer *self, const void *config, s32 mode, s32 variant)
{
    DualLayerTileRenderer_LoadFromConfig(self, config, mode, variant);
    MainBg0ResourceRenderer_LoadBgResources(self);
}

/* Forward the caller's notification flag through the second common activation
 * path, then load and upload the BG0 resources. */
void MainBg0ResourceRenderer_ActivateSecondary(MainBg0ResourceRenderer *self,
                                               s32 notify)
{
    DualLayerTileRenderer_ActivateLayers(self, notify);
    MainBg0ResourceRenderer_LoadBgResources(self);
}

/*
 * Configure main BG0, set priority three, enable its DISPCNT plane, load IDs
 * 0xa00c..0xa00e, upload resource0/resource2 for BG0 index zero, and copy 0x80
 * palette bytes from resource1+0x180 to main palette offset 0x180. Release and
 * destroy the temporary set; calls may update VRAM and cache state.
 */
void MainBg0ResourceRenderer_LoadBgResources(MainBg0ResourceRenderer *self)
{
    GraphicsResourceSet set;
    volatile u16 *bg0 = (volatile u16 *)0x04000008;
    volatile u32 *disp = (volatile u32 *)0x04000000;
    u32 planes;

    (void)self;
    GraphicsResourceSet_Init(&set);
    *bg0 = (*bg0 & 0x43) | 0x1808;
    *bg0 = (*bg0 & ~3u) | 3;
    planes = ((*disp >> 8) & 0x1f) | 1;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa00c, 0xa00d, 0xa00e);
    func_020b44e8();
    func_02070638(set.resource0, 0, 0);
    func_02070e0c(set.resource2, 0, 0);
    PaletteBuffer_Write(&gMainBgPaletteBuffer, GraphicsBgResourceData_GetDecoded(set.resource1) + 0x180,
                        0x180, 0x80);
    GraphicsResourceSet_ReleaseHandles(&set);
    GraphicsResourceSet_Destroy(&set);
}
