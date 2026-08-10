#include "tingle/types.h"

/*
 * Recovered motion and animation controls for the type-seven auxiliary
 * presentation object. They drive its bobbing offsets and staged transitions.
 */

extern const s16 data_020c9670[];
extern const u8 data_020c3dfc[];
extern const s16 data_020e1e60[];
extern void *gSoundContext;

typedef struct Type7AuxiliaryPresentation {
    const void *vtable;
    u8 *presentation;
    u8 *owner;
    void *resource;
    u8 flags10;
    s8 direction11;
    s8 stage12;
    s8 previousStage13;
    s32 height14;
    s32 targetHeight18;
    s32 offset1c;
    s32 offset20;
    u16 phase24;
    u16 phase26;
    s32 baseHeight28;
} Type7AuxiliaryPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 index);
extern void Sound_Play(void *soundContext, s32 group, s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Input is an auxiliary presentation object. If +0x10 bit one is set, target
 * +0x18 becomes base +0x28 plus 0x1e000 and current +0x14 approaches it by
 * 0x1400 per call without overshoot. Advance 8-bit phases +0x24/+0x26 by two
 * and three, then read two signed values 0x40 bytes apart from the recovered
 * table data_020c9670 and scale each by 3/2 into +0x1c/+0x20. If the bit is
 * clear, zero +0x14/+0x18. No value is returned. Only object state and the
 * read-only lookup table are involved; there are no SDK or hardware effects.
 */
void Type7AuxiliaryPresentation_UpdateMotion(Type7AuxiliaryPresentation *self)
{
    if ((self->flags10 & 1) != 0) {
        self->targetHeight18 = self->baseHeight28 + 0x1e000;
        if (self->height14 != self->targetHeight18) {
            self->height14 += 0x1400;
            if (self->height14 > self->targetHeight18)
                self->height14 = self->targetHeight18;
        }
        self->phase24 = (self->phase24 + 2) & 0xff;
        self->phase26 = (self->phase26 + 3) & 0xff;
        self->offset1c = data_020c9670[self->phase24 * 0x20] * 3 / 2;
        self->offset20 = data_020c9670[self->phase26 * 0x20 + 1] * 3 / 2;
    } else {
        self->targetHeight18 = 0;
        self->height14 = 0;
    }
}

/*
 * Inputs are an auxiliary presentation object and direction/index value.
 * Clear completion bit 0x02. State bit 0x04 waits for presentation +0x24 bit
 * one, then converts to bit 0x08 and hides through bit eight. Active bit 0x01
 * advances stage +0x12 through three animations using byte sequence
 * data_020c3dfc, recording the previous stage and setting completion bit 0x02
 * at stage three. An inactive object hides and resets its stage when the
 * current animation finishes. Finally copy owner-presentation byte +0x3a and
 * add the direction's three signed offsets at data_020e1e60 to owner offsets
 * +0x2c/+0x2e/+0x28, then store direction at +0x11. Object and presentation
 * state change via GraphicsSpriteState_SetAnimationIndex; there are no direct hardware effects.
 */
void Type7AuxiliaryPresentation_UpdateAnimationAndPosition(Type7AuxiliaryPresentation *self, s32 direction)
{
    u16 presentationFlags;
    u8 *ownerPresentation = *(u8 **)(self->owner + 0x54);
    self->flags10 &= (u8)~2;
    presentationFlags = *(u16 *)(self->presentation + 0x24);

    if ((self->flags10 & 4) != 0) {
        if ((presentationFlags & 1) != 0) {
            self->flags10 = (self->flags10 & (u8)~4) | 8;
            *(u16 *)(self->presentation + 0x24) |= 8;
        }
    } else if ((self->flags10 & 1) != 0) {
        self->previousStage13 = self->stage12;
        *(u16 *)(self->presentation + 0x24) &= (u16)~8;
        presentationFlags = *(u16 *)(self->presentation + 0x24);
        if (self->stage12 == 0 || (presentationFlags & 1) != 0) {
            if (self->stage12 < 3)
                ++self->stage12;
            *(u16 *)(self->presentation + 0x24) &= (u16)~1;
            GraphicsSpriteState_SetAnimationIndex(self->presentation,
                          (u8)(direction + data_020c3dfc[self->stage12 - 1]));
        }
        if (self->stage12 == 3)
            self->flags10 |= 2;
    } else if ((presentationFlags & 1) != 0) {
        *(u16 *)(self->presentation + 0x24) |= 8;
        self->stage12 = 0;
    }

    self->presentation[0x3a] = ownerPresentation[0x3a];
    *(s16 *)(self->presentation + 0x2c) =
        *(s16 *)(ownerPresentation + 0x2c)
        + data_020e1e60[direction * 3];
    *(s16 *)(self->presentation + 0x2e) =
        *(s16 *)(ownerPresentation + 0x2e)
        + data_020e1e60[direction * 3 + 1];
    *(u16 *)(self->presentation + 0x28) =
        *(u16 *)(ownerPresentation + 0x28)
        + data_020e1e60[direction * 3 + 2];
    self->direction11 = (s8)direction;
}

/*
 * Input is an auxiliary presentation object. Unless shutdown bit 0x04 is set,
 * set active bit 0x01 and reset animation stage +0x12 to zero. No value is
 * returned; only local state changes, with no SDK or hardware effects.
 */
void Type7AuxiliaryPresentation_Activate(Type7AuxiliaryPresentation *self)
{
    if ((self->flags10 & 4) == 0) {
        self->flags10 |= 1;
        self->stage12 = 0;
    }
}

/*
 * Input is an auxiliary presentation object. Clear active bit 0x01, set
 * shutdown bit 0x04, zero height and stage fields, select animation 0x18 plus
 * nonnegative direction +0x11, clear presentation bits one and eight, and play
 * sound 0x1b through the global sound context. No value is returned. Object,
 * presentation, and sound state may change; hardware is not accessed directly.
 */
void Type7AuxiliaryPresentation_BeginShutdown(Type7AuxiliaryPresentation *self)
{
    s32 direction = self->direction11;
    self->flags10 = (self->flags10 & (u8)~1) | 4;
    self->targetHeight18 = 0;
    self->height14 = 0;
    self->stage12 = 0;
    self->previousStage13 = 0;
    if (direction < 0)
        direction = 0;
    GraphicsSpriteState_SetAnimationIndex(self->presentation, (u8)(direction + 0x18));
    *(u16 *)(self->presentation + 0x24) &= (u16)~9;
    Sound_Play(gSoundContext, 0, 0x1b);
}
