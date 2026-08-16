#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a dual-layer renderer variant for sub-engine BG0/BG1. It loads
 * two fixed graphics-resource triplets, adjusts BG control/display registers,
 * remaps BG1 tile palette indices, copies palette data into renderer-owned
 * storage, and delegates common lifecycle/update work to the base renderer.
 */
typedef struct ResourceDimensions {
    u8 field_00[0x0c];
    s32 rows_0c;
    s32 columns_10;
} ResourceDimensions;

typedef struct TileMapResource {
    u8 field_00[0x20];
    ResourceDimensions *dimensions_20;
    u16 *entries_24;
} TileMapResource;

typedef struct SubDualLayerResourceRenderer {
    void **vtable_00;
    u8 field_04[0x10];
    u8 *paletteBuffer_14;
} SubDualLayerResourceRenderer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSubDualLayerResourceRendererVtable;
extern void *data_020f4e18;
extern void DualLayerTileRendererBase_InitBase(void *self);
extern void DualLayerTileRendererBase_Destroy(void *self);
extern void DualLayerTileRenderer_LoadFromConfig(void *self,
                                                 const void *config,
                                                 s32 mode, s32 variant);
extern void DualLayerTileRenderer_ActivateLayers(void *self, s32 notify);
extern void DualLayerTileRenderer_UploadPalette(void *self);
extern void DualLayerTileRenderer_SetLayersEnabled(void *self, s32 enabled);
extern void func_020b44e8(void);
extern void func_020706c4(void *resource, s32 background, s32 value);
extern void func_02070eac(void *resource, s32 background, s32 value);
extern u8 *func_02070874(void *resource);
extern void MIi_CpuCopy16(const void *source, void *destination, u32 size);
void SubDualLayerResourceRenderer_LoadBgResources(SubDualLayerResourceRenderer *self);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
SubDualLayerResourceRenderer *SubDualLayerResourceRenderer_Init(SubDualLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gSubDualLayerResourceRendererVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
SubDualLayerResourceRenderer *SubDualLayerResourceRenderer_DestroyComplete(SubDualLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
SubDualLayerResourceRenderer *SubDualLayerResourceRenderer_DestroyAndFree(SubDualLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Forward the caller-owned config and mode selectors through the first common
 * activation path, then perform this variant's resource setup. */
void SubDualLayerResourceRenderer_ActivatePrimary(
    SubDualLayerResourceRenderer *self, const void *config, s32 mode,
    s32 variant)
{
    DualLayerTileRenderer_LoadFromConfig(self, config, mode, variant);
    SubDualLayerResourceRenderer_LoadBgResources(self);
}

/* Forward the caller's notification flag through the second common activation
 * path, then perform this variant's resource setup. */
void SubDualLayerResourceRenderer_ActivateSecondary(
    SubDualLayerResourceRenderer *self, s32 notify)
{
    DualLayerTileRenderer_ActivateLayers(self, notify);
    SubDualLayerResourceRenderer_LoadBgResources(self);
}

/*
 * Configure sub BG0, load resource IDs 0xa00f..0xa011, apply its tile map,
 * then configure sub BG1 and load IDs 0xa012..0xa014. Every BG1 tile entry's
 * palette nibble is advanced by six modulo 16. Upload both background sets,
 * copy 0xc0 palette bytes from resource1+0x80 into paletteBuffer_14+0x140,
 * invoke the common post-load hook, enable the corresponding sub display
 * planes, destroy temporary resources, and return. These calls update VRAM,
 * cache state, palette storage, and the sub-engine hardware registers.
 */
void SubDualLayerResourceRenderer_LoadBgResources(SubDualLayerResourceRenderer *self)
{
    GraphicsResourceSet resources;
    TileMapResource *tileMap;
    u8 *palette;
    s32 count;
    s32 i;
    volatile u16 *bg0cnt = (volatile u16 *)0x04001008;
    volatile u16 *bg1cnt = (volatile u16 *)0x0400100a;
    volatile u32 *dispcnt = (volatile u32 *)0x04001000;

    GraphicsResourceSet_Init(&resources);
    *bg0cnt = (*bg0cnt & 0x43) | 0x5800;
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xa00f, 0xa010, 0xa011);
    func_020b44e8();
    func_02070eac(resources.resource2, 0, 0);
    *bg0cnt = (*bg0cnt & ~3u) | 3;
    *dispcnt = (*dispcnt & ~0x1f00u) | ((((*dispcnt >> 8) & 0x1f) | 1) << 8);
    GraphicsResourceSet_ReleaseHandles(&resources);

    *bg1cnt = (*bg1cnt & 0x43) | 0x5a10;
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xa012, 0xa013, 0xa014);
    tileMap = (TileMapResource *)resources.resource2;
    count = tileMap->dimensions_20->rows_0c * tileMap->dimensions_20->columns_10;
    for (i = 0; i < count; i++)
        tileMap->entries_24[i] = (tileMap->entries_24[i] & 0x0fff) |
            ((((tileMap->entries_24[i] >> 12) + 6) & 0x0f) << 12);
    func_020b44e8();
    func_020706c4(resources.resource0, 1, 0);
    func_02070eac(resources.resource2, 1, 0);
    palette = func_02070874(resources.resource1);
    MIi_CpuCopy16(palette + 0x80, self->paletteBuffer_14 + 0x140, 0xc0);
    DualLayerTileRenderer_UploadPalette(self);
    *bg1cnt = (*bg1cnt & ~3u) | 3;
    *dispcnt = (*dispcnt & ~0x1f00u) | ((((*dispcnt >> 8) & 0x1f) | 2) << 8);
    GraphicsResourceSet_Destroy(&resources);
}

/*
 * Forward enabled through the common visibility path, then set both sub BG0
 * and BG1 display-plane bits when nonzero or clear both when zero.
 */
void SubDualLayerResourceRenderer_SetVisible(SubDualLayerResourceRenderer *self, s32 enabled)
{
    volatile u32 *dispcnt = (volatile u32 *)0x04001000;
    u32 planes;

    DualLayerTileRenderer_SetLayersEnabled(self, enabled);
    planes = (*dispcnt >> 8) & 0x1f;
    if (enabled)
        planes |= 3;
    else
        planes &= ~3u;
    *dispcnt = (*dispcnt & ~0x1f00u) | (planes << 8);
}
