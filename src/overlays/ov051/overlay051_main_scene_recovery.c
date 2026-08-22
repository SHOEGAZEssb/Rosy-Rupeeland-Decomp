#include "tingle/types.h"

extern "C" void MI_CpuCopy8(const void *source, void *destination, u32 size);

/*
 * Overlay 51 main-engine dream-scene lifecycle. It configures main BG display,
 * owns graphics resources, and exposes scene callbacks parallel to the sub-engine
 * implementation. Portable bodies mirror the exact assembly fallbacks' MMIO
 * and SDK resource ordering.
 */

/*
 * Apply the recovered main-engine display-control bitfield. The argument's exact
 * semantic type is unconfirmed. Main display MMIO changes; nothing is returned.
 */
extern "C" void func_ov051_0220dbc4(u32 first, u32 second, u32 third,
                                     u32 fourth)
{
    volatile u16 *control = (volatile u16 *)0x0400000c;
    *control = (u16)((*control & 0x43) | (first << 14) | (second << 13) |
                     (third << 8) | (fourth << 2));
}

/*
 * Construct caller-owned `scene`, initialize its shared base and graphics set,
 * configure main BG banks/mode, load resources, and install callbacks. Return
 * `scene`. VRAM, display MMIO, and SDK graphics state change.
 */
typedef struct Overlay051ResourceSet {
    void *tiles;
    void *map;
    void *palette;
} Overlay051ResourceSet;

extern "C" void *data_020f4e18;
extern "C" u8 data_ov051_0220df48[];
extern "C" u8 data_ov051_0220dfb8[];
extern "C" u8 data_021052fc[];
extern "C" u8 gHeapContext[];
extern "C" void *func_ov051_0220d600(void *scene);
extern "C" void GraphicsResourceSet_Init(Overlay051ResourceSet *set);
extern "C" void GraphicsResourceSet_Load(Overlay051ResourceSet *set,
                                           void *archive, s32 first,
                                           s32 second, s32 third);
extern "C" void GraphicsResourceSet_Destroy(Overlay051ResourceSet *set);
extern "C" void func_02070fd4(void *palette);
extern "C" void func_020b44e8(void);
extern "C" void func_020af1f8(u32 banks);
extern "C" void GX_SetGraphicsMode(u32 first, u32 second, u32 third);
extern "C" void func_02070638(void *tiles, s32 layer, s32 offset);
extern "C" void func_02070b50(void *map, s32 offset);
extern "C" void func_02070e0c(void *palette, s32 layer, s32 offset);
extern "C" void func_020afd28(volatile void *registers,
                               const void *transform, s32 width, s32 height,
                               s32 x, s32 y);
extern "C" void *Heap_Alloc(u32 size, const void *tag, u32 alignment,
                             void *heap);
extern "C" void Heap_Free(void *allocation);
extern "C" void func_0201df44(void *manager, void *object);
extern "C" void *func_0201e28c(void *scene);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *manager, s32 slot);
extern "C" void func_020ae96c(void);

extern "C" void *func_ov051_0220dbf0(void *scene, s32 first, s32 second,
                                      s32 third)
{
    u8 *bytes = (u8 *)func_ov051_0220d600(scene);
    Overlay051ResourceSet resources;

    *(void **)bytes = data_ov051_0220df48;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, first, second, third);
    func_02070fd4(resources.palette);
    func_020b44e8();
    func_020af1f8(0x10);
    GX_SetGraphicsMode(1, 5, 1);
    func_ov051_0220dbc4(2, 1, 0, 4);
    *(volatile u32 *)0x04000000 =
        (*(volatile u32 *)0x04000000 & ~0x1f00u) | 0x1400u;
    func_02070638(resources.tiles, 2, 0);
    func_02070b50(resources.map, 0x4000);
    func_02070e0c(resources.palette, 2, 0);
    func_020afd28((volatile void *)0x04000020, bytes + 0xc10,
                  0x80, 0x60, 0, 0);
    *(u32 *)(bytes + 4) = (*(u32 *)(bytes + 4) & ~1u) | 3u;
    *(volatile u16 *)0x04000050 = 0;
    GraphicsResourceSet_Destroy(&resources);
    return scene;
}

/*
 * Destroy the main scene without freeing its storage: reset display/BG state,
 * release graphics resources, and run shared teardown. Return `scene`; SDK,
 * VRAM, and display state change.
 */
extern "C" void *func_ov051_0220dd10(void *scene)
{
    *(void **)scene = data_ov051_0220df48;
    func_020ae96c();
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 0);
    func_0201e28c(scene);
    return scene;
}

/*
 * Perform main-scene teardown, free its allocation, and return the former
 * address identity. Heap, SDK, VRAM, and display state change; the result must
 * not be dereferenced.
 */
extern "C" void *func_ov051_0220dd44(void *scene)
{
    func_ov051_0220dd10(scene);
    Heap_Free(scene);
    return scene;
}

/*
 * Allocate and construct a main scene, register it with the shared scene system,
 * and return the allocation. Heap and scene-manager/graphics state change; no
 * direct MMIO occurs outside the constructor.
 */
extern "C" void *func_ov051_0220dd90(s32 first, s32 second, s32 third)
{
    void *scene = Heap_Alloc(0x1814, data_ov051_0220dfb8, 4, gHeapContext);

    if (scene != 0)
        scene = func_ov051_0220dbf0(scene, first, second, third);
    func_0201df44(*(u8 **)data_021052fc + 0x2f7c, scene);
    return scene;
}

/*
 * Apply the recovered main-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220ddf8(void *scene)
{
    u8 *bytes = (u8 *)scene;
    s32 index;

    for (index = 0; index < 0xc0; ++index)
        MI_CpuCopy8(bytes + 0x10 + index * 0x10,
                    bytes + 0xc10 + index * 0x10, 0x10);
    func_020afd28((volatile void *)0x04000020, bytes + 0xc10,
                  0x100, 0x100, *(s32 *)(bytes + 8),
                  *(s32 *)(bytes + 0xc));
}

/*
 * Restore the recovered main-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220de68(void *scene, s32 index)
{
    u8 *bytes = (u8 *)scene;

    if (index < 0xc0)
        func_020afd28((volatile void *)0x04000020,
                      bytes + 0xc10 + index * 0x10,
                      0x100, 0x100, *(s32 *)(bytes + 8),
                      *(s32 *)(bytes + 0xc) + index);
}
