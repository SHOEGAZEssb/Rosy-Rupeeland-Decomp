#include "tingle/types.h"

/*
 * Overlay 1 active-cell refresh. This recovered helper conditionally rebuilds
 * the active grid cell after applying an operation to its linked record.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001ActiveCellRefreshState {
    u8 field_000[0x1c];
    void *transient_01c;
    u8 field_020[0x18c];
    s32 activeIndex_1ac;
    u8 field_1b0[0x5c];
    void *metadata_20c;
} Overlay001ActiveCellRefreshState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 *InventoryRecord_GetMetadata(void *cell);
extern void ActorDescriptor_SetQuantity(void *cell, s32 index);
extern void func_ov001_021fc460(Overlay001ActiveCellRefreshState *state,
                                s32 index);
extern void func_ov001_021fc404(Overlay001ActiveCellRefreshState *state,
                                s32 index, void *cell);
extern void func_ov001_021fc068(Overlay001ActiveCellRefreshState *state);
#ifdef __cplusplus
}
#endif

/*
 * Resolve the active metadata record and inspect its linked cell. Continue
 * only when InventoryRecord_GetMetadata(cell)[2] is one and the cell halfword at +4 is
 * nonzero. Apply ActorDescriptor_SetQuantity(cell, 0), retire any transient by setting its
 * +0x32 halfword to 0x0100, reset and clear the active metadata binding,
 * refresh the grid, then attach metadata+0x10 as the new transient. Returns no
 * value; the callees and direct writes mutate presentation and cell state.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc7f4(Overlay001ActiveCellRefreshState *state)
{
    void *metadata =
        (u8 *)state->metadata_20c + state->activeIndex_1ac * 0x20;
    void *cell = FIELD(void *, metadata, 0x0c);

    if (InventoryRecord_GetMetadata(cell)[2] != 1 || FIELD(u16, cell, 0x04) == 0) {
        return;
    }
    ActorDescriptor_SetQuantity(cell, 0);
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
