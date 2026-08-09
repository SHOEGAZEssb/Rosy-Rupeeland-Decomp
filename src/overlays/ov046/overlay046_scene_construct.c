#include "tingle/types.h"

/*
 * Overlay 46 scene construction and state-callback installation. The scene
 * owns a shared font state, a resource owner, a selection panel, and an
 * auxiliary data object. Exact assembly preserves constructor ABI details and
 * the large resource-selection control flow.
 */

/*
 * Install callback `callback` and argument `argument` at scene +0x24/+0x28,
 * then clear state and timer fields +4/+8. The scene changes, nothing is
 * returned, and no SDK or hardware operation occurs. The fourth ABI register
 * is unused but retained by the original compiler's argument-save sequence.
 */
extern "C" void func_ov046_0220c7b0(void *scene, void *callback,
                                     void *argument, void *unused);

/*
 * Construct the overlay scene in caller-owned `scene` storage for selector
 * `selection` and return that storage. The routine initializes the base scene
 * and vtable, owner +0x54, selects resources by scanning eleven game records,
 * loads the selector-dependent owner IDs, acquires font state +0x60, allocates
 * and constructs panel +0x70, creates/configures an auxiliary object +0x74,
 * installs initial positions and sprite state, and sets flag 0x400 at +0x20.
 * Heap, graphics-resource, sprite, and base-scene state change; allocation
 * failure handling follows the recovered SDK calls.
 */
extern "C" void *func_ov046_0220c7d8(void *scene, s32 selection);
