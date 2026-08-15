#include "tingle/types.h"

/* Overlay 27 sprite configuration and descriptor-backed object construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021fee98[];
extern const u8 data_ov027_021fef08[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsAnimationInstance_SetAnimation(void *, u8);
extern void func_020955b0(void *, void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Applies byte `kind` through the sprite SDK helper, stores three words at
 * +0x20/+0x24/+0x28, byte +0x5A, and ORs `flags` into halfword +0x50.
 * Returns void; arguments after `value24` use the original stack ABI.
 */
extern "C" void func_ov027_021fd180(void *sprite, s32 kind, s32 value20,
                                      s32 value24, s32 value28, s32 value5a,
                                      s32 flags)
{
    GraphicsAnimationInstance_SetAnimation(sprite, (u8)kind);
    FIELD(s32, sprite, 0x20) = value20;
    FIELD(s32, sprite, 0x24) = value24;
    FIELD(s32, sprite, 0x28) = value28;
    FIELD(u8, sprite, 0x5a) = (u8)value5a;
    FIELD(u16, sprite, 0x50) |= (u16)flags;
}

/*
 * Constructs `object` from `descriptor` and `index`. It runs the base
 * constructor with `base_arg`, installs vtable 0x021FEE98, stores descriptor
 * +0xA0 and index*6 at +0xA4, clears +0xA8/+0xAC, configures the sprite at
 * +0x9C from descriptor word 0, and positions the object from descriptor words
 * 1/2 with z=index*2. Returns `object`.
 */
extern "C" void *func_ov027_021fd1c8(void *object, void *base_arg,
                                       const s32 *descriptor, s32 index)
{
    func_020955b0(object, base_arg);
    FIELD(const void *, object, 0) = data_ov027_021fee98;
    FIELD(const s32 *, object, 0xa0) = descriptor;
    FIELD(s32, object, 0xa4) = index * 6;
    FIELD(s32, object, 0xa8) = 0;
    FIELD(s32, object, 0xac) = 0;
    func_ov027_021fd180(FIELD(void *, object, 0x9c), descriptor[0], 0, 0,
                         0, 0x14, 2);
    FIELD(u8, FIELD(void *, object, 0x9c), 0x59) = 3;
    Presentation_SetPosition(object, descriptor[1], descriptor[2], index * 2);
    return object;
}

/*
 * Constructs a second descriptor-backed sprite object. Descriptor word 1
 * selects initial x sign (+/-0x800), word 2 supplies y, and `value_a4` is
 * retained at +0xA4. It installs vtable 0x021FEF08, sets transform control
 * +0x2C to (2,0x100), starts a 120-tick timer, records deltas at +0xB0/+0xB4,
 * configures the +0x9C sprite with kind 0, and enables +0x88. Returns `object`.
 */
extern "C" void *func_ov027_021fd408(void *object, void *base_arg,
                                      const s32 *descriptor, s32 value_a4)
{
    func_020955b0(object, base_arg);
    FIELD(const void *, object, 0) = data_ov027_021fef08;
    FIELD(const s32 *, object, 0xa0) = descriptor;
    FIELD(s32, object, 0xa8) = descriptor[1] < 0 ? -0x800 : 0x800;
    FIELD(s32, object, 0xac) = descriptor[2];
    FIELD(s32, object, 0xa4) = value_a4;
    Presentation_SetPosition(object, FIELD(s32, object, 0xa8),
                   FIELD(s32, object, 0xac), 0x1000);
    PresentationScalar_TransitionTo((u8 *)object + 0x2c, 2, 0x100);
    FIELD(s32, object, 0x7c) = 0x78;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0xb0) = FIELD(s32, object, 0xa8) - descriptor[1];
    FIELD(s32, object, 0xb4) = FIELD(s32, object, 0xac) - descriptor[2];
    FIELD(s32, object, 0xb8) = 0;
    func_ov027_021fd180(FIELD(void *, object, 0x9c), 0, 0, 0, 0, 0x14,
                         2);
    FIELD(s32, object, 0x88) = 1;
    return object;
}
