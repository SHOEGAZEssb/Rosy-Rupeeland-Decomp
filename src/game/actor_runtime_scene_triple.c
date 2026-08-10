#include "tingle/actor_runtime_scene.h"

/* Initialize a three-word state block embedded after an optional owner prefix. */

/*
 * If object is nonnull, advance past its leading four-byte prefix; then store
 * first/second/third consecutively and return the destination. A null object
 * deliberately leaves address zero as the destination, matching the original
 * unchecked contract. No SDK or hardware state is touched.
 */
u32 *ActorRuntimeTriple_Assign(void *object, u32 first, u32 second, u32 third)
{
    u32 *destination = (u32 *)object;

    if (destination != 0)
        destination = (u32 *)((u8 *)destination + 4);
    destination[0] = first;
    destination[1] = second;
    destination[2] = third;
    return destination;
}
