#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the sub-engine dual-layer renderer that assigns resource triplet
 * 0xa015..0xa017 to BG0 and 0xa012..0xa014 to BG1, reversing the assignment
 * used by the adjacent alternate sub renderer.
 */
typedef struct SwappedResourceDimensions {
    u8 field_00[0x0c];
    s32 rows_0c;
    s32 columns_10;
} SwappedResourceDimensions;
typedef struct SwappedTileMapResource {
    u8 field_00[0x20];
    SwappedResourceDimensions *dimensions_20;
    u16 *entries_24;
} SwappedTileMapResource;
typedef struct SubDualLayerResourceRendererSwapped {
    void **vtable_00;
    u8 field_04[0x10];
    u8 *paletteBuffer_14;
} SubDualLayerResourceRendererSwapped;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSubDualLayerResourceRendererSwappedVtable;
extern void *data_020f4e18;
extern void DualLayerTileRendererBase_InitBase(void *);
extern void DualLayerTileRendererBase_Destroy(void *);
extern void DualLayerTileRenderer_LoadFromConfig(void *, const void *, s32,
                                                 s32);
extern void DualLayerTileRenderer_ActivateLayers(void *, s32);
extern void DualLayerTileRenderer_UploadPalette(void *);
extern void func_020b44e8(void);
extern void func_020706c4(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern u8 *GraphicsBgResourceData_GetDecoded(void *);
extern void MIi_CpuCopy16(const void *, void *, u32);
void SubDualLayerResourceRendererSwapped_LoadBgResources(SubDualLayerResourceRendererSwapped *);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
SubDualLayerResourceRendererSwapped *SubDualLayerResourceRendererSwapped_Init(SubDualLayerResourceRendererSwapped *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gSubDualLayerResourceRendererSwappedVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
SubDualLayerResourceRendererSwapped *SubDualLayerResourceRendererSwapped_DestroyComplete(SubDualLayerResourceRendererSwapped *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
SubDualLayerResourceRendererSwapped *SubDualLayerResourceRendererSwapped_DestroyAndFree(SubDualLayerResourceRendererSwapped *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Forward the caller-owned config and mode selectors through the first common
 * activation path, then perform the swapped resource setup. */
void SubDualLayerResourceRendererSwapped_ActivatePrimary(
    SubDualLayerResourceRendererSwapped *self, const void *config, s32 mode,
    s32 variant)
{
    DualLayerTileRenderer_LoadFromConfig(self, config, mode, variant);
    SubDualLayerResourceRendererSwapped_LoadBgResources(self);
}

/* Forward the caller's notification flag through the second common activation
 * path, then perform the swapped resource setup. */
void SubDualLayerResourceRendererSwapped_ActivateSecondary(
    SubDualLayerResourceRendererSwapped *self, s32 notify)
{
    DualLayerTileRenderer_ActivateLayers(self, notify);
    SubDualLayerResourceRendererSwapped_LoadBgResources(self);
}

/*
 * Configure sub BG0 and load IDs 0xa015..0xa017, then configure sub BG1 and
 * load IDs 0xa012..0xa014. Advance BG1 tile palette nibbles by six modulo 16,
 * upload both maps, copy 0xc0 palette bytes into paletteBuffer_14+0x140, run
 * common post-load work, enable both display planes, and destroy resources.
 */
void SubDualLayerResourceRendererSwapped_LoadBgResources(SubDualLayerResourceRendererSwapped *self)
{
    GraphicsResourceSet set;
    SwappedTileMapResource *map;
    s32 i, count;
    volatile u16 *bg0 = (volatile u16 *)0x04001008;
    volatile u16 *bg1 = (volatile u16 *)0x0400100a;
    volatile u32 *disp = (volatile u32 *)0x04001000;

    GraphicsResourceSet_Init(&set);
    *bg0 = (*bg0 & 0x43) | 0x5800;
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa015, 0xa016, 0xa017);
    func_020b44e8();
    func_02070eac(set.resource2, 0, 0);
    *bg0 = (*bg0 & ~3u) | 3;
    *disp = (*disp & ~0x1f00u) | (((((*disp >> 8) & 0x1f) | 1) & 0x1f) << 8);
    GraphicsResourceSet_ReleaseHandles(&set);
    *bg1 = (*bg1 & 0x43) | 0x5a10;
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa012, 0xa013, 0xa014);
    map = (SwappedTileMapResource *)set.resource2;
    count = map->dimensions_20->rows_0c * map->dimensions_20->columns_10;
    for (i = 0; i < count; i++)
        map->entries_24[i] = (map->entries_24[i] & 0x0fff) |
            ((((map->entries_24[i] >> 12) + 6) & 0xf) << 12);
    func_020b44e8();
    func_020706c4(set.resource0, 1, 0);
    func_02070eac(set.resource2, 1, 0);
    MIi_CpuCopy16(GraphicsBgResourceData_GetDecoded(set.resource1) + 0x80,
                  self->paletteBuffer_14 + 0x140, 0xc0);
    DualLayerTileRenderer_UploadPalette(self);
    *bg1 = (*bg1 & ~3u) | 3;
    *disp = (*disp & ~0x1f00u) | (((((*disp >> 8) & 0x1f) | 2) & 0x1f) << 8);
    GraphicsResourceSet_Destroy(&set);
}
