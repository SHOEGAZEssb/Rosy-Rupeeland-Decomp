#include "tingle/types.h"

/* Overlay 31 short fixed-point sprite trajectory object and no-op callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initializes trajectory `motion` for `sprite` with 24.8 fixed-point position
 * (`x`,`y`) and horizontal delta `velocityX`. Vertical velocity starts at zero
 * and lifetime at 16 frames. Returns void; only trajectory memory changes.
 */
extern "C" void func_ov031_021fd19c(void *motion, void *sprite,
                                      s32 x, s32 y, s32 velocityX)
{
    FIELD(void *, motion, 0) = sprite;
    FIELD(s32, motion, 4) = x;
    FIELD(s32, motion, 8) = y;
    FIELD(s32, motion, 0xc) = velocityX;
    FIELD(s32, motion, 0x10) = 0;
    FIELD(s32, motion, 0x14) = 0x10;
}

/*
 * Releases the optional sprite at trajectory +0 through 0x02073EF8 and returns
 * `motion` without freeing it. Sprite SDK state may change; trajectory ownership
 * remains with the caller.
 */
extern "C" void *func_ov031_021fd1c0(void *motion)
{
    if (FIELD(void *, motion, 0) != 0)
        GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, motion, 0));
    return motion;
}

/*
 * Advances one trajectory frame. A zero lifetime returns 1 immediately.
 * Otherwise it decrements lifetime, adds horizontal/vertical velocity to the
 * 24.8 position, adds gravity 0x20 to vertical velocity, writes integer sprite
 * coordinates to halfwords +0x2C/+0x2E, and returns 0. Trajectory and sprite
 * state change; no direct hardware effects occur.
 */
extern "C" s32 func_ov031_021fd1e0(void *motion)
{
    if (FIELD(s32, motion, 0x14) == 0)
        return 1;
    --FIELD(s32, motion, 0x14);
    FIELD(s32, motion, 4) += FIELD(s32, motion, 0xc);
    FIELD(s32, motion, 8) += FIELD(s32, motion, 0x10);
    FIELD(s32, motion, 0x10) += 0x20;
    void *sprite = FIELD(void *, motion, 0);
    FIELD(u16, sprite, 0x2c) = (u16)(FIELD(s32, motion, 4) / 256);
    FIELD(u16, sprite, 0x2e) = (u16)(FIELD(s32, motion, 8) / 256);
    return 0;
}

/* No-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov031_021fd254(void *object)
{
    (void)object;
}
