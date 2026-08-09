#include "tingle/types.h"

/*
 * Overlay 49 particle/effect behavior. These recovered routines seed, burst,
 * transform, render, randomize, and step point-based effect records. Exact
 * assembly retains fixed-point arithmetic, random modulo sequences, and SDK
 * call ordering.
 */

/*
 * Initialize an effect record from its owner and random source, choosing
 * offset-derived direction/magnitude values with genrand_int32 and clearing
 * its counters. Return nothing; effect and global RNG state change, with no
 * direct hardware or SDK rendering effect.
 */
extern "C" void func_ov049_0220c254(void *effect);

/*
 * Start or advance a randomized burst: choose random parameters, update point
 * velocities/timers, and play one of the confirmed sound effects when the
 * recovered gates pass. Effect, RNG, and audio state change; the routine
 * returns its control-flow status and performs no direct MMIO.
 */
extern "C" s32 func_ov049_0220c2dc(void *effect);

/*
 * Build and apply an offset-derived transform for `effect`, including the
 * signed fixed-point values consumed by func_020adc40. Effect/SDK transform
 * state changes, nothing is returned, and no direct hardware register is used.
 */
extern "C" void func_ov049_0220c3d8(void *effect);

/*
 * Submit the effect's two recovered render passes through func_020adc90 using
 * current point, color, and transform fields. SDK 3D state changes; effect
 * storage is read but not structurally modified, no value is returned, and no
 * direct MMIO occurs.
 */
extern "C" void func_ov049_0220c48c(void *effect);

/*
 * Randomize an effect record's offset-derived direction and timer fields using
 * genrand_int32. Effect and RNG state change; nothing is returned and no SDK
 * rendering or hardware effect occurs directly.
 */
extern "C" void func_ov049_0220c67c(void *effect);

/*
 * Step a particle/effect record: copy its point state, update random motion and
 * counters, perform the recovered fixed-point calculation, and query
 * func_020bf1f8 for the terminal/visibility condition. Return the resulting
 * status. Effect and RNG state change; SDK effects are limited to that query.
 */
extern "C" s32 func_ov049_0220c6cc(void *effect);
