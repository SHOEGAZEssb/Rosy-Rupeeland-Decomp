#include "tingle/types.h"

/* Overlay 27 two-layer geometry renderer for the timed motion object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_ov027_021fe9a4[];
extern const s16 data_ov027_021fe9d4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov027_021fd0f0(u32, u32, u32, u32, u32, u32);
extern void func_ov027_021fd150(s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Draws two four-vertex layers when scale +0x70 is positive. It loads the
 * object translation, scales x/y by +0x70, configures texture modes 0 and 1,
 * and submits vertices from 12-byte records at 0x021FE9A4/0x021FE9D4. Each
 * record contains x/y followed by two already-packed command words. The first
 * layer uses color 0x7FFF at z=0; the second uses +0xB4 at z=-0x20. Returns
 * void and writes geometry registers 0x04000444-0x04000504 directly.
 */
extern "C" void func_ov027_021fd834(void *object)
{
    s32 scale = FIELD(s32, object, 0x70);
    if (scale <= 0)
        return;

    volatile u32 *const matrix = (volatile u32 *)0x04000444;
    matrix[0] = 0;
    matrix[11] = FIELD(u32, object, 0x10);
    matrix[11] = FIELD(u32, object, 0x20);
    matrix[11] = FIELD(u32, object, 0x30);
    matrix[10] = scale;
    matrix[10] = scale;
    matrix[10] = 0x1000;

    func_ov027_021fd0f0(0, 0, 3, 0, 0x1f, 0);
    *(volatile u32 *)0x04000500 = 0;
    *(volatile u32 *)0x04000480 = 0x7fff;
    for (s32 i = 0; i < 4; ++i) {
        const s16 *record = data_ov027_021fe9a4 + i * 6;
        func_ov027_021fd150(record[0], record[1], 0);
        *(volatile u32 *)0x04000494 =
            (u16)record[2] | ((u32)(u16)record[3] << 16);
        *(volatile u32 *)0x04000494 =
            (u16)record[4] | ((u32)(u16)record[5] << 16);
    }
    *(volatile u32 *)0x04000504 = 0;

    func_ov027_021fd0f0(0, 0, 3, 1, 0xc, 0);
    *(volatile u32 *)0x04000500 = 0;
    *(volatile u32 *)0x04000480 = FIELD(u16, object, 0xb4);
    for (s32 i = 0; i < 4; ++i) {
        const s16 *record = data_ov027_021fe9d4 + i * 6;
        func_ov027_021fd150(record[0], record[1], -0x20);
        *(volatile u32 *)0x04000494 =
            (u16)record[2] | ((u32)(u16)record[3] << 16);
        *(volatile u32 *)0x04000494 =
            (u16)record[4] | ((u32)(u16)record[5] << 16);
    }
    *(volatile u32 *)0x04000504 = 0;
    *(volatile u32 *)0x04000448 = 1;
}
