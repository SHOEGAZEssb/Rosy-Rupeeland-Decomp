#include "tingle/game_phase_runtime.h"
#include "tingle/actor_motion.h"
#include "tingle/vec_fx32.h"

/* Build the primary actor transform from runtime offsets and current position. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitSum(void *destination, const void *left,
                          const void *right);
#ifdef __cplusplus
}
#endif

/*
 * Build a temporary vector from runtime fields 0x3018/0x301c, add it to the
 * current position of object 0x2fbc, store the resulting value at destination,
 * and destroy the temporary. Returns no value.
 */
void GamePhaseRuntime_BuildPrimaryTransform(void *destination, GamePhaseRuntime *self)
{
    VecFx32Object offset;
    u8 *b = (u8 *)self;
    ActorMotionState_BuildOscillationOffset(&offset,
                          (const ActorMotionState *)(b + 0x3000));
    VecFx32Object_InitSum(destination,
        ActorMotionAreaFollower_GetPosition((ActorMotionAreaFollower *)(b + 0x2fbc)),
        &offset);
    VecFx32Object_Destroy(&offset);
}

/*
 * Construct a three-component vector from signed runtime fields 0x18 and
 * 0x1c, with a zero third component. The destination is mutated; returns no
 * value and tail-calls the recovered vector constructor.
 */
void ActorMotionState_BuildOscillationOffset(void *destination, const void *runtimeFields)
{
    const ActorMotionState *state = (const ActorMotionState *)runtimeFields;
    VecFx32Object_InitComponents((VecFx32Object *)destination,
                                 state->sampledOffsetX,
                                 state->sampledOffsetY, 0);
}
