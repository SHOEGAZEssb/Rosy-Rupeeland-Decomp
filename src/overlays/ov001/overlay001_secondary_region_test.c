#include "tingle/types.h"

/* Overlay 1 secondary-region interaction forwarding for offset 0xD4. */

typedef struct Overlay001SecondaryRegionTestState { u8 field_000[0xd4]; u8 region_0d4[1]; } Overlay001SecondaryRegionTestState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02095860(void *region, const void *record, s32 first, s32 count);
#ifdef __cplusplus
}
#endif

/* Forward record with fixed range (4,0) and return the boolean-like result. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc3ec(Overlay001SecondaryRegionTestState *state,
                        const void *record)
{
    return func_02095860(state->region_0d4, record, 4, 0);
}
