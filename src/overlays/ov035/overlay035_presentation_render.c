#include "tingle/types.h"

/* Overlay 35 top-level child rendering and direct display-register staging. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef s32 (*QueryCallback)(void *);
typedef void (*RenderCallback)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov043_0220b9bc(void *state);
extern void func_020b0558(void);
extern void func_ov048_0220bad4(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Renders the current child scene at +0x60. It first calls child vtable slot
 * +0x10 to obtain a display value, subtracting 0x47E when embedded state +0x98
 * reports 1. After func_020b0558 it writes 0x7FFF/0/0 to hardware addresses
 * 0x040004C0, 0x040004C4, and 0x04000444, stores 0 and the adjusted value in
 * child fields +0x98/+0x9C, and invokes child vtable slot +0x0C. It then writes
 * 1 to 0x04000448 and 0 to 0x04000540 before finalizing embedded state +0x98.
 * There is no return value; child, renderer, and display hardware state change.
 */
extern "C" void func_ov035_022028b4(void *object)
{
    void *child = FIELD(void *, object, 0x60);
    void **vtable = FIELD(void **, child, 0);
    QueryCallback query = (QueryCallback)vtable[4];
    s32 value = query(child);
    if (func_ov043_0220b9bc((u8 *)object + 0x98) == 1)
        value -= 0x47e;
    func_020b0558();

    *(volatile u32 *)0x040004c0 = 0x7fff;
    *(volatile u32 *)0x040004c4 = 0;
    *(volatile u32 *)0x04000444 = 0;
    FIELD(s32, child, 0x98) = 0;
    FIELD(s32, child, 0x9c) = value;
    RenderCallback render = (RenderCallback)vtable[3];
    render(child);
    *(volatile u32 *)0x04000448 = 1;
    *(volatile u32 *)0x04000540 = 0;
    func_ov048_0220bad4((u8 *)object + 0x98);
}
