#include "tingle/types.h"

/*
 * Overlay 52 Pinkle message-menu scene. It owns message/UI allocations,
 * graphics resources, transition state, and randomized menu decorations.
 * Exact assembly preserves indirect callbacks, cleanup, and resource ordering.
 */

/*
 * Construct caller-owned `scene` for the requested offset-derived mode: install
 * its vtable, allocate/initialize message and UI objects, configure text/window
 * state, and register callbacks. Return `scene`. Heap, text, sound/UI, and SDK
 * state change; field meanings beyond confirmed offsets remain inferred.
 */
extern "C" void *func_ov052_0220d618(void *scene, u32 mode, u32 variant);

/*
 * Destroy the scene without freeing its own storage, invoking optional recovered
 * callbacks and releasing message/UI resources in order. Return `scene`; heap,
 * UI, graphics, and SDK state change and no direct MMIO occurs.
 */
extern "C" void *func_ov052_0220d884(void *scene);

/*
 * Perform full scene teardown and free the scene allocation, returning its
 * former address identity. Heap/UI/graphics state changes; the result must not
 * be dereferenced.
 */
extern "C" void *func_ov052_0220d968(void *scene);

/*
 * Advance the message-menu state machine: process input/transition state,
 * update randomized decorations and selection resources, and publish the
 * recovered result. Scene, input, graphics, audio, and SDK state can change.
 */
extern "C" s32 func_ov052_0220da54(void *scene);

/*
 * Load and configure the scene's sub-engine BG/resource sets, coordinate scene
 * manager flags, initialize BG transforms, then destroy temporary resources.
 * Scene-manager, VRAM, BG, and SDK state change; nothing is returned.
 */
extern "C" void func_ov052_0220ddb4(void *scene);

/*
 * Randomize and apply one offset-derived menu-decoration record using the RNG,
 * animation, and object helpers. Object/RNG/SDK state changes; the recovered
 * status is returned and no direct MMIO occurs.
 */
extern "C" s32 func_ov052_0220df9c(void *scene, void *record);

/*
 * Update the offset-derived menu animation state from `input`, starting,
 * polling, or finalizing UI operations according to its state fields. Scene/UI
 * state changes; nothing is returned and field semantics remain inferred.
 */
extern "C" void func_ov052_0220e064(void *scene, void *input, u32 argument);

/*
 * Resolve a shared resource through func_02079408 and forward it with `scene`
 * and `argument` to func_ov052_0220e064. Scene/UI state changes; nothing is returned.
 */
extern "C" void func_ov052_0220e14c(void *scene, void *unused, u32 argument);

/*
 * Set the recovered scene state to four, play the confirmation sound, and start
 * the corresponding transition. Scene, sound, and transition state change;
 * nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov052_0220e178(void *scene);
