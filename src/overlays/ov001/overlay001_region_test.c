#include "tingle/types.h"

/* Overlay 1 main-region interaction forwarding for the region at offset 0x28. */

typedef struct Overlay001RegionTestState { u8 field_000[0x28]; u8 region_028[1]; } Overlay001RegionTestState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02095860(void *region, const void *record, s32 first, s32 count);
#ifdef __cplusplus
}
#endif

/* Forward record with fixed range (0,4) and return the boolean-like result. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc3c4(Overlay001RegionTestState *state, const void *record)
{
    return func_02095860(state->region_028, record, 0, 4);
}
