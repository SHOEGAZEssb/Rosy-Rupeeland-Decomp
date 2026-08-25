#include "tingle/types.h"

/*
 * Overlay 0 region-query forwarding. This recovered helper exposes a result
 * from the presentation-region object embedded at offset 0x24.
 */

typedef struct Overlay000RegionQueryState {
    u8 field_000[0x24];
    u8 region_024[1];
} Overlay000RegionQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 SpriteMotionController_Show(void *region);
#ifdef __cplusplus
}
#endif

/*
 * Pass the embedded region at state+0x24 to SpriteMotionController_Show and return its result
 * unchanged. The exact query meaning is not yet confirmed; this wrapper makes
 * no other state change and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc59c(Overlay000RegionQueryState *state)
{
    return SpriteMotionController_Show(state->region_024);
}
