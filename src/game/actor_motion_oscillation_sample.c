#include "tingle/actor_motion.h"

/* Table sampling and target assignment used by actor motion. */

extern const s16 data_020c9670[];

static s32 actor_motion_sample_multiply(s16 value, s32 scale)
{
    return (s32)(((s64)value * scale + 0x800) >> 12);
}

/*
 * Multiply the state's phase increment by time, retain the low 16 phase bits,
 * and sample one of the shared interleaved fixed-point direction-table lanes.
 * Mode zero uses the odd lane and mode one the even lane, returning midpoint
 * plus the scaled half-range. Other modes reproduce the retail fall-through
 * value (the state address cast to s32). No state or hardware changes.
 */
s32 func_020096f0(const ActorMotionTriple *state, s32 time, s32 tableMode)
{
    u32 phase = (u16)(state->z * time);
    u32 index = phase >> 4;
    s16 sample;

    if (tableMode == 0)
        sample = data_020c9670[index * 2 + 1];
    else if (tableMode == 1)
        sample = data_020c9670[index * 2];
    else
        return (s32)state;

    return state->y + actor_motion_sample_multiply(sample, state->x);
}

/* Copy a supplied vector payload into the motion target and return that target. */
VecFx32Object *func_02009780(ActorMotion *self,
                             const VecFx32Object *target)
{
    return func_020050a4(&self->target, target);
}
