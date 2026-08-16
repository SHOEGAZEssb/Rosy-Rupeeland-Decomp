#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/palette_buffer.h"
#include "tingle/types.h"

/*
 * Implement a dual-layer renderer variant for main-engine BG0/BG1. It loads
 * two fixed resource triplets, routes their graphics and tile maps through the
 * main-engine upload APIs, copies palette data into the global main BG palette
 * buffer, and configures the corresponding display planes.
 */
typedef struct MainDualLayerResourceRenderer {
    void **vtable_00;
} MainDualLayerResourceRenderer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gMainDualLayerResourceRendererVtable;
extern void *data_020f4e18;
extern PaletteBuffer gMainBgPaletteBuffer;
extern void DualLayerTileRendererBase_InitBase(void *self);
extern void DualLayerTileRendererBase_Destroy(void *self);
extern void DualLayerTileRenderer_LoadFromConfig(void *self,
                                                 const void *config,
                                                 s32 mode, s32 variant);
extern void DualLayerTileRenderer_ActivateLayers(void *self, s32 notify);
extern void func_020b44e8(void);
extern void func_02070638(void *resource, s32 background, s32 value);
extern void func_02070e0c(void *resource, s32 background, s32 value);
extern u8 *func_02070874(void *resource);
void MainDualLayerResourceRenderer_LoadBgResources(MainDualLayerResourceRenderer *self);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
MainDualLayerResourceRenderer *MainDualLayerResourceRenderer_Init(MainDualLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gMainDualLayerResourceRendererVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
MainDualLayerResourceRenderer *MainDualLayerResourceRenderer_DestroyComplete(MainDualLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
MainDualLayerResourceRenderer *MainDualLayerResourceRenderer_DestroyAndFree(MainDualLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Forward the caller-owned config and mode selectors through the first common
 * activation path, then perform this variant's resource setup. */
void MainDualLayerResourceRenderer_ActivatePrimary(
    MainDualLayerResourceRenderer *self, const void *config, s32 mode,
    s32 variant)
{
    DualLayerTileRenderer_LoadFromConfig(self, config, mode, variant);
    MainDualLayerResourceRenderer_LoadBgResources(self);
}

/* Forward the caller's notification flag through the second common activation
 * path, then perform this variant's resource setup. */
void MainDualLayerResourceRenderer_ActivateSecondary(
    MainDualLayerResourceRenderer *self, s32 notify)
{
    DualLayerTileRenderer_ActivateLayers(self, notify);
    MainDualLayerResourceRenderer_LoadBgResources(self);
}

/*
 * Configure main BG0, load IDs 0xa006..0xa008, upload its graphics/tile map,
 * and copy 0x80 palette bytes from resource1+0x180 to main palette offset
 * 0x180. Release that triplet, configure main BG1, load IDs 0xa000..0xa002,
 * upload its tile map, then destroy the temporary set. The routine updates
 * VRAM/cache state, the main BG palette buffer, BG0CNT/BG1CNT, and main
 * DISPCNT plane-enable bits.
 */
void MainDualLayerResourceRenderer_LoadBgResources(MainDualLayerResourceRenderer *self)
{
    GraphicsResourceSet resources;
    u8 *palette;
    volatile u16 *bg0cnt = (volatile u16 *)0x04000008;
    volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
    volatile u32 *dispcnt = (volatile u32 *)0x04000000;
    u32 planes;

    (void)self;
    GraphicsResourceSet_Init(&resources);
    *bg0cnt = (*bg0cnt & 0x43) | 0x1808;
    *bg0cnt = (*bg0cnt & ~3u) | 3;
    planes = ((*dispcnt >> 8) & 0x1f) | 1;
    *dispcnt = (*dispcnt & ~0x1f00u) | (planes << 8);
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xa006, 0xa007, 0xa008);
    func_020b44e8();
    func_02070638(resources.resource0, 0, 0);
    func_02070e0c(resources.resource2, 0, 0);
    palette = func_02070874(resources.resource1);
    PaletteBuffer_Write(&gMainBgPaletteBuffer, palette + 0x180, 0x180, 0x80);
    GraphicsResourceSet_ReleaseHandles(&resources);

    *bg1cnt = (*bg1cnt & 0x43) | 0x1a00;
    *bg1cnt &= ~3u;
    planes = ((*dispcnt >> 8) & 0x1f) | 2;
    *dispcnt = (*dispcnt & ~0x1f00u) | (planes << 8);
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xa000, 0xa001, 0xa002);
    func_020b44e8();
    func_02070e0c(resources.resource2, 1, 0);
    GraphicsResourceSet_Destroy(&resources);
}
