#include "tingle/types.h"

/*
 * Overlay 40 fixed scene tables. This recovered initialization pass clears
 * per-slot runtime storage and installs fixed-point magnitudes, parameter
 * triples, rectangles, and byte mappings used by later motion/render updates.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void func_ov040_021fe18c(void *destination, const void *source);
extern void func_ov040_02202244(void *scene, s32 mode);
#ifdef __cplusplus
}
#endif

static const s32 sSlotMagnitude[29] = {
    0x32000, 0x5000, 0x78000, 0x10000, 0x10000, 0x10000, 0x14000,
    0x10000, 0x10000, 0x26000, 0x14000, 0x10000, 0x20000, 0x18000,
    0x10000, 0x20000, 0x18000, 0x18000, 0x18000, 0x14000, 0x14000,
    0x14000, 0x14000, 0xa000, 0x20000, 0x4000, 0x4000, 0xc000, 0
};

/* Three values stored in separate interleaved lanes at +0x2E8..+0x434. */
static const s32 sSlotParameters[29][3] = {
    {0,0,0}, {0,0,0}, {0,0,0}, {0,0x290,0}, {0,0x290,0}, {0x23d,0,0},
    {0,0,0}, {0x800,0,0}, {0,0x800,0}, {0,0,0}, {0,0,0xcd},
    {0x1c3,0,0x1800}, {0,0,0}, {0x1c3,0,0xcd}, {0x333,0,0},
    {0x333,0,0}, {0x2b8,0xc00,0}, {0x266,0xb33,0}, {0xccd,0,0},
    {0x4cd,0,0x452}, {0x4cd,0,0x452}, {-0x1000,0,0}, {0,0,0},
    {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0x7000,0}, {0,0,0x35c}
};

static const s32 sSlotRect[29][4] = {
    {0,0,0x8000,0x20000}, {0xa8000,0x48000,0x40000,-0x48000},
    {0,0xb0000,0x8000,0x20000}, {0x98000,0x58000,-0x98000,-0x58000},
    {0x20000,0x78000,0x10000,0x30000}, {0x20000,0x78000,0x10000,0x30000},
    {0x20000,0x78000,0x10000,0x30000}, {0x50000,0x58000,0x18000,0x50000},
    {0x20000,0x78000,0x10000,0x30000}, {0x20000,0x78000,0x10000,0x30000},
    {0x20000,0xb8000,-0x20000,-0x60000}, {0x100000,0x4c000,-0x18000,0x30000},
    {0x20000,0x78000,0x10000,0x30000}, {0x30000,0x58000,0x20000,0x38000},
    {0x100000,0xd8000,-0x18000,-0x30000}, {0x20000,0x78000,0x10000,0x30000},
    {0x30000,0x58000,0x20000,0x38000}, {0xe8000,0xd8000,0x18000,-0x30000},
    {0xc8000,0x48000,0x18000,0x38000}, {0xb0000,0x48000,0x18000,0x38000},
    {0xe0000,0x80000,0x20000,0x28000}, {0xc0000,0x80000,0x20000,0x28000},
    {0x30000,0x90000,0x20000,0x18000}, {0x30000,0xb8000,0x20000,0x28000},
    {0x38000,0xa8000,0x10000,0x10000}, {0x28000,0xe8000,-0x28000,-0x10000},
    {0x20000,0xa8000,0x8000,0x8000}, {0x20000,0xa8000,0x8000,0x8000},
    {0xe8000,0x38000,0x17000,-0x37000}
};

static const u8 sSlotMapping[29] = {
    0xff,0,1,2,1,1,4,6,5,8,9,0,0x0b,0x0c,0x0d,0x0b,0x0f,
    0x10,4,5,7,9,2,1,0x17,2,0x19,0x19,3
};

/*
 * Initialize all 29 address-derived slots in scene. The extra callback
 * arguments are unused. Returns no value; only scene-owned vector, table, and
 * motion-bound state changes, with vector helpers running their normal SDK
 * construction/copy/destruction effects.
 */
extern "C" void func_ov040_021fd8ac(void *scene, s32 unused1, s32 unused2,
                                      s32 unused3)
{
    (void)unused1; (void)unused2; (void)unused3;
    for (s32 index = 28; index >= 0; index--) {
        s32 zero[4];
        func_0200500c(zero, 0, 0, 0);
        func_020050a4((u8 *)scene + 0x84 + index * 0x10, zero);
        func_02005058(zero);
        FIELD(s32, scene, 0x264 + index * 4) = 0;
        FIELD(s32, scene, 0x2dc + index * 0x0c) = 0;
        FIELD(s32, scene, 0x2e0 + index * 0x0c) = 0;
        FIELD(u8, scene, 0x624 + index) = 0xff;
        FIELD(u8, scene, 0x642 + index) = 1;
    }
    for (s32 index = 0; index < 29; index++) {
        FIELD(s32, scene, 0x268 + index * 4) = sSlotMagnitude[index];
        FIELD(s32, scene, 0x2e8 + index * 0x0c) = sSlotParameters[index][0];
        FIELD(s32, scene, 0x2ec + index * 0x0c) = sSlotParameters[index][1];
        FIELD(s32, scene, 0x2f0 + index * 0x0c) = sSlotParameters[index][2];
        func_ov040_021fe18c((u8 *)scene + 0x444 + index * 0x10,
                            sSlotRect[index]);
        FIELD(u8, scene, 0x624 + index) = sSlotMapping[index];
    }
    for (s32 index = 2; index >= 0; index--) {
        FIELD(s32, scene, 0x868 + index * 0x0c) = 0;
        FIELD(s32, scene, 0x86c + index * 0x0c) = 0;
        FIELD(s32, scene, 0x898 + index * 0x0c) = 0;
        FIELD(s32, scene, 0x89c + index * 0x0c) = 0;
    }
    func_ov040_02202244(scene, 0);
}
