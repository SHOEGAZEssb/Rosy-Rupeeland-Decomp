#include "tingle/types.h"

/*
 * Overlay 8 particle spawning. This recovered routine claims inactive entries
 * from a 60-object pool and initializes mode-specific motion and lifetime data.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/* Return a random value limited to the confirmed inclusive bit-mask range. */
static u32 overlay008_random_mask(u32 mask)
{
    return genrand_int32() & mask;
}

/* Apply the retail positive fixed-point multiply with its 0x800 rounding bias. */
static s32 overlay008_scaled_random(u32 random, s32 scale)
{
    return (s32)(((s64)random * scale + 0x800) >> 12);
}

/* Build the confirmed packed 5-bit color used by modes 5 and 7. */
static u16 overlay008_random_color(void)
{
    u32 value = overlay008_random_mask(0x1f);
    u32 inverse = 0x1f - value;
    u32 red = 0x1f - (value >> 2);

    return (u16)(red | (inverse << 5) | (inverse << 10));
}

/*
 * Treat mode as the observed 0..7 selector and convert x/y from pixels to
 * 20.12 coordinates. Attempt to claim 3 entries for modes 0..3, 8 for mode 4,
 * 2 for modes 5/7, or 4 for mode 6, scanning slots 59 down to zero for each
 * attempt. A slot is inactive when +0x754+index*4 is -1 or less.
 *
 * For a claimed slot, reset its object's +0x30/+0x34/+0x38 coordinates, clear
 * +0x148+index*16, set color +0x844+index*2 to 0x7FFF and timer
 * +0x664+index*4 to 150, then generate the confirmed mode-specific velocity,
 * color, timer, random-angle (+0x4FC), angular delta (+0x574), and slot-code fields.
 * Modes 5, 6, and 7 offset object X by velocity times 17, 13, and 7. Mode 7 sets
 * slot code zero and clears object flag bit 2 at +0x42. Return no value. Random
 * generator state advances for every claimed slot; no direct hardware access
 * occurs. Modes outside 0..7 were not observed and have no established contract.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov008_021fb868(void *state, s32 mode, s32 x, s32 y)
{
    s32 attempts;
    s32 attempt;
    s32 index;
    s32 fixedX = x << 12;
    s32 fixedY = y << 12;

    if (mode <= 3) {
        attempts = 3;
    } else if (mode == 4) {
        attempts = 8;
    } else if (mode == 5 || mode == 7) {
        attempts = 2;
    } else if (mode == 6) {
        attempts = 4;
    } else {
        attempts = 0;
    }

    for (attempt = 0; attempt < attempts; attempt++) {
        for (index = 59; index >= 0; index--) {
            void *object;
            s32 velocityX = 0;
            s32 velocityY = 0;
            s32 slotCode;

            if (FIELD(s32, state, 0x754 + index * 4) > -1) {
                continue;
            }

            object = FIELD(void *, state, 0x04c + index * 4);
            FIELD(s32, object, 0x30) = fixedX;
            FIELD(s32, object, 0x34) = fixedY;
            FIELD(s32, object, 0x38) = 0;
            FIELD(s32, state, 0x148 + index * 16) = 0;
            FIELD(u16, state, 0x844 + index * 2) = 0x7fff;
            FIELD(s32, state, 0x664 + index * 4) = 150;

            if (mode <= 3) {
                velocityX = overlay008_scaled_random(
                                overlay008_random_mask(0xfff), 0x3000) - 0x1800;
                velocityY = (s32)overlay008_random_mask(0x1fff) - 0x3800;
            } else if (mode == 4) {
                velocityX = overlay008_scaled_random(
                                overlay008_random_mask(0xfff), 0x2333) - 0x119a;
                velocityY = (s32)overlay008_random_mask(0xfff) - 0x2666;
            } else if (mode == 5) {
                velocityX = overlay008_scaled_random(
                                overlay008_random_mask(0xfff), 0x1ccd) - 0xe66;
                velocityY = (s32)overlay008_random_mask(0x7ff) - 0x1000;
                FIELD(s32, object, 0x30) += velocityX * 17;
                FIELD(u16, state, 0x844 + index * 2) = overlay008_random_color();
                FIELD(s32, state, 0x664 + index * 4) = 70;
            } else if (mode == 6) {
                velocityX = overlay008_scaled_random(
                                overlay008_random_mask(0xfff), 0x2333) - 0x119a;
                velocityY = (s32)overlay008_random_mask(0xfff) - 0x3666;
                FIELD(s32, object, 0x30) += velocityX * 13;
                FIELD(s32, state, 0x664 + index * 4) = 80;
            } else if (mode == 7) {
                velocityX = overlay008_scaled_random(
                                overlay008_random_mask(0xfff), 0x800) - 0x400;
                velocityY = (s32)overlay008_random_mask(0x7ff) - 0x1000;
                FIELD(s32, object, 0x30) += velocityX * 7;
                FIELD(u16, state, 0x844 + index * 2) = overlay008_random_color();
                FIELD(s32, state, 0x664 + index * 4) = 50;
            }

            FIELD(s32, state, 0x140 + index * 16) = velocityX;
            FIELD(s32, state, 0x144 + index * 16) = velocityY;
            FIELD(u16, state, 0x4fc + index * 2) = (u16)genrand_int32();
            FIELD(s32, state, 0x574 + index * 4) =
                (s32)overlay008_random_mask(0x7ff) - 0x400;

            switch (mode) {
            case 0:
            case 1:
                slotCode = 1;
                break;
            case 2:
                slotCode = (s32)overlay008_random_mask(1) + 1;
                break;
            case 3:
                slotCode = (s32)(genrand_int32() % 6) + 4;
                break;
            case 4:
                slotCode = (s32)overlay008_random_mask(3) + 10;
                break;
            case 5:
                slotCode = (s32)overlay008_random_mask(7) + 14;
                break;
            case 6:
                slotCode = (s32)overlay008_random_mask(3) + 10;
                break;
            default:
                slotCode = 0;
                FIELD(u16, object, 0x42) &= (u16)~4;
                break;
            }
            FIELD(s32, state, 0x754 + index * 4) = slotCode;
            break;
        }
    }
}
