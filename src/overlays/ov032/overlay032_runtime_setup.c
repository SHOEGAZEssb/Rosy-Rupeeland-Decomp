#include "tingle/types.h"

/* Overlay 32 scene teardown, scrolling, display initialization, and graphics-resource upload. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

typedef struct GraphicsResourceSet {
    void *tiles;
    void *map;
    void *palette;
} GraphicsResourceSet;

extern void *gSoundContext;
extern void *gDebugFont;
extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *data_021052fc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02058eb8(...);
extern void func_020597fc(...);
extern void func_02074330(...);
extern void func_02071d4c(...);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *);
extern void GraphicsResourceSet_Load(...);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *);
extern void func_02071eb8(void *);
extern void func_020923a0(void *);
extern void func_020923a4(void *);
extern void __destroy_arr(...);
extern void func_0201e0f4(void *);
extern void func_020755bc(void *);
extern void GamePhaseState_SetEnabled(...);
extern void func_020122a0(...);
extern void GX_SetBankForBG(...);
extern void GX_SetGraphicsMode(...);
extern void GXS_SetGraphicsMode(...);
extern void func_020af1f8(...);
extern void func_020aea7c(...);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(...);
extern void func_02092688(...);
extern void func_020b44e8(void);
extern void func_02070638(...);
extern void func_020706c4(...);
extern s32 func_0207042c(void *);
extern void func_02070b50(...);
extern void func_02070bc4(...);
extern void func_02070e0c(...);
extern void func_02070eac(...);
extern void func_02072000(GraphicsResourceSet *);
extern void func_020afd0c(...);
extern void func_02075a04(...);
extern void *func_ov032_021fd7e0(void *);
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

    func_02058eb8(gSoundContext, 0, 0, 0x14, 0x1e);
    func_020597fc(gSoundContext, 0x81);

    void *owned = FIELD(void *, scene, 0x10);
    if (owned != 0) {
        void **vtable = FIELD(void **, owned, 0);
        ((VirtualDestructor)vtable[1])(owned);
    }

    func_02074330(gDebugFont, FIELD(void *, scene, 4));
    func_02074330(data_020f4e14[0], FIELD(void *, scene, 0));
    func_02071d4c(data_020f4e18[0], FIELD(void *, scene, 8));
    GraphicsResourceSet_Destroy((GraphicsResourceSet *)((u8 *)scene + 0xf18));
    __destroy_arr((u8 *)scene + 0xc44, 5, 0x6c, func_ov032_021fd7e0);
    func_020923a0((u8 *)scene + 0xbe8);
    GraphicsResourceSet_Destroy((GraphicsResourceSet *)((u8 *)scene + 0xb44));
    __destroy_arr((u8 *)scene + 0x334, 0x28, 0x30, func_ov032_021fce00);

    for (s32 offset = 0x58; offset >= 0x1c; offset -= 0xc) {
        func_02071eb8((u8 *)scene + offset);
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

static void load_text_resources(GraphicsResourceSet *set, u32 tilesId, u32 mapId,
                                u32 paletteId, s32 layer, u32 mapBase)
{
    GraphicsResourceSet_Load(set, data_020f4e18[0], tilesId, mapId, paletteId);
    func_020b44e8();
    func_02070638(set->tiles, layer, 0);
    func_02070b50(set->map, func_0207042c(set->tiles) ? mapBase : 0);
    func_02070e0c(set->palette, layer, 0);
    func_02072000(set);
}

static void load_affine_resources(GraphicsResourceSet *set, u32 tilesId, u32 mapId,
                                  u32 paletteId, s32 layer, u32 mapBase)
{
    GraphicsResourceSet_Load(set, data_020f4e18[0], tilesId, mapId, paletteId);
    func_020b44e8();
    func_020706c4(set->tiles, layer, 0);
    func_02070bc4(set->map, func_0207042c(set->tiles) ? mapBase : 0);
    func_02070eac(set->palette, layer, 0);
    func_02072000(set);
}

/*
 * Initializes both 2D engines for `scene`, uploads five resource triples from
 * the global archive, establishes BG priority/blending, and sets +0xF2C. It
 * records the previous POWCNT display-swap bit at +0xB50 and temporarily clears
 * that bit; the numeric resource IDs are confirmed, while their asset names are
 * not yet known.
 */
extern "C" void func_ov032_021fd994(void *scene)
{
    GraphicsResourceSet set;
    u8 *context = (u8 *)data_021052fc[0];

    func_0201e0f4(context + 0x2f7c);
    func_020923a4((u8 *)scene + 0xbe8);
    func_020755bc(data_020f4e14[0]);
    func_020755bc(gDebugFont);
    GamePhaseState_SetEnabled(context + 0x24, 0);
    func_020122a0(FIELD(void *, context, 0x2fb8), 0);

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
    func_020925f8();
    func_02092638(0, 1, 2, 3);

    REG32(0x04001000) = (REG32(0x04001000) & ~0x1f00) | 0x1e00;
    GXS_SetGraphicsMode(0);
    func_020aea7c(0x80);
    REG16(0x0400100a) = (REG16(0x0400100a) & 0x43) | 0x3a00;
    REG16(0x0400100c) = (REG16(0x0400100c) & 0x43) | 0x1c10;
    REG16(0x0400100e) = (REG16(0x0400100e) & 0x43) | 0x1e98;
    func_02092618();
    func_02092688(0, 1, 2, 3);

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
    func_02075a04(data_020f4e14[0], 2, 0);
    func_02075a04(gDebugFont, 3, 0);
    FIELD(s32, scene, 0xf2c) = 1;
    GraphicsResourceSet_Destroy(&set);
}

/* Replaces only POWCNT bit 15 with `enabled`; other power-control bits remain unchanged. */
extern "C" void func_ov032_021fde1c(s32 enabled)
{
    REG16(0x04000304) = (REG16(0x04000304) & ~0x8000) | (enabled << 15);
}
