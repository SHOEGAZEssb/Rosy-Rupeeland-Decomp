#include "tingle/types.h"

/* Overlay 12 object-viewer defaults, resource selection, input bounds, and idle-scene initialization. */

extern u32 data_ov012_021fe4d0[];
#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov012_021fd044(s32);
extern void func_ov012_021fceb4(void *, void *);
extern void func_ov012_021fd148(void *, s32, s32, s32);
extern void func_020b0300(u32, u32, u32, u32, u32);
#ifdef __cplusplus
}
#endif

/* Initialize confirmed viewer fields at +0x194..+0x1C0, apply the 3D toggle and clear-color state, and return void. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd5ac(void *state)
{
    u32 intensity;
    u32 color;

    *(s32 *)((u8 *)state + 0x198) = 0;
    *(s32 *)((u8 *)state + 0x19c) = 0;
    *(s32 *)((u8 *)state + 0x1ac) = 0;
    *(s32 *)((u8 *)state + 0x1a8) = 0;
    *(s32 *)((u8 *)state + 0x1a4) = 0;
    *(s32 *)((u8 *)state + 0x1a0) = 2;
    *(s32 *)((u8 *)state + 0x194) = 8;
    *(s32 *)((u8 *)state + 0x1b0) = 1;
    *(s32 *)((u8 *)state + 0x1b4) = 1;
    *(s32 *)((u8 *)state + 0x1b8) = 1;
    *(s32 *)((u8 *)state + 0x1c0) = 0x1f;
    *(s32 *)((u8 *)state + 0x1bc) = 1;

    func_ov012_021fd044(*(s32 *)((u8 *)state + 0x1b8));
    intensity = *(u32 *)((u8 *)state + 0x194);
    color = (u16)(intensity | (intensity << 5) | (intensity << 10));
    /* func_020b0300 is the SDK clear-color boundary; the final zero is passed on the stack. */
    func_020b0300(color, 0x1f, 0x7fff, 0x3f, 0);
}

/* Clear +0x18C and select the 24-byte resource-table entry indexed by +0x188 for the transform at +0x158; returns void. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd63c(void *state)
{
    s32 index;
    u8 *table;
    void *descriptor;

    *(s32 *)((u8 *)state + 0x18c) = 0;
    index = *(s32 *)((u8 *)state + 0x188);
    table = *(u8 **)((u8 *)state + 0x7c);
    descriptor = *(void **)(table + index * 0x18);
    func_ov012_021fceb4((u8 *)state + 0x158, descriptor);
}

/* On held bit 0x10/0x20 at input +0x06, add/subtract step and clamp to [minimum, maximum]; return the bounded value. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov012_021fd668(void *state, s32 value, s32 minimum, s32 maximum,
                         s32 step)
{
    u16 held = *(u16 *)(*(u8 **)((u8 *)state + 0x50) + 6);

    if (held & 0x10) {
        value += step;
        if (value > maximum) value = maximum;
    } else if (held & 0x20) {
        value -= step;
        if (value < minimum) value = minimum;
    }
    return value;
}

/* On held bit 0x10/0x20 at input +0x06, add/subtract step and wrap across [minimum, maximum]; return the wrapped value. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov012_021fd6ac(void *state, s32 value, s32 minimum, s32 maximum,
                         s32 step)
{
    u16 held = *(u16 *)(*(u8 **)((u8 *)state + 0x50) + 6);

    if (held & 0x10) {
        value += step;
        if (value > maximum) value = minimum;
    } else if (held & 0x20) {
        value -= step;
        if (value < minimum) value = maximum;
    }
    return value;
}

/* If embedded scene field +0x28 is clear, initialize member +0x24 from data +8 and data +0x0C minus 0x48; return zero. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov012_021fd6f0(void *state)
{
    if (*(s32 *)((u8 *)state + 0x28) == 0) {
        func_ov012_021fd148((u8 *)state + 0x24,
                            (s32)data_ov012_021fe4d0[2],
                            (s32)data_ov012_021fe4d0[3] - 0x48,
                            0);
    }
    return 0;
}
