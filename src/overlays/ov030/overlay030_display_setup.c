#include "tingle/types.h"

/* Overlay 30 dual-engine background/display-mode setup and BG control packing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];

#ifdef __cplusplus
extern "C" {
#endif
extern void TitleDisplay_ConfigureMain2dEngine(s32, s32);
extern void TitleDisplay_ResetMainBgScroll(void);
extern void TitleDisplay_SetMainBgPriorities(s32, s32, s32, s32);
extern void TitleDisplay_ConfigureSub2dEngine(s32);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetSubBgPriorities(s32, s32, s32, s32);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void func_ov030_021fe3e0(s32, s32, s32, s32, s32);
extern void func_ov030_021fe414(s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Configures both display engines for mode value 0x1C, sets main BG0/BG1 via
 * the two helpers, normalizes BG2/BG3 control registers to preserved bits 0,1,
 * and 6 plus 0x1E00, assigns BG priorities 0..3, and mirrors selected font/
 * canvas halfwords into its configuration block. Returns void; scene fields,
 * engine graphics state, POWERCNT, and background-control MMIO change.
 */
extern "C" void func_ov030_021fe2b4(void *scene)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, scene, 0x48) = 0x1c;
    TitleDisplay_ConfigureMain2dEngine(0, 0x1c);
    func_ov030_021fe3e0(0, 1, 0x18, 4, 1);
    func_ov030_021fe414(2, 1, 0x1a, 4, 1);
    volatile u16 *mainBg2 = (volatile u16 *)0x0400000c;
    mainBg2[0] = (mainBg2[0] & 0x43) | 0x1e00;
    mainBg2[1] = (mainBg2[1] & 0x43) | 0x1e00;
    TitleDisplay_ResetMainBgScroll();
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);

    FIELD(s32, scene, 0x4c) = 0x1c;
    TitleDisplay_ConfigureSub2dEngine(0);
    volatile u16 *subBg2 = (volatile u16 *)0x0400100c;
    subBg2[0] = (subBg2[0] & 0x43) | 0x1e00;
    subBg2[1] = (subBg2[1] & 0x43) | 0x1e00;
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    void *configuration = GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14[0]);
    FIELD(u16, configuration, 6) = FIELD(u16, configuration, 0x16);
    FIELD(u16, configuration, 8) = FIELD(u16, configuration, 0x1e);
    FIELD(u16, configuration, 0xa) = 0x4210;
    FIELD(u16, configuration, 0xc) = FIELD(u16, configuration, 0x1e);
}

/*
 * Packs `priority`, `characterBase`, `screenBase`, `size`, and `colorMode` into
 * main-engine BG0CNT while preserving bits 0,1, and 6. Returns void; main BG0
 * control MMIO changes. Parameter meanings follow the standard DS BGxCNT bit
 * layout inferred from the shifts.
 */
extern "C" void func_ov030_021fe3e0(s32 priority, s32 characterBase,
                                      s32 screenBase, s32 size, s32 colorMode)
{
    u16 preserved = *(volatile u16 *)0x04000008 & 0x43;
    *(volatile u16 *)0x04000008 = preserved | (priority << 14) |
        (characterBase << 7) | (screenBase << 8) | (size << 2) |
        (colorMode << 13);
}

/*
 * Packs the same five BGxCNT fields as 0x021FE3E0 into main-engine BG1CNT,
 * preserving bits 0,1, and 6. Returns void; main BG1 control MMIO changes.
 */
extern "C" void func_ov030_021fe414(s32 priority, s32 characterBase,
                                      s32 screenBase, s32 size, s32 colorMode)
{
    u16 preserved = *(volatile u16 *)0x0400000a & 0x43;
    *(volatile u16 *)0x0400000a = preserved | (priority << 14) |
        (characterBase << 7) | (screenBase << 8) | (size << 2) |
        (colorMode << 13);
}
