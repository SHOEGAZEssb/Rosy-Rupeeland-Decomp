#include "tingle/types.h"

/*
 * Overlay 38 display setup and fixed graphics-resource upload. These recovered
 * helpers configure the DS main-engine background layers used by the selection
 * presentation and load its three archive-backed graphics groups.
 */

typedef struct Overlay038DisplayState {
    u8 field_000[0x48];
    s32 layer_048;
} Overlay038DisplayState;

typedef struct Overlay038GraphicsResourceSet {
    void *first;
    void *second;
    void *third;
} Overlay038GraphicsResourceSet;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void TitleDisplay_ConfigureMain2dEngine(s32 layer);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(s32 first, s32 second, s32 third, s32 fourth);
extern void GraphicsResourceSet_Init(Overlay038GraphicsResourceSet *set);
extern void GraphicsResourceSet_Load(Overlay038GraphicsResourceSet *set,
                                     void *archive, s32 first, s32 second,
                                     s32 third);
extern void GraphicsResourceSet_Destroy(Overlay038GraphicsResourceSet *set);
extern void GraphicsBgMapResource_SetPaletteBank(void *resource, s32 layer);
extern void GraphicsBgMapResource_AddPaletteBankOffset(void *resource, s32 layer);
extern void func_020b44e8(void);
extern void func_02072048(Overlay038GraphicsResourceSet *set, s32 layer,
                          s32 offset);
extern void GraphicsBgMapResource_UploadToMainBg(void *resource, s32 layer, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Clear display-control bit 15 at 0x04000304, store layer ID 0x1B at +0x48,
 * initialize main-engine layer zero, and rewrite BG0CNT, BG1CNT, and BG3CNT
 * while retaining only their 0x43 masked bits. The written constants are
 * 0x3800, 0x3A00, and 0x1E00 respectively. The helper then finalizes the
 * background service and installs ordering (0,1,2,3). Returns no value and
 * has confirmed Nintendo DS MMIO and graphics-service effects.
 */
extern "C" void func_ov038_021fd210(Overlay038DisplayState *state)
{
    volatile u16 *displayControl = (volatile u16 *)0x04000304;
    volatile u16 *backgroundControl = (volatile u16 *)0x04000008;

    *displayControl &= (u16)~0x8000;
    state->layer_048 = 0x1b;
    TitleDisplay_ConfigureMain2dEngine(0);
    backgroundControl[0] = (backgroundControl[0] & 0x43) | 0x3800;
    backgroundControl[1] = (backgroundControl[1] & 0x43) | 0x3a00;
    backgroundControl[3] = (backgroundControl[3] & 0x43) | 0x1e00;
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);
}

/*
 * Load fixed archive triplets 0xC00F..0xC011, 0x801F/0x8020/0x8022, and
 * 0x801F..0x8021 into one temporary resource set. The first group is prepared
 * for layer 15 then uploaded to layer 3 at offset 0x1E0; the latter groups are
 * prepared for layer 8, with the second uploaded to layer zero at offset 0x100
 * and the third applied to layer one. Each group also runs the shared cache or
 * transfer synchronization hook. Finally destroys the temporary set and
 * returns no value; archive, graphics-resource, and VRAM state change.
 */
extern "C" void func_ov038_021fd28c(void)
{
    Overlay038GraphicsResourceSet set;

    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xc00f, 0xc010, 0xc011);
    GraphicsBgMapResource_SetPaletteBank(set.third, 15);
    func_020b44e8();
    func_02072048(&set, 3, 0x1e0);

    GraphicsResourceSet_Load(&set, data_020f4e18, 0x801f, 0x8020, 0x8022);
    GraphicsBgMapResource_AddPaletteBankOffset(set.third, 8);
    func_020b44e8();
    func_02072048(&set, 0, 0x100);

    GraphicsResourceSet_Load(&set, data_020f4e18, 0x801f, 0x8020, 0x8021);
    GraphicsBgMapResource_AddPaletteBankOffset(set.third, 8);
    func_020b44e8();
    GraphicsBgMapResource_UploadToMainBg(set.third, 1, 0);
    GraphicsResourceSet_Destroy(&set);
}
