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
extern void *data_020dec4c;
extern void *data_020f4e18;
extern PaletteBuffer gMainBgPaletteBuffer;
extern void func_020291b8(void *self);
extern void func_020292f0(void *self);
extern void func_02029370(void *self);
extern void func_02029648(void *self);
extern void func_020b44e8(void);
extern void func_02070638(void *resource, s32 background, s32 value);
extern void func_02070e0c(void *resource, s32 background, s32 value);
extern u8 *func_02070874(void *resource);
void func_0202bf4c(MainDualLayerResourceRenderer *self);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
MainDualLayerResourceRenderer *func_0202becc(MainDualLayerResourceRenderer *self)
{
    func_020291b8(self);
    self->vtable_00 = (void **)data_020dec4c;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
MainDualLayerResourceRenderer *func_0202beec(MainDualLayerResourceRenderer *self)
{
    func_020292f0(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
MainDualLayerResourceRenderer *func_0202bf00(MainDualLayerResourceRenderer *self)
{
    func_020292f0(self);
    Heap_Free(self);
    return self;
}

/* Run the first common activation path, then perform this variant's resource setup. */
void func_0202bf1c(MainDualLayerResourceRenderer *self)
{
    func_02029370(self);
    func_0202bf4c(self);
}

/* Run the second common activation path, then perform this variant's resource setup. */
void func_0202bf34(MainDualLayerResourceRenderer *self)
{
    func_02029648(self);
    func_0202bf4c(self);
}

/*
 * Configure main BG0, load IDs 0xa006..0xa008, upload its graphics/tile map,
 * and copy 0x80 palette bytes from resource1+0x180 to main palette offset
 * 0x180. Release that triplet, configure main BG1, load IDs 0xa000..0xa002,
 * upload its tile map, then destroy the temporary set. The routine updates
 * VRAM/cache state, the main BG palette buffer, BG0CNT/BG1CNT, and main
 * DISPCNT plane-enable bits.
 */
void func_0202bf4c(MainDualLayerResourceRenderer *self)
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
