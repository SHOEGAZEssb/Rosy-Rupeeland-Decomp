#include "tingle/game_work.h"
#include "tingle/types.h"

/*
 * Recovered type-seven motion-state update. It chooses between reset and
 * active initialization from an actor-owned count, game-work state, and an
 * incoming condition, then maintains a countdown-driven callback.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SetPosition(void *actor);
extern void Type7Actor_UpdateMotionTowardTransform(void *actor, const void *transform);
extern void func_02048bcc(void *actor);
extern void func_0204a014(void *actor);
extern void func_0204a0d8(void *actor, s32 condition);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a type-seven actor, one unused recovered argument, and a
 * condition. First run Actor_SetPosition. If signed/word count +0x1fc is not
 * positive, clear actor +0x10 mask 0x1f0000 and reset through func_0204a014.
 * Otherwise force the condition to one while game-work flag 0x44b is set,
 * initialize active state through func_0204a0d8, and update motion from the
 * actor's current transform +0x18.
 *
 * Finally, when signed countdown +0x258 is positive, decrement it and call
 * func_02048bcc exactly when it reaches zero. Actor, motion, callback, and
 * game-work-derived state may change. GameWork_TestFlag reads the global game
 * state; there is no direct hardware access and no return value.
 */
void func_02049f78(void *self, s32 unused, s32 condition)
{
    u8 *actor = (u8 *)self;
    (void)unused;

    Actor_SetPosition(actor);
    if (*(s32 *)(actor + 0x1fc) <= 0) {
        *(u32 *)(actor + 0x10) &= ~0x1f0000;
        func_0204a014(actor);
        return;
    }
    if (GameWork_TestFlag(gGameWork, 0x44b) != 0)
        condition = 1;
    func_0204a0d8(actor, condition);
    Type7Actor_UpdateMotionTowardTransform(actor, actor + 0x18);
    if (*(s16 *)(actor + 0x258) > 0) {
        --*(s16 *)(actor + 0x258);
        if (*(s16 *)(actor + 0x258) == 0)
            func_02048bcc(actor);
    }
}
