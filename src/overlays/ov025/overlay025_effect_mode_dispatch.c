#include "tingle/types.h"

/* Overlay 25 central paired-effect mode and timing dispatcher. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02202d24[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020948e4(void *, s32, s32);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_02094cf0(void *, const void *, s32);
extern void func_ov025_021fe174(void *, s32, s32, s32);
extern void func_ov025_021fe248(void *);
extern void func_ov025_021fe2c4(void *);
extern void func_ov025_021fe39c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Store `mode`/+0x9C and `variant`/+0xAC, reset phase +0xA0, hide both
 * secondary sprites, then configure the retail resource, animation, fixed-
 * point position, child tween, duration +0x7C, and timer +0x80 for modes
 * 0..8 and 10..11. Mode 9 intentionally performs no setup. Graphics and
 * animation state change; returns void.
 */
extern "C" void func_ov025_021fe4cc(void *object, s32 mode, s32 variant)
{
    FIELD(s32, object, 0x9c) = mode;
    FIELD(s32, object, 0xac) = variant;
    FIELD(s32, object, 0xa0) = 0;
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 4;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 4;

    switch (FIELD(s32, object, 0x9c)) {
    case 0:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 0, 0, 2);
            func_02094cf0(object, data_ov025_02202d24, 1);
            return;
        }
        /* The opposite side deliberately shares mode 2 setup. */
    case 2:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 1, FIELD(s32, object, 0xac), 2);
            func_02094bbc(object, 0x120000, 0xa0000, 0);
            func_020948e4((u8 *)object + 0xc, 2, -0x20000);
        } else {
            func_ov025_021fe174(object, 1, FIELD(s32, object, 0xac), 0x42);
            func_02094bbc(object, -0x20000, 0xa0000, 0);
            func_020948e4((u8 *)object + 0xc, 2, 0x120000);
        }
        switch (FIELD(s32, object, 0xac)) {
        case 0:
        case 3:
            FIELD(s32, object, 0x7c) = 300;
            FIELD(s32, object, 0x80) = 0;
            return;
        case 1:
        case 2:
            FIELD(s32, object, 0x7c) = 150;
            FIELD(s32, object, 0x80) = 0;
            return;
        }
        break;
    case 3:
    case 4:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 1, FIELD(s32, object, 0xac), 2);
            func_02094bbc(object, 0x120000, 0xa0000, 0);
        } else {
            func_ov025_021fe174(object, 1, FIELD(s32, object, 0xac), 0x42);
            func_02094bbc(object, -0x20000, 0xa0000, 0);
        }
        func_020948e4((u8 *)object + 0xc, 2, 0x80000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 5:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe248(object);
            func_02094bbc(object, 0x120000, 0xa0000, 0);
            func_020948e4((u8 *)object + 0xc, 2, -0x20000);
        } else {
            func_ov025_021fe2c4(object);
            func_02094bbc(object, -0x20000, 0xa0000, 0);
            func_020948e4((u8 *)object + 0xc, 2, 0x120000);
        }
        func_020948e4((u8 *)object + 0x1c, 2, 0x40000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 6:
    case 7:
    case 8:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe248(object);
            func_02094bbc(object, 0x120000, 0x60000, 0);
        } else {
            func_ov025_021fe2c4(object);
            func_02094bbc(object, -0x20000, 0x60000, 0);
        }
        func_020948e4((u8 *)object + 0xc, 2, 0x80000);
        func_020948e4((u8 *)object + 0x1c, 2, 0x60000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 1:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 1, 1, 2);
            func_02094bbc(object, 0x120000, 0xa0000, 0);
        } else {
            func_ov025_021fe174(object, 1, 1, 0x42);
            func_02094bbc(object, -0x20000, 0xa0000, 0);
        }
        func_020948e4((u8 *)object + 0xc, 1, 0x80000);
        func_020948e4((u8 *)object + 0x1c, 3, 0x60000);
        FIELD(s32, object, 0x7c) = 90;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 10:
        if (FIELD(s32, object, 0xa4) != 0) {
            func_ov025_021fe174(object, 1, 13, 2);
            func_02094bbc(object, 0x120000, -0xe0000, 0);
            func_020948e4((u8 *)object + 0xc, 2, -0x20000);
        } else {
            func_ov025_021fe174(object, 1, 13, 0x42);
            func_02094bbc(object, -0x20000, -0xe0000, 0);
            func_020948e4((u8 *)object + 0xc, 2, 0x120000);
        }
        FIELD(s32, object, 0x7c) = 480;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 11:
        func_ov025_021fe39c(object);
        func_02094bbc(object, 0x80000, -0x120000, 0);
        func_020948e4((u8 *)object + 0x1c, 1, 0xa0000);
        FIELD(s32, object, 0x7c) = 60;
        FIELD(s32, object, 0x80) = 0;
        return;
    default:
        return;
    }
}
