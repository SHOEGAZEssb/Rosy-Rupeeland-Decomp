#include "tingle/types.h"

/* Overlay 32 child resource selection, sprite setup, and horizontal motion planning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_ReleaseResources(void *);
extern void func_ov032_0220147c(void *);
extern void AnimationResourceState_ReplaceResources(...);
extern void Overlay032Controller_CreateObject(...);
extern void func_ov032_022014c0(...);
extern void func_ov032_021fe0c4(void *);
extern void Overlay032Controller_SetScaleTarget(...);
extern s32 func_020beb18(...);
extern s32 func_020be8c0(...);
extern s32 func_020beb6c(...);
extern s32 func_020beae4(...);
extern s32 func_020adc90(...);
#ifdef __cplusplus
}
#endif

static s32 motion_step(s32 distance)
{
    s32 angle = func_020beb18(distance << 12);
    s32 transformed = distance > 0 ? func_020be8c0(0x3f000000, angle)
                                   : func_020beb6c(angle, 0x3f000000);
    return func_020adc90(func_020beae4(transformed), 0x28000);
}

/*
 * Resets `child` resource/controller state and, when its child index +0x04 is
 * eligible for `selection`, selects a 0x18-byte asset record from `records`,
 * loads its three IDs, creates/configures the sprite at record X/Y/frame values,
 * disables its controller flags, and applies immediate scale 0x100 for child 3
 * or 0x80 otherwise. `mode` suppresses child 3, and child 4 is suppressed for
 * selection 10 or `recordIndex`; returns void.
 */
extern "C" void func_ov032_02201020(void *child, s32 recordIndex, s32 selection,
                                     const u8 *records, s32 mode)
{
    AnimationResourceState_ReleaseResources((u8 *)child + 0xc);
    func_ov032_0220147c((u8 *)child + 0x18);
    s32 index = FIELD(s32, child, 4);
    if ((mode != 0 && index == 3) ||
        (index == 4 && (selection == 10 || selection == recordIndex)) ||
        (index == 2 && selection < 2) ||
        (index == 1 && selection < 3) ||
        (index == 0 && selection < 4)) return;

    const u8 *record = records + (selection + index - 3) * 0x18;
    AnimationResourceState_ReplaceResources((u8 *)child + 0xc, data_020f4e18[0],
                  FIELD(u32, record, 0x10), FIELD(u32, record, 0x14), FIELD(u32, record, 0x18));
    s32 x = FIELD(s32, child, 0x48);
    if (index == 2) x += FIELD(s32, record, 0x20);
    s32 frame = FIELD(s32, record, 0x1c);
    FIELD(s32, child, 0x50) = x;
    FIELD(s32, child, 0x54) = FIELD(s32, child, 0x4c);
    Overlay032Controller_CreateObject((u8 *)child + 0x18, FIELD(void *, child, 8), (u8 *)child + 0xc);
    func_ov032_022014c0((u8 *)child + 0x18, frame, frame, x,
                        FIELD(s32, child, 0x54), 3, 0, 0, 0);
    func_ov032_021fe0c4((u8 *)child + 0x18);
    Overlay032Controller_SetScaleTarget((u8 *)child + 0x18, index == 3 ? 0x100 : 0x80, 0);
}

/*
 * Plans a 40-frame horizontal move for `child` in signed `direction`. It stores
 * direction +0x60, timer +0x64, accumulator +0x5C, base/target +0x68 and derived
 * fixed-point step +0x58. End children cancel impossible outward moves. Child 3
 * moving left and child 1 moving right add record-specific X offset +0x20;
 * other targets use the adjacent child's +0x48. Returns void.
 */
extern "C" void func_ov032_02201188(void *child, s32 direction, s32 selection,
                                     const u8 *records)
{
    FIELD(s32, child, 0x60) = direction;
    FIELD(s32, child, 0x64) = 0x28;
    FIELD(s32, child, 0x5c) = 0;
    FIELD(s32, child, 0x68) = FIELD(s32, child, 0x48);
    FIELD(s32, child, 0x58) = 0x1000;
    s32 index = FIELD(s32, child, 4);
    if (direction < 0) {
        if (index == 0) { FIELD(s32, child, 0x64) = 0; return; }
        s32 target = FIELD(s32, (u8 *)FIELD(void *, child, 0) + (index - 1) * 0x6c, 0xc8c);
        if (index == 3) target += FIELD(s32, records + selection * 0x18, 0x20);
        FIELD(s32, child, 0x68) = target;
        FIELD(s32, child, 0x58) = motion_step(FIELD(s32, child, 0x48) - target);
    } else {
        if (index == 4) { FIELD(s32, child, 0x64) = 0; return; }
        s32 target = FIELD(s32, (u8 *)FIELD(void *, child, 0) + (index + 1) * 0x6c, 0xc8c);
        if (index == 1) target += FIELD(s32, records + (selection - 2) * 0x18, 0x20);
        FIELD(s32, child, 0x68) = target;
        FIELD(s32, child, 0x58) = motion_step(target - FIELD(s32, child, 0x48));
    }
}
