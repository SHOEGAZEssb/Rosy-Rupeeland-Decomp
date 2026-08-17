#include "tingle/types.h"

/*
 * Overlay 1 active-cell merge. This recovered helper consumes a requested
 * quantity from a supplied record, applies it to the active linked cell, and
 * rebuilds the active presentation resource.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001ActiveCellMergeState {
    u8 field_000[0x1c];
    void *transient_01c;
    u8 field_020[0x18c];
    s32 activeIndex_1ac;
    u8 field_1b0[0x5c];
    void *metadata_20c;
} Overlay001ActiveCellMergeState;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 *InventoryRecord_GetMetadata(void *cell);
extern void ActorDescriptor_SetQuantity(void *cell, s32 value);
extern s32 ActorDescriptor_GetSubtype(void *cell);
extern void ActorDescriptor_Init(void *cell, u16 key, u16 property, u16 quantity);
extern void func_ov001_021fc460(Overlay001ActiveCellMergeState *state,
                                s32 index);
extern void func_ov001_021fc404(Overlay001ActiveCellMergeState *state,
                                s32 index, void *cell);
extern void func_ov001_021fc068(Overlay001ActiveCellMergeState *state);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are state, an amount, and a source record. Continue only when the
 * active linked cell's descriptor type byte is one. Subtract amount from the
 * source +4 quantity (with 16-bit truncation), then call ActorDescriptor_Init on the
 * active cell using the source +0 key, the active cell property returned by
 * ActorDescriptor_GetSubtype, and active quantity plus amount. Retire the transient,
 * reset/clear the active binding, refresh the grid, and attach metadata+0x10.
 * Returns no value; record and presentation state are mutated by writes/calls.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc964(Overlay001ActiveCellMergeState *state, s32 amount,
                          void *source)
{
    void *metadata =
        (u8 *)state->metadata_20c + state->activeIndex_1ac * 0x20;
    void *cell = FIELD(void *, metadata, 0x0c);
    u16 key;
    u16 property;
    u16 quantity;

    if (InventoryRecord_GetMetadata(cell)[2] != 1) {
        return;
    }
    ActorDescriptor_SetQuantity(source, (u16)(FIELD(u16, source, 0x04) - amount));
    key = FIELD(u16, source, 0x00);
    property = (u16)ActorDescriptor_GetSubtype(cell);
    quantity = (u16)(FIELD(u16, cell, 0x04) + amount);
    ActorDescriptor_Init(cell, key, property, quantity);
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
