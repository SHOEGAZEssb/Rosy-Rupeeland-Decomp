#include "tingle/types.h"

/* Overlay 36 child transition setup and randomized radial particle emission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern const u8 data_ov036_02206148[];
/* The retail literal names the heap context itself, not its storage pointer. */
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern s32 func_ov036_021fd28c(void *object);
extern s32 func_0209189c(void *random, s32 minimum, s32 maximum);
extern s32 TitleRandom_NextBounded(void *random, s32 maximum);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fd2a4(void *object, s16 type,
                                 s16 secondDuration, u16 colorA,
                                 u16 colorB, s16 firstDuration,
                                 s32 acceleration);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void PresentationList_Append(void *list, void *object);
#ifdef __cplusplus
}
#endif

/* Applies the binary's signed Q12 truncation toward zero. */
static s32 mul_q12_trunc(s32 first, s32 second)
{
    s32 product = first * second;
    return (product + ((u32)(product >> 11) >> 20)) >> 12;
}

/*
 * Configures child transitions. owner is unused by this recovered callback;
 * child receives mode-2 targets x/y/z through fields +0xC/+0x1C/+0x2C,
 * duration is sign-extended to +0x7C, and elapsed +0x80 is cleared. It returns
 * nothing and changes transform/timer state in child.
 */
extern "C" void func_ov036_021ff778(void *owner, void *child,
                                     s32 x, s32 y, s32 z, s32 duration)
{
    (void)owner;
    PresentationScalar_TransitionTo((u8 *)child + 0xc, 2, x);
    PresentationScalar_TransitionTo((u8 *)child + 0x1c, 2, y);
    PresentationScalar_TransitionTo((u8 *)child + 0x2c, 2, z);
    FIELD(s32, child, 0x7c) = (s16)duration;
    FIELD(s32, child, 0x80) = 0;
}

/*
 * Emits one randomized radial motion primitive and, when child +0xF8 reports
 * its timer complete, retargets that child to three offsets in [-range,range]
 * for two to four frames. The new particle uses a random angle/radius
 * (0..0xFFF and 0x600..0xC00), red/green components 16..31, type 1, a 20..30
 * frame second interval, zero first interval, random positive acceleration
 * 0x666..0xCCD, scale 0x333, and a random rotation. It is appended to list
 * +0x128. Returns nothing; RNG, heap, child timer/transform, and list state
 * change. The original assumes allocation succeeds before later field access.
 */
extern "C" void func_ov036_021ff7cc(void *controller, s32 range)
{
    void *child = FIELD(void *, controller, 0xf8);
    if (func_ov036_021fd28c(child) != 0) {
        s32 x = func_0209189c((u8 *)controller + 0xc0, -range, range);
        s32 y = func_0209189c((u8 *)controller + 0xc0, -range, range);
        s32 z = func_0209189c((u8 *)controller + 0xc0, -range, range);
        s32 duration = func_0209189c((u8 *)controller + 0xc0, 2, 4);
        func_ov036_021ff778(controller, child, x, y, z, duration);
    }

    u16 angle = (u16)(TitleRandom_NextBounded((u8 *)controller + 0xc0, 0x1000) << 4);
    s32 radius = func_0209189c((u8 *)controller + 0xc0, 0x600, 0xc00);
    s32 index = (angle >> 4) * 2;
    s32 x = mul_q12_trunc(radius, gFx32CosSinTable[index]);
    s32 z = mul_q12_trunc(radius, gFx32CosSinTable[index + 1]);
    s32 red = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
    s32 green = func_0209189c((u8 *)controller + 0xc0, 0x10, 0x1f);
    u16 fullColor = (u16)(red | (green << 5));
    u16 halfColor = (u16)(red / 2 | ((green / 2) << 5));

    void *particle = Heap_Alloc(0xb8, data_ov036_02206148,
                                4, gHeapContext);
    if (particle != 0) {
        s16 duration = (s16)func_0209189c((u8 *)controller + 0xc0,
                                          0x14, 0x1e);
        s32 acceleration = func_0209189c((u8 *)controller + 0xc0,
                                         0x666, 0xccd);
        particle = func_ov036_021fd2a4(particle, 1, duration,
                                       halfColor, fullColor, 0, acceleration);
    }
    Presentation_SetPosition(particle, x, 0, z);
    PresentationScalar_SetImmediate((u8 *)particle + 0x5c,
                  TitleRandom_NextBounded((u8 *)controller + 0xc0, 0x1000) << 4);
    PresentationScalar_SetImmediate((u8 *)particle + 0x6c, 0x333);
    PresentationList_Append((u8 *)controller + 0x128, particle);
}
