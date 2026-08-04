#include "tingle/util_animation_resource.h"

/*
 * Positioning and viewport-culling methods for CUtilAnmRes. They derive an
 * offset from the object's embedded position, apply it to the paired handles
 * on opposite sides of a retained origin, and toggle each handle's hidden bit
 * according to DS screen bounds with the retail off-screen margins.
 */

/*
 * Subtract position from the embedded position, apply that coordinate to the
 * selector-opposite handle, shift its y coordinate by origin + 0xc0, and apply
 * the result to the other handle. Each application may update coordinates and
 * flag bit 3; no value is returned and no hardware register is written here.
 */
void func_02005810(UtilAnimationResource *self, const TouchPoint *position)
{
    TouchPoint difference;
    AnimationBindingHandle *handle;

    func_02005880(&difference, &self->position, position);
    handle = self->selector == 0 ? self->handles[1] : self->handles[0];
    func_020058b8(self, handle, &difference);

    difference.y -= self->origin + 0xc0;
    handle = self->selector == 0 ? self->handles[0] : self->handles[1];
    func_020058b8(self, handle, &difference);
}

/*
 * Show and position handle when -64 < x < 320 and -50 < y < 242: clear flag
 * bit 3 and write the low 16 bits of x/y at handle offsets 0x2c/0x2e. Outside
 * that expanded viewport, set bit 3 and leave coordinates unchanged. self is
 * an ABI parameter only; the manager handle is the sole modified state.
 */
#ifndef MATCHING
void func_020058b8(UtilAnimationResource *self,
                   AnimationBindingHandle *handle,
                   const TouchPoint *position)
{
    (void)self;
    if ((s32)position->x > -64 && (s32)position->x < 320 &&
        (s32)position->y > -50 && (s32)position->y < 242) {
        handle->flags24 &= (u16)~8;
        *(u16 *)((u8 *)handle + 0x2c) = position->x;
        *(u16 *)((u8 *)handle + 0x2e) = position->y;
    } else {
        handle->flags24 |= 8;
    }
}
#endif
