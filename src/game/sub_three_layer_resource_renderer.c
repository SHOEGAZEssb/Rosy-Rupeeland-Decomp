#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/palette_buffer.h"
#include "tingle/types.h"

/*
 * Configure sub-engine BG1, BG2, and BG3 from three resource combinations,
 * partitioning their palettes across the global sub BG palette buffer. The
 * activation path also suppresses pending refreshes on two attached layers.
 */
typedef struct AttachedLayerState {
    u8 field_0000[0x1030];
    u8 status_1030;
} AttachedLayerState;
typedef struct SubThreeLayerResourceRenderer {
    void **vtable_00;
    u8 field_04[0x24];
    AttachedLayerState *layer_28;
    AttachedLayerState *layer_2c;
} SubThreeLayerResourceRenderer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSubThreeLayerResourceRendererVtable;
extern void *data_020f4e18;
extern PaletteBuffer gSubBgPaletteBuffer;
extern void DualLayerTileRendererBase_InitBase(void *);
extern void DualLayerTileRendererBase_Destroy(void *);
extern void DualLayerTileRenderer_LoadFromConfig(void *);
extern void DualLayerTileRenderer_ActivateLayers(void *);
extern void func_020b44e8(void);
extern void func_020706c4(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
extern void func_02070bc4(void *, s32);
extern void func_02070f80(void *, s32);
extern u8 *func_02070874(void *);
void SubThreeLayerResourceRenderer_LoadBgResources(SubThreeLayerResourceRenderer *);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
SubThreeLayerResourceRenderer *SubThreeLayerResourceRenderer_Init(SubThreeLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gSubThreeLayerResourceRendererVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
SubThreeLayerResourceRenderer *SubThreeLayerResourceRenderer_DestroyComplete(SubThreeLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
SubThreeLayerResourceRenderer *SubThreeLayerResourceRenderer_DestroyAndFree(SubThreeLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Run first-path activation, clear status bit zero on both attached layers,
 * then configure and upload the three fixed background resource sets.
 */
void SubThreeLayerResourceRenderer_ActivatePrimary(SubThreeLayerResourceRenderer *self)
{
    DualLayerTileRenderer_LoadFromConfig(self);
    self->layer_28->status_1030 &= ~1u;
    self->layer_2c->status_1030 &= ~1u;
    SubThreeLayerResourceRenderer_LoadBgResources(self);
}

/* Run second-path activation, then configure and upload the three resource sets. */
void SubThreeLayerResourceRenderer_ActivateSecondary(SubThreeLayerResourceRenderer *self)
{
    DualLayerTileRenderer_ActivateLayers(self);
    SubThreeLayerResourceRenderer_LoadBgResources(self);
}

/*
 * Set up sub BG2 with IDs 0xa103..0xa105 and palette range 0..0xbf; sub BG1
 * with the resource combination (0xa103,0xa106,0xa105), resource2 parameter
 * six, and palette range 0xc0..0x17f; then sub BG3 with IDs 0xa10b..0xa10d,
 * resource2 parameter 12, and palette range 0x180..0x1ff. Each stage sets its
 * CNT priority/configuration, enables its DISPCNT plane, zeros both scroll
 * coordinates, routes graphics/map/palette resources through the recovered
 * upload APIs, and releases the temporary set. VRAM, cache, palette, and sub
 * display hardware state are mutated.
 */
void SubThreeLayerResourceRenderer_LoadBgResources(SubThreeLayerResourceRenderer *self)
{
    GraphicsResourceSet set;
    volatile u32 *disp = (volatile u32 *)0x04001000;
    volatile u16 *bg1 = (volatile u16 *)0x0400100a;
    volatile u16 *bg2 = (volatile u16 *)0x0400100c;
    volatile u16 *bg3 = (volatile u16 *)0x0400100e;
    u32 planes;

    (void)self;
    GraphicsResourceSet_Init(&set);

    *bg2 = (*bg2 & 0x43) | 0x1c00;
    *bg2 = (*bg2 & ~3u) | 2;
    planes = ((*disp >> 8) & 0x1f) | 4;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    *(volatile u32 *)0x04001018 = 0;
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa103, 0xa104, 0xa105);
    func_020706c4(set.resource0, 2, 0);
    func_02070eac(set.resource2, 2, 0);
    func_02070bc4(set.resource1, 0);
    PaletteBuffer_Write(&gSubBgPaletteBuffer, func_02070874(set.resource1), 0, 0xc0);
    GraphicsResourceSet_ReleaseHandles(&set);

    *bg1 = (*bg1 & 0x43) | 0x1a00;
    *bg1 = (*bg1 & ~3u) | 2;
    planes = ((*disp >> 8) & 0x1f) | 2;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    *(volatile u32 *)0x04001014 = 0;
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa103, 0xa106, 0xa105);
    func_02070f80(set.resource2, 6);
    func_020b44e8();
    func_02070eac(set.resource2, 1, 0);
    func_02070bc4(set.resource1, 0xc0);
    PaletteBuffer_Write(&gSubBgPaletteBuffer, func_02070874(set.resource1),
                        0xc0, 0xc0);
    GraphicsResourceSet_ReleaseHandles(&set);

    *bg3 = (*bg3 & 0x43) | 0x1e08;
    *bg3 = (*bg3 & ~3u) | 2;
    planes = ((*disp >> 8) & 0x1f) | 8;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    *(volatile u32 *)0x0400101c = 0;
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa10b, 0xa10c, 0xa10d);
    func_020706c4(set.resource0, 3, 0);
    func_02070f80(set.resource2, 12);
    func_020b44e8();
    func_02070eac(set.resource2, 3, 0);
    func_02070bc4(set.resource1, 0x180);
    PaletteBuffer_Write(&gSubBgPaletteBuffer, func_02070874(set.resource1),
                        0x180, 0x80);
    GraphicsResourceSet_ReleaseHandles(&set);
    GraphicsResourceSet_Destroy(&set);
}
