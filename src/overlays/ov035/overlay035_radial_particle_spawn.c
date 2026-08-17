#include "tingle/types.h"

/* Overlay 35 randomized radial particle allocation and motion setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov035_02203d68[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 TitleRandom_NextBounded(void *randomState, s32 limit);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov035_021fd2bc(void *object, s32 identifier,
                                s32 directionA, s32 directionB, u16 color,
                                s32 finalArgument);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void PresentationList_Append(void *collection, void *object);
#ifdef __cplusplus
}
#endif

/* Converts a signed fixed-point product to the binary's truncating Q15 result. */
static s32 q15_product(s32 product)
{
    return (product + ((u32)(product >> 7) >> 24)) >> 8;
}

/*
 * Spawns one randomized radial particle using random state +0xC0. Inputs red,
 * green, and blue are packed into a 5:5:5 value without independent masking;
 * the final cast supplies the binary's 16-bit truncation. A random angle selects
 * adjacent entries in data_020c9670 and a random 0x100..0x1FF magnitude supplies
 * X/Y at Z=-0x10000. The 0xA8-byte object receives a +0x2C motion target of
 * 0x2000 over 40 frames and is attached to collection +0x118. It has no defined
 * return value; RNG, heap, animation, transform, and collection state change.
 * Trigonometric table layout is confirmed by accesses; semantic axis names are
 * intentionally left inferred.
 */
extern "C" void func_ov035_02200ec0(void *scene, s32 red, s32 green,
                                      s32 blue)
{
    s32 angle = TitleRandom_NextBounded((u8 *)scene + 0xc0, 0x1000) << 4;
    s32 magnitude = func_0209189c((u8 *)scene + 0xc0, 0x100, 0x200);

    s32 forwardIndex = angle >> 3;
    s32 reverseIndex = (((u16)-angle) >> 4) << 1;
    s32 forwardA = data_020c9670[forwardIndex];
    s32 forwardB = data_020c9670[forwardIndex + 1];
    s32 reverseA = data_020c9670[reverseIndex];
    s32 reverseB = data_020c9670[reverseIndex + 1];
    s32 x = q15_product(magnitude * forwardA);
    s32 y = q15_product(magnitude * forwardB);

    void *particle = Heap_Alloc(0xa8, data_ov035_02203d68, 4, gHeapContext);
    if (particle != 0) {
        u16 color = (u16)(red | (green << 5) | (blue << 10));
        particle = func_ov035_021fd2bc(particle, 0, reverseA, reverseB,
                                      color, 0);
    }
    Presentation_SetPosition(particle, x, y, -0x10000);
    PresentationScalar_TransitionTo((u8 *)particle + 0x2c, 1, 0x2000);
    FIELD(s32, particle, 0x7c) = 40;
    FIELD(s32, particle, 0x80) = 0;
    PresentationList_Append((u8 *)scene + 0x118, particle);
}
