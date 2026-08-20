#include "tingle/types.h"

/*
 * Overlay 49 sprite placement and animation. These recovered routines map
 * object coordinates into sprite positions, select frames, and synchronize
 * visibility/transform state with the shared renderer. Exact assembly retains
 * fixed-point rounding and table-dependent control flow.
 */

/*
 * Search active primary render records from the configured last index toward
 * zero. If one lies within 0x1e000 of `point`, select animation one, seed its
 * 420-frame display timer, and return one; otherwise return zero. Sprite state
 * changes only through the graphics helper.
 */
extern "C" s32 func_020adc40(s32);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);

static s32 ov049_square_fx(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

extern "C" s32 func_ov049_0220bac0(void *object, const void *point)
{
    u8 *state = (u8 *)object;
    for (s32 index = *(s32 *)(state + 0x88); index >= 0; --index) {
        void *secondary = *(void **)(state + 0x68 + index * 4);
        if ((*(u16 *)((u8 *)secondary + 0x42) & 4) == 0) {
            u8 *primary = *(u8 **)(state + 0x4c + index * 4);
            s32 dx = *(s32 *)(primary + 0x30) -
                     *(const s32 *)((const u8 *)point + 4);
            s32 dy = *(s32 *)(primary + 0x34) -
                     *(const s32 *)((const u8 *)point + 8);
            s32 squared =
                (s32)((u32)ov049_square_fx(dx) + (u32)ov049_square_fx(dy));
            if (func_020adc40(squared) < 0x1e000) {
                GraphicsSpriteState_SetAnimationIndex(*(void **)(primary + 0xc), 1);
                *(s16 *)(state + 0xac + index * 2) = 0x1a4;
                return 1;
            }
        }
    }
    return 0;
}

/*
 * Select the first active primary render record, choose animation one, seed
 * its 420-frame display timer, and return one. Return zero if no record is
 * active. OAM-visible state changes only through the graphics helper.
 */
extern "C" s32 func_ov049_0220bb84(void *object)
{
    u8 *state = (u8 *)object;
    for (s32 index = *(s32 *)(state + 0x88); index >= 0; --index) {
        void *secondary = *(void **)(state + 0x68 + index * 4);
        if ((*(u16 *)((u8 *)secondary + 0x42) & 4) == 0) {
            u8 *primary = *(u8 **)(state + 0x4c + index * 4);
            GraphicsSpriteState_SetAnimationIndex(*(void **)(primary + 0xc), 1);
            *(s16 *)(state + 0xac + index * 2) = 0x1a4;
            return 1;
        }
    }
    return 0;
}

/*
 * Advance the shared falling effect and every primary/secondary render pair.
 * Primary animation timers transition between frames zero, two, and one;
 * owner states 23..26 force a 127-frame hold. Otherwise an idle primary near
 * the owner's tracked position reveals its secondary record for rendering.
 */
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void func_ov049_0220be28(void *);

extern "C" void func_ov049_0220bee8(void *object)
{
    u8 *state = (u8 *)object;
    func_ov049_0220be28(object);
    for (s32 index = *(s32 *)(state + 0x88); index >= 0; --index) {
        s16 *timer = (s16 *)(state + 0xac + index * 2);
        u8 *primary = *(u8 **)(state + 0x4c + index * 4);
        u8 *secondary = *(u8 **)(state + 0x68 + index * 4);
        u8 *sprite = *(u8 **)(primary + 0xc);
        if (*timer == 1) {
            if ((*(u16 *)(sprite + 0x24) & 1) != 0) {
                GraphicsSpriteState_SetAnimationIndex(sprite, 0);
                *(u16 *)(sprite + 0x24) |= 2;
                *timer = 0;
            }
        } else if (*timer > 0) {
            --*timer;
            if (*timer == 1) {
                GraphicsSpriteState_SetAnimationIndex(sprite, 2);
                *(u16 *)(sprite + 0x24) &= (u16)~2;
            }
        }
        *(u16 *)(secondary + 0x42) |= 4;
        u8 *owner = *(u8 **)(state + 0x48);
        s32 ownerState = *(s32 *)(owner + 0x74);
        if (ownerState >= 0x17 && ownerState <= 0x1a) {
            if (*timer <= 1)
                GraphicsSpriteState_SetAnimationIndex(sprite, 1);
            *timer = 0x7f;
        } else if (*timer == 0) {
            u8 temporary[0x10];
            u8 *tracked = *(u8 **)(owner + 8);
            VecFx32Object_InitCopy(temporary,
                                   *(u8 **)(tracked + 0x48) + 0x2c);
            s32 dx = *(s32 *)(temporary + 4) - *(s32 *)(primary + 0x30);
            s32 dy = *(s32 *)(temporary + 8) - *(s32 *)(primary + 0x34);
            s32 squared =
                (s32)((u32)ov049_square_fx(dx) + (u32)ov049_square_fx(dy));
            if (func_020adc40(squared) < 0x1e000)
                *(u16 *)(secondary + 0x42) &= (u16)~4;
            VecFx32Object_Destroy(temporary);
        }
    }
}
