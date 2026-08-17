#include "tingle/types.h"

/* Overlay 25 saved-record row destruction and canonical reconstruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_022033b4[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void func_020927b8(void *);
extern void *func_ov025_021fd5dc(void *, s32);
extern void func_ov025_021fd9e4(void *, s32);
extern void func_ov025_021fde58(void *);
extern void func_ov025_02200564(void *);
#ifdef __cplusplus
}
#endif

/*
 * Hide the choice controllers, finalize and destroy the row selected at +0x54,
 * reconstruct it from the root heap, mark its sprite-group owner ready, lower
 * all three rows to y=0, and clear the selection to -1. Heap, sprite, and row
 * state change; all indexed fields are deliberately re-read as retail does.
 */
extern "C" void func_ov025_022006c4(void *scene)
{
    func_ov025_02200564(scene);
    func_ov025_021fde58(FIELD(void *, (u32)scene +
        (FIELD(s32, scene, 0x54) << 2), 0xe4));
    void *row = FIELD(void *, (u32)scene +
        (FIELD(s32, scene, 0x54) << 2), 0xe4);
    if (row) {
        GraphicsSpriteGroup_Destroy(FIELD(void *, row, 0xc));
        func_020927b8((u8 *)row + 0x30);
        AnimationResourceState_Destroy(row);
        Heap_Free(row);
    }
    row = Heap_Alloc(0x90, data_ov025_022033b4, 4, gHeapContext);
    if (row)
        row = func_ov025_021fd5dc(row, FIELD(s32, scene, 0x54));
    FIELD(void *, (u32)scene + (FIELD(s32, scene, 0x54) << 2), 0xe4) = row;
    FIELD(s32, FIELD(void *, FIELD(void *, (u32)scene +
        (FIELD(s32, scene, 0x54) << 2), 0xe4), 0xc), 0x20) = 1;
    for (s32 i = 0; i < 3; ++i)
        func_ov025_021fd9e4(FIELD(void *, (u32)scene + (i << 2), 0xe4), 0);
    FIELD(s32, scene, 0x54) = -1;
}

/*
 * Destroy and reconstruct the row indexed at scene +0x58, retain it in the
 * +0xE4 row array, and mark its sprite-group owner ready. Heap and sprite
 * ownership change; the index and retained row are re-read in retail order.
 */
extern "C" void func_ov025_02200794(void *scene)
{
    void *row = FIELD(void *, (u32)scene +
        (FIELD(s32, scene, 0x58) << 2), 0xe4);
    if (row) {
        GraphicsSpriteGroup_Destroy(FIELD(void *, row, 0xc));
        func_020927b8((u8 *)row + 0x30);
        AnimationResourceState_Destroy(row);
        Heap_Free(row);
    }
    row = Heap_Alloc(0x90, data_ov025_022033b4, 4, gHeapContext);
    if (row)
        row = func_ov025_021fd5dc(row, FIELD(s32, scene, 0x58));
    FIELD(void *, (u32)scene + (FIELD(s32, scene, 0x58) << 2), 0xe4) = row;
    FIELD(s32, FIELD(void *, FIELD(void *, (u32)scene +
        (FIELD(s32, scene, 0x58) << 2), 0xe4), 0xc), 0x20) = 1;
}
