#include "tingle/types.h"

/*
 * Overlay 47 transition interpolation. This recovered routine advances the
 * controller frame and derives four rectangle edges used by the renderer.
 * Exact assembly preserves eight SDK interpolation calls and switch epilogues.
 */

/*
 * If current frame +0x24 has not reached terminal frame +0x28, increment it
 * and update edges +0x10..+0x1C according to transition kind +0x20. Kinds use
 * either Presentation_InterpolateSmoothStep for signed linear interpolation around the half-duration
 * point or Presentation_InterpolateEaseInQuadratic for randomized boundary selection. Origin +8/+0xC
 * and optional GameWork-derived field +0x2C influence selected cases. Return
 * nothing; only controller geometry/random state changes and no MMIO occurs.
 */
typedef struct Overlay047ControllerGeometry {
    void *model00;
    void *animation04;
    s32 originX08;
    s32 originY0c;
    s32 left10;
    s32 top14;
    s32 right18;
    s32 bottom1c;
    s32 kind20;
    s32 frame24;
    s32 terminalFrame28;
    s32 repeatCount2c;
} Overlay047ControllerGeometry;

extern "C" s32 Presentation_InterpolateSmoothStep(s32, s32, s32, s32);
extern "C" s32 Presentation_InterpolateEaseInQuadratic(s32, s32, s32, s32);

static void update_horizontal_pair(Overlay047ControllerGeometry *self,
                                   s32 reverse)
{
    s32 half = self->terminalFrame28 / 2;
    s32 secondFrame = self->frame24 - half;
    s32 low;
    s32 high;

    if (self->frame24 < half) {
        low = Presentation_InterpolateSmoothStep(
            reverse ? 0 : -0x180, reverse ? -0x40 : -0x40,
            half, self->frame24);
        high = Presentation_InterpolateSmoothStep(
            reverse ? 0 : 0x180, 0x40, half, self->frame24);
    } else {
        low = Presentation_InterpolateSmoothStep(
            reverse ? -0x40 : -0x40, reverse ? -0x180 : 0,
            half, secondFrame);
        high = Presentation_InterpolateSmoothStep(
            0x40, reverse ? 0x180 : 0, half, secondFrame);
    }
    self->left10 = self->originX08 + low;
    self->top14 = self->originY0c + low;
    self->right18 = self->originX08 + high;
    self->bottom1c = self->originY0c + high;
}

extern "C" void func_ov047_0220baa8(void *controller)
{
    Overlay047ControllerGeometry *self =
        (Overlay047ControllerGeometry *)controller;
    s32 half;

    if (self->frame24 >= self->terminalFrame28)
        return;
    ++self->frame24;
    half = self->terminalFrame28 / 2;

    if ((self->kind20 == 11 || self->kind20 == 13 ||
         self->kind20 == 12 || self->kind20 == 14) &&
        self->frame24 == half + 1 && self->repeatCount2c != 0) {
        --self->repeatCount2c;
        --self->frame24;
    }

    switch (self->kind20) {
    case 1: case 11: case 13:
        update_horizontal_pair(self, 0);
        break;
    case 2: case 12: case 14:
        update_horizontal_pair(self, 1);
        break;
    case 3:
        self->right18 = Presentation_InterpolateEaseInQuadratic(
            0, 0x100, self->terminalFrame28, self->frame24);
        break;
    case 4:
        self->left10 = Presentation_InterpolateEaseInQuadratic(
            0x100, 0, self->terminalFrame28, self->frame24);
        break;
    case 5:
        self->bottom1c = Presentation_InterpolateEaseInQuadratic(
            0, 0xc0, self->terminalFrame28, self->frame24);
        break;
    case 6:
        self->top14 = Presentation_InterpolateEaseInQuadratic(
            0xc0, 0, self->terminalFrame28, self->frame24);
        break;
    case 7:
        self->left10 = Presentation_InterpolateEaseInQuadratic(
            0, 0x100, self->terminalFrame28, self->frame24);
        break;
    case 8:
        self->right18 = Presentation_InterpolateEaseInQuadratic(
            0x100, 0, self->terminalFrame28, self->frame24);
        break;
    case 9:
        self->top14 = Presentation_InterpolateEaseInQuadratic(
            0, 0xc0, self->terminalFrame28, self->frame24);
        break;
    case 10:
        self->bottom1c = Presentation_InterpolateEaseInQuadratic(
            0xc0, 0, self->terminalFrame28, self->frame24);
        break;
    }
}
