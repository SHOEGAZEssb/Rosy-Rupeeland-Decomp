#include "tingle/types.h"

/*
 * Overlay 0 region interaction forwarding. This recovered helper tests an
 * input or selection record against the presentation region at offset 0x24.
 */

typedef struct Overlay000RegionTestState {
    u8 field_000[0x24];
    u8 region_024[1];
} Overlay000RegionTestState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 SpriteMotionController_BeginHitResponse(void *region, const void *record, s32 first,
                         s32 count);
#ifdef __cplusplus
}
#endif

/*
 * Forward record to SpriteMotionController_BeginHitResponse for the embedded region, fixing the final
 * range arguments to 0 and 4, and return its result. Cross-overlay callers use
 * the result as a boolean. Any input/presentation effects occur in the callee;
 * no direct hardware access is present here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc5ac(Overlay000RegionTestState *state, const void *record)
{
    return SpriteMotionController_BeginHitResponse(state->region_024, record, 0, 4);
}
