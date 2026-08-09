#include "tingle/types.h"

/*
 * Overlay 51 shared dream-scene geometry and lifecycle support. The recovered
 * base owns two 192-element offset-derived record arrays and common dimensions.
 * Exact assembly preserves loop shape and fixed-point SDK call ordering.
 */

/*
 * Initialize caller-owned `scene`, construct both embedded record arrays, set
 * the recovered vtable, and store the 0x80-by-0xa0 dimensions. Return `scene`.
 * Embedded SDK/object state changes; no allocation or direct MMIO occurs.
 */
extern "C" void *func_ov051_0220d600(void *scene);

/*
 * Advance the shared scene records using the recovered offset-based selection
 * and update logic, then publish derived values through the SDK helpers. Scene
 * and SDK state change; the return value is not used and no direct MMIO occurs.
 */
extern "C" void func_ov051_0220d688(void *scene);

/*
 * Convert the offset-derived input coordinates into the destination transform
 * record and apply the fixed-point helper. Destination/SDK transform state
 * changes; nothing is returned and no direct hardware access occurs.
 */
extern "C" void func_ov051_0220d774(void *destination, const void *source);

/*
 * Compute and store the recovered bounds/coordinates from `source` into
 * `destination`. The arithmetic and field meanings remain inferred from their
 * offsets. Destination memory changes; nothing is returned and no SDK/MMIO is used.
 */
extern "C" void func_ov051_0220d7bc(void *destination, const void *source);
