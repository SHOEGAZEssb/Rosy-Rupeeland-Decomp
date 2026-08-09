#include "tingle/types.h"

/*
 * Overlay 50 field-effect scene lifecycle. The recovered scene owns a resource
 * owner, two font states, four child effects, a manager, and transition/task
 * state. Exact assembly retains resource cleanup and the large update switch.
 */

/*
 * Construct caller-owned `scene`: initialize the base scene and owner, create
 * render records/font states, allocate and construct the manager/children,
 * initialize counters/callbacks, and clear the relevant GameWork flag. Return
 * `scene`. Heap, GameWork, sprite/font, resource-owner, and SDK state change.
 */
extern "C" void *func_ov050_0220db84(void *scene, void *argument);

/*
 * Destroy the scene without freeing its own storage: release manager and child
 * effects, font states, task/transition state, render record, owner, and base
 * scene in reverse order. Return the unchanged scene pointer. Heap and SDK
 * resources change; no direct MMIO occurs.
 */
extern "C" void *func_ov050_0220dcb8(void *scene);

/*
 * Perform the same recovered scene teardown, then free scene storage and return
 * its former address identity. Heap/SDK state changes and the result is not
 * safe to dereference.
 */
extern "C" void *func_ov050_0220dd50(void *scene);

/*
 * Advance the scene state machine and return its update status. It tests/sets
 * GameWork flags, broadcasts child fields, checks readiness, creates/destroys
 * effect managers, updates alpha/font states and transitions, and synchronizes
 * rendering. Scene, children, heap, GameWork, RNG, and SDK state can change;
 * no direct MMIO is performed. State meanings remain offset-derived.
 */
extern "C" s32 func_ov050_0220ddf0(void *scene);

/*
 * Initialize an offset-derived vector, derive a transform through
 * func_020adff0, and store/apply it to scene-owned state. Scene and SDK 3D
 * transform state change; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov050_0220e168(void *scene, void *source);

/*
 * Allocate scene storage, construct it through func_ov050_0220db84, register
 * it with the shared scene/task system, and return the allocation. Heap and
 * scene-manager state change; failure follows the recovered allocation path.
 */
extern "C" void *func_ov050_0220e1a0(void *argument);
