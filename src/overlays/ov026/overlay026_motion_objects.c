#include "tingle/types.h"

/* Overlay 26 geometry submission plus motion/effect object initialization and ticking. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov026_022049d0[];
extern const u8 data_ov026_02204a08[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_01ff88c4(s32, const void *, s32);
extern void PresentationScalar_SetImmediate(void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void Presentation_Init(void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void func_02094bf0(void *, s32, s32, s32);
extern void *func_ov026_021fce00(void *, void *, s32, u16);
extern s32 func_ov026_021fd018(const u32 *);
#ifdef __cplusplus
}
#endif

/*
 * Submits radial-fan builder +4/list +0xC after translating only by +0x1C on
 * the Y axis. Returns void and writes matrix/FIFO/swap geometry registers.
 */
extern "C" void func_ov026_021fe56c(void *object)
{
    volatile u32 *const matrix_port = (volatile u32 *)0x04000444;
    *matrix_port = 0;
    *matrix_port = 0;
    *matrix_port = FIELD(u32, object, 0x1c);
    *matrix_port = 0;
    func_01ff88c4(3, FIELD(void *, object, 0xc),
                  func_ov026_021fd018((const u32 *)((u8 *)object + 4)));
    *(volatile u32 *)0x04000448 = 1;
}

/* Stores signed 16-bit `value` at +0x7C and clears its progress field +0x80. */
extern "C" void func_ov026_021fe5c0(void *object, s32 value)
{
    FIELD(s32, object, 0x7c) = (s16)value;
    FIELD(s32, object, 0x80) = 0;
}

/*
 * Constructs a geometry-backed motion object. It initializes the shared base
 * with model entry 3/polygon 0x7FFF, configures recovered transform parameters,
 * selects animation/control IDs 0x52 and 0x148, initializes +0x7C to 30, clears
 * +0x80/+0xB0, and enables +0x88. Returns `object`; later argument semantics
 * remain address-derived.
 */
extern "C" void *func_ov026_021fe5d8(void *object, void *resource,
                                      s32 arg2, s32 arg3, s32 arg4,
                                      s32 arg5, s32 arg6)
{
    func_ov026_021fce00(object, resource, 3, 0x7fff);
    FIELD(const void *, object, 0) = data_ov026_02204a08;
    FIELD(s32, object, 0xb0) = 0;
    Presentation_SetPosition(object, arg2, arg3, arg4);
    PresentationScalar_SetImmediate((u8 *)object + 0x6c, 0x52);
    func_02094bf0(object, arg5, arg6, 0);
    PresentationScalar_TransitionTo((u8 *)object + 0x6c, 3, 0x148);
    PresentationScalar_TransitionTo((u8 *)object + 0x5c, 1, 0x8000);
    FIELD(s32, object, 0x7c) = 30;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Constructs a 0xC8-byte effect-motion controller with fixed-point defaults:
 * +0x9C=0x385, +0xA0=0x666, +0xA4=0x1000, +0xA8=0x333, step +0xB0=0x52,
 * period +0xB8=16, and all counters/flags cleared. Returns `object`.
 */
extern "C" void *func_ov026_021fe680(void *object)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov026_022049d0;
    FIELD(s32, object, 0xc0) = 0;
    FIELD(s32, object, 0x9c) = 0x385;
    FIELD(s32, object, 0xa0) = 0x666;
    FIELD(s32, object, 0xa4) = 0x1000;
    FIELD(s32, object, 0xa8) = 0x333;
    FIELD(s32, object, 0xac) = 0;
    FIELD(s32, object, 0xb0) = 0x52;
    FIELD(s32, object, 0xb4) = 0;
    FIELD(s32, object, 0xb8) = 0x10;
    FIELD(u16, object, 0xbc) = 0;
    FIELD(s32, object, 0xc4) = 0;
    return object;
}

/*
 * Advances +0xAC by step +0xB0 while countdown +0xB4 remains nonnegative.
 * On expiry it snapshots +0xC0 into +0xC4, reloads a four-frame countdown,
 * and resets +0xAC to zero. Always returns zero.
 */
extern "C" s32 func_ov026_021fe6f0(void *object)
{
    if (--FIELD(s32, object, 0xb4) >= 0)
        FIELD(s32, object, 0xac) += FIELD(s32, object, 0xb0);
    else {
        FIELD(s32, object, 0xc4) = FIELD(s32, object, 0xc0);
        FIELD(s32, object, 0xb4) = 4;
        FIELD(s32, object, 0xac) = 0;
    }
    return 0;
}
