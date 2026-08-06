#include "tingle/types.h"

/*
 * Recovered spawn variants for the grid/effect actor. They share the core
 * singleton-slot allocator and specialize the actor's initial velocity or flags.
 */

extern const s16 data_020c9670[];
extern u16 data_02105790[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void *func_0204f62c(const void *position, void *source, s16 timer);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct FxVector3 {
    s32 x;
    s32 y;
    s32 z;
} FxVector3;

static s32 fx_mul(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Inputs are forwarded to func_0204f62c. On success, derive X and Y velocities
 * as 0x1000 minus independent 13-bit halves of one random word, use 0x3000 for
 * Z, copy the vector to actor+0x38, and return one; return zero if spawning
 * fails. Actor/RNG state changes, with no direct hardware effects.
 */
s32 func_0204f7e4(const void *position, void *source, s16 timer)
{
    void *actor = func_0204f62c(position, source, timer);
    FxVector3 velocity;
    if (actor == 0)
        return 0;
    u32 random = genrand_int32();
    func_0200500c(&velocity,
                  0x1000 - (s32)(random & 0x1fff),
                  0x1000 - (s32)((random >> 16) & 0x1fff),
                  0x3000);
    func_020050a4((u8 *)actor + 0x38, &velocity);
    func_02005058(&velocity);
    return 1;
}

/*
 * Forward the core spawn inputs to func_0204f62c and propagate its actor/null
 * result. This tail-call entry has only the core spawner's engine effects.
 */
void *func_0204f848(const void *position, void *source, s16 timer)
{
    return func_0204f62c(position, source, timer);
}

/*
 * Inputs are position, a velocity vector, resource source, and timer. Spawn
 * through func_0204f62c with the latter two inputs reordered, copy the supplied
 * vector to actor+0x38, set actor flag 2, and return one; return zero on failure.
 * Actor-manager state changes and hardware is not accessed directly.
 */
s32 func_0204f854(const void *position, const void *velocity,
                  void *source, s16 timer)
{
    void *actor = func_0204f62c(position, source, timer);
    if (actor == 0)
        return 0;
    func_020050a4((u8 *)actor + 0x38, velocity);
    FIELD(u32, actor, 0x14) |= 2;
    return 1;
}

/*
 * Inputs are forwarded to func_0204f62c. On success, advance the global angle
 * by 0x1999 plus a random 12-bit value, wrapping values above 0x8000, then form
 * X/Y velocities from data_020c9670 scaled by fixed-point 0x1333 and use Z
 * velocity 0x3000. Copy the vector and return one; return zero on spawn failure.
 * Actor, angle, and RNG state change without direct hardware access.
 */
s32 func_0204f894(const void *position, void *source, s16 timer)
{
    void *actor = func_0204f62c(position, source, timer);
    FxVector3 velocity;
    if (actor == 0)
        return 0;

    data_02105790[0] = (u16)(data_02105790[0] +
        (genrand_int32() & 0xfff) + 0x1999);
    if (data_02105790[0] > 0x8000)
        data_02105790[0] -= 0x8000;
    s32 index = (s16)data_02105790[0] >> 4;
    func_0200500c(&velocity,
                  fx_mul(data_020c9670[index * 2 + 1], 0x1333),
                  fx_mul(data_020c9670[index * 2], 0x1333),
                  0x3000);
    func_020050a4((u8 *)actor + 0x38, &velocity);
    func_02005058(&velocity);
    return 1;
}

