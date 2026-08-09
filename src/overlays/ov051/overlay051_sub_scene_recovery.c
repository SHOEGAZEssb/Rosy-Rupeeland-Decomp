#include "tingle/types.h"

/*
 * Overlay 51 sub-engine dream-scene lifecycle. It configures sub BG display,
 * owns graphics resources, and drives a flag-gated scene update. Exact assembly
 * retains direct display-register writes and SDK resource cleanup ordering.
 */

/*
 * Apply the recovered sub-engine display-control bitfield. The argument's exact
 * semantic type is unconfirmed. Sub display MMIO changes; nothing is returned.
 */
extern "C" void func_ov051_0220d84c(u32 control);

/*
 * Construct caller-owned `scene`, initialize its shared base and graphics
 * resource set, configure sub BG banks/mode, load resources, and install the
 * recovered callbacks. Return `scene`. VRAM, display MMIO, and SDK state change.
 */
extern "C" void *func_ov051_0220d878(void *scene, void *argument);

/*
 * Destroy the sub scene without freeing its storage: reset display/BG state,
 * release graphics resources, and run shared teardown. Return `scene`; SDK,
 * VRAM, and display state change.
 */
extern "C" void *func_ov051_0220d99c(void *scene);

/*
 * Perform sub-scene teardown, free its allocation, and return the former
 * address identity. Heap, SDK, VRAM, and display state change; the result must
 * not be dereferenced.
 */
extern "C" void *func_ov051_0220d9dc(void *scene);

/*
 * Advance the sub-scene state machine, testing/clearing the recovered GameWork
 * flag and triggering transition/audio helpers before the shared update. Scene,
 * GameWork, and SDK state change; the recovered status is returned.
 */
extern "C" s32 func_ov051_0220da24(void *scene);

/*
 * Allocate and construct a sub scene, register it with the shared scene system,
 * and return the allocation. Heap and scene-manager/graphics state change; no
 * direct MMIO occurs outside the constructor.
 */
extern "C" void *func_ov051_0220daa4(void *argument);

/*
 * Apply the recovered sub-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220db0c(void *scene);

/*
 * Restore the recovered sub-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220db7c(void *scene);
