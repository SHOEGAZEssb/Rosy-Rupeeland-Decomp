#include "tingle/types.h"

/*
 * Overlay 1 active-cell transfer. This recovered helper moves the active
 * cell's quantity into a corresponding secondary-table record and refreshes
 * the cell presentation.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001ActiveCellTransferState {
    u8 field_000[0x1c];
    void *transient_01c;
    u8 field_020[0x18c];
    s32 activeIndex_1ac;
    u8 field_1b0[0x58];
    void *secondaryTable_208;
    void *metadata_20c;
} Overlay001ActiveCellTransferState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 *InventoryRecord_GetMetadata(void *cell);
extern s32 InventoryRecordCollection_FindIdAlternate(void *table, u16 key);
extern void ActorDescriptor_SetQuantity(void *cell, s32 value);
extern void func_ov001_021fc460(Overlay001ActiveCellTransferState *state,
                                s32 index);
extern void func_ov001_021fc404(Overlay001ActiveCellTransferState *state,
                                s32 index, void *cell);
extern void func_ov001_021fc068(Overlay001ActiveCellTransferState *state);
#ifdef __cplusplus
}
#endif

/*
 * Continue only for an active linked cell whose descriptor type byte is one,
 * whose +4 quantity is nonzero, and whose +0 key is found in secondaryTable_208.
 * Locate the matching 0x24-byte record through the table pointer at +4, apply
 * the active quantity to both records (adding it to the secondary quantity),
 * retire any transient, reset/clear the active binding, refresh the grid, and
 * attach the rebuilt metadata+0x10 resource. The sum is explicitly truncated
 * to 16 bits. Returns no value; callees mutate record and presentation state.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc88c(Overlay001ActiveCellTransferState *state)
{
    void *metadata =
        (u8 *)state->metadata_20c + state->activeIndex_1ac * 0x20;
    void *cell = FIELD(void *, metadata, 0x0c);
    s32 tableIndex;
    void *secondary;
    u16 quantity;

    if (InventoryRecord_GetMetadata(cell)[2] != 1 || FIELD(u16, cell, 0x04) == 0) {
        return;
    }
    tableIndex = InventoryRecordCollection_FindIdAlternate(state->secondaryTable_208,
                              FIELD(u16, cell, 0x00));
    if (tableIndex < 0) {
        return;
    }
    quantity = FIELD(u16, cell, 0x04);
    secondary = (u8 *)FIELD(void *, state->secondaryTable_208, 0x04) +
                tableIndex * 0x24;
    ActorDescriptor_SetQuantity(cell, quantity);
    ActorDescriptor_SetQuantity(secondary,
                  (u16)(quantity + FIELD(u16, secondary, 0x04)));
    if (state->transient_01c != 0) {
        FIELD(u16, state->transient_01c, 0x32) = 0x100;
        state->transient_01c = 0;
    }
    func_ov001_021fc460(state, state->activeIndex_1ac);
    func_ov001_021fc404(state, state->activeIndex_1ac, 0);
    func_ov001_021fc068(state);
    metadata = (u8 *)state->metadata_20c + state->activeIndex_1ac * 0x20;
    state->transient_01c = FIELD(void *, metadata, 0x10);
}
