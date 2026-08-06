#include "tingle/types.h"

/*
 * Overlay 0 cell binding. This recovered helper links one 0x24-byte source
 * cell to its 0x20-byte metadata record when the source is eligible.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000CellBindState {
    u8 field_000[0x24c];
    void *cellContainer_24c;
    void *metadata_250;
} Overlay000CellBindState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02062b28(void *cell);
#ifdef __cplusplus
}
#endif

/*
 * Locate source cell index in the 0x24-byte array referenced through
 * cellContainer_24c+8. If func_02062b28 reports it ineligible, return without
 * changes. Otherwise store its pointer at metadata[index]+0x0C, copy its
 * halfword at +4 into metadata[index]+0x1C as a word, and clear cell+0x20 when
 * clearField is nonzero. The eligibility test's wider effects are unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc658(Overlay000CellBindState *state, s32 index,
                         s32 clearField)
{
    void *cell = (u8 *)FIELD(void *, state->cellContainer_24c, 0x08) +
                 index * 0x24;
    if (func_02062b28(cell) != 0) {
        return;
    }
    FIELD(void *, (u8 *)state->metadata_250 + index * 0x20, 0x0c) = cell;
    FIELD(u32, (u8 *)state->metadata_250 + index * 0x20, 0x1c) =
        FIELD(u16, cell, 0x04);
    if (clearField != 0) {
        FIELD(s32, cell, 0x20) = 0;
    }
}
