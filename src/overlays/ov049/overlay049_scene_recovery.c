#include "tingle/types.h"

/*
 * Overlay 49 scene/effect construction. The recovered routine allocates and
 * initializes the derived render object and controller, binds resources, and
 * installs scene callbacks. Exact assembly preserves allocation cleanup paths
 * and SDK ownership transitions.
 */

/*
 * Construct the overlay scene/effect object in caller-owned `scene` storage
 * and return it. It initializes the base scene, allocates/constructs the
 * derived object and controller, initializes five point records, loads and
 * binds graphics resources, configures callbacks and transforms, and installs
 * cleanup state. Heap, resource-manager, animation, and SDK rendering state
 * change. On intermediate failures the recovered path releases already-owned
 * allocations in reverse order; no direct MMIO occurs.
 */
extern "C" void *func_ov049_0220cf94(void *scene, void *argument);
