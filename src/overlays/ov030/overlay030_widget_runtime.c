#include "tingle/types.h"

/* Overlay 30 selector-widget teardown, frame rendering, and numeric sprites. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern void *data_020f4e14[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02070958(void *, s32, s32, s32);
extern void func_02071eb8(void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_020740a4(void *);
extern void func_0207419c(void *);
extern void func_02074dc8(void *);
extern void func_0207593c(void *, s32, s32);
extern void func_02091e1c(void *);
extern void func_020958d8(void *);
extern s32 func_020befec(s32, s32);
extern void func_ov030_021fcf18(void *);
#ifdef __cplusplus
}
#endif

/*
 * Frees optional allocation +0x1B0; releases renderers +0x28/+0x2C; clears the
 * font area through +0 with zero arguments; destroys four timers +0x1D0..
 * +0x1E8, controllers +0x58/+0x104 through their no-op destructors, and resource
 * sets +4/+0x10/+0x1C. Returns `widget` without freeing it; owned heap, timer,
 * renderer, font, and resource SDK state is released.
 */
extern "C" void *func_ov030_021fd27c(void *widget)
{
    if (FIELD(void *, widget, 0x1b0) != 0)
        Heap_Free(FIELD(void *, widget, 0x1b0));
    func_0207419c(FIELD(void *, widget, 0x28));
    func_0207419c(FIELD(void *, widget, 0x2c));
    func_0207593c(FIELD(void *, widget, 0), 0, 0);
    func_02091e1c((u8 *)widget + 0x1e8);
    func_02091e1c((u8 *)widget + 0x1e0);
    func_02091e1c((u8 *)widget + 0x1d8);
    func_02091e1c((u8 *)widget + 0x1d0);
    func_ov030_021fcf18((u8 *)widget + 0x104);
    func_ov030_021fcf18((u8 *)widget + 0x58);
    func_02071eb8((u8 *)widget + 0x1c);
    func_02071eb8((u8 *)widget + 0x10);
    func_02071eb8((u8 *)widget + 4);
    return widget;
}

/*
 * Advances 16-bit phase +0x1C8 by 0x1000, indexes sine table 0x020C9670 by
 * phase>>4, derives a signed intensity around 0x180, and applies it equally to
 * three channels of resource +8. If any of seven slot sprites +0x34..+0x4C is
 * visible (flag bit 2 clear at +0x24), it invokes font hook 0x02074DC8 once.
 * It advances controllers +0x58/+0x104, applies negative scroll +0x1C4 to
 * renderer +0x28 and font +0, and renders +0x28/+0x2C. Returns void; phase,
 * resource, font, controller, and renderer SDK state change.
 */
extern "C" void func_ov030_021fd304(void *widget)
{
    u16 phase = (u16)(FIELD(u32, widget, 0x1c8) + 0x1000);
    FIELD(u32, widget, 0x1c8) = phase;
    s32 scaled = (data_020c9670[phase >> 4] << 7) / 0x1000 + 0x180;
    func_02070958(FIELD(void *, widget, 8), scaled, scaled, scaled);
    for (s32 i = 0; i < 7; ++i) {
        void *sprite = FIELD(void *, widget, 0x34 + i * 4);
        if ((FIELD(u16, sprite, 0x24) & 4) == 0) {
            func_02074dc8(data_020f4e14[0]);
            break;
        }
    }
    func_020958d8((u8 *)widget + 0x58);
    func_020958d8((u8 *)widget + 0x104);
    s32 scroll = FIELD(s32, widget, 0x1c4);
    FIELD(s32, FIELD(void *, widget, 0x28), 0x18) = 0;
    FIELD(s32, FIELD(void *, widget, 0x28), 0x1c) = -scroll;
    func_0207593c(FIELD(void *, widget, 0), 0, -scroll);
    func_020740a4(FIELD(void *, widget, 0x28));
    func_020740a4(FIELD(void *, widget, 0x2c));
}

/*
 * Splits numeric value +0x1B4 by ten and sets sprite +0x50 to quotient+8 and
 * sprite +0x54 to remainder+8. Returns void; the two sprite selectors change.
 */
extern "C" void func_ov030_021fd3e8(void *widget)
{
    s32 value = FIELD(s32, widget, 0x1b4);
    s32 quotient = func_020befec(value, 10);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x50), (quotient + 8) & 0xff);
    (void)func_020befec(value, 10);
    s32 remainder = value - quotient * 10;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x54), (remainder + 8) & 0xff);
}
