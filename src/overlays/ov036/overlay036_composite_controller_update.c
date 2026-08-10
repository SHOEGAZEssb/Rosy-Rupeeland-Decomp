#include "tingle/types.h"

/* Overlay 36 composite controller per-frame servicing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095360(void *list);
extern void func_ov036_02203228(void *controller);
extern void func_ov036_021fdcec(void *auxiliary);
extern void GraphicsAnimationInstanceManager_Update(void *manager);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void func_02091dac(void *timer);
extern void func_02091b98(void *timer, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Services list +0x100, and when render object +0x154 flag +0x98 bit 2 is set,
 * invokes the confirmed transition helper func_ov036_02203228. It updates
 * auxiliary +0x1A0, list +0x110, and manager +0xF4. When timer +0x120
 * completes in mode two, timer +0x13C advances and +0x120 restarts at 30.
 * Returns nothing; lists, auxiliary, manager, timers, and transition-owned
 * state may change.
 */
extern "C" void func_ov036_02202fb8(void *controller)
{
    func_02095360((u8 *)controller + 0x100);
    if ((FIELD(u16, FIELD(void *, controller, 0x154), 0x98) & 4) != 0)
        func_ov036_02203228(controller);
    func_ov036_021fdcec(FIELD(void *, controller, 0x1a0));
    func_02095360((u8 *)controller + 0x110);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, controller, 0xf4));
    if (func_02091c7c((u8 *)controller + 0x120, 2) != 0) {
        func_02091dac((u8 *)controller + 0x13c);
        func_02091b98((u8 *)controller + 0x120, 0x1e);
    }
}
