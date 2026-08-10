#include "tingle/types.h"

/* Overlay 26 central frame renderer and flag-gated effect submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020773e4(void *, void *);
extern void Graphics3DLight_Apply(void *, s32);
extern void Graphics3DSceneState_Apply(void *);
extern void func_020b0558(void);
extern s32 func_ov043_0220b9bc(void *);
extern void func_ov048_0220bad4(void *);
extern void func_ov026_021fd300(void *);
extern void func_ov026_021fd540(void *);
extern void func_ov026_021fd6b0(void *, void *);
extern void func_ov026_021fd900(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd964(u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fe72c(void *);
extern void func_ov026_021fea4c(void *);
extern void func_ov026_021feec8(void *);
extern s32 func_ov026_021ff4f8(void *);
extern void func_ov026_021ff51c(void *);
extern void func_ov026_022006f8(void *, s32);
#ifdef __cplusplus
}
#endif

typedef void (*ObjectMethod)(void *);

/* Submits a polymorphic render object through virtual slot +0x14. */
static void submit_object(void *object)
{
    ((ObjectMethod *)FIELD(void *, object, 0))[5](object);
}

/*
 * Renders one scene frame. It updates display helper +0x370, prepares matrices
 * and four transform slots, mirrors composite flag 0x200 into central-record
 * bit 4, applies optional scale interpolation (0x2000), submits particle pools,
 * and gates companion renderers with flags 0x4/8/10/20/40/100/800/40000. It
 * always renders the composite, then submits the +0x318 linked list under model
 * state 0x15. Returns void and directly writes DS geometry command registers.
 */
extern "C" void func_ov026_0220046c(void *scene)
{
    s32 inactive = func_ov043_0220b9bc((u8 *)scene + 0x370) == 0;
    FIELD(s32, scene, 0x24c) = 0;
    FIELD(s32, scene, 0x250) = inactive ? 0x47e : 0;
    func_020b0558();
    *(volatile u32 *)0x040004c0 = 0x7f107fff;

    if (FIELD(s32, scene, 0x370) == 1) {
        *(volatile u32 *)0x04000444 = 0;
        Graphics3DSceneState_Apply((u8 *)scene + 0x254);
        func_020773e4(FIELD(void *, scene, 0x78), (u8 *)scene + 0x2ac);
        *(volatile u32 *)0x04000448 = 1;
    }
    *(volatile u32 *)0x04000444 = 0;
    Graphics3DSceneState_Apply((u8 *)scene + 0x1c0);
    for (s32 i = 0; i < 4; ++i)
        Graphics3DLight_Apply((u8 *)scene + 0x180 + i * 0x10, i);

    void *effect = FIELD(void *, scene, 0x160);
    void *central = FIELD(void *, scene, 0x158);
    if (FIELD(u32, effect, 0x12c) & 0x200)
        FIELD(u16, central, 0x50) &= ~4;
    else
        FIELD(u16, central, 0x50) |= 4;
    if (FIELD(u32, effect, 0x12c) & 0x2000)
        func_ov026_022006f8(scene, func_ov026_021ff4f8(effect));

    func_020773e4(FIELD(void *, scene, 0x6c), (u8 *)scene + 0x218);
    u32 flags = FIELD(u32, effect, 0x12c);
    if (flags & 4)
        func_020773e4(FIELD(void *, scene, 0x70), (u8 *)scene + 0x218);
    if (flags & 8)
        func_020773e4(FIELD(void *, scene, 0x74), (u8 *)scene + 0x218);
    if (flags & 0x10)
        func_ov026_021fd300(FIELD(void *, scene, 0x164));
    if (flags & 0x100)
        func_ov026_021fd540(FIELD(void *, scene, 0x168));
    func_ov026_021ff51c(effect);
    if (flags & 0x20)
        func_ov026_021fe72c(FIELD(void *, scene, 0x16c));
    if (flags & 0x40)
        func_ov026_021fea4c(FIELD(void *, scene, 0x170));
    if (flags & 0x800)
        func_ov026_021feec8(FIELD(void *, scene, 0x174));
    if (flags & 0x40000)
        func_ov026_021fd6b0(FIELD(void *, scene, 0x17c),
                            (u8 *)scene + 0x218);

    func_ov026_021fd964(0, 0, 3, 0x15, 0x1f, 0);
    func_ov026_021fd900(0, 0, 0, 0, 0, 0, 0, 0);
    for (void *node = FIELD(void *, scene, 0x318); node != 0;
         node = FIELD(void *, node, 8))
        submit_object(node);
    if (flags & 4)
        submit_object(FIELD(void *, scene, 0x178));

    *(volatile u32 *)0x04000448 = 1;
    *(volatile u32 *)0x04000540 = 0;
    func_ov048_0220bad4((u8 *)scene + 0x370);
}
