#include "tingle/graphics_bg_map_resource.h"

/* Overlay 32 scene teardown, scrolling, display initialization, and graphics-resource upload. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

typedef struct GraphicsResourceSet {
    void *characterResource;
    void *paletteResource;
    GraphicsBgMapResource *bgMapResource;
} GraphicsResourceSet;

extern void *gSoundContext;
extern void *gDebugFont;
extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *gGamePhaseRuntime[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_SetModalEnvelopeEnabled(...);
extern void Sound_ReleaseGroup(...);
extern void GraphicsSpriteGroupOwner_DestroyGroup(...);
extern void GraphicsArchive_ReleaseResourceE4(...);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *);
extern void GraphicsResourceSet_Load(...);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsBankStateSnapshot_Destroy(void *);
extern void GraphicsBankStateSnapshot_Capture(void *);
extern void __destroy_arr(...);
extern void RuntimePresentationManager_DisableGraphics3dForActivePhase(
    void *manager);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GamePhaseState_SetEnabled(...);
extern void GamePhaseAreaScene_SetEnabled(...);
extern void GX_SetBankForBG(...);
extern void GX_SetGraphicsMode(...);
extern void GXS_SetGraphicsMode(...);
extern void func_020af1f8(...);
extern void func_020aea7c(...);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(...);
extern void TitleDisplay_SetSubBgPriorities(...);
extern void func_020b44e8(void);
extern void GraphicsBgCharacterResource_UploadToMainBg(...);
extern void GraphicsBgCharacterResource_UploadToSubBg(...);
extern s32 GraphicsResource_GetFormat(void *);
extern void GraphicsBgPaletteResource_UploadToMainBg(...);
extern void GraphicsBgPaletteResource_UploadToSubBg(...);
extern void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *);
extern void func_020afd0c(...);
extern void GraphicsSpriteRenderer_ConfigureTextGridPriority(...);
extern void *Overlay032Child_Destroy(void *);
extern void func_ov032_021fce00(void *);
extern void func_ov032_021fd938(void *);
extern void func_ov032_021fde1c(s32);
#ifdef __cplusplus
}
#endif

/*
 * Tears down `scene` without freeing its storage and returns it. This restores
 * sound state, closes the optional object at +0x10, detaches render resources,
 * destroys the child arrays, and releases all six resource sets.
 */
extern "C" void *func_ov032_021fd7f8(void *scene)
{
    typedef void (*VirtualDestructor)(void *);

    Sound_SetModalEnvelopeEnabled(gSoundContext, 0, 0, 0x14, 0x1e);
    Sound_ReleaseGroup(gSoundContext, 0x81);

    void *owned = FIELD(void *, scene, 0x10);
    if (owned != 0) {
        void **vtable = FIELD(void **, owned, 0);
        ((VirtualDestructor)vtable[1])(owned);
    }

    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, FIELD(void *, scene, 4));
    GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14[0], FIELD(void *, scene, 0));
    GraphicsArchive_ReleaseResourceE4(data_020f4e18[0], FIELD(void *, scene, 8));
    GraphicsResourceSet_Destroy((GraphicsResourceSet *)((u8 *)scene + 0xf18));
    __destroy_arr((u8 *)scene + 0xc44, 5, 0x6c, Overlay032Child_Destroy);
    GraphicsBankStateSnapshot_Destroy((u8 *)scene + 0xbe8);
    GraphicsResourceSet_Destroy((GraphicsResourceSet *)((u8 *)scene + 0xb44));
    __destroy_arr((u8 *)scene + 0x334, 0x28, 0x30, func_ov032_021fce00);

    for (s32 offset = 0x58; offset >= 0x1c; offset -= 0xc) {
        AnimationResourceState_Destroy((u8 *)scene + offset);
    }
    return scene;
}

/* Calls the scrolling update for `scene` only after graphics setup set +0xF2C. */
extern "C" void func_ov032_021fd920(void *scene)
{
    if (FIELD(s32, scene, 0xf2c) != 0) {
        func_ov032_021fd938(scene);
    }
}

/*
 * Advances the counter at +0xB78 and writes two half-speed negative offsets
 * to sub-engine BG3X and main-engine BG2Y. The 9-bit mask reflects affine BG
 * hardware wrapping; signed division deliberately truncates toward zero.
 */
extern "C" void func_ov032_021fd938(void *scene)
{
    s32 counter = FIELD(s32, scene, 0xb78);
    REG32(0x04001018) = ((u32)(-counter / 2) << 16) & 0x01ff0000;
    REG32(0x04000014) = ((u32)(-(counter + 0xa0) / 2) << 16) & 0x01ff0000;
    FIELD(s32, scene, 0xb78) = counter + 1;
}

