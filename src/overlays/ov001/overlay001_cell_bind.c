#include "tingle/types.h"

/*
 * Overlay 1 cell binding. This recovered helper links one 0x24-byte source
 * record to its corresponding 0x20-byte metadata entry when eligible.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001CellBindState {
    u8 field_000[0x204];
    void *recordTable_204;
    u8 field_208[0x04];
    void *metadata_20c;
} Overlay001CellBindState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02062b28(void *record);
#ifdef __cplusplus
}
#endif

/*
 * Locate source index in the 0x24-byte array at recordTable_204+4. Return if
 * func_02062b28 reports it ineligible. Otherwise store its pointer at metadata
 * +0x0C, copy source halfword +4 into metadata word +0x1C, and clear source
 * word +0x20 when clearField is nonzero. The eligibility callee's wider effects
 * are unconfirmed; no hardware is accessed directly.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc404(Overlay001CellBindState *state, s32 index,
                         s32 clearField)
{
    void *record = (u8 *)FIELD(void *, state->recordTable_204, 0x04) +
                   index * 0x24;

    if (func_02062b28(record) != 0) {
        return;
    }
    FIELD(void *, (u8 *)state->metadata_20c + index * 0x20, 0x0c) = record;
    FIELD(u32, (u8 *)state->metadata_20c + index * 0x20, 0x1c) =
        FIELD(u16, record, 0x04);
    if (clearField != 0) {
        FIELD(s32, record, 0x20) = 0;
    }
}
