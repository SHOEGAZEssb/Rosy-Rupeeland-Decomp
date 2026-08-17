#include "tingle/types.h"

/* Overlay 24 display-engine bootstrap and selector-dependent map resources. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_02070638(void *, s32, s32);
extern void func_02070b50(void *, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02072048(void *, s32, s32);
extern void func_020925a4(s32);
extern void func_020925f8(void);
extern void func_02092638(s32, s32, s32, s32);
extern void TitlePalette_SetMainBackdrop(u16);
extern void func_020afce8(void *, s32, s32);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

static void load_and_install(void *set, s32 first, s32 third, s32 slot)
{
    /* All overlay-specific map triplets share archive member 0xB087. */
    GraphicsResourceSet_Load(set, data_020f4e18, first, 0xb087, third);
    func_020b44e8();
    func_02072048(set, slot, 0);
}

/*
 * Configures the main DS engine's BG modes, layer order, blend state, and the
 * shared display-mode field +0x48. It selects three map triplets according to
 * saved selector +0x58, then loads common resource 0xC00C..0xC00E. Every map
 * cell in that common resource is moved to palette bank 15 and its tile index
 * is advanced by 0x100 before character/map/palette data are installed. MMIO,
 * archive, graphics-resource, VRAM, and palette state change; returns void.
 */
extern "C" void func_ov024_021fd2f8(void *scene)
{
    *(volatile u16 *)0x04000304 &= (u16)~0x8000;
    FIELD(s32, scene, 0x48) = 31;
    func_020925a4(0);

    volatile u16 *bg = (volatile u16 *)0x04000008;
    bg[0] = (bg[0] & 0x43) | 0xe008;
    bg[1] = (bg[1] & 0x43) | 0xe410;
    bg[2] = (bg[2] & 0x43) | 0xc818;
    bg[3] = (bg[3] & 0x43) | 0x0c14;
    func_020925f8();
    func_02092638(2, 2, 2, 3);
    *(volatile u32 *)0x04000000 =
        (*(volatile u32 *)0x04000000 & ~0xe000u) | 0x8000;
    func_020afce8((void *)0x04000050, 31, 0);
    *(volatile u16 *)0x0400004a =
        (*(volatile u16 *)0x0400004a & (u16)~0x3f3f) | 0x3f1f;

    void *set[3];
    GraphicsResourceSet_Init(set);
    s32 choice = FIELD(s32, scene, 0x58);
    if (choice >= 1 && choice <= 4) {
        static const s32 first[] = { 0, 0xb086, 0xb089, 0xb08b, 0xb08d };
        static const s32 third[] = { 0, 0xb088, 0xb08a, 0xb08c, 0xb08e };
        load_and_install(set, first[choice], third[choice], 2);
        load_and_install(set, 0xb08f, 0xb090, 1);
        load_and_install(set, 0xb097, 0xb098, 0);
    } else if (choice >= 5 && choice <= 7) {
        static const s32 first[] = { 0xb091, 0xb093, 0xb095 };
        static const s32 third[] = { 0xb092, 0xb094, 0xb096 };
        load_and_install(set, 0xb08d, 0xb08e, 2);
        load_and_install(set, first[choice - 5], third[choice - 5], 1);
        load_and_install(set, 0xb097, 0xb098, 0);
    } else {
        load_and_install(set, 0xb08d, 0xb08e, 2);
        load_and_install(set, 0xb095, 0xb096, 1);
        if (choice == 8)
            load_and_install(set, 0xb099, 0xb09a, 0);
        else if (choice == 9)
            load_and_install(set, 0xb09b, 0xb09c, 0);
        else
            load_and_install(set, 0xb09d, 0xb09e, 0);
    }

    GraphicsResourceSet_Load(set, data_020f4e18, 0xc00c, 0xc00d, 0xc00e);
    u16 *cells = FIELD(u16 *, set[2], 0x24);
    s32 count = FIELD(s32, FIELD(void *, set[2], 0x20), 0xc) *
                FIELD(s32, FIELD(void *, set[2], 0x20), 0x10);
    for (s32 i = 0; i < count; ++i)
        cells[i] = (u16)((cells[i] & 0xfc00) |
                         ((cells[i] + 0x100) & 0x03ff) | 0xf000);
    func_020b44e8();
    func_02070638(set[0], 3, 0x2000);
    func_02070b50(set[1], 0x1e0);
    func_02070e0c(set[2], 3, 0);
    TitlePalette_SetMainBackdrop(*(u16 *)GraphicsBgResourceData_GetDecoded(set[1]));
    GraphicsResourceSet_Destroy(set);
}
