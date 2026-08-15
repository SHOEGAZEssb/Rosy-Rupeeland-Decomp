#include "tingle/types.h"

/* Overlay 35 directional animated-object construction and motion update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203bec[];
extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020955b0(void *object, s32 argument);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern s32 Presentation_UpdateScript(void *object);
extern void func_020956a4(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a directional animated object. It initializes the shared base
 * with the base argument, stores kind +0xA0, direction +0xA4, baseline +0xA8,
 * and angle +0xAC. Direction selects mirrored X/Z values of +/-0xA00; Y and
 * the remaining position component come from stack arguments. Lifetime is set
 * to 120, elapsed time is cleared, and +0x88 is enabled. Returns the object;
 * engine transform/object state changes, with no direct hardware access.
 */
extern "C" void *func_ov035_021fdb54(void *object, s32 kind,
                                      s32 baseArgument, s32 direction,
                                      s32 baseline, s32 positionZ, s32 angle)
{
    func_020955b0(object, baseArgument);
    FIELD(const void *, object, 0) = data_ov035_02203bec;
    FIELD(s32, object, 0xa0) = kind;
    FIELD(s32, object, 0xac) = angle;
    FIELD(s32, object, 0xa8) = baseline;
    FIELD(s32, object, 0xa4) = direction;
    s32 x = direction ? -0xa00 : 0xa00;
    s32 zMotion = direction ? 0xa00 : -0xa00;
    Presentation_SetPosition(object, x, baseline, positionZ);
    PresentationScalar_TransitionTo((u8 *)object + 0x0c, 1, zMotion);
    FIELD(s32, object, 0x7c) = 120;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Updates special motion for kinds +0xA0 equal to 2 or 3. Kind 2 advances or
 * reverses 16-bit angle +0xAC by 0x200 according to direction +0xA4 and writes
 * it to rotation +0x5C. Kind 3 advances the angle and writes a table-derived
 * rotation value. Both add sine(angle)/8 to baseline +0xA8 at field +0x1C.
 * It then runs the shared completion query and base update, returning the
 * query result. Object/engine state changes; no direct MMIO occurs.
 */
extern "C" s32 func_ov035_021fdbe0(void *object)
{
    s32 kind = FIELD(s32, object, 0xa0);
    if (kind == 2) {
        u16 angle = (u16)(FIELD(s32, object, 0xac) +
                          (FIELD(s32, object, 0xa4) ? -0x200 : 0x200));
        FIELD(s32, object, 0xac) = angle;
        PresentationScalar_SetImmediate((u8 *)object + 0x5c, angle);
        s16 sine = data_020c9670[(angle >> 4) * 2];
        PresentationScalar_SetImmediate((u8 *)object + 0x1c,
                      FIELD(s32, object, 0xa8) + sine / 8);
    } else if (kind == 3) {
        u16 angle = (u16)(FIELD(s32, object, 0xac) + 0x200);
        FIELD(s32, object, 0xac) = angle;
        s16 rotation = *(const s16 *)((const u8 *)data_020c9670 +
                                      (angle & 0x3ffc));
        PresentationScalar_SetImmediate((u8 *)object + 0x5c, rotation);
        s16 sine = data_020c9670[(angle >> 4) * 2];
        PresentationScalar_SetImmediate((u8 *)object + 0x1c,
                      FIELD(s32, object, 0xa8) + sine / 8);
    }
    s32 complete = Presentation_UpdateScript(object);
    func_020956a4(object);
    return complete;
}
