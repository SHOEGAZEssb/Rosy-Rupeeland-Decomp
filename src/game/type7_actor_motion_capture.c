#include "tingle/types.h"

/*
 * Recovered type-seven motion-capture initializer. It preserves the current
 * directional words, clears active vectors, and detaches the related object.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200b2c0(void *value, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Set collision/state bit +0xd0/0x80, enter the
 * actor's virtual mode zero, copy motion words +0x3c/+0x40 to +0x8c/+0x90,
 * clear the vector-like values at +0x38 and +0x98, and null related object
 * +0x210. Actor mode, flags, motion snapshots, vectors, and relationship state
 * may change. No value is returned and there are no direct SDK or hardware
 * effects.
 */
void Type7Actor_InitializeMotionCapture(void *self)
{
    u8 *actor = (u8 *)self;
    typedef void (*ModeCallback)(void *actor, s32 mode);
    ModeCallback callback;

    *(u32 *)(actor + 0xd0) |= 0x80;
    callback = *(ModeCallback *)(*(u8 **)actor + 0x54);
    callback(actor, 0);
    *(s32 *)(actor + 0x8c) = *(s32 *)(actor + 0x3c);
    *(s32 *)(actor + 0x90) = *(s32 *)(actor + 0x40);
    func_0200b2c0(actor + 0x38, 0, 0, 0);
    func_0200b2c0(actor + 0x98, 0, 0, 0);
    *(void **)(actor + 0x210) = 0;
}
