#include "tingle/types.h"

/* Overlay 25 paired-engine animated effect controller and mode dispatcher. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u8 data_ov025_02202c84[];
extern const u8 data_ov025_02202d24[];
extern const u8 data_ov025_02203354[];
extern void *gDebugFont;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern u32 genrand_int32(void);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_ReplaceStateResourcesFromSource(void *, void *, void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern s32 func_0209189c(u32 *, s32, s32);
extern s32 func_020918f4(u32 *, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_020949ec(void *);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_02094cf0(void *, const void *, s32);
extern void func_ov025_021fdec8(void *);
extern void func_ov025_021fe174(void *, s32, s32, s32);
extern void func_ov025_021fe248(void *);
extern void func_ov025_021fe2c4(void *);
extern void func_ov025_021fe39c(void *);
extern void func_ov025_021fe4cc(void *, s32, s32);
extern void func_ov025_021feb08(void *, s32);
#ifdef __cplusplus
}
#endif

/* Empty base lifecycle hook; its input and all observable state are unchanged. */
extern "C" void func_ov025_021fdec8(void *object)
{
    (void)object;
}

/*
 * Chooses a random mode in 0..8 different from current +0x9C, chooses a random
 * variant in 0..2, and dispatches it through func_ov025_021FE4CC. RNG and
 * animation state change; returns void.
 */
extern "C" void func_ov025_021fe3f8(void *object)
{
    s32 mode;
    do mode = func_020918f4((u32 *)object + 0x3e, 9);
    while (mode == FIELD(s32, object, 0x9c));
    func_ov025_021fe4cc(object, mode,
                        func_0209189c((u32 *)object + 0x3e, 0, 3));
}

static void position_by_side(void *object, s32 animation, s32 flag,
                             s32 y, s32 child_target)
{
    if (FIELD(s32, object, 0xa4)) {
        func_ov025_021fe174(object, 1, animation, flag);
        func_02094bbc(object, 0x120000, y, 0);
        func_020948e4((u8 *)object + 0xc, 2, -0x20000);
    } else {
        func_ov025_021fe174(object, 1, animation, 0x42);
        func_02094bbc(object, -0x20000, y, 0);
        func_020948e4((u8 *)object + 0xc, 2, 0x120000);
    }
    if (child_target != 0)
        func_020948e4((u8 *)object + 0x1c, 2, child_target);
}

/*
 * Central mode dispatcher. It stores mode +0x9C and variant +0xAC, resets
 * phase +0xA0, initially hides the secondary pair, then configures resources,
 * animations, mirrored side-dependent positions, child tweens, and duration
 * +0x7C/+0x80 for modes 0..8 and 10..11. Mode 9 deliberately has no setup.
 * Mode 0 may instead start recovered path data +0x2D24. Graphics/animation
 * state changes; returns void.
 */
extern "C" void func_ov025_021fe4cc(void *object, s32 mode, s32 variant)
{
    FIELD(s32, object, 0x9c) = mode;
    FIELD(s32, object, 0xac) = variant;
    FIELD(s32, object, 0xa0) = 0;
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 4;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 4;

    switch (mode) {
    case 0:
        if (FIELD(s32, object, 0xa4)) {
            func_ov025_021fe174(object, 0, 0, 2);
            func_02094cf0(object, data_ov025_02202d24, 1);
            return;
        }
        /* The opposite side intentionally shares mode 2 setup. */
    case 2:
        position_by_side(object, variant, 2, 0xa0000, 0);
        FIELD(s32, object, 0x7c) = (variant == 0 || variant == 3) ? 300 : 150;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 3:
    case 4:
        position_by_side(object, variant, 2, 0xa0000, 0);
        func_020948e4((u8 *)object + 0xc, 2, 0x80000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 5:
        if (FIELD(s32, object, 0xa4)) func_ov025_021fe248(object);
        else func_ov025_021fe2c4(object);
        func_02094bbc(object, FIELD(s32, object, 0xa4) ? 0x120000 : -0x20000,
                      0xa0000, 0);
        func_020948e4((u8 *)object + 0xc, 2,
                      FIELD(s32, object, 0xa4) ? -0x20000 : 0x120000);
        func_020948e4((u8 *)object + 0x1c, 2, 0x40000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 6:
    case 7:
    case 8:
        if (FIELD(s32, object, 0xa4)) func_ov025_021fe248(object);
        else func_ov025_021fe2c4(object);
        func_02094bbc(object, FIELD(s32, object, 0xa4) ? 0x120000 : -0x20000,
                      0x60000, 0);
        func_020948e4((u8 *)object + 0xc, 2, 0x80000);
        func_020948e4((u8 *)object + 0x1c, 2, 0x60000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 1:
        position_by_side(object, 1, 2, 0xa0000, 0);
        func_020948e4((u8 *)object + 0xc, 1, 0x80000);
        func_020948e4((u8 *)object + 0x1c, 3, 0x60000);
        FIELD(s32, object, 0x7c) = 90;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 10:
        position_by_side(object, 13, 2, -0xe0000, 0);
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
