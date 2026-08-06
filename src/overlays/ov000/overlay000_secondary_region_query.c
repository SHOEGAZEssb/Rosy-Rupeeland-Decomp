#include "tingle/types.h"

/*
 * Overlay 0 secondary-region query forwarding. This recovered helper exposes
 * a result from the presentation-region object embedded at offset 0xD0.
 */

typedef struct Overlay000SecondaryRegionQueryState {
    u8 field_000[0xd0];
    u8 region_0d0[1];
} Overlay000SecondaryRegionQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02095928(void *region);
#ifdef __cplusplus
}
#endif

/*
 * Pass the secondary embedded region at state+0xD0 to func_02095928 and return
 * its result unchanged. The exact query meaning is not yet confirmed; this
 * wrapper performs no other state change or direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc5c4(Overlay000SecondaryRegionQueryState *state)
{
    return func_02095928(state->region_0d0);
}
