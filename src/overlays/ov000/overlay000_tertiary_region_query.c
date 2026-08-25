#include "tingle/types.h"

/*
 * Overlay 0 tertiary-region query forwarding. This recovered helper exposes a
 * result from the presentation-region object embedded at offset 0x17C.
 */

typedef struct Overlay000TertiaryRegionQueryState {
    u8 field_000[0x17c];
    u8 region_17c[1];
} Overlay000TertiaryRegionQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 SpriteMotionController_Show(void *region);
#ifdef __cplusplus
}
#endif

/*
 * Pass the tertiary embedded region at state+0x17C to SpriteMotionController_Show and return
 * its result unchanged. The precise query is not yet confirmed; this wrapper
 * performs no other state change or direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc5ec(Overlay000TertiaryRegionQueryState *state)
{
    return SpriteMotionController_Show(state->region_17c);
}
