#include "tingle/types.h"

/* Overlay 25 randomized-side return-pose and wait configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_020918f4(u32 *, s32);
extern "C" void func_020948e4(void *, s32, s32);
extern "C" void func_ov025_021fe174(void *, s32, s32, s32);
extern "C" void func_ov025_021fe248(void *);
extern "C" void func_ov025_021fe2c4(void *);

/*
 * Choose a random side, hide both secondary sprites, and configure the
 * current mode's recovered return pose and wait. Case order mirrors the retail
 * block layout; RNG, sprite, tween, and timer state may change.
 */
extern "C" void func_ov025_021fe91c(void *object)
{
    FIELD(s32, object, 0xa4) = func_020918f4((u32 *)object + 0x3e, 2);
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 4;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 4;

    switch (FIELD(s32, object, 0x9c)) {
    case 0:
        break;
    case 2:
        break;
    case 5:
        break;
    case 8:
        break;
    case 9:
        break;
    case 10:
        break;
    case 3:
    case 7:
    case 11:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 1, FIELD(s32, object, 0xac), 2);
            func_020948e4((u8 *)object + 0xc, 2, -0x20000);
        } else {
            func_ov025_021fe174(object, 1, FIELD(s32, object, 0xac), 0x42);
            func_020948e4((u8 *)object + 0xc, 2, 0x120000);
        }
        switch (FIELD(s32, object, 0xac)) {
        case 0:
        case 3:
            FIELD(s32, object, 0x7c) = 120;
            FIELD(s32, object, 0x80) = 0;
            break;
        case 1:
        case 2:
            FIELD(s32, object, 0x7c) = 60;
            FIELD(s32, object, 0x80) = 0;
            break;
        }
        break;
    case 4:
    case 6:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe248(object);
            func_020948e4((u8 *)object + 0xc, 2, -0x20000);
        } else {
            func_ov025_021fe2c4(object);
            func_020948e4((u8 *)object + 0xc, 2, 0x120000);
        }
        func_020948e4((u8 *)object + 0x1c, 2, 0x40000);
        FIELD(s32, object, 0x7c) = 120;
        FIELD(s32, object, 0x80) = 0;
        break;
    case 1:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 1, 1, 2);
            func_020948e4((u8 *)object + 0xc, 1, -0x20000);
        } else {
            func_ov025_021fe174(object, 1, 1, 0x42);
            func_020948e4((u8 *)object + 0xc, 1, 0x120000);
        }
        func_020948e4((u8 *)object + 0x1c, 3, 0x40000);
        FIELD(s32, object, 0x7c) = 90;
        FIELD(s32, object, 0x80) = 0;
        break;
    default:
        break;
    }
}
