#include "tingle/game_phase_runtime.h"

/* Apply a staged area request and rebuild the active phase configuration. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200f824(void);
extern void func_0200f52c(void);
extern void func_0200e61c(void *state);
extern void func_020080d0(GamePhaseRuntime *self);
extern void func_02008110(GamePhaseRuntime *self);
#ifdef __cplusplus
}
#endif

/*
 * Promote the staged area at 0x30d0 to 0x30bc, force both DS display-control
 * registers' mode bits 8..12 to 0x1000, tear down the prior phase state, and
 * rebuild it using staged values 0x30d4..0x30dc. Returns no value. Hardware
 * writes and teardown order are observable and must remain ordered.
 */
void func_02007ff4(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;

    *(void **)(b + 0x30bc) = *(void **)(b + 0x30d0);
    *mainDisplay = (*mainDisplay & ~0x1f00) | 0x1000;
    *subDisplay = (*subDisplay & ~0x1f00) | 0x1000;
    func_0200f824();
    func_0200f52c();
    func_0200e61c(b + 0x24);
    func_020080d0(self);
    func_02008110(self);
    func_02006bdc(self, *(void **)(b + 0x30d0),
                   *(s32 *)(b + 0x30d4), *(s32 *)(b + 0x30d8),
                   *(s32 *)(b + 0x30dc));
}
