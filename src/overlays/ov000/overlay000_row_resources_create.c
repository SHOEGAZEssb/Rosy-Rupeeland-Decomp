#include "tingle/types.h"

/*
 * Overlay 0 row-resource creation. This recovered helper lazily constructs the
 * presentation resource for each linked cell in one five-entry grid row.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay000RowResourcesState {
    u8 field_000[0x08];
    void *spriteGroup_008;
    u8 field_00c[0x244];
    void *metadata_250;
    s32 cellCount_254;
} Overlay000RowResourcesState;

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
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *context, void *metadata, s32 kind);
extern void func_02073e48(void *resource, s32 value, s32 x, s32 y, s32 mode,
                          s32 scale, s32 extra);
extern s32 func_ov000_021fc834(const void *metadata, s32 mask);
#ifdef __cplusplus
}
#endif

/*
 * Visit the five metadata records beginning at row*5, stopping at
 * cellCount_254. For each linked cell whose metadata+0x10 resource is null,
 * derive four properties through func_02062918 and its component accessors,
 * initialize metadata from data_020f4e18, allocate/configure a kind-2 resource,
 * and store it at +0x10. If linked-cell flag bit 0 is set, write 1 to the new
 * resource's halfword at +0x2A. Resource allocation and presentation effects
 * occur in the callees; their precise SDK types remain unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fc84c(Overlay000RowResourcesState *state, s32 row)
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

        if (index >= state->cellCount_254) {
            break;
        }
        metadata = (u8 *)state->metadata_250 + index * 0x20;
        cell = FIELD(void *, metadata, 0x0c);
        if (cell == 0 || FIELD(void *, metadata, 0x10) != 0) {
            continue;
        }
        first = func_02063064(func_02062918(cell, 0));
        second = func_02063074(func_02062918(cell, 0));
        third = func_02063084(func_02062918(cell, 0));
        func_02071ee0(metadata, data_020f4e18, first, second, third);
        resource = GraphicsSpriteGroup_CreateStateFromSource(
            state->spriteGroup_008, metadata, 2);
        value = func_02063190(func_02062918(cell, 0));
        func_02073e48(resource, value, FIELD(s32, metadata, 0x14),
                      FIELD(s32, metadata, 0x18), 2, 0x3000, 0);
        FIELD(void *, metadata, 0x10) = resource;
        if (func_ov000_021fc834(metadata, 1) != 0) {
            FIELD(u16, resource, 0x2a) = 1;
        }
    }
}
