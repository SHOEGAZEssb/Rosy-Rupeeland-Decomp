#include "tingle/types.h"

/*
 * Overlay 0 tertiary-region interaction forwarding. This recovered helper
 * tests a record against the presentation region embedded at offset 0x17C.
 */

typedef struct Overlay000TertiaryRegionTestState {
    u8 field_000[0x17c];
    u8 region_17c[1];
} Overlay000TertiaryRegionTestState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02095860(void *region, const void *record, s32 first,
                         s32 count);
#ifdef __cplusplus
}
#endif

/*
 * Forward record to func_02095860 for the tertiary embedded region, fixing its
 * final arguments to 4 and 0, and return the boolean-like result. This differs
 * deliberately from the 0,4 range used by the first two regions. Any SDK-side
 * input or presentation effects occur in the callee.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc5fc(Overlay000TertiaryRegionTestState *state,
                        const void *record)
{
    return func_02095860(state->region_17c, record, 4, 0);
}
