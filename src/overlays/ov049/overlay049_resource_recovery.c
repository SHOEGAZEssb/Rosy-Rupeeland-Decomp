#include "tingle/types.h"

/*
 * Overlay 49 render-resource lifecycle. The recovered routines construct,
 * apply, and release a group of model/animation handles embedded in the
 * derived object. Exact assembly preserves the SDK's required ownership order.
 */

/*
 * Initialize sixteen offset-derived resource/animation records, two embedded
 * render records, and the sprite/model state used by the object, then clear
 * their runtime counters and flags. Resource manager and SDK graphics state
 * change, no value is returned, and no direct MMIO is accessed. The repeated
 * record roles are inferred from their common VecFx32Object_InitComponents initialization.
 */
extern "C" void func_ov049_0220bbdc(void *object);

/*
 * Advance and apply the object's active render resource. The function updates
 * an embedded animation through VecFx32Object_Add/func_0209f09c and dispatches to
 * overlay 39 rendering helpers using current object state. It returns a
 * Boolean/status result from the recovered control flow; animation and SDK 3D
 * state change, with no direct MMIO.
 */
extern "C" s32 func_ov049_0220be28(void *object);

/*
 * Destroy four resource arrays/records through func_0209a2ac in reverse
 * ownership order. Object-owned SDK graphics resources change, storage is not
 * freed, and the routine returns the unchanged object/status prescribed by
 * the original destructor path.
 */
extern "C" void *func_ov049_0220c0b8(void *object);
