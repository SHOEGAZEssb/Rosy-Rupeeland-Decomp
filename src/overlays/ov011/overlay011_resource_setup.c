#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/*
 * Overlay 11 resource setup. This routine selects one record from the active
 * asset file, loads its graphics triplet, and configures sub-engine BG1.
 */

typedef struct Overlay011ResourceRecord {
    u32 resource0Id;
    u32 resource1Id;
    u32 resource2Id;
    u8 field_00c[0x14];
} Overlay011ResourceRecord;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern const char data_ov011_021fe618[];
extern u8 gHeapContext[];
extern void func_020b44e8(void);
extern s32 func_0207043c(void *resource);
extern void func_020706c4(void *resource, s32 background, s32 value);
extern void func_02070bc4(void *resource, s32 destination);
extern void *Heap_AllocCore(s32 size, const char *tag, s32 alignment,
                           void *heapContext);
extern void func_020b1bfc(void *source, s32 destination, s32 size);
extern u16 *GraphicsBgResourceData_GetDecoded(void *resource);
extern void func_ov011_021fd374(s32 priority, s32 charBase, s32 screenBase,
                                s32 size, s32 overflow);
extern void func_ov011_021fd3a8(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Use +0xD0 to select one of five loaded file buffers at +0x84 and its
 * 32-byte record index at +0xE8. Load that record's three confirmed resource
 * IDs into the set at +0x78 and synchronize resource work.
 *
 * When +0xCC is nonzero, configure BG1 from resource-1 metadata, bind the
 * resources, build an 0x800-byte tilemap whose first N entries are identity
 * indices (N is resource-0 size divided by 32 or 64), and upload it at offset
 * zero. Otherwise derive BG priority/quadrant bits from resource-2 dimensions,
 * apply the set, and copy resource 1's first color directly to sub BG palette
 * address 0x05000400. Both paths finish through func_ov011_021fd3a8.
 * Metadata meanings beyond the comparisons shown here remain inferred.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fd188(void *state)
{
    s32 fileIndex = FIELD(s32, state, 0xd0);
    u8 *file = FIELD(u8 *, state, 0x84 + fileIndex * 4);
    s32 recordIndex = FIELD(s32, state, 0xe8 + fileIndex * 4);
    Overlay011ResourceRecord *record =
        (Overlay011ResourceRecord *)(file + recordIndex * 0x20);
    GraphicsResourceSet *set =
        (GraphicsResourceSet *)((u8 *)state + 0x78);
    u8 *resource1Metadata;
    u16 layout;

    GraphicsResourceSet_Load(set, data_020f4e18, record->resource0Id,
                             record->resource1Id, record->resource2Id);
    func_020b44e8();
    resource1Metadata = FIELD(u8 *, set->resource1, 0x20);
    layout = *(u16 *)(resource1Metadata + 4);

    if (FIELD(s32, state, 0xcc) != 0) {
        s32 count;
        s32 i;
        s32 paletteDestination = 0;
        u16 *tilemap;

        func_ov011_021fd374(0, layout == 0x10 ? 0 : 1, 0x12, 4, 0);
        count = func_0207043c(set->resource0) /
                (layout == 0x100 ? 0x40 : 0x20);
        func_020706c4(set->resource0, 1, 0);
        if (layout == 0x100)
            paletteDestination = 0x2000;
        func_02070bc4(set->resource1, paletteDestination);
        tilemap = (u16 *)Heap_AllocCore(0x800, data_ov011_021fe618, 4,
                                      gHeapContext);
        for (i = 0; i < count; i++)
            tilemap[i] = (u16)i;
        for (; i < 0x400; i++)
            tilemap[i] = 0;
        func_020b44e8();
        func_020b1bfc(tilemap, 0, 0x800);
    } else {
        u8 *resource2Metadata = FIELD(u8 *, set->resource2, 0x20);
        s32 width = FIELD(s32, resource2Metadata, 0x0c);
        s32 height = FIELD(s32, resource2Metadata, 0x10);
        s32 quadrant;

        if (width > 0x20)
            quadrant = height > 0x20 ? 3 : 1;
        else
            quadrant = height > 0x20 ? 2 : 0;
        func_ov011_021fd374(quadrant, layout == 0x10 ? 0 : 1,
                            0x12, 4, 0);
        GraphicsResourceSet_Apply(set, 1, layout == 0x100 ? 0x2000 : 0);
        *(volatile u16 *)0x05000400 = *GraphicsBgResourceData_GetDecoded(set->resource1);
    }
    func_ov011_021fd3a8(state);
}
