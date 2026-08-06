#include "tingle/types.h"

/*
 * Overlay 0 active-metadata lookup. This recovered helper returns the metadata
 * record identified by the grid state's current active index.
 */

typedef struct Overlay000ActiveMetadataState {
    u8 field_000[0x250];
    void *metadata_250;
    u8 field_254[0x08];
    s32 activeIndex_25c;
} Overlay000ActiveMetadataState;

/*
 * Return metadata_250 + activeIndex_25c*0x20 without performing a bounds check.
 * Inputs and state are unchanged, and no SDK or hardware service is called.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov000_021fcad8(Overlay000ActiveMetadataState *state)
{
    return (u8 *)state->metadata_250 + state->activeIndex_25c * 0x20;
}
