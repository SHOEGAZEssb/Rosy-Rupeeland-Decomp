#include "tingle/types.h"

/* Overlay 36 randomized colored segment emission for the composite controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206198[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *random, s32 minimum, s32 maximum);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fd834(void *object, s16 duration,
                                 s32 x0, s32 y0, s32 x1, s32 y1,
                                 s32 initialZ, u16 red, u16 green, u16 blue);
extern void PresentationList_Append(void *list, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Emits one 60-frame segment into list +0x110. colorMode chooses random
 * 5-bit components: 0 red+green, 1 green+blue, 2 red+blue, 3 blue only
 * (all in 0x10..0x1F), and 4 equal RGB in 8..0x10. Other modes leave black.
 * segmentType zero selects a vertical segment with random X in
 * [-0x800,0x800], endpoints (X,0x1200)/(X,-0x600), and Z=-0x10. Type one
 * selects a near-horizontal segment with random Y in [-0x600,0x1200],
 * endpoints (-0x800,Y)/(0x800,Y+0x80), and the same Z. Other types consume
 * color RNG but emit nothing. Returns nothing; RNG, heap, and list state may
 * change. Allocation failure is passed onward exactly as in the original.
 */
extern "C" void func_ov036_02203024(void *controller, s32 colorMode,
                                     s32 segmentType)
{
    s32 red = 0;
    s32 green = 0;
    s32 blue = 0;
    switch (colorMode) {
    case 0:
        red = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        green = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        break;
    case 1:
        green = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        blue = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        break;
    case 2:
        red = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        blue = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        break;
    case 3:
        blue = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
        break;
    case 4:
        blue = func_0209189c((u8 *)controller + 0xc0, 8, 0x10);
        green = blue;
        red = blue;
        break;
    }

    void *segment;
    if (segmentType == 0) {
        s32 x = func_0209189c((u8 *)controller + 0xc0, -0x800, 0x800);
        segment = Heap_Alloc(0xb8, data_ov036_02206198, 4, gHeapContext);
        if (segment != 0)
            segment = func_ov036_021fd834(segment, 0x3c,
                                          x, 0x1200, x, -0x600, -0x10,
                                          red, green, blue);
        PresentationList_Append((u8 *)controller + 0x110, segment);
    } else if (segmentType == 1) {
        s32 y = func_0209189c((u8 *)controller + 0xc0, -0x600, 0x1200);
        segment = Heap_Alloc(0xb8, data_ov036_02206198, 4, gHeapContext);
        if (segment != 0)
            segment = func_ov036_021fd834(segment, 0x3c,
                                          -0x800, y, 0x800, y + 0x80, -0x10,
                                          red, green, blue);
        PresentationList_Append((u8 *)controller + 0x110, segment);
    }
}
