#include "tingle/types.h"

/*
 * Overlay 0 secondary-region interaction forwarding. This recovered helper
 * tests a record against the presentation region embedded at offset 0xD0.
 */

typedef struct Overlay000SecondaryRegionTestState {
    u8 field_000[0xd0];
    u8 region_0d0[1];
} Overlay000SecondaryRegionTestState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 SpriteMotionController_BeginHitResponse(void *region, const void *record, s32 first,
                         s32 count);
#ifdef __cplusplus
}
#endif

/*
 * Forward record to SpriteMotionController_BeginHitResponse for the secondary embedded region, fixing
 * its final range arguments to 0 and 4, and return the boolean-like result.
 * Any input/presentation effects occur in the callee; hardware is not accessed
 * directly here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc5d4(Overlay000SecondaryRegionTestState *state,
                        const void *record)
{
    return SpriteMotionController_BeginHitResponse(state->region_0d0, record, 0, 4);
}
