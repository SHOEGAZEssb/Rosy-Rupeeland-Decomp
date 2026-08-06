#include "tingle/types.h"

/*
 * Overlay 1 row-resource creation. This recovered helper lazily constructs the
 * presentation resource for each linked cell in one five-entry grid row.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001RowResourcesState {
    u8 field_000[0x08];
    u8 resourceContext_008[1];
    u8 field_009[0x19b];
    s32 cellCount_1a4;
    u8 field_1a8[0x64];
    void *metadata_20c;
} Overlay001RowResourcesState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *func_02062918(void *cell, s32 index);
extern s32 func_02063064(void *component);
extern s32 func_02063074(void *component);
extern s32 func_02063084(void *component);
extern s32 func_02063190(void *component);
extern void func_02071ee0(void *metadata, void *config, s32 first, s32 second,
                          s32 third);
extern void *func_02073ffc(void *context, void *metadata, s32 kind);
extern void func_02073e48(void *resource, s32 value, s32 x, s32 y, s32 mode,
                          s32 scale, s32 extra);
#ifdef __cplusplus
}
#endif

/*
 * Visit the five metadata records beginning at row*5, stopping at
 * cellCount_1a4. For each linked cell whose metadata+0x10 resource is null,
 * derive four presentation properties from component zero, initialize the
 * metadata, and allocate/configure a kind-2 resource. The new resource is
 * stored at metadata+0x10. Confirmed linked-cell flag bit 0, found at +0x20,
 * sets resource halfword +0x2A to one. Allocation and renderer effects occur
 * in the callees; the precise SDK resource types remain unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc4b4(Overlay001RowResourcesState *state, s32 row)
{
    s32 column;

    for (column = 0; column < 5; column++) {
        s32 index = row * 5 + column;
        void *metadata;
        void *cell;
        void *resource;
        s32 first;
        s32 second;
        s32 third;
        s32 value;

        if (index >= state->cellCount_1a4) {
            break;
        }
        metadata = (u8 *)state->metadata_20c + index * 0x20;
        cell = FIELD(void *, metadata, 0x0c);
        if (cell == 0 || FIELD(void *, metadata, 0x10) != 0) {
            continue;
        }
        first = func_02063064(func_02062918(cell, 0));
        second = func_02063074(func_02062918(cell, 0));
        third = func_02063084(func_02062918(cell, 0));
        func_02071ee0(metadata, data_020f4e18, first, second, third);
        resource = func_02073ffc(state->resourceContext_008, metadata, 2);
        FIELD(void *, metadata, 0x10) = resource;
        value = func_02063190(func_02062918(cell, 0));
        func_02073e48(resource, value, FIELD(s32, metadata, 0x14),
                      FIELD(s32, metadata, 0x18), 2, 0x3000, 0);
        if ((FIELD(u32, cell, 0x20) & 1) != 0) {
            FIELD(u16, resource, 0x2a) = 1;
        }
    }
}
