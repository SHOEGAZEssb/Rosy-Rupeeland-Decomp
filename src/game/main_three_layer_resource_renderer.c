#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/palette_buffer.h"
#include "tingle/types.h"

/*
 * Configure main-engine BG1, BG2, and BG3 from three fixed resource
 * combinations and partition their colors across the global main BG palette.
 * First-path activation also clears pending refresh bits on two attached layers.
 */
typedef struct MainAttachedLayerState {
    u8 field_0000[0x1030];
    u8 status_1030;
} MainAttachedLayerState;
typedef struct MainThreeLayerResourceRenderer {
    void **vtable_00;
    u8 field_04[0x24];
    MainAttachedLayerState *layer_28;
    MainAttachedLayerState *layer_2c;
} MainThreeLayerResourceRenderer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gMainThreeLayerResourceRendererVtable;
extern void *data_020f4e18;
extern PaletteBuffer gMainBgPaletteBuffer;
extern void DualLayerTileRendererBase_InitBase(void *);
extern void DualLayerTileRendererBase_Destroy(void *);
extern void DualLayerTileRenderer_LoadFromConfig(void *);
extern void DualLayerTileRenderer_ActivateLayers(void *);
extern void func_020b44e8(void);
extern void func_02070638(void *, s32, s32);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070b50(void *, s32);
extern void func_02070f80(void *, s32);
extern u8 *func_02070874(void *);
void MainThreeLayerResourceRenderer_LoadBgResources(MainThreeLayerResourceRenderer *);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
MainThreeLayerResourceRenderer *MainThreeLayerResourceRenderer_Init(MainThreeLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gMainThreeLayerResourceRendererVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
MainThreeLayerResourceRenderer *MainThreeLayerResourceRenderer_DestroyComplete(MainThreeLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
MainThreeLayerResourceRenderer *MainThreeLayerResourceRenderer_DestroyAndFree(MainThreeLayerResourceRenderer *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Clear both attached refresh bits after first-path activation, then load resources. */
void MainThreeLayerResourceRenderer_ActivatePrimary(MainThreeLayerResourceRenderer *self)
{
    DualLayerTileRenderer_LoadFromConfig(self);
    self->layer_28->status_1030 &= ~1u;
    self->layer_2c->status_1030 &= ~1u;
    MainThreeLayerResourceRenderer_LoadBgResources(self);
}

/* Run second-path activation, then configure and upload the three resource sets. */
void MainThreeLayerResourceRenderer_ActivateSecondary(MainThreeLayerResourceRenderer *self)
{
    DualLayerTileRenderer_ActivateLayers(self);
    MainThreeLayerResourceRenderer_LoadBgResources(self);
}

/*
 * Set up main BG2 with IDs 0xa107..0xa109 and palette bytes 0..0xbf; main
 * BG1 with (0xa107,0xa10a,0xa109), resource2 parameter six, and palette bytes
 * 0xc0..0x17f; then main BG3 with IDs 0xa10e..0xa110, resource2 parameter 15,
 * and palette bytes 0x1e0..0x1ff. Each stage sets CNT priority/configuration,
 * enables its DISPCNT plane, zeros scroll, uploads its selected resources, and
 * releases the set. VRAM, cache, palette, and main display state are mutated.
 */
void MainThreeLayerResourceRenderer_LoadBgResources(MainThreeLayerResourceRenderer *self)
{
    GraphicsResourceSet set;
    volatile u32 *disp = (volatile u32 *)0x04000000;
    volatile u16 *bg1 = (volatile u16 *)0x0400000a;
    volatile u16 *bg2 = (volatile u16 *)0x0400000c;
    volatile u16 *bg3 = (volatile u16 *)0x0400000e;
    u32 planes;

    (void)self;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa107, 0xa108, 0xa109);
    *bg2 = (*bg2 & 0x43) | 0x1800;
    *bg2 = (*bg2 & ~3u) | 1;
    planes = ((*disp >> 8) & 0x1f) | 4;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    *(volatile u32 *)0x04000018 = 0;
    func_02070638(set.resource0, 2, 0);
    func_02070e0c(set.resource2, 2, 0);
    func_02070b50(set.resource1, 0);
    PaletteBuffer_Write(&gMainBgPaletteBuffer, func_02070874(set.resource1), 0, 0xc0);
    GraphicsResourceSet_ReleaseHandles(&set);

    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa107, 0xa10a, 0xa109);
    *bg1 = (*bg1 & 0x43) | 0x1600;
    *bg1 = (*bg1 & ~3u) | 1;
    planes = ((*disp >> 8) & 0x1f) | 2;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    *(volatile u32 *)0x04000014 = 0;
    func_02070f80(set.resource2, 6);
    func_020b44e8();
    func_02070e0c(set.resource2, 1, 0);
    func_02070b50(set.resource1, 0xc0);
    PaletteBuffer_Write(&gMainBgPaletteBuffer, func_02070874(set.resource1),
                        0xc0, 0xc0);
    GraphicsResourceSet_ReleaseHandles(&set);

    GraphicsResourceSet_Load(&set, data_020f4e18, 0xa10e, 0xa10f, 0xa110);
    *bg3 = (*bg3 & 0x43) | 0x1e08;
    *bg3 = (*bg3 & ~3u) | 2;
    planes = ((*disp >> 8) & 0x1f) | 8;
    *disp = (*disp & ~0x1f00u) | (planes << 8);
    *(volatile u32 *)0x0400001c = 0;
    func_02070638(set.resource0, 3, 0);
    func_02070f80(set.resource2, 15);
    func_020b44e8();
    func_02070e0c(set.resource2, 3, 0);
    func_02070b50(set.resource1, 0x1e0);
    PaletteBuffer_Write(&gMainBgPaletteBuffer, func_02070874(set.resource1),
                        0x1e0, 0x20);
    GraphicsResourceSet_ReleaseHandles(&set);
    GraphicsResourceSet_Destroy(&set);
}
