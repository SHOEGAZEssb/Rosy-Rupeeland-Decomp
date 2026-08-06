#include "tingle/types.h"

/*
 * Overlay 1 active metadata lookup. This recovered helper resolves the grid's
 * current active index to its 0x20-byte metadata record.
 */

typedef struct Overlay001ActiveMetadataGetState {
    u8 field_000[0x1ac];
    s32 activeIndex_1ac;
    u8 field_1b0[0x5c];
    void *metadata_20c;
} Overlay001ActiveMetadataGetState;

/*
 * Return metadata_20c + activeIndex_1ac*0x20 without a bounds check. The input
 * and state are unchanged, and no SDK or hardware service is called.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov001_021fc7e4(Overlay001ActiveMetadataGetState *state)
{
    return (u8 *)state->metadata_20c + state->activeIndex_1ac * 0x20;
}