static void load_text_resources(GraphicsResourceSet *set,
                                u32 characterResourceId,
                                u32 paletteResourceId, u32 bgMapResourceId,
                                s32 layer, u32 mapBase)
{
    GraphicsResourceSet_Load(set, data_020f4e18[0], characterResourceId,
                             paletteResourceId, bgMapResourceId);
    func_020b44e8();
    GraphicsBgCharacterResource_UploadToMainBg(set->characterResource, layer, 0);
    GraphicsBgPaletteResource_UploadToMainBg(set->paletteResource,
                  GraphicsResource_GetFormat(set->characterResource)
                      ? mapBase : 0);
    GraphicsBgMapResource_UploadToMainBg(set->bgMapResource, layer, 0);
    GraphicsResourceSet_ReleaseHandles(set);
}

static void load_affine_resources(GraphicsResourceSet *set,
                                  u32 characterResourceId,
                                  u32 paletteResourceId, u32 bgMapResourceId,
                                  s32 layer, u32 mapBase)
{
    GraphicsResourceSet_Load(set, data_020f4e18[0], characterResourceId,
                             paletteResourceId, bgMapResourceId);
    func_020b44e8();
    GraphicsBgCharacterResource_UploadToSubBg(set->characterResource, layer, 0);
    GraphicsBgPaletteResource_UploadToSubBg(set->paletteResource,
                  GraphicsResource_GetFormat(set->characterResource)
                      ? mapBase : 0);
    GraphicsBgMapResource_UploadToSubBg(set->bgMapResource, layer, 0);
    GraphicsResourceSet_ReleaseHandles(set);
}

/*
 * Initializes both 2D engines for `scene`, uploads five resource triples from
 * the global archive, establishes BG priority/blending, and sets +0xF2C. It
 * records the previous POWCNT display-swap bit at +0xB50 and temporarily clears
 * that bit; the numeric resource IDs are confirmed, while their asset names are
 * not yet known.
 */
extern "C" void Overlay032Scene_SetupGraphics(void *scene)
{
    GraphicsResourceSet set;
    u8 *context = (u8 *)gGamePhaseRuntime[0];

    RuntimePresentationManager_DisableGraphics3dForActivePhase(context + 0x2f7c);
    GraphicsBankStateSnapshot_Capture((u8 *)scene + 0xbe8);
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    GamePhaseState_SetEnabled(context + 0x24, 0);
    GamePhaseAreaScene_SetEnabled(FIELD(void *, context, 0x2fb8), 0);

    FIELD(s32, scene, 0xb50) = (REG16(0x04000304) & 0x8000) >> 15;
    REG16(0x04000050) = 0;
    REG16(0x04001050) = 0;
    func_ov032_021fde1c(0);

    REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1300;
    GX_SetBankForBG(2);
    GX_SetGraphicsMode(1, 0, 0);
    func_020af1f8(0x40);
    REG16(0x04000008) = (REG16(0x04000008) & 0x43) | 0x3800;
    REG16(0x0400000a) = (REG16(0x0400000a) & 0x43) | 0x3a00;
    REG16(0x0400000c) = (REG16(0x0400000c) & 0x43) | 0x1c00;
    REG16(0x0400000e) = (REG16(0x0400000e) & 0x43) | 0x5e90;
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);

    REG32(0x04001000) = (REG32(0x04001000) & ~0x1f00) | 0x1e00;
    GXS_SetGraphicsMode(0);
    func_020aea7c(0x80);
    REG16(0x0400100a) = (REG16(0x0400100a) & 0x43) | 0x3a00;
    REG16(0x0400100c) = (REG16(0x0400100c) & 0x43) | 0x1c10;
    REG16(0x0400100e) = (REG16(0x0400100e) & 0x43) | 0x1e98;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    GraphicsResourceSet_Init(&set);
    load_text_resources(&set, 0xa064, 0xa065, 0xa066, 0, 0x6000);
    load_text_resources(&set, 0xa064, 0xa065, 0xa068, 1, 0x4000);
    load_affine_resources(&set, 0xa061, 0xa062, 0xa063, 1, 0x6000);
    load_affine_resources(&set, 0xa064, 0xa065, 0xa068, 2, 0x4000);
    load_affine_resources(&set, 0x9011, 0x9012, 0x9013, 3, 0x6000);

    REG16(0x05000000) = 0x24a3;
    REG16(0x05000400) = 0x24a3;
    func_020afd0c((void *)0x04000050, 2, 0x3c, 0xc, 8);
    func_020afd0c((void *)0x04001050, 4, 0x38, 0xc, 8);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(data_020f4e14[0], 2, 0);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(gDebugFont, 3, 0);
    FIELD(s32, scene, 0xf2c) = 1;
    GraphicsResourceSet_Destroy(&set);
}

/* Replaces only POWCNT bit 15 with `enabled`; other power-control bits remain unchanged. */
extern "C" void func_ov032_021fde1c(s32 enabled)
{
    REG16(0x04000304) = (u16)((REG16(0x04000304) & ~0x8000) |
                              ((u32)enabled << 15));
}
