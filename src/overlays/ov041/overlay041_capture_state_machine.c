#include "tingle/types.h"

/*
 * Overlay 41 capture-bank state machine. This recovered dispatcher advances
 * BG-bank swaps, brightness ramps and two small graphics-memory copies across
 * capture frames.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020befec(s32, s32);
void func_020afce8(volatile void *, s32, s32);
void func_ov041_021fdd04(s32, s32, s32, s32, s32);
s32 func_0207043c(void);
s32 func_02070874(void *);
s32 func_02070888(void *);
void func_020b1924(void *, s32, s32);
void func_020b2058(s32, s32, s32);
}

/*
 * Advance owner+0x184 through states 0..10. States 1/2 animate display
 * brightness, 3..7 copy resource pixels while switching BG1 banks, 8/9 copy
 * bounded graphics ranges on alternating capture banks, and 10 wraps the
 * brightness counter. The routine mutates owner state and graphics registers.
 */
extern "C" void func_ov041_021fe8b8(void *owner)
{
    s32 state = FIELD(s32, owner, 0x184);
    switch (state) {
    case 1: {
        s32 value = ++FIELD(s32, owner, 0x188);
        func_020afce8((volatile void *)0x04000050, 2, func_020befec(value, 3));
        if (value == 0)
            FIELD(s32, owner, 0x184) = 0;
        break;
    }
    case 2: {
        s32 value = --FIELD(s32, owner, 0x188);
        func_020afce8((volatile void *)0x04000050, 2, func_020befec(value, 3));
        if (value <= -0x30) {
            ++FIELD(s32, owner, 0x184);
            FIELD(s32, owner, 0x180) =
                func_020befec(FIELD(s32, owner, 0x180) + 2, 6);
        }
        break;
    }
    case 3:
    case 5:
    case 7: {
        s32 offset = (state - 3) << 12;
        func_ov041_021fdd04(0, 0, 0x1c, 2, 0);
        s32 slot = FIELD(s32, owner, 0x180) + 1;
        void *resource = FIELD(void *, owner, 0x48 + slot * 12);
        u8 *pixels = (u8 *)FIELD(void *, resource, 0x24);
        s32 length = func_0207043c();
        func_020b1924(pixels + (offset >> 1), offset, length / 4);
        func_ov041_021fdd04(0, 0, 0x1c, 0, 0);
        ++FIELD(s32, owner, 0x184);
        break;
    }
    case 4:
    case 6: {
        s32 offset = state << 12;
        func_ov041_021fdd04(0, 0, 0x1c, 0, 0);
        s32 slot = FIELD(s32, owner, 0x180);
        void *resource = FIELD(void *, owner, 0x48 + slot * 12);
        u8 *pixels = (u8 *)FIELD(void *, resource, 0x24);
        s32 length = func_0207043c();
        func_020b1924(pixels + (offset >> 1), offset, length / 4);
        ++FIELD(s32, owner, 0x184);
        break;
    }
    case 8:
        if (FIELD(s32, owner, 0x1ec) == 0) {
            void *resource = FIELD(void *, owner,
                                   0x4c + FIELD(s32, owner, 0x180) * 12);
            s32 start = func_02070874(resource);
            s32 end = func_02070888(resource);
            func_020b2058(start + 0x20, 0x20, end - 0x20);
            ++FIELD(s32, owner, 0x184);
        }
        break;
    case 9:
        if (FIELD(s32, owner, 0x1ec) != 0) {
            s32 slot = FIELD(s32, owner, 0x180) + 1;
            void *resource = FIELD(void *, owner, 0x4c + slot * 12);
            func_020b2058(func_02070874(resource), 0x100,
                          func_02070888(resource));
            ++FIELD(s32, owner, 0x184);
        }
        break;
    case 10:
        if (--FIELD(s32, owner, 0x188) < -0x6c) {
            FIELD(s32, owner, 0x188) = -0x30;
            FIELD(s32, owner, 0x184) = 1;
        }
        break;
    default:
        break;
    }
}
