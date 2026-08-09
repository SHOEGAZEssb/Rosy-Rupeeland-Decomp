#include "tingle/types.h"

/*
 * Overlay 49 effect-controller lifecycle. The controller owns two arrays of
 * small polymorphic points plus effect counters, random state, and a pointer
 * to the scene/runtime owner. Exact assembly preserves array-constructor ABI
 * details and the large update state machine.
 */

/*
 * Construct caller-owned `controller`, build its two point arrays through
 * __construct_array, store the supplied owner/state arguments, initialize
 * counters and flags, and copy a default point through func_ov049_0220c23c.
 * Return `controller`. Array elements and controller state change; no direct
 * hardware access occurs and storage ownership remains with the caller.
 */
extern "C" void *func_ov049_0220c124(void *controller, void *owner,
                                      s32 mode);

/*
 * Advance the controller's effect simulation and return its recovered status.
 * The routine updates both point arrays, dispatches particle initialization,
 * randomization, stepping, and rendering by mode/timer, applies repeated
 * fixed-point vector operations, emits SDK effects, and transitions terminal
 * state when its counters expire. Controller, owner, random, audio, and SDK
 * rendering state may change; no direct MMIO is used. State labels remain
 * offset-derived because their semantic names are not confirmed.
 */
extern "C" s32 func_ov049_0220c8a0(void *controller);
