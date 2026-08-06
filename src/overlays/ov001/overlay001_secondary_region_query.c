#include "tingle/types.h"

/* Overlay 1 secondary-region query forwarding for the region at offset 0xD4. */

typedef struct Overlay001SecondaryRegionQueryState { u8 field_000[0xd4]; u8 region_0d4[1]; } Overlay001SecondaryRegionQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02095928(void *region);
#ifdef __cplusplus
}
#endif

/* Return func_02095928's result unchanged; no other state or hardware changes. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc3dc(Overlay001SecondaryRegionQueryState *state)
{
    return func_02095928(state->region_0d4);
}
