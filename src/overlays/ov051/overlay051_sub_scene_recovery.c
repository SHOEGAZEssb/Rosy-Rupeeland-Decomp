#include "tingle/field_effect.h"
#include "tingle/graphics_bg_map_resource.h"
#include "tingle/types.h"

extern "C" void MI_CpuCopy8(const void *source, void *destination, u32 size);

/*
 * Overlay 51 sub-engine dream-scene lifecycle. It configures sub BG display,
 * owns graphics resources, and drives a flag-gated scene update. Portable
 * bodies mirror the exact assembly fallbacks' display-register writes and SDK
 * resource cleanup ordering.
 */

/*
 * Apply the recovered sub-engine display-control bitfield. The argument's exact
 * semantic type is unconfirmed. Sub display MMIO changes; nothing is returned.
 */
extern "C" void func_ov051_0220d84c(u32 first, u32 second, u32 third,
                                     u32 fourth)
{
    volatile u16 *control = (volatile u16 *)0x0400100c;
    *control = (u16)((*control & 0x43) | (first << 14) | (second << 13) |
                     (third << 8) | (fourth << 2));
}

/*
 * Construct caller-owned `scene`, initialize its shared base and graphics
 * resource set, configure sub BG banks/mode, load resources, and install the
 * recovered callbacks. Return `scene`. VRAM, display MMIO, and SDK state change.
 */
typedef struct Overlay051ResourceSet {
    void *characterResource;
    void *paletteResource;
    GraphicsBgMapResource *bgMapResource;
} Overlay051ResourceSet;

extern "C" void *data_020f4e18;
extern "C" u8 data_ov051_0220df98[];
extern "C" u8 data_ov051_0220dfb8[];
extern "C" u8 gGamePhaseRuntime[];
extern "C" u8 gHeapContext[];
extern "C" void *func_ov051_0220d600(void *scene);
extern "C" void GraphicsResourceSet_Init(Overlay051ResourceSet *set);
extern "C" void GraphicsResourceSet_Load(Overlay051ResourceSet *set,
                                           void *archive, s32 first,
                                           s32 second, s32 third);
extern "C" void GraphicsResourceSet_Destroy(Overlay051ResourceSet *set);
extern "C" void func_020b44e8(void);
extern "C" void GX_SetBankForSubBG(u32 bank);
extern "C" void func_020aea7c(u32 banks);
extern "C" void GXS_SetGraphicsMode(u32 mode);
extern "C" void func_020706c4(void *characterResource, s32 layer, s32 offset);
extern "C" void func_02070bc4(void *paletteResource, s32 offset);
extern "C" void func_020afd28(volatile void *registers,
                               const void *transform, s32 width, s32 height,
                               s32 x, s32 y);
extern "C" void *Heap_Alloc(u32 size, const void *tag, u32 alignment,
                             void *heap);
extern "C" void Heap_Free(void *allocation);
extern "C" void RuntimePresentationManager_AppendSecondListEffect(void *manager, void *object);

extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *manager, s32 slot);

extern "C" void *func_ov051_0220d878(void *scene, s32 first, s32 second,
                                      s32 third)
{
    u8 *bytes = (u8 *)func_ov051_0220d600(scene);
    Overlay051ResourceSet resources;
    s32 zero = 0;

    *(void **)bytes = data_ov051_0220df98;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, first, second, third);
    GraphicsBgMapResource_Convert32x32BlockMajorToRowMajor(
        resources.bgMapResource);
    func_020b44e8();
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    GXS_SetGraphicsMode(5);
    func_ov051_0220d84c(2, 1, 0x10, 4);
    *(volatile u32 *)0x04001000 =
        (*(volatile u32 *)0x04001000 & ~0x1f00u) | 0x1400u;
    func_020706c4(resources.characterResource, 2, 0);
    func_02070bc4(resources.paletteResource, 0x4000);
    GraphicsBgMapResource_UploadToSubBg(resources.bgMapResource, 2, 0);
    func_020afd28((volatile void *)0x04001020, bytes + 0xc10,
                  0x80, 0x60, zero, zero);
    *(u32 *)(bytes + 4) = (*(u32 *)(bytes + 4) & ~1u) | 3u;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsResourceSet_Destroy(&resources);
    return scene;
}

