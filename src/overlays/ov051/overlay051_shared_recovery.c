#include "tingle/field_effect.h"
#include "tingle/types.h"

/*
 * Overlay 51 shared dream-scene geometry and lifecycle support. The recovered
 * base owns two 192-element offset-derived record arrays and common dimensions.
 * Portable bodies mirror the exact assembly fallbacks' fixed-point operations.
 */


extern "C" void func_020ad250(void *record);
extern "C" void func_020ad268(void *record, s32 first, s32 second);
extern "C" void func_020ad274(const void *source, void *destination,
                               s32 first, s32 second);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" u8 data_ov051_0220df70[];
extern "C" s16 gFx32CosSinTable[];
extern "C" u8 gSystemState[];

/* Initialize caller-owned `scene`, construct both embedded record arrays, set
 * the recovered vtable, and store the 0x80-by-0xa0 dimensions. Return `scene`.
 * Embedded SDK/object state changes; no allocation or direct MMIO occurs. */
extern "C" void *func_ov051_0220d600(void *scene)
{
    u8 *bytes = (u8 *)FieldEffect_Init(scene);
    s32 index;

    *(void **)bytes = data_ov051_0220df70;
    for (index = 0; index < 0xc0; ++index) {
        func_020ad250(bytes + 0xc10 + index * 0x10);
        func_020ad250(bytes + 0x10 + index * 0x10);
    }
    *(s32 *)(bytes + 8) = 0x80;
    *(s32 *)(bytes + 0xc) = 0xa0;
    return scene;
}

/*
 * Advance the shared scene records using the recovered offset-based selection
 * and update logic, then publish derived values through the SDK helpers. Scene
 * and SDK state change; the return value is not used and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220d774(void *destination, s32 first,
                                     s32 second, s32 duration);
extern "C" s32 func_ov051_0220d7bc(const void *range, s32 index, s32 mode);

extern "C" void func_ov051_0220d688(void *scene)
{
    u8 *bytes = (u8 *)scene;
    s32 vertical_range[3];
    s32 horizontal_range[3];
    s32 index;
    u16 *angle = (u16 *)(bytes + 0x1810);

    *angle = 0x2000;
    func_ov051_0220d774(vertical_range, -0x1000, 0x1000, 0x12c);
    *angle = (u16)func_ov051_0220d7bc(
        vertical_range, *(s32 *)(gSystemState + 0x64), 0);
    func_ov051_0220d774(horizontal_range, 0x1000, 0x1333, 0x60);
    for (index = 0; index < 0xc0; ++index) {
        u8 *record = bytes + 0x10 + index * 0x10;
        s32 scalar = func_ov051_0220d7bc(
            horizontal_range, *(s32 *)(gSystemState + 0x64) + index, 0);
        /* Retail LDRH keeps the complete unsigned 16-bit phase; treating the
         * high half as signed would index before the 4096-pair trig table. */
        u32 lookup = *angle >> 4;

        func_020ad250(record);
        func_020ad268(record, gFx32CosSinTable[lookup * 2],
                      gFx32CosSinTable[lookup * 2 + 1]);
        func_020ad274(record, record, scalar, scalar);
    }
}

/*
 * Convert the offset-derived input coordinates into the destination transform
 * record and apply the fixed-point helper. Destination/SDK transform state
 * changes; nothing is returned and no direct hardware access occurs.
 */
extern "C" void func_ov051_0220d774(void *destination, s32 first,
                                     s32 second, s32 duration)
{
    s32 *range = (s32 *)destination;
    s32 half = (first - second) / 2;

    range[0] = half;
    if (half < 0)
        half = -half;
    range[1] = (first <= second ? first : second) + half;
    range[2] = func_020befec(0x10000, duration);
}

/*
 * Compute and store the recovered bounds/coordinates from `source` into
 * `destination`. The arithmetic and field meanings remain inferred from their
 * offsets. Destination memory changes; nothing is returned and no SDK/MMIO is used.
 */
extern "C" s32 func_ov051_0220d7bc(const void *rangeValue, s32 index,
                                    s32 mode)
{
    const s32 *range = (const s32 *)rangeValue;
    u16 phase = (u16)(range[2] * index);
    s16 factor;
    s64 product;

    if (mode == 0)
        factor = gFx32CosSinTable[((phase >> 4) * 2 + 1)];
    else if (mode == 1)
        factor = gFx32CosSinTable[(phase >> 4) * 2];
    else
        return 0;
    product = (s64)factor * range[0] + 0x800;
    return range[1] + (s32)(product >> 12);
}
