#include "tingle/game_work.h"
#include "tingle/types.h"

/*
 * Recovered type-seven motion-state initializers. They install callback pairs,
 * reset motion fields, and configure either a stationary state or one of two
 * alternating launch directions.
 */
extern u32 data_020e1780[];
extern u32 data_020e18c0[];
extern u8 data_021056e0;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200b2c0(void *value, s32 x, s32 y, s32 z);
extern void Type7Actor_SetCallbackPair(void *actor, u32 first, u32 second, s32 duration);
extern void func_02072b68(void *object, u32 value);
#ifdef __cplusplus
}
#endif

/* Invoke the actor's virtual +0x54 mode callback. */
static void set_actor_mode(u8 *actor, s32 mode)
{
    typedef void (*ModeCallback)(void *actor, s32 mode);
    ModeCallback callback = *(ModeCallback *)(*(u8 **)actor + 0x54);
    callback(actor, mode);
}

/*
 * Input is a type-seven actor. Null related object +0x210, install callback
 * pair data_020e1780 indefinitely, and select presentation 12. Set +0x14 bits
 * two/four; clear +0x10 bit 0x10000 while setting mask 0x160000; null target
 * +0x280; and clear +0x268 bits 0x14. Enter virtual mode one, clear vector-like
 * fields +0x38/+0x88/+0x98, clear +0x108, and set +0xd0 bit 0x100. Actor,
 * callback, target, mode, flag, and motion state may change. No value is
 * returned and no SDK or hardware effects occur directly.
 */
void Type7Actor_InitializeStationaryMotionState(void *self)
{
    u8 *actor = (u8 *)self;
    *(void **)(actor + 0x210) = 0;
    Type7Actor_SetCallbackPair(actor, data_020e1780[0], data_020e1780[1], -1);
    *(u16 *)(actor + 0xd6) = 12;
    *(u32 *)(actor + 0x14) |= 6;
    *(u32 *)(actor + 0x10) =
        (*(u32 *)(actor + 0x10) & ~0x10000) | 0x160000;
    *(void **)(actor + 0x280) = 0;
    *(u32 *)(actor + 0x268) &= ~0x14;
    set_actor_mode(actor, 1);
    func_0200b2c0(actor + 0x38, 0, 0, 0);
    func_0200b2c0(actor + 0x88, 0, 0, 0);
    func_0200b2c0(actor + 0x98, 0, 0, 0);
    *(u32 *)(actor + 0x108) = 0;
    *(u32 *)(actor + 0xd0) |= 0x100;
}

/*
 * Inputs are a type-seven actor and a launch condition. Null related object
 * +0x210, install callback pair data_020e18c0 for 60 ticks, clear +0x14 bits
 * two/four, set +0x10 bits 0x30000, enter virtual mode one, and clear vectors
 * +0x38/+0x88/+0x98.
 *
 * With a zero condition, select presentation 13. Otherwise set motion word
 * +0x90 to +0x2800 when game-work flag 0x44b is set or -0x2800 when clear;
 * alternate +0x8c between +0x1800 and -0x1800 using byte data_021056e0, then
 * increment that byte. Set actor flag 0x200, select presentation 14, reset
 * object +0x54 through func_02072b68(..., 0), and clear actor byte +0xd4.
 * Actor, callback, global alternation, game-work-derived, mode, presentation,
 * and motion state may change; no direct hardware access occurs.
 */
void Type7Actor_InitializeActiveMotionState(void *self, s32 launch)
{
    u8 *actor = (u8 *)self;
    *(void **)(actor + 0x210) = 0;
    Type7Actor_SetCallbackPair(actor, data_020e18c0[0], data_020e18c0[1], 60);
    *(u32 *)(actor + 0x14) &= ~(2 | 4);
    *(u32 *)(actor + 0x10) |= 0x30000;
    set_actor_mode(actor, 1);
    func_0200b2c0(actor + 0x38, 0, 0, 0);
    func_0200b2c0(actor + 0x88, 0, 0, 0);
    func_0200b2c0(actor + 0x98, 0, 0, 0);
    if (launch != 0) {
        *(s32 *)(actor + 0x90) =
            GameWork_TestFlag(gGameWork, 0x44b) != 0 ? 0x2800 : -0x2800;
        *(s32 *)(actor + 0x8c) =
            (data_021056e0 & 1) != 0 ? -0x1800 : 0x1800;
        ++data_021056e0;
        *(u32 *)(actor + 0x268) |= 0x200;
        *(u16 *)(actor + 0xd6) = 14;
        func_02072b68(*(void **)(actor + 0x54), 0);
        actor[0xd4] = 0;
    } else {
        *(u16 *)(actor + 0xd6) = 13;
    }
}
