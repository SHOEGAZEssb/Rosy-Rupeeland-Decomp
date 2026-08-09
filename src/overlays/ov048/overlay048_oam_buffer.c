#include "tingle/types.h"

/*
 * Overlay 48 OAM-buffer lifecycle. The recovered object owns 128 eight-byte
 * software OAM entries and an eight-word transfer-order table.
 */

extern "C" void func_020b4554(void *table, s32 size);

/*
 * Clear count +0 and both words of all 128 entries at +4, populate the eight
 * words at +0x404 with packed indices (0,4,8,12 through 112,116,120,124), call
 * the SDK buffer initializer for that 0x20-byte table, and return `buffer`.
 * Only caller-owned memory and SDK OAM bookkeeping change; no MMIO is written.
 */
extern "C" void *func_ov048_0220b740(void *buffer)
{
    u8 *bytes = (u8 *)buffer;
    *(s32 *)bytes = 0;
    for (s32 i = 0; i < 128; ++i) {
        *(s32 *)(bytes + 4 + i * 8) = 0;
        *(s32 *)(bytes + 8 + i * 8) = 0;
    }
    for (s32 i = 0; i < 8; ++i) {
        u32 base = (u32)i << 4;
        *(u32 *)(bytes + 0x404 + i * 4) =
            base | ((base + 4) << 8) | ((base + 8) << 16) |
            ((base + 12) << 24);
    }
    func_020b4554(bytes + 0x404, 0x20);
    return buffer;
}

/*
 * No-op lifecycle hook. The input, memory, SDK, and hardware state are all
 * unchanged; the function has no return value.
 */
extern "C" void func_ov048_0220b7b4(void *)
{
}
