#include "tingle/types.h"

/* Overlay 36 randomized ramp-controller primitive emission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov036_02206180[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *random, s32 minimum, s32 maximum);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fd690(void *object, s32 mode, u16 valueA4,
                                 u16 valueA6, u16 valueA0, u16 valueA2);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_02094bf0(void *object, s32 x, s32 y, s32 z);
extern void func_020948f8(void *field, s32 mode, s32 value);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_02095274(void *list, void *object);
#ifdef __cplusplus
}
#endif

/* Applies the binary's signed Q12 truncation toward zero. */
static s32 mul_q12_trunc(s32 first, s32 second)
{
    s32 product = first * second;
    return (product + ((u32)(product >> 11) >> 20)) >> 12;
}

/* Applies the recovered Q12 rounding used for the direction vector. */
static s32 mul_q12_round(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Emits a mode-1 0xA8-byte primitive into list +0x158. A random signed Q12
 * value scaled by controller +0x178 selects both the object's negative Z
 * rotation and a 0x2800 direction from data_020c9670; another random value in
 * [-0x800,0x800] supplies X at Y=-0x600. The direction becomes mode-1 targets
 * +0xC/+0x1C, Z targets -0x100, and duration is sign-extended into +0x7C with
 * elapsed +0x80 cleared. Returns nothing; RNG, heap, transform, and list state
 * change. Allocation failure is passed onward exactly as in the original.
 */
extern "C" void func_ov036_02201580(void *controller, s32 duration)
{
    s32 sample = func_0209189c((u8 *)controller + 0xc0,
                                -0x1000, 0x1000);
    s32 angle = mul_q12_trunc(sample, FIELD(s32, controller, 0x178));
    u32 index = ((u16)angle >> 4) * 2;
    s32 first = mul_q12_round(data_020c9670[index], 0x2800);
    s32 second = mul_q12_round(data_020c9670[index + 1], 0x2800);
    s32 x = func_0209189c((u8 *)controller + 0xc0, -0x800, 0x800);

    void *object = Heap_Alloc(0xa8, data_ov036_02206180, 4, gHeapContext);
    if (object != 0)
        object = func_ov036_021fd690(object, 1, 0, 0, 0x21f, 0x18);
    func_02094bbc(object, x, -0x600, 0);
    func_02094bf0(object, 0, 0, -angle);
    func_020948f8((u8 *)object + 0xc, 1, first);
    func_020948f8((u8 *)object + 0x1c, 1, second);
    func_020948e4((u8 *)object + 0x2c, 1, -0x100);
    FIELD(s32, object, 0x7c) = (s16)duration;
    FIELD(s32, object, 0x80) = 0;
    func_02095274((u8 *)controller + 0x158, object);
}
