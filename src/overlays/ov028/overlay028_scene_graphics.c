#include "tingle/types.h"

/* Overlay 28 display setup, list creation, and per-frame graphics updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *data_021f3d68;
extern u16 data_ov028_021ff300[];
extern const u8 data_ov028_021ff2e8[];
extern void *gHeapContext;
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void GamePhaseCurrencyHud_Update(void *);
extern void func_02070638(void *, s32, s32);
extern void *func_02070874(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070f34(void *, s32);
extern void func_02072048(void *, s32, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern s32 func_0209189c(void *, s32, s32);
extern void func_020925a4(s32, s32);
extern void func_020925f8(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092850(s32);
extern void func_02094574(void *);
extern void func_020948e4(void *, s32, s32);
extern void func_02095360(void *);
extern void func_020958d8(void *);
extern void func_020b2058(void *, s32, s32);
extern void func_020b44e8(void);
extern void func_ov028_021fcf2c(const u16 *, const u16 *, s32);
extern void func_ov028_021fd00c(void *, void *, s32);
extern void *func_ov028_021fd20c(void *, const void *);
extern void func_ov028_021fd2ec(void *);
extern void func_ov028_021fda4c(void *);
extern void func_ov028_021fe540(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Configures main-engine display state. It disables one control bit at
 * 0x04000304, writes scene field +0x48=30, configures BG control registers
 * 0x04000008..0x0E, display routing, and font state. Temporary resource sets
 * load IDs 0x803D..0x8040 and 0xC009..0xC00B, publish graphics, install two
 * layers, and interpolate the loaded palette into 0x021FF300 before copying
 * 0x100 bytes to destination 0x20. It finally selects manager state zero.
 * Returns void; graphics SDK state and Nintendo DS MMIO are modified.
 */
extern "C" void func_ov028_021fe1b0(void *state)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, state, 0x48) = 0x1e;
    func_020925a4(0, 0x1e);
    volatile u16 *bg = (volatile u16 *)0x04000008;
    bg[0] = (bg[0] & 0x43) | 0x3a00;
    bg[1] = (bg[1] & 0x43) | 0x3c00;
    bg[2] = (bg[2] & 0x43) | 0x1e10;
    bg[3] = (bg[3] & 0x43) | 0x1e10;
    func_020925f8();
    func_02092638(1, 1, 2, 3);
    u16 *fontState = (u16 *)GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14[0]);
    fontState[1] = fontState[13];
    fontState[2] = fontState[15];

    u32 setA[3], setB[3], setC[3];
    GraphicsResourceSet_Init(setA);
    GraphicsResourceSet_Init(setB);
    GraphicsResourceSet_Load(setA, data_020f4e18[0], 0x803d, 0x803e, 0x803f);
    GraphicsResourceSet_Load(setB, data_020f4e18[0], 0x803d, 0x803e, 0x8040);
    func_020b44e8();
    func_02072048(setA, 1, 0);
    func_02072048(setB, 0, 0);
    GraphicsResourceSet_Destroy(setB);
    GraphicsResourceSet_Destroy(setA);

    GraphicsResourceSet_Init(setC);
    GraphicsResourceSet_Load(setC, data_020f4e18[0], 0xc009, 0xc00a, 0xc00b);
    func_02070f34((void *)setC[2], 8);
    func_020b44e8();
    func_02070638((void *)setC[0], 2, 0);
    func_02070e0c((void *)setC[2], 2, 0);
    void *paletteResource = (void *)setC[1];
    const u16 *from = (const u16 *)func_02070874(paletteResource);
    const u16 *to = (const u16 *)func_02070874(paletteResource);
    func_ov028_021fcf2c(from, to, 0);
    func_020b2058(data_ov028_021ff300, 0x100, 0x20);
    func_02092850(0);
    GraphicsResourceSet_Destroy(setC);
}

/*
 * Allocates the 0x4C-byte list at scene +0x220 for the global descriptor count
 * +0x10C. It appends descriptor pointers from +8, explicitly assigns X=0 and
 * Y=index*24 to each returned row, then creates the initial visible sprites.
 * Returns void; heap, list, and sprite SDK state change.
 */
extern "C" void func_ov028_021fe3a4(void *state)
{
    s32 count = FIELD(s32, data_021f3d68, 0x10c);
    void *list = Heap_Alloc(0x4c, data_ov028_021ff2e8, 4, gHeapContext);
    if (list != 0)
        func_ov028_021fd00c(list, data_020f4e14[0], count);
    FIELD(void *, state, 0x220) = list;
    for (s32 i = 0; i < count; ++i) {
        void *row = func_ov028_021fd20c(
            list, FIELD(void *, data_021f3d68, 8 + i * 4));
        FIELD(s16, row, 8) = 0;
        FIELD(s16, row, 0xa) = (s16)(i * 0x18);
    }
    func_ov028_021fd2ec(list);
}

/*
 * Advances scene child aggregate +0x264 and imported sprite +0x90. When child
 * +0x260 completes its interval (+0x80>=+0x7C), randomized -2..2 offsets are
 * applied around base coordinates +0x274/+0x278 and a random [16,32] parameter
 * is installed. It then advances global context, both controllers, renderers,
 * optional list controller, and effect owner. Returns void; PRNG and graphics,
 * UI, and context SDK state change.
 */
extern "C" void func_ov028_021fe438(void *state)
{
    func_02095360((u8 *)state + 0x264);
    if (FIELD(void *, state, 0x90) != 0)
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, FIELD(void *, state, 0x90), 0));
    void *child = FIELD(void *, state, 0x260);
    if (FIELD(s32, child, 0x80) >= FIELD(s32, child, 0x7c)) {
        s32 offset = func_0209189c((u8 *)state + 0x27c, -2, 2);
        func_020948e4((u8 *)child + 0xc, 2,
                      FIELD(s32, state, 0x274) + (offset << 12));
        offset = func_0209189c((u8 *)state + 0x27c, -2, 2);
        func_020948e4((u8 *)child + 0x1c, 2,
                      FIELD(s32, state, 0x278) + (offset << 12));
        func_ov028_021fe540(child,
                           func_0209189c((u8 *)state + 0x27c, 0x10, 0x20));
    }
    GamePhaseCurrencyHud_Update(gLupyContext);
    func_020958d8((u8 *)state + 0x98);
    func_020958d8((u8 *)state + 0x144);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x54));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x58));
    if (FIELD(void *, state, 0x220) != 0)
        func_02094574(FIELD(void *, FIELD(void *, state, 0x220), 0x44));
    if (FIELD(void *, state, 0x224) != 0)
        func_ov028_021fda4c(FIELD(void *, state, 0x224));
}
