#include "tingle/types.h"

/* Overlay 27 timed transform-motion object construction and update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021feeec[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *);
extern void PresentationScalar_SetImmediate(void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void PresentationScalar_TransitionBy(void *, s32, s32);
extern void Presentation_UpdateScript(void *);
extern void func_ov027_021fd3d8(void *, s32);
extern s32 func_ov027_021fd3f0(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a timed motion object: runs the base initializer, installs
 * vtable 0x021FEEEC, clears state +0xB0, sets color +0xB4 to 0x7FFF, clears
 * transform control +0x6C, and enables +0x88. Returns `object`.
 */
extern "C" void *func_ov027_021fd718(void *object)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov027_021feeec;
    FIELD(s32, object, 0xb0) = 0;
    FIELD(u16, object, 0xb4) = 0x7fff;
    PresentationScalar_SetImmediate((u8 *)object + 0x6c, 0);
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Drives motion state +0xB0. State 0 starts the +0xA8 delay and immediately
 * enters state 1. On expiry, state 1 starts scale control +0x6C toward 0x10000
 * and position controls +0x0C/+0x1C/+0x2C toward +0x9C/+0xA0/+0xA4, then
 * starts the +0xAC delay. State 2 waits for that delay; state 3 returns one.
 * Nonterminal states run the common object update and return zero.
 */
extern "C" s32 func_ov027_021fd75c(void *object)
{
    switch (FIELD(s32, object, 0xb0)) {
    case 0:
        func_ov027_021fd3d8(object, FIELD(s32, object, 0xa8));
        ++FIELD(s32, object, 0xb0);
        /* Fall through so a zero delay can start motion immediately. */
    case 1:
        if (func_ov027_021fd3f0(object)) {
            PresentationScalar_TransitionTo((u8 *)object + 0x6c, 3, 0x10000);
            PresentationScalar_TransitionBy((u8 *)object + 0xc, 5,
                           FIELD(s32, object, 0x9c));
            PresentationScalar_TransitionBy((u8 *)object + 0x1c, 5,
                           FIELD(s32, object, 0xa0));
            PresentationScalar_TransitionBy((u8 *)object + 0x2c, 1,
                           FIELD(s32, object, 0xa4));
            func_ov027_021fd3d8(object, FIELD(s32, object, 0xac));
            ++FIELD(s32, object, 0xb0);
        }
        break;
    case 2:
        if (func_ov027_021fd3f0(object))
            ++FIELD(s32, object, 0xb0);
        break;
    case 3:
        return 1;
    }
    Presentation_UpdateScript(object);
    return 0;
}
