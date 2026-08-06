#include "tingle/types.h"

/*
 * Overlay 0 metadata lookup. This recovered helper performs a bounds-checked
 * lookup in the grid's array of 0x20-byte metadata records.
 */

typedef struct Overlay000MetadataGetState {
    u8 field_000[0x250];
    void *metadata_250;
    s32 cellCount_254;
} Overlay000MetadataGetState;

/*
 * Return metadata_250 + index*0x20 when 0 <= index < cellCount_254; otherwise
 * return null. Inputs and state are unchanged, and no SDK or hardware service
 * is called.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov000_021fcab4(Overlay000MetadataGetState *state, s32 index)
{
    if (index < 0) {
        return 0;
    }
    if (index >= state->cellCount_254) {
        return 0;
    }
    return (u8 *)state->metadata_250 + index * 0x20;
}