/*
 * Destroy the sub scene without freeing its storage: reset display/BG state,
 * release graphics resources, and run shared teardown. Return `scene`; SDK,
 * VRAM, and display state change.
 */
extern "C" void *func_ov051_0220d99c(void *scene)
{
    *(void **)scene = data_ov051_0220df98;
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 0);
    FieldEffect_DestroyBase(scene);
    return scene;
}

/*
 * Perform sub-scene teardown, free its allocation, and return the former
 * address identity. Heap, SDK, VRAM, and display state change; the result must
 * not be dereferenced.
 */
extern "C" void *func_ov051_0220d9dc(void *scene)
{
    func_ov051_0220d99c(scene);
    Heap_Free(scene);
    return scene;
}

/*
 * Advance the sub-scene state machine, testing/clearing the recovered GameWork
 * flag and triggering transition/audio helpers before the shared update. Scene,
 * GameWork, and SDK state change; the recovered status is returned.
 */
extern "C" void *gGameWork;
extern "C" void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern "C" void ActorCollection_SetEnabled(void *collection, s32 enabled);
extern "C" s32 GameWork_TestFlag(void *work, u32 flag);
extern "C" void GameWork_ClearFlag(void *work, u32 flag);
extern "C" void GamePhaseRuntime_ApplyScreenMode(void *runtime, s32 first, s32 second);
extern "C" void func_ov051_0220d688(void *scene);

extern "C" s32 func_ov051_0220da24(void *scene)
{
    void *runtime = *(void **)gGamePhaseRuntime;

    ActorCollection_SetEnabled(GamePhaseRuntime_GetActorCollection(runtime, 2),
                               1);
    if (GameWork_TestFlag(gGameWork, 0x40b)) {
        GameWork_ClearFlag(gGameWork, 0x40b);
        GamePhaseRuntime_ApplyScreenMode(runtime, 1, 1);
        return 1;
    }
    func_ov051_0220d688(scene);
    return 0;
}

/*
 * Allocate and construct a sub scene, register it with the shared scene system,
 * and return the allocation. Heap and scene-manager/graphics state change; no
 * direct MMIO occurs outside the constructor.
 */
extern "C" void *func_ov051_0220daa4(s32 first, s32 second, s32 third)
{
    void *scene = Heap_Alloc(0x1814, data_ov051_0220dfb8, 4, gHeapContext);

    if (scene != 0)
        scene = func_ov051_0220d878(scene, first, second, third);
    RuntimePresentationManager_AppendSecondListEffect(*(u8 **)gGamePhaseRuntime + 0x2f7c, scene);
    return scene;
}

/*
 * Apply the recovered sub-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220db0c(void *scene)
{
    u8 *bytes = (u8 *)scene;
    s32 index;

    for (index = 0; index < 0xc0; ++index)
        MI_CpuCopy8(bytes + 0x10 + index * 0x10,
                    bytes + 0xc10 + index * 0x10, 0x10);
    func_020afd28((volatile void *)0x04001020, bytes + 0xc10,
                  0x100, 0x100, *(s32 *)(bytes + 8),
                  *(s32 *)(bytes + 0xc));
}

/*
 * Restore the recovered sub-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220db7c(void *scene, s32 index)
{
    u8 *bytes = (u8 *)scene;

    if (index < 0xc0)
        func_020afd28((volatile void *)0x04001020,
                      bytes + 0xc10 + index * 0x10,
                      0x100, 0x100, *(s32 *)(bytes + 8),
                      *(s32 *)(bytes + 0xc) + index);
}
