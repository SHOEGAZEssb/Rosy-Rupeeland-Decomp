#include "tingle/types.h"

/* Overlay 31 status-sprite timing and sub-engine transition graphics setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov031_021fe6e0[];
extern void *data_020f4e18[];
extern void *data_020f4dc8[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_020925dc(s32);
extern void func_02092618(void);
extern void func_02092688(s32, s32, s32, s32);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_020b44e8(void);
extern void func_020706c4(void *, s32, s32);
extern void func_02070bc4(void *, s32);
extern void func_02070eac(void *, s32, s32);
extern void GraphicsResourceSet_ReleaseHandles(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void func_ov031_021fce00(void *, s32, s32);
extern void GXx_SetMasterBrightness_(void *, s32);
extern void func_ov031_021fe148(s32, s32, s32, s32, s32);
extern void *DisplayBrightnessPair_GetScreen(void *);
extern void DisplayBrightness_StartTransition(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Controls visible status sprite +0x6C. Nonzero `restart` sets cooldown +0x94 to
 * 200 and selects a frame from table 0x021FE6E0 using choice +0x9C. Otherwise it
 * decrements a nonzero cooldown, or when expired randomizes the next interval in
 * [120,240] and refreshes the frame. It always clears sprite hidden flag bit 2.
 * Returns void; PRNG, cooldown, and sprite state may change.
 */
extern "C" void func_ov031_021fdf20(void *scene, s32 restart)
{
    if (restart != 0) {
        FIELD(s32, scene, 0x94) = 200;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x6c),
            data_ov031_021fe6e0[FIELD(s32, scene, 0x9c)]);
    } else if (FIELD(s32, scene, 0x94) != 0) {
        --FIELD(s32, scene, 0x94);
    } else {
        FIELD(s32, scene, 0x94) =
            func_0209189c((u8 *)scene + 0x54c, 0x78, 0xf0);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, scene, 0x6c),
            data_ov031_021fe6e0[FIELD(s32, scene, 0x9c)]);
    }
    FIELD(u16, FIELD(void *, scene, 0x6c), 0x24) &= (u16)~4;
}

/*
 * Configures sub display mode +0x4C to 0x17, BG0 through 0x021FE148, direct
 * BG1/BG2 control words, and priorities 0,2,1,3. It loads resource triples for
 * IDs around 0x9010, 0x900D, and 0x9009 and uploads character/map/palette data to
 * BG layers 0,1,2 (BG1 map base 0x6000), then destroys the temporary set. Returns
 * void; scene, sub-engine BG MMIO, and graphics resource/VRAM state change.
 */
extern "C" void func_ov031_021fdfa8(void *scene)
{
    FIELD(s32, scene, 0x4c) = 0x17;
    func_020925dc(0);
    func_ov031_021fe148(0, 0, 0x1a, 0, 1);
    volatile u16 *bg1 = (volatile u16 *)0x0400100a;
    bg1[0] = (bg1[0] & 0x43) | 0x3c90;
    bg1[1] = (bg1[1] & 0x43) | 0x1e98;
    func_02092618();
    func_02092688(0, 2, 1, 3);
    u32 resources[3];
    GraphicsResourceSet_Init(resources);

    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x900e, 0x900f, 0x9010);
    func_020b44e8();
    func_020706c4((void *)resources[0], 0, 0);
    func_02070bc4((void *)resources[1], 0);
    func_02070eac((void *)resources[2], 0, 0);
    GraphicsResourceSet_ReleaseHandles(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x900c, 0x9008, 0x900d);
    func_020b44e8();
    func_020706c4((void *)resources[0], 1, 0);
    func_02070bc4((void *)resources[1], 0x6000);
    func_02070eac((void *)resources[2], 1, 0);
    GraphicsResourceSet_ReleaseHandles(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x9007, 0x9008, 0x9009);
    func_020b44e8();
    func_020706c4((void *)resources[0], 2, 0);
    func_02070eac((void *)resources[2], 2, 0);
    GraphicsResourceSet_ReleaseHandles(resources);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Packs five recovered BG-control parameters into sub-engine BG0CNT while
 * preserving bits 0,1,6. Returns void; sub BG0 control MMIO changes. Parameter
 * roles follow the standard Nintendo DS BGxCNT bit layout inferred from shifts.
 */
extern "C" void func_ov031_021fe148(s32 priority, s32 characterBase,
                                      s32 screenBase, s32 size, s32 colorMode)
{
    u16 preserved = *(volatile u16 *)0x04001008 & 0x43;
    *(volatile u16 *)0x04001008 = preserved | (priority << 14) |
        (characterBase << 7) | (screenBase << 8) | (size << 2) |
        (colorMode << 13);
}

/*
 * Disables renderer +0x58, reinitializes waveform +0xA4 for mode-1 eight-frame
 * fade-in, and sets effect-enable +0xA0. Returns void; renderer and waveform
 * memory/SDK state change.
 */
extern "C" void func_ov031_021fe17c(void *scene)
{
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, scene, 0x58));
    func_ov031_021fce00((u8 *)scene + 0xa4, 1, 8);
    FIELD(s32, scene, 0xa0) = 1;
}

/*
 * Ends the scanline waveform by clearing +0xA0 and setting sub master brightness
 * to -16. It reconfigures sub BG0, loads IDs 0x9008/0x900A/0x900B into BG0 with
 * map base 0x4000, enables renderer +0x58, clears sub BG2X, creates a transition
 * object from global resource 0x020F4DC8, and starts it from -16 to 0 over eight
 * ticks. Returns void; scene, renderer, graphics resources, transition state, and
 * sub-engine MMIO change.
 */
extern "C" void func_ov031_021fe1a8(void *scene)
{
    FIELD(s32, scene, 0xa0) = 0;
    GXx_SetMasterBrightness_((void *)0x0400106c, -16);
    func_ov031_021fe148(0, 1, 0x1a, 0, 1);
    u32 resources[3];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0x900a, 0x9008, 0x900b);
    func_020b44e8();
    func_020706c4((void *)resources[0], 0, 0);
    func_02070bc4((void *)resources[1], 0x4000);
    func_02070eac((void *)resources[2], 0, 0);
    FIELD(s32, FIELD(void *, scene, 0x58), 0x20) = 1;
    *(volatile u32 *)0x04001010 = 0;
    void *transition = DisplayBrightnessPair_GetScreen(data_020f4dc8[0]);
    DisplayBrightness_StartTransition(transition, -16, 0, 8);
    GraphicsResourceSet_Destroy(resources);
}
