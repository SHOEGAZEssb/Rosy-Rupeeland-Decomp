#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the second fixed-resource dual-layer renderer for sub BG0/BG1.
 * Its hardware and upload sequence matches the neighboring sub variant while
 * selecting resource IDs 0xa012 through 0xa017.
 */
typedef struct ResourceDimensionsAlt {
    u8 field_00[0x0c];
    s32 rows_0c;
    s32 columns_10;
} ResourceDimensionsAlt;

typedef struct TileMapResourceAlt {
    u8 field_00[0x20];
    ResourceDimensionsAlt *dimensions_20;
    u16 *entries_24;
} TileMapResourceAlt;

typedef struct SubDualLayerResourceRendererAlt {
    void **vtable_00;
    u8 field_04[0x10];
    u8 *paletteBuffer_14;
} SubDualLayerResourceRendererAlt;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSubDualLayerResourceRendererAltVtable;
extern void *data_020f4e18;
extern void DualLayerTileRendererBase_InitBase(void *self);
extern void DualLayerTileRendererBase_Destroy(void *self);
extern void DualLayerTileRenderer_LoadFromConfig(void *self,
                                                 const void *config,
                                                 s32 mode, s32 variant);
extern void DualLayerTileRenderer_ActivateLayers(void *self, s32 notify);
extern void DualLayerTileRenderer_UploadPalette(void *self);
extern void func_020b44e8(void);
extern void func_020706c4(void *resource, s32 background, s32 value);
extern void func_02070eac(void *resource, s32 background, s32 value);
extern u8 *GraphicsBgResourceData_GetDecoded(void *resource);
extern void MIi_CpuCopy16(const void *source, void *destination, u32 size);
void SubDualLayerResourceRendererAlt_LoadBgResources(SubDualLayerResourceRendererAlt *self);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
SubDualLayerResourceRendererAlt *SubDualLayerResourceRendererAlt_Init(SubDualLayerResourceRendererAlt *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gSubDualLayerResourceRendererAltVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
SubDualLayerResourceRendererAlt *SubDualLayerResourceRendererAlt_DestroyComplete(SubDualLayerResourceRendererAlt *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
SubDualLayerResourceRendererAlt *SubDualLayerResourceRendererAlt_DestroyAndFree(SubDualLayerResourceRendererAlt *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Forward the caller-owned config and mode selectors through the first common
 * activation path, then perform this variant's resource setup. */
void SubDualLayerResourceRendererAlt_ActivatePrimary(
    SubDualLayerResourceRendererAlt *self, const void *config, s32 mode,
    s32 variant)
{
    DualLayerTileRenderer_LoadFromConfig(self, config, mode, variant);
    SubDualLayerResourceRendererAlt_LoadBgResources(self);
}

/* Forward the caller's notification flag through the second common activation
 * path, then perform this variant's resource setup. */
void SubDualLayerResourceRendererAlt_ActivateSecondary(
    SubDualLayerResourceRendererAlt *self, s32 notify)
{
    DualLayerTileRenderer_ActivateLayers(self, notify);
    SubDualLayerResourceRendererAlt_LoadBgResources(self);
}

/*
 * Configure sub BG0 and load IDs 0xa012..0xa014, then configure sub BG1 and
 * load IDs 0xa015..0xa017. Advance each BG1 tile palette nibble by six modulo
 * 16, upload both maps, copy 0xc0 palette bytes into paletteBuffer_14+0x140,
 * invoke the common post-load hook, enable both sub display planes, and
 * release the temporary resources. This mutates VRAM, cache/palette state,
 * BG0CNT, BG1CNT, and sub DISPCNT.
 */
void SubDualLayerResourceRendererAlt_LoadBgResources(SubDualLayerResourceRendererAlt *self)
{
    GraphicsResourceSet resources;
    TileMapResourceAlt *tileMap;
    u8 *palette;
    s32 count;
    s32 i;
    volatile u16 *bg0cnt = (volatile u16 *)0x04001008;
    volatile u16 *bg1cnt = (volatile u16 *)0x0400100a;
    volatile u32 *dispcnt = (volatile u32 *)0x04001000;

    GraphicsResourceSet_Init(&resources);
    *bg0cnt = (*bg0cnt & 0x43) | 0x5800;
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xa012, 0xa013, 0xa014);
    func_020b44e8();
    func_02070eac(resources.resource2, 0, 0);
    *bg0cnt = (*bg0cnt & ~3u) | 3;
    *dispcnt = (*dispcnt & ~0x1f00u) |
               (((((*dispcnt >> 8) & 0x1f) | 1) & 0x1f) << 8);
    GraphicsResourceSet_ReleaseHandles(&resources);

    *bg1cnt = (*bg1cnt & 0x43) | 0x5a10;
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xa015, 0xa016, 0xa017);
    tileMap = (TileMapResourceAlt *)resources.resource2;
    count = tileMap->dimensions_20->rows_0c * tileMap->dimensions_20->columns_10;
    for (i = 0; i < count; i++)
        tileMap->entries_24[i] = (tileMap->entries_24[i] & 0x0fff) |
            ((((tileMap->entries_24[i] >> 12) + 6) & 0x0f) << 12);
    func_020b44e8();
    func_020706c4(resources.resource0, 1, 0);
    func_02070eac(resources.resource2, 1, 0);
    palette = GraphicsBgResourceData_GetDecoded(resources.resource1);
    MIi_CpuCopy16(palette + 0x80, self->paletteBuffer_14 + 0x140, 0xc0);
    DualLayerTileRenderer_UploadPalette(self);
    *bg1cnt = (*bg1cnt & ~3u) | 3;
    *dispcnt = (*dispcnt & ~0x1f00u) |
               (((((*dispcnt >> 8) & 0x1f) | 2) & 0x1f) << 8);
    GraphicsResourceSet_Destroy(&resources);
}
