#include "tingle/types.h"

/*
 * Overlay 1 region-query forwarding. This recovered helper exposes a result
 * from the main presentation region embedded at offset 0x28.
 */

typedef struct Overlay001RegionQueryState {
    u8 field_000[0x28];
    u8 region_028[1];
} Overlay001RegionQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 SpriteMotionController_Show(void *region);
#ifdef __cplusplus
}
#endif

/*
 * Pass the embedded region at state+0x28 to SpriteMotionController_Show and return its result
 * unchanged. The precise query is unconfirmed; this wrapper changes no other
 * state and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc3b4(Overlay001RegionQueryState *state)
{
    return SpriteMotionController_Show(state->region_028);
}
