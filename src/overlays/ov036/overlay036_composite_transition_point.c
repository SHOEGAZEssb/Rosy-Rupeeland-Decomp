#include "tingle/types.h"

/* Overlay 36 transition-point projection into the composite auxiliary object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov036_021fdc5c(void *auxiliary,
                                s32 x0, s32 y0, s32 x1, s32 y1);
#ifdef __cplusplus
}
#endif

/* Implements signed division by 256 with truncation toward zero. */
static s32 divide_by_256(s32 value)
{
    return (value + ((u32)(value >> 7) >> 24)) >> 8;
}

/*
 * Projects a radius-0xE0 point from render object +0x154. The low 16 bits of
 * negated angle +0x60 select an adjacent pair in data_020c9670. Each component
 * is multiplied by 0xE0 and truncated toward zero by 256; the pair is added to
 * base X/Y at +0x10/+0x20. Auxiliary +0x1A0 receives the segment from the base
 * point to that projected point. Returns nothing; auxiliary geometry changes,
 * with no direct hardware write in this function.
 */
extern "C" void func_ov036_02203228(void *controller)
{
    void *object = FIELD(void *, controller, 0x154);
    u32 index = ((u16)-FIELD(s32, object, 0x60) >> 4) * 2;
    s32 x = FIELD(s32, object, 0x10);
    s32 y = FIELD(s32, object, 0x20);
    s32 projectedX =
        x + divide_by_256((s16)data_020c9670[index] * 0xe0);
    s32 projectedY =
        y + divide_by_256((s16)data_020c9670[index + 1] * 0xe0);
    func_ov036_021fdc5c(FIELD(void *, controller, 0x1a0),
                        x, y, projectedX, projectedY);
}
