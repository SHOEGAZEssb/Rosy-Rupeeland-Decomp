#include "tingle/types.h"

/* Overlay 20 scene teardown, graphics loading, list hit testing, and startup dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18[];
extern const s32 data_ov020_021fe458[2];
extern const s32 data_ov020_021fe478[2];
extern const u32 data_ov020_021fe504[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void GraphicsResourceSet_Apply(void *, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void func_02070f80(void *, s32);
extern void func_02071eb8(void *);
extern void func_02072048(void *, s32, s32);
extern void func_0207419c(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_020925a4(s32);
extern void func_020925dc(s32);
extern void func_020925f8(void);
extern void func_02092618(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_02092688(s32, s32, s32, s32);
extern void func_020927b8(void *);
extern s32 func_020befec(s32, s32);
extern void func_020b44e8(void);
extern void func_ov020_021fcfd4(void *);
extern void func_ov020_021fd1cc(void *);
extern void func_ov020_021fd404(void *);
extern void func_ov020_021fd818(void *);
extern void func_ov020_021fd81c(void *, s32, s32, s32);
extern void func_ov020_021fde9c(void *);
extern s32 func_ov020_021fdee0(void *);
#ifdef __cplusplus
}
#endif

/* Shared ordered teardown used by both scene destructor variants. */
static void destroySceneContents(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov020_021fe504;
    FIELD(u32, state, 0x20) &= ~0x400U;
    func_0207419c(FIELD(void *, state, 0x6c));
    void *detail = FIELD(void *, state, 0x1e0);
    if (detail != 0) {
        func_ov020_021fd404(detail);
        Heap_Free(detail);
    }
    void *list = FIELD(void *, state, 0x1dc);
    if (list != 0) {
        func_ov020_021fcfd4(list);
        Heap_Free(list);
    }
    func_020927b8((u8 *)state + 0x1b8);
    func_ov020_021fd818((u8 *)state + 0x70);
    func_02071eb8((u8 *)state + 0x60);
    func_02071eb8((u8 *)state + 0x54);
}

/*
 * Restore vtable data_ov020_021FE504, clear scene flag bit 10, release renderer
 * +0x6C, destroy/free optional detail +0x1E0 and list +0x1DC, then tear down
 * manager +0x1B8, callback +0x70, and resources +0x60/+0x54. Return state
 * without freeing it. Heap/resource/UI ownership changes; no direct MMIO.
 */
extern "C" void *func_ov020_021fdb8c(void *state)
{
    destroySceneContents(state);
    return state;
}

/* Perform 0x021FDB8C teardown, free the scene, and return its invalid former address. */
extern "C" void *func_ov020_021fdc14(void *state)
{
    destroySceneContents(state);
    Heap_Free(state);
    return state;
}

/*
 * Set POWCNT1 LCD-swap bit 15; configure main BG2/BG3 and sub BG0/BG1/BG3
 * control words while preserving bits 0,1,6; store selectors 0x1C/+0x48 and
 * 0x1A/+0x4C; then invoke main/sub setup and 0/1/2/3 layer ordering. Returns
 * void. Graphics SDK state and Nintendo DS POWCNT1/BG control MMIO change.
 */
extern "C" void func_ov020_021fdca4(void *state)
{
    volatile u16 *mainBg = (volatile u16 *)0x0400000c;
    volatile u16 *subBg = (volatile u16 *)0x04001008;
    *(volatile u16 *)0x04000304 |= 0x8000;
    FIELD(s32, state, 0x48) = 0x1c;
    func_020925a4(0);
    mainBg[0] = (mainBg[0] & 0x43) | 0x1c10;
    mainBg[1] = (mainBg[1] & 0x43) | 0x1e18;
    func_020925f8();
    func_02092638(0, 1, 2, 3);
    FIELD(s32, state, 0x4c) = 0x1a;
    func_020925dc(0);
    subBg[0] = (subBg[0] & 0x43) | 0x3800;
    subBg[1] = (subBg[1] & 0x43) | 0x3a00;
    subBg[3] = (subBg[3] & 0x43) | 0x1e18;
    func_02092618();
    func_02092688(0, 1, 2, 3);
}

/*
 * Load/apply 0x803D..0x803F to layer 1 at scale 0x100 after mode 8 on the
 * third handle; load 0x802E/0x802C/0x802F to layer 3; then 0x802B..0x802D to
 * layer 2. Destroy the temporary set. Graphics/resource SDK state changes;
 * returns void with no direct hardware access.
 */
extern "C" void func_ov020_021fdd88(void)
{
    u8 resources[12];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0], 0x803d, 0x803e, 0x803f);
    func_02070f80(FIELD(void *, resources, 8), 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(resources, 1, 0x100);
    GraphicsResourceSet_Load(resources, data_020f4e18[0], 0x802e, 0x802c, 0x802f);
    func_020b44e8();
    func_02072048(resources, 3, 0);
    GraphicsResourceSet_Apply(resources, 3, 0);
    GraphicsResourceSet_Load(resources, data_020f4e18[0], 0x802b, 0x802c, 0x802d);
    func_02072048(resources, 2, 0);
    GraphicsResourceSet_Destroy(resources);
}

/*
 * Map scene coordinates +0x34/+0x38 inside X=32..204,Y=16..136 to a 24-pixel
 * visible row, clamp row 5+ to 4, add list first-visible +0x0C, and return it
 * when below total +0x120; otherwise return -1. State is read only; division
 * uses 0x020BEFEC and no hardware is accessed.
 */
extern "C" s32 func_ov020_021fdf08(void *state)
{
    s32 y = FIELD(s32, state, 0x38) - 0x10;
    s32 x = FIELD(s32, state, 0x34) - 0x20;
    if (x < 0 || x > 0xac || y < 0 || y > 0x78)
        return -1;
    s32 row = func_020befec(y, 0x18);
    if (row >= 5)
        row = 4;
    void *controller = FIELD(void *, FIELD(void *, state, 0x1dc), 0x44);
    s32 index = row + FIELD(s32, controller, 0xc);
    return index < FIELD(s32, state, 0x120) ? index : -1;
}

/*
 * On phase +4 zero, set flag bit zero. For nonempty total +0x120, commit both
 * fonts, render list +0x1DC, position the selector, render initial details, and
 * select transition 0x021FE458; otherwise select empty-list transition
 * 0x021FE478. Always return zero. UI/transition state may change; no MMIO.
 */
extern "C" s32 func_ov020_021fdf7c(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        FIELD(u32, state, 0x20) |= 1;
        if (FIELD(s32, state, 0x120) != 0) {
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            func_ov020_021fd1cc(FIELD(void *, state, 0x1dc));
            func_ov020_021fde9c(state);
            func_ov020_021fdee0(state);
            func_ov020_021fd81c(state, data_ov020_021fe458[0],
                                data_ov020_021fe458[1], 0);
        } else {
            func_ov020_021fd81c(state, data_ov020_021fe478[0],
                                data_ov020_021fe478[1], 0);
        }
    }
    return 0;
}
