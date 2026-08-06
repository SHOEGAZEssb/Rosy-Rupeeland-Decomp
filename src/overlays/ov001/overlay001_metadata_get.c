#include "tingle/types.h"

/*
 * Overlay 1 metadata lookup. This recovered helper performs a bounds-checked
 * lookup in the grid's array of 0x20-byte metadata records.
 */

typedef struct Overlay001MetadataGetState {
    u8 field_000[0x1a4];
    s32 cellCount_1a4;
    u8 field_1a8[0x64];
    void *metadata_20c;
} Overlay001MetadataGetState;

/*
 * Return metadata_20c + index*0x20 when 0 <= index < cellCount_1a4; otherwise
 * return null. Inputs and state are unchanged, and no SDK or hardware service
 * is called.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov001_021fc7c0(Overlay001MetadataGetState *state, s32 index)
{
    if (index < 0) {
        return 0;
    }
    if (index >= state->cellCount_1a4) {
        return 0;
    }
    return (u8 *)state->metadata_20c + index * 0x20;
}
