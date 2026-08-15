#include "tingle/types.h"

/* Overlay 36 three-child object motion and virtual-update dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*UpdateCallback)(void *object);

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_UpdateScript(void *object);
extern s32 func_ov036_021fd28c(void *field);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
#ifdef __cplusplus
}
#endif

/* Divides a signed value by two with truncation toward zero. */
static s32 halve(s32 value)
{
    return (value + (s32)((u32)value >> 31)) >> 1;
}

/*
 * Runs the common object update and preserves its return value. When field
 * +0xB4 reports completion, transition +0xD0 is retargeted in mode two to
 * -0x40 if current Y-like value +0xD4 is positive, otherwise +0x40; duration
 * +0x130 becomes 12 and elapsed +0x134 is cleared. Child +0x150 receives the
 * full +0xD4 value at transform +0x1C, while +0x154/+0x158 receive signed
 * half values. If +0xB0 is nonzero, +0xB4's vtable slot +8 is invoked, then
 * the same virtual update slot is invoked for all three children. Returns the
 * common update result; transition, child transforms, and virtual child state
 * may change.
 */
extern "C" s32 func_ov036_02203a38(void *object)
{
    s32 result = Presentation_UpdateScript(object);
    if (func_ov036_021fd28c((u8 *)object + 0xb4) != 0) {
        s32 target = FIELD(s32, object, 0xd4) > 0 ? -0x40 : 0x40;
        PresentationScalar_TransitionTo((u8 *)object + 0xd0, 2, target);
        FIELD(s32, object, 0x130) = 0xc;
        FIELD(s32, object, 0x134) = 0;
    }
    s32 y = FIELD(s32, object, 0xd4);
    PresentationScalar_SetImmediate((u8 *)FIELD(void *, object, 0x150) + 0x1c, y);
    PresentationScalar_SetImmediate((u8 *)FIELD(void *, object, 0x154) + 0x1c, halve(y));
    PresentationScalar_SetImmediate((u8 *)FIELD(void *, object, 0x158) + 0x1c, halve(y));
    if (FIELD(s32, object, 0xb0) != 0) {
        void *field = (u8 *)object + 0xb4;
        (*(UpdateCallback *)((u8 *)FIELD(void *, field, 0) + 8))(field);
    }
    void *child = FIELD(void *, object, 0x150);
    (*(UpdateCallback *)((u8 *)FIELD(void *, child, 0) + 8))(child);
    child = FIELD(void *, object, 0x154);
    (*(UpdateCallback *)((u8 *)FIELD(void *, child, 0) + 8))(child);
    child = FIELD(void *, object, 0x158);
    (*(UpdateCallback *)((u8 *)FIELD(void *, child, 0) + 8))(child);
    return result;
}
