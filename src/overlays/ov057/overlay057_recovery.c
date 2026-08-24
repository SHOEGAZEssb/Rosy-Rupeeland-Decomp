#include "tingle/field_effect.h"
#include "tingle/types.h"

/* Recovered overlay 57 compact graphics scene lifecycle. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))



extern "C" void GraphicsResourceSet_Init(void *);
extern "C" void GraphicsResourceSet_Destroy(void *);
extern "C" void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *, s32);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void RuntimePresentationManager_AppendSecondListEffect(void *, void *);
extern "C" s32 func_020af958(void);
extern "C" s32 func_020af938(void);
extern "C" void func_020b581c(s32, s32, s32);
extern "C" void GraphicsBgMapResource_AddPaletteBankOffset(void *, s32);
extern "C" void func_020b44e8(void);
extern "C" void func_020706c4(void *, s32, s32);
extern "C" void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern "C" void func_02070638(void *, s32, s32);
extern "C" void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern "C" void *GraphicsBgResourceData_GetDecoded(void *);
extern "C" void PaletteBuffer_Write(void *, const void *, s32, s32);

extern "C" void *data_020f4e18;
extern "C" void *gGamePhaseRuntime;
extern "C" void *gHeapContext;
extern "C" u8 gSubBgPaletteBuffer[];
extern "C" u8 gMainBgPaletteBuffer[];
extern "C" u8 data_ov057_0220e7d4[];
extern "C" u8 data_ov057_0220e7f4[];

extern "C" void func_ov057_0220e658(void *);

static s16 configure_layer(s16 value, s32 index)
{
    value = (s16)((value & ~15) | index);
    return (s16)((value & (s32)0xffff000f) | 0x140);
}

/* Construct the presentation, load resources, and configure its four layers. */
extern "C" void *func_ov057_0220e400(void *scene)
{
    FieldEffect_Init(scene);
    FIELD(void *, scene, 0) = data_ov057_0220e7d4;
    GraphicsResourceSet_Init((u8 *)scene + 8);
    FIELD(s32, scene, 0x20) = 0;
    FIELD(s32, scene, 0x24) = 0;
    func_ov057_0220e658(scene);
    *(volatile u32 *)0x04001014 = 0;
    FIELD(s32, scene, 0x14) = 0;
    FIELD(s16, scene, 0x18) = configure_layer(FIELD(s16, scene, 0x18), 0);
    FIELD(s16, scene, 0x1a) = configure_layer(FIELD(s16, scene, 0x1a), 1);
    FIELD(s16, scene, 0x1c) = configure_layer(FIELD(s16, scene, 0x1c), 2);
    FIELD(s16, scene, 0x1e) = configure_layer(FIELD(s16, scene, 0x1e), 1);
    FIELD(u32, scene, 4) |= 2;
    return scene;
}

static void destroy_scene(void *scene)
{
    FIELD(void *, scene, 0) = data_ov057_0220e7d4;
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 1);
    GraphicsResourceSet_Destroy((u8 *)scene + 8);
    FieldEffect_DestroyBase(scene);
}

/* Destroy the graphics scene while retaining its allocation. */
extern "C" void *func_ov057_0220e4e0(void *scene)
{
    destroy_scene(scene);
    return scene;
}

/* Destroy the graphics scene and release its allocation. */
extern "C" void *func_ov057_0220e518(void *scene)
{
    destroy_scene(scene);
    Heap_Free(scene);
    return scene;
}

/* Allocate, construct, and register the scene with the shared scene service. */
extern "C" void func_ov057_0220e558(void)
{
    void *scene = Heap_Alloc(0x28, data_ov057_0220e7f4, 4, gHeapContext);
    if (scene) scene = func_ov057_0220e400(scene);
    RuntimePresentationManager_AppendSecondListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, scene);
}

/* Constant-status scene callback. */
extern "C" s32 func_ov057_0220e5a4(void)
{
    return 0;
}

/* Advance the four-layer scrolling schedule after its per-layer countdown. */
extern "C" void func_ov057_0220e5ac(void *scene)
{
    s32 countdown = FIELD(s32, scene, 0x24) - 1;
    FIELD(s32, scene, 0x24) = countdown;
    if (countdown >= 0) return;

    s32 index = FIELD(s32, scene, 0x20);
    s16 control = FIELD(s16, scene, 0x18 + index * 2);
    FIELD(s32, scene, 0x24) = control >> 4;
    s32 low_nibble = control & 15;
    if (low_nibble >= 8) low_nibble -= 16;
    s32 offset = low_nibble << 11;
    s32 base = FIELD(s32, FIELD(void *, scene, 8), 0x24);
    func_020b581c(base + offset, func_020af958(), 0x800);
    func_020b581c(base + offset, func_020af938(), 0x800);
    FIELD(s32, scene, 0x20) = index == 3 ? 0 : index + 1;
}

/* Load and apply the paired main/sub background resources and palettes. */
extern "C" void func_ov057_0220e658(void *scene)
{
    GraphicsResourceSet_Load((u8 *)scene + 8, data_020f4e18,
                             0xa05b, 0xa05c, 0xa05d);
    volatile u16 *sub_bg1 = (volatile u16 *)0x0400100a;
    volatile u16 *main_bg1 = (volatile u16 *)0x0400000a;
    *sub_bg1 = (u16)((*sub_bg1 & 0x43) | 0x1a00);
    *sub_bg1 = (u16)((*sub_bg1 & ~3) | 3);
    *main_bg1 = (u16)((*main_bg1 & 0x43) | 0x1a08);
    *main_bg1 = (u16)((*main_bg1 & ~3) | 3);
    GraphicsBgMapResource_AddPaletteBankOffset(FIELD(void *, scene, 0x10), 15);
    func_020b44e8();
    func_020706c4(FIELD(void *, scene, 8), 1, 0);
    GraphicsBgMapResource_UploadToSubBg(FIELD(void *, scene, 0x10), 1, 0);
    PaletteBuffer_Write(gSubBgPaletteBuffer,
        GraphicsBgResourceData_GetDecoded(FIELD(void *, scene, 0x0c)), 0x1e0, 0x20);
    func_02070638(FIELD(void *, scene, 8), 1, 0);
    GraphicsBgMapResource_UploadToMainBg(FIELD(void *, scene, 0x10), 1, 0);
    PaletteBuffer_Write(gMainBgPaletteBuffer,
        GraphicsBgResourceData_GetDecoded(FIELD(void *, scene, 0x0c)), 0x1e0, 0x20);
}

/* Reload the scene graphics through the shared setup path. */
extern "C" void func_ov057_0220e774(void *scene) { func_ov057_0220e658(scene); }
/* Intentional virtual no-op callbacks. */
extern "C" void func_ov057_0220e780(void) {}
extern "C" void func_ov057_0220e784(void) {}
extern "C" void func_ov057_0220e788(void) {}
