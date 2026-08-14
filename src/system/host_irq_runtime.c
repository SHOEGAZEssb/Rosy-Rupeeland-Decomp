/*
 * Portable reconstruction of the title-relevant ITCM IRQ runtime beginning at
 * 0x01FF8000. It preserves callback registration, scene hooks, graphics flush
 * order, VCount accounting, and interrupt-observed frame counters without
 * executing the retail ITCM image.
 */
#include "tingle/scene.h"
#include "tingle/types.h"

#include <stddef.h>

extern void func_020b2840(u32 interrupt, void (*handler)(void));
extern void func_020b273c(u32 interrupt_mask);
extern void func_020748a8(void *renderer);
extern void BgScroll_Flush(void);
extern void MainBgPaletteBuffer_Flush(void *buffer);
extern void SubBgPaletteBuffer_Flush(void *buffer);
extern void MainBgExtendedPaletteBuffer_Flush(void *buffer);
extern void SubBgExtendedPaletteBuffer_Flush(void *buffer);

extern void *data_020f4e14;
extern void *gDebugFont;
extern u8 gMainBgPaletteBuffer[];
extern u8 gSubBgPaletteBuffer[];
extern u8 gMainBgExtendedPaletteBuffer[];
extern u8 gSubBgExtendedPaletteBuffer[];

extern s32 gVCountAccumulator;
extern s32 gMaxFrameVCount;
extern s32 gFrameVCount;
extern s32 gAdjustedVCount;
extern s32 gPreviousVCount;
extern s32 data_027e0060;
extern s32 data_027e0064;
extern s32 data_027e0068;
extern s32 data_027e006c;
extern s32 data_027e0084;

/* Retail VBlank callback at 0x01FF80C0. */
void func_01ff80c0(void)
{
    s32 current_vcount = *(volatile u16 *)0x04000006;
    s32 elapsed;
    Scene *scene;

    data_027e006c = current_vcount;
    if (data_020f4e14 != NULL)
        func_020748a8(data_020f4e14);
    if (gDebugFont != NULL)
        func_020748a8(gDebugFont);
    if (gSceneManager != NULL && !SceneManager_IsEmpty(gSceneManager)) {
        scene = SceneManager_GetCurrent(gSceneManager);
        if ((scene->flags.raw & 1) != 0)
            scene->vtable->method0C(scene);
    }
    BgScroll_Flush();
    MainBgPaletteBuffer_Flush(gMainBgPaletteBuffer);
    SubBgPaletteBuffer_Flush(gSubBgPaletteBuffer);
    MainBgExtendedPaletteBuffer_Flush(gMainBgExtendedPaletteBuffer);
    SubBgExtendedPaletteBuffer_Flush(gSubBgExtendedPaletteBuffer);

    data_027e0068 = current_vcount < data_027e006c
        ? current_vcount + 0x107
        : current_vcount;
    elapsed = data_027e0068 - data_027e006c;
    if (gMaxFrameVCount < elapsed)
        gMaxFrameVCount = elapsed;
    gFrameVCount = elapsed;
    ++gVCountAccumulator;
    ++data_027e0084;
    *(volatile u32 *)0x04003ff8 |= 1;
}

/* Retail HBlank callback at 0x01FF8220. */
void func_01ff8220(void)
{
    Scene *scene;

    if (gSceneManager != NULL && !SceneManager_IsEmpty(gSceneManager)) {
        scene = SceneManager_GetCurrent(gSceneManager);
        if ((scene->flags.raw & 2) != 0)
            scene->vtable->method10(scene);
    }
    *(volatile u32 *)0x04003ff8 |= 2;
}

/* Register the recovered display callbacks and reset retail timing globals. */
void func_01ff8000(void)
{
    func_020b2840(1, func_01ff80c0);
    func_020b2840(2, func_01ff8220);
    func_020b273c(3);
    *(volatile u16 *)0x04000208 = 1;
    gPreviousVCount = 0;
    gAdjustedVCount = 0;
    gFrameVCount = 0;
    gMaxFrameVCount = 0;
    gVCountAccumulator = 0;
    data_027e006c = 0;
    data_027e0068 = 0;
    data_027e0064 = 0;
    data_027e0060 = 0;
    data_027e0084 = 0;
}
