#include "tingle/types.h"

/*
 * Overlay 0 cell-flag testing. This recovered helper reads a maskable flag word
 * from the cell linked through a metadata record.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Return linked cell field 0x20 AND mask. Return zero when metadata field 0x0C
 * contains no linked cell. Inputs and state are unchanged, and no SDK or
 * hardware service is called.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc834(const void *metadata, s32 mask)
{
    const void *cell = FIELD(void *, metadata, 0x0c);

    return cell != 0 ? FIELD(s32, cell, 0x20) & mask : 0;
}
