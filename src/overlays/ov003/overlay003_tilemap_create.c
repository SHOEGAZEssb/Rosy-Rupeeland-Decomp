#include "tingle/types.h"

/*
 * Overlay 3 tile-map creation. This recovered helper allocates a 32-by-24
 * text-background map and initializes sequential tile indices and palette bank.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_ov003_021fbcd8[];
extern void *gHeapContext;
extern void *Heap_AllocAlternateEntry(u32 size, const char *tag, s32 alignment,
                           void *context);
extern void func_020b4554(void *address, u32 size);
#ifdef __cplusplus
}
#endif

/*
 * Ignore owner, allocate/load 0x600 bytes using the overlay tag, four-byte
 * alignment, and gHeapContext. Rewrite all 0x300 halfwords so bits 0..9 contain
 * the sequential tile index, bits 10..11 are clear, and bits 12..15 contain
 * paletteBank's low nibble. Flush/prepare the completed 0x600-byte block with
 * func_020b4554 and return it. Allocation/cache effects occur through callees;
 * the 32x24 text-map interpretation follows the confirmed entry count/layout.
 */
#ifdef __cplusplus
extern "C"
#endif
u16 *func_ov003_021fb804(void *owner, u16 paletteBank)
{
    u16 *map;
    s32 i;

    (void)owner;
    map = (u16 *)Heap_AllocAlternateEntry(0x600, data_ov003_021fbcd8, 4, gHeapContext);
    for (i = 0; i < 0x300; i++) {
        map[i] = (u16)((i & 0x3ff) | ((paletteBank & 0xf) << 12));
    }
    func_020b4554(map, 0x600);
    return map;
}
