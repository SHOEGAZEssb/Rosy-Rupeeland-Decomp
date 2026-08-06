#include "tingle/types.h"

/*
 * Recovered extended type-two actor countdown update. It advances virtual
 * state, subtracts a caller delta, and emits the descriptor-indexed sound.
 */
extern u16 data_020e6d3c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020349b8(void *actor, u32 sound, s32 extra);
#ifdef __cplusplus
}
#endif

/*
 * If actor +0x260 bit one is clear, or virtual +0xa8 reports active, return
 * without changing the countdown. Otherwise invoke virtual +0x10c and subtract
 * delta from word +0x1fc. A negative result clamps to zero and, if virtual
 * +0xa8 still reports inactive, invokes virtual +0x104. A nonnegative result
 * plays the data_020e6d3c sound indexed by halfword +0x4e unless it is 0xffff.
 * Store the resulting countdown. The routine has no meaningful return value;
 * actor, virtual, and sound state may change, with func_020349b8 crossing the
 * sound boundary.
 */
void func_02042514(void *self, s32 delta)
{
    u8 *actor = (u8 *)self;
    u8 *vtable = *(u8 **)actor;
    s32 remaining;

    if ((*(u32 *)(actor + 0x260) & 2) == 0 ||
        (*(s32 (**)(void *))(vtable + 0xa8))(actor) != 0)
        return;
    (*(void (**)(void *))(vtable + 0x10c))(actor);
    remaining = *(s32 *)(actor + 0x1fc) - delta;
    if (remaining < 0) {
        remaining = 0;
        if ((*(s32 (**)(void *))(vtable + 0xa8))(actor) == 0)
            (*(void (**)(void *))(vtable + 0x104))(actor);
    } else {
        u16 sound = data_020e6d3c[*(u16 *)(actor + 0x4e)];
        if (sound != 0xffff)
            func_020349b8(actor, sound, 0);
    }
    *(s32 *)(actor + 0x1fc) = remaining;
}
