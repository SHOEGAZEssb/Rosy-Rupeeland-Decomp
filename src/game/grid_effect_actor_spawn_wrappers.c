#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Recovered spawn variants for the grid/effect actor. They share the core
 * singleton-slot allocator and specialize the actor's initial velocity or flags.
 */

extern const s16 data_020c9670[];
extern u16 gGridEffectActorRuntimeState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GridEffectActor_SpawnCore(const void *position, void *source, s16 timer);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

static s32 fx_mul(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Inputs are forwarded to GridEffectActor_SpawnCore. On success, derive X and Y velocities
 * as 0x1000 minus independent 13-bit halves of one random word, use 0x3000 for
 * Z, copy the vector to actor+0x38, and return one; return zero if spawning
 * fails. Actor/RNG state changes, with no direct hardware effects.
 */
s32 GridEffectActor_SpawnWithRandomVelocity(const void *position, void *source, s16 timer)
{
    void *actor = GridEffectActor_SpawnCore(position, source, timer);
    VecFx32Object velocity;
    if (actor == 0)
        return 0;
    u32 random = genrand_int32();
    VecFx32Object_InitComponents(&velocity,
                  0x1000 - (s32)(random & 0x1fff),
                  0x1000 - (s32)((random >> 16) & 0x1fff),
                  0x3000);
    VecFx32Object_Assign((VecFx32Object *)((u8 *)actor + 0x38), &velocity);
    VecFx32Object_Destroy(&velocity);
    return 1;
}

/*
 * Forward the core spawn inputs to GridEffectActor_SpawnCore and propagate its actor/null
 * result. This tail-call entry has only the core spawner's engine effects.
 */
void *GridEffectActor_Spawn(const void *position, void *source, s16 timer)
{
    return GridEffectActor_SpawnCore(position, source, timer);
}

/*
 * Inputs are position, a velocity vector, resource source, and timer. Spawn
 * through GridEffectActor_SpawnCore with the latter two inputs reordered, copy the supplied
 * vector to actor+0x38, set actor flag 2, and return one; return zero on failure.
 * Actor-manager state changes and hardware is not accessed directly.
 */
s32 GridEffectActor_SpawnWithVelocity(const void *position, const void *velocity,
                  void *source, s16 timer)
{
    void *actor = GridEffectActor_SpawnCore(position, source, timer);
    if (actor == 0)
        return 0;
    VecFx32Object_Assign((VecFx32Object *)((u8 *)actor + 0x38),
                         (const VecFx32Object *)velocity);
    FIELD(u32, actor, 0x14) |= 2;
    return 1;
}

/*
 * Inputs are forwarded to GridEffectActor_SpawnCore. On success, advance the global angle
 * by 0x1999 plus a random 12-bit value, wrapping values above 0x8000, then form
 * X/Y velocities from data_020c9670 scaled by fixed-point 0x1333 and use Z
 * velocity 0x3000. Copy the vector and return one; return zero on spawn failure.
 * Actor, angle, and RNG state change without direct hardware access.
 */
s32 GridEffectActor_SpawnWithRadialVelocity(const void *position, void *source, s16 timer)
{
    void *actor = GridEffectActor_SpawnCore(position, source, timer);
    VecFx32Object velocity;
    if (actor == 0)
        return 0;
    gGridEffectActorRuntimeState[0] = (u16)(gGridEffectActorRuntimeState[0] +
        (genrand_int32() & 0xfff) + 0x1999);
    if (gGridEffectActorRuntimeState[0] > 0x8000)
        gGridEffectActorRuntimeState[0] -= 0x8000;
    s32 index = gGridEffectActorRuntimeState[0] >> 4;
    VecFx32Object_InitComponents(&velocity,
                  fx_mul(data_020c9670[index * 2 + 1], 0x1333),
                  fx_mul(data_020c9670[index * 2], 0x1333),
                  0x3000);
    VecFx32Object_Assign((VecFx32Object *)((u8 *)actor + 0x38), &velocity);
    VecFx32Object_Destroy(&velocity);
    return 1;
}
