#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/* Overlay 16 graphics-resource setup for its two main presentation modes. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02070f80(void *, s32);
extern void func_020925f8(void);
extern void func_02092638(s32, s32, s32, s32);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020b44e8(void);
extern void func_ov016_021fd188(void *);
extern void func_ov016_021fd1e0(void *);
extern void func_ov016_021ff04c(s32);
extern void Overlay016_ConfigureMainBg3(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Configure the mode using list finalizer 0x021FD188. Disable display power bit
 * 15, set main layer mask +0x48 to 0x1C, configure BG3 and priorities, then load
 * resource triples 0x8004-0x8006 and 0x8012/0x8013/0x8017. The first set's
 * third resource receives parameter 8 before both sets are applied. Finally,
 * finalize the list at state +0x444 and release the temporary resource set.
 * Return void; display and graphics-resource state are changed globally.
 */
extern "C" void func_ov016_021ff094(void *state)
{
    GraphicsResourceSet resources;

    func_ov016_021ff04c(0);
    FIELD(s32, state, 0x48) = 0x1c;
    Overlay016_ConfigureMainBg3(0, 0, 0x1e, 4);
    func_020925f8();
    func_02092638(0, 0, 2, 3);

    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8004, 0x8005, 0x8006);
    func_02070f80(resources.resource2, 8);
    func_020b44e8();
    func_02072048(&resources, 3, 0x100);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8012, 0x8013, 0x8017);
    func_020b44e8();
    func_02072048(&resources, 2, 0);
    func_ov016_021fd188(FIELD(void *, state, 0x444));
    GraphicsResourceSet_Destroy(&resources);
}

/*
 * Configure the alternate mode using list finalizer 0x021FD1E0. Set main layer
 * mask +0x48 to 0x1C, configure BG3, clear main BG2/BG3 scroll at 0x04000018,
 * and load/apply triples 0x8008-0x800A and 0x8012/0x8013/0x801D. The latter's
 * third resource receives parameter 8. Configure main blending with arguments
 * (0,12,4,12), finalize the list at state +0x444, and free temporary resources.
 * Return void; this performs direct display MMIO and global resource changes.
 */
extern "C" void func_ov016_021ff17c(void *state)
{
    GraphicsResourceSet resources;

    FIELD(s32, state, 0x48) = 0x1c;
    Overlay016_ConfigureMainBg3(0, 0, 0x1e, 4);
    func_020925f8();
    *(volatile u32 *)0x04000018 = 0x00380000;
    func_02092638(0, 0, 3, 2);

    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8008, 0x8009, 0x800a);
    func_020b44e8();
    func_02072048(&resources, 2, 0);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0x8012, 0x8013, 0x801d);
    func_02070f80(resources.resource2, 8);
    func_020b44e8();
    func_02072048(&resources, 3, 0x100);
    func_020afd0c((void *)0x04000050, 0, 0xc, 4, 0xc);
    func_ov016_021fd1e0(FIELD(void *, state, 0x444));
    GraphicsResourceSet_Destroy(&resources);
}
