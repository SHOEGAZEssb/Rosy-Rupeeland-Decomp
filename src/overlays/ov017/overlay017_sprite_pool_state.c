#include "tingle/types.h"

/* Overlay 17 sprite-pool scale animation state machine and transition entry points. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *, s32, s32);
extern void TitleInterpolatedValue_Configure(void *, s32, s32, s32, s32);
extern void func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void GraphicsAnimationInstanceManager_Update(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advance the scale interpolator at +0x38, then process state +0x30. State 1
 * waits for completion and starts a transition from current +0x48 to 0x1000
 * over eight frames. State 2 repeatedly chooses a target in 0xE66..0x119A and
 * duration 4..8 after each completion. State 3 returns to idle after completion.
 * Copy current +0x48 to +0x34/+0x38 of all eight sprites and submit the pool's
 * graphics object. Pool, sprite, PRNG, and SDK state change; returns void and
 * performs no direct MMIO.
 */
extern "C" void Overlay017_UpdateSpritePool(void *pool)
{
    s32 i;

    func_02091c7c((u8 *)pool + 0x38, 0);
    switch (FIELD(s32, pool, 0x30)) {
    case 1:
        if (func_02091cf0((u8 *)pool + 0x38)) {
            TitleInterpolatedValue_Configure((u8 *)pool + 0x38, 2,
                          FIELD(s32, pool, 0x48), 0x1000, 8);
            FIELD(s32, pool, 0x30) = 2;
            FIELD(s32, pool, 0x34) = 0;
        }
        break;
    case 2:
        if (func_02091cf0((u8 *)pool + 0x38)) {
            s32 target = func_0209189c((u8 *)pool + 0x54, 0xe66, 0x119a);
            s32 duration = func_0209189c((u8 *)pool + 0x54, 4, 8);
            TitleInterpolatedValue_Configure((u8 *)pool + 0x38, 2,
                          FIELD(s32, pool, 0x48), target, duration);
            FIELD(s32, pool, 0x30) = 2;
            FIELD(s32, pool, 0x34) = 0;
        }
        break;
    case 3:
        if (func_02091cf0((u8 *)pool + 0x38)) {
            FIELD(s32, pool, 0x30) = 0;
            FIELD(s32, pool, 0x34) = 0;
        }
        break;
    }

    for (i = 0; i < 8; i++) {
        void *sprite = FIELD(void *, pool, 0x10 + i * 4);
        FIELD(s32, sprite, 0x34) = FIELD(s32, pool, 0x48);
        FIELD(s32, sprite, 0x38) = FIELD(s32, pool, 0x48);
    }
    GraphicsAnimationInstanceManager_Update(FIELD(void *, pool, 0));
}

/*
 * Start scale interpolation mode 2 from zero to 0x1800 over 16 frames, enter
 * state 1, and clear +0x34. Pool/SDK state changes; returns void and has no
 * direct hardware effects.
 */
extern "C" void Overlay017_ShowSpritePool(void *pool)
{
    TitleInterpolatedValue_Configure((u8 *)pool + 0x38, 2, 0, 0x1800, 0x10);
    FIELD(s32, pool, 0x30) = 1;
    FIELD(s32, pool, 0x34) = 0;
}

/*
 * Start scale interpolation mode 2 from current +0x48 to zero over 16 frames,
 * enter state 3, and clear +0x34. Pool/SDK state changes; returns void and has
 * no direct hardware effects.
 */
extern "C" void Overlay017_HideSpritePool(void *pool)
{
    TitleInterpolatedValue_Configure((u8 *)pool + 0x38, 2, FIELD(s32, pool, 0x48), 0, 0x10);
    FIELD(s32, pool, 0x30) = 3;
    FIELD(s32, pool, 0x34) = 0;
}
