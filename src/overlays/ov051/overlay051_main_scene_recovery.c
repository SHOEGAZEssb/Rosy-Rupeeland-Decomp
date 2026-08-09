#include "tingle/types.h"

/*
 * Overlay 51 main-engine dream-scene lifecycle. It configures main BG display,
 * owns graphics resources, and exposes scene callbacks parallel to the sub-engine
 * implementation. Exact assembly preserves MMIO and SDK resource ordering.
 */

/*
 * Apply the recovered main-engine display-control bitfield. The argument's exact
 * semantic type is unconfirmed. Main display MMIO changes; nothing is returned.
 */
extern "C" void func_ov051_0220dbc4(u32 control);

/*
 * Construct caller-owned `scene`, initialize its shared base and graphics set,
 * configure main BG banks/mode, load resources, and install callbacks. Return
 * `scene`. VRAM, display MMIO, and SDK graphics state change.
 */
extern "C" void *func_ov051_0220dbf0(void *scene, void *argument);

/*
 * Destroy the main scene without freeing its storage: reset display/BG state,
 * release graphics resources, and run shared teardown. Return `scene`; SDK,
 * VRAM, and display state change.
 */
extern "C" void *func_ov051_0220dd10(void *scene);

/*
 * Perform main-scene teardown, free its allocation, and return the former
 * address identity. Heap, SDK, VRAM, and display state change; the result must
 * not be dereferenced.
 */
extern "C" void *func_ov051_0220dd44(void *scene);

/*
 * Allocate and construct a main scene, register it with the shared scene system,
 * and return the allocation. Heap and scene-manager/graphics state change; no
 * direct MMIO occurs outside the constructor.
 */
extern "C" void *func_ov051_0220dd90(void *argument);

/*
 * Apply the recovered main-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220ddf8(void *scene);

/*
 * Restore the recovered main-BG offset/transform values through func_020afd28.
 * BG/SDK state changes; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220de68(void *scene);
