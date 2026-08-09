#include "tingle/types.h"

/*
 * Overlay 50 effect-manager lifecycle and factory. The recovered manager owns
 * an effect allocation plus an embedded render record and delegates creation
 * by a mode discriminator. Exact assembly preserves cleanup paths.
 */

/*
 * Destroy and free the optional effect pointer, destroy the manager's embedded
 * render record, run the base-effect teardown, and return the unchanged manager
 * pointer. Heap, sprite, and SDK resource state change; manager storage remains.
 */
extern "C" void *func_ov050_0220d8f4(void *manager);

/*
 * Perform the recovered manager/base teardown, free manager storage, and return
 * its former address identity. Heap and owned SDK state change; the result is
 * invalid to dereference and no direct MMIO occurs.
 */
extern "C" void *func_ov050_0220d95c(void *manager);

/*
 * Allocate and construct the mode-selected effect/manager object, initialize
 * its embedded render state and paired sprites, and return the allocation.
 * On failure, unwind partially initialized resources in reverse order. Heap,
 * RNG, and SDK sprite/resource state change; no direct hardware access occurs.
 */
extern "C" void *func_ov050_0220d9c4(void *fontState, void *resourceOwner,
                                      s32 mode);
