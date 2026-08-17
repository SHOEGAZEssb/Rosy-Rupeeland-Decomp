#include "tingle/types.h"

/* Overlay 17 animated effect variants, transform export, and sprite setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov017_02201408[3];
extern const u32 data_ov017_02201654[];
extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsAnimationInstance_SetAnimation(void *, s32);
extern void PresentationScalar_SetImmediate(void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void PresentationScalar_TransitionBy(void *, s32, s32);
extern void Presentation_Init(void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern s32 Presentation_AdvanceTransitions(void *);
extern void Overlay017Transform_SubmitGeometry(void *);
extern s32 func_ov017_021fd918(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Construct one of three animated effect variants. Initialize the inherited
 * SDK object, install vtable data_ov017_02201654, and record variant +0x9C.
 * Variants select different base translation, motion mode/value, angle, and
 * angular scale settings. Store the sign-extended caller halfword at +0x7C,
 * clear +0x80, initialize the +0x3C component from the final argument, and set
 * +0x88. Returns state; SDK animation state changes, with no direct MMIO.
 */
extern "C" void *func_ov017_021fe190(void *state, s32 variant, s32 baseArg1,
                                      s32 baseArg3, s32 motionValue,
                                      s16 value7c, s32 componentValue)
{
    Presentation_Init(state);
    FIELD(const u32 *, state, 0) = data_ov017_02201654;
    FIELD(s32, state, 0x9c) = variant;

    if (variant == 0) {
        Presentation_SetPosition(state, baseArg1, 0, baseArg3);
        PresentationScalar_TransitionBy((u8 *)state + 0x1c, 3, motionValue);
        PresentationScalar_SetImmediate((u8 *)state + 0x6c, 0);
        PresentationScalar_TransitionTo((u8 *)state + 0x6c, 1, 0x100);
    } else if (variant == 1) {
        Presentation_SetPosition(state, baseArg1, motionValue, baseArg3);
        PresentationScalar_TransitionBy((u8 *)state + 0x1c, 4, -motionValue);
        PresentationScalar_SetImmediate((u8 *)state + 0x6c, 0x80);
        PresentationScalar_TransitionTo((u8 *)state + 0x6c, 1, 0x100);
    } else if (variant == 2) {
        Presentation_SetPosition(state, baseArg1, motionValue, baseArg3);
        PresentationScalar_TransitionBy((u8 *)state + 0x1c, 4, -motionValue);
        PresentationScalar_SetImmediate((u8 *)state + 0x6c, 0x100);
        PresentationScalar_TransitionTo((u8 *)state + 0x6c, 1, 0x400);
    }

    FIELD(s32, state, 0x7c) = value7c;
    FIELD(s32, state, 0x80) = 0;
    PresentationScalar_SetImmediate((u8 *)state + 0x3c, componentValue);
    FIELD(s32, state, 0x88) = 1;
    return state;
}

/*
 * Advance component +0x3C by 0x800 and update the inherited animation. Return
 * zero while the SDK reports it active. On completion return one; variant 2
 * also initializes global pointer +0x18 from +0x1C when it is still null.
 * Object, SDK, and possibly overlay-global state change; no direct MMIO occurs.
 */
extern "C" s32 func_ov017_021fe2d4(void *state)
{
    PresentationScalar_SetImmediate((u8 *)state + 0x3c, FIELD(s32, state, 0x40) + 0x800);
    if (!Presentation_AdvanceTransitions(state)) {
        return 0;
    }
    if (FIELD(s32, state, 0x9c) == 2 &&
        FIELD(void *, data_ov017_022016e0, 0x18) == 0) {
        FIELD(void *, data_ov017_022016e0, 0x18) =
            FIELD(void *, data_ov017_022016e0, 0x1c);
    }
    return 1;
}

/*
 * Export the effect's position, uniform angle, and uniform low-halfword scale
 * into the transform destination, submit that transform to the geometry SDK,
 * then resolve the variant-selected resource index from the confirmed three-
 * word table at 0x02201408. Destination and SDK state change; returns void and
 * performs no direct hardware access.
 */
extern "C" void func_ov017_021fe33c(void *state, void *transform)
{
    u32 resourceIds[3] = {data_ov017_02201408[0], data_ov017_02201408[1],
                          data_ov017_02201408[2]};
    u32 scale = (u16)FIELD(u32, state, 0x40);
    s32 angle = FIELD(s32, state, 0x70);

    FIELD(u32, transform, 0x20) = scale;
    FIELD(u32, transform, 0x24) = scale;
    FIELD(u32, transform, 0x28) = scale;
    FIELD(s32, transform, 0x14) = angle;
    FIELD(s32, transform, 0x18) = angle;
    FIELD(s32, transform, 0x1c) = angle;
    FIELD(s32, transform, 8) = FIELD(s32, state, 0x10);
    FIELD(s32, transform, 0xc) = FIELD(s32, state, 0x20);
    FIELD(s32, transform, 0x10) = FIELD(s32, state, 0x30);
    Overlay017Transform_SubmitGeometry(transform);
    func_ov017_021fd918(transform, resourceIds[FIELD(s32, state, 0x9c)]);
}

/*
 * Initialize a sprite/animation instance with the low byte of animationIndex,
 * store caller words at +0x20/+0x24/+0x28 and a caller byte at +0x5A, then OR
 * caller flags into halfword +0x50. The object and graphics-animation SDK state
 * change; the function returns void and performs no direct MMIO.
 */
extern "C" void func_ov017_021fe3c4(void *sprite, u32 animationIndex,
                                      u32 value20, u32 value24, u32 value28,
                                      u8 value5a, u32 flags50)
{
    GraphicsAnimationInstance_SetAnimation(sprite, (u8)animationIndex);
    FIELD(u32, sprite, 0x20) = value20;
    FIELD(u32, sprite, 0x24) = value24;
    FIELD(u32, sprite, 0x28) = value28;
    FIELD(u8, sprite, 0x5a) = value5a;
    FIELD(u16, sprite, 0x50) |= (u16)flags50;
}
