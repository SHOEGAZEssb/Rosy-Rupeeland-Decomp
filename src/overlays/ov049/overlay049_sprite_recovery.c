#include "tingle/types.h"

/*
 * Overlay 49 sprite placement and animation. These recovered routines map
 * object coordinates into sprite positions, select frames, and synchronize
 * visibility/transform state with the shared renderer. Exact assembly retains
 * fixed-point rounding and table-dependent control flow.
 */

/*
 * Convert the object's signed 20.12 position fields to integer sprite-space,
 * add caller-provided offsets, and write the result into sprite record +0xAC.
 * A renderer helper is then called to apply the position. Object/sprite state
 * changes, nothing is returned, and hardware effects occur only through SDK
 * sprite submission. The coordinate field names remain offset-derived.
 */
extern "C" void func_ov049_0220bac0(void *object, s32 xOffset, s32 yOffset);

/*
 * Select and apply a sprite frame/variant derived from object state and the
 * supplied index. The sprite referenced by +0xAC is updated through
 * func_02072b68; the object is otherwise unchanged, nothing is returned, and
 * OAM-visible state changes through the SDK helper.
 */
extern "C" void func_ov049_0220bb84(void *object, s32 index);

/*
 * Advance one frame of the object's visible sprite state. It refreshes the
 * resource/animation state through func_ov049_0220be28, chooses frames for up
 * to three sprite records, updates their positions and visibility, advances
 * an embedded timer/animation record, and applies the primary sprite. Object,
 * animation, and renderer state change; the return value is the recovered
 * status from the final update path. No direct MMIO occurs.
 */
extern "C" s32 func_ov049_0220bee8(void *object);
