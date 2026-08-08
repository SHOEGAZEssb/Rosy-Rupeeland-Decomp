#include "tingle/types.h"

/* Overlay 26 main scene simulation dispatcher and per-frame transform aggregation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern void func_020773a8(void *);
extern void func_020948e4(void *, s32, s32);
extern void func_02095360(void *);
extern void func_ov026_021fe5c0(void *, s32);
extern void func_ov026_0220046c(void *);
extern s32 func_ov026_02200d08(void *);
extern void func_ov026_02200e0c(void *, s32);
extern void func_ov026_02200ff4(void *);
extern void func_ov026_0220112c(void *);
extern void func_ov026_02201284(void *, s32);
#ifdef __cplusplus
}
#endif

typedef void (*ObjectMethod)(void *);

/* Invokes virtual slot +8, inferred to reset or advance a completed motion object. */
static void invoke_slot8(void *object)
{
    ((ObjectMethod *)FIELD(void *, object, 0))[2](object);
}

/*
 * Runs one complete scene simulation frame. Composite flags at +0x160/+0x12C
 * gate random and periodic spawning, three owned-object lists, and four record
 * pools. Motion object +0x2F0 is reset or randomized on completion. The routine
 * copies +0x2E8's transform into camera vector +0x1C4 and sums +0x2EC/+0x2F0
 * into +0x1D0, clears variant-specific effect flags, then calls the central
 * renderer. Returns void.
 */
extern "C" void func_ov026_022009dc(void *scene)
{
    void *effect = FIELD(void *, scene, 0x160);
    u32 flags = FIELD(u32, effect, 0x12c);
    void *rng = (u8 *)scene + 0x7a4;

    if ((flags & 1) && !(flags & 0x400) &&
        func_020918f4(rng, 4) == 0) {
        s32 offset = func_020918f4(rng, FIELD(s32, effect, 0x13c));
        func_ov026_02200e0c(scene,
            FIELD(s32, effect, 0x20) - (offset << 10));
    }
    if (flags & 2)
        func_ov026_02200ff4(scene);
    if (flags & 0x4000)
        func_ov026_0220112c(scene);
    if (flags & 0x10000)
        func_ov026_02201284(scene, 0x64cd);
    if (flags & 0x20000)
        func_ov026_02201284(scene, 0x3a66);

    func_02095360((u8 *)scene + 0x2f4);
    func_02095360((u8 *)scene + 0x304);
    func_02095360((u8 *)scene + 0x314);
    func_020773a8(FIELD(void *, scene, 0x6c));
    func_020773a8(FIELD(void *, scene, 0x70));
    func_020773a8(FIELD(void *, scene, 0x74));
    func_020773a8(FIELD(void *, scene, 0x78));

    void *motion = FIELD(void *, scene, 0x2f0);
    if (func_ov026_02200d08(motion)) {
        if (flags & 1) {
            s32 spread = FIELD(s32, scene, 0x36c);
            func_020948e4((u8 *)motion + 0xc, 2,
                           func_0209189c(rng, -spread, spread));
            func_020948e4((u8 *)motion + 0x1c, 2,
                           func_0209189c(rng, -spread, spread));
            func_020948e4((u8 *)motion + 0x2c, 2,
                           func_0209189c(rng, -spread, spread));
            func_ov026_021fe5c0(motion, func_0209189c(rng, 1, 3));
        } else {
            func_020948e4((u8 *)motion + 0xc, 2, 0);
            func_020948e4((u8 *)motion + 0x1c, 2, 0);
            func_020948e4((u8 *)motion + 0x2c, 2, 0);
            FIELD(s32, motion, 0x7c) = 8;
            FIELD(s32, motion, 0x80) = 0;
        }
    } else {
        invoke_slot8(motion);
    }

    void *base = FIELD(void *, scene, 0x2e8);
    FIELD(s32, scene, 0x1c4) = FIELD(s32, base, 0x10);
    FIELD(s32, scene, 0x1c8) = FIELD(s32, base, 0x20);
    FIELD(s32, scene, 0x1cc) = FIELD(s32, base, 0x30);
    void *a = FIELD(void *, scene, 0x2ec);
    void *b = FIELD(void *, scene, 0x2f0);
    FIELD(s32, scene, 0x1d0) = FIELD(s32, a, 0x10) + FIELD(s32, b, 0x10);
    FIELD(s32, scene, 0x1d4) = FIELD(s32, a, 0x20) + FIELD(s32, b, 0x20);
    FIELD(s32, scene, 0x1d8) = FIELD(s32, a, 0x30) + FIELD(s32, b, 0x30);

    switch (FIELD(s32, scene, 0x54)) {
    case 1: case 2: case 3: case 4:
        FIELD(u32, effect, 0x12c) &= 0xfffbfeff;
        break;
    case 5: case 6:
        FIELD(u32, effect, 0x12c) &= 0xfffbfef9;
        break;
    case 7: case 8:
        FIELD(u32, effect, 0x12c) &= 0xfffffef1;
        break;
    case 9: case 10:
        FIELD(u32, effect, 0x12c) &= ~0x5e;
        break;
    }
    func_ov026_0220046c(scene);
}
