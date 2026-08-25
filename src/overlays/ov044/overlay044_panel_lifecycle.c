#include "tingle/types.h"

/*
 * Overlay 44 panel lifecycle and row management. These recovered routines
 * release a panel, append row descriptors, toggle visibility, and materialize
 * the currently visible row bindings.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteGroup_Destroy(void *object);
extern "C" void CxxArray_DestroyAndFree(void *records, s32 stride, s32 alignment,
                               void (*destroy)(void *));
extern "C" void TitleCharacterResourceCollection_Destroy(void *presentation);
extern "C" void AnimationResourceState_Destroy(void *owner);
extern "C" void InventoryCell_Destroy(void *record);
extern "C" void GraphicsSpriteGroup_ReleaseIndexedEntries(void *object);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *font, void *owner, s32 value);
extern "C" s32 func_ov044_0220bb48(void *record, s32 mode);
extern "C" void GraphicsSpriteState_ApplyRenderConfig(void *binding, s32 row, s32 x, s32 y,
                               s32 visible, s32 first, s32 second);
extern "C" void func_ov044_0220baa0(void *object, s32 index);

/*
 * Destroy panel-owned resources and return the original pointer. Release font
 * object +0x04, invoke virtual destructor slot +0x04 on optional child +0x44,
 * destroy the optional 32-byte record array +0x38 with InventoryCell_Destroy, and
 * destroy presentation +0x14 and owner +0x08. Heap/resource state changes;
 * caller-owned panel storage is not freed.
 */
extern "C" void *func_ov044_0220b8e4(void *object)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 4));
    void *child = FIELD(void *, object, 0x44);
    if (child) {
        void **vtable = FIELD(void **, child, 0);
        ((void (*)(void *))vtable[1])(child);
    }
    if (FIELD(void *, object, 0x38))
        CxxArray_DestroyAndFree(FIELD(void *, object, 0x38), 0x20, 8, InventoryCell_Destroy);
    TitleCharacterResourceCollection_Destroy((u8 *)object + 0x14);
    AnimationResourceState_Destroy((u8 *)object + 8);
    return object;
}

/*
 * Append one row when array +0x38 exists and count +0x40 is below capacity
 * +0x3C. Store caller item at record +0x0C, clear binding +0x14, set vertical
 * offset +0x18 to index*24, and place the supplied 16-bit value in the upper
 * half of item field +0x20 without disturbing its low half. Increment +0x40.
 */
extern "C" void func_ov044_0220b944(void *object, void *item, u16 value)
{
    void *records = FIELD(void *, object, 0x38);
    s32 index = FIELD(s32, object, 0x40);
    if (!records || index >= FIELD(s32, object, 0x3c))
        return;
    void *record = (u8 *)records + index * 0x20;
    FIELD(void *, record, 0xc) = item;
    FIELD(u32, record, 0x14) = 0;
    FIELD(s32, record, 0x18) = index * 24;
    if (item)
        FIELD(u32, item, 0x20) = (FIELD(u32, item, 0x20) & 0xffff) |
                                 ((u32)value << 16);
    FIELD(s32, object, 0x40) = index + 1;
}

/*
 * Show the panel. Set +0x48, expose the child's current display when rows were
 * appended (or directly activate it when empty), and activate font +0x04.
 * UI visibility state changes; no value is returned.
 */
extern "C" void func_ov044_0220b9c8(void *object)
{
    FIELD(s32, object, 0x48) = 1;
    void *child = FIELD(void *, object, 0x44);
    if (FIELD(s32, object, 0x40)) {
        if (FIELD(s32, child, 8) < FIELD(s32, child, 4))
            FIELD(s32, FIELD(void *, child, 0x50), 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, child, 0x50));
    }
    FIELD(s32, FIELD(void *, object, 4), 0x20) = 1;
}

/*
 * Hide the panel. Clear +0x48 and deactivate the child display +0x50 and font
 * +0x04 through GraphicsSpriteGroup_ReleaseIndexedEntries. UI visibility state changes only.
 */
extern "C" void func_ov044_0220ba18(void *object)
{
    FIELD(s32, object, 0x48) = 0;
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, object, 0x44), 0x50));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, object, 4));
}

/*
 * Rebuild bindings for the child viewport. Adjust font height +0x1C from the
 * child top row +0x0C, then materialize rows spanning top through
 * top+visibleCount-1 by calling func_ov044_0220baa0. Resource bindings change.
 */
extern "C" void func_ov044_0220ba40(void *object)
{
    void *child = FIELD(void *, object, 0x44);
    FIELD(s32, FIELD(void *, object, 4), 0x1c) =
        0x20 - FIELD(s32, child, 0xc) * 24;
    s32 end = FIELD(s32, child, 0xc) + FIELD(s32, child, 8) - 1;
    for (s32 index = FIELD(s32, child, 0xc); index <= end; ++index)
        func_ov044_0220baa0(object, index);
}

/*
 * Lazily create a font binding for nonzero row index below appended count
 * +0x40. Store it at record +0x10, query the row predicate using mode one,
 * and configure the binding at row index-1 (or index+49 when the predicate is
 * false), using record coordinates +0x14/+0x18 and flags 1/0/0. Font/resource
 * state changes; invalid/already-bound rows are ignored.
 */
extern "C" void func_ov044_0220baa0(void *object, s32 index)
{
    if (index == 0 || index >= FIELD(s32, object, 0x40))
        return;
    void *record = (u8 *)FIELD(void *, object, 0x38) + index * 0x20;
    if (FIELD(void *, record, 0x10))
        return;
    void *binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 4),
                                   (u8 *)object + 8, 1);
    FIELD(void *, record, 0x10) = binding;
    s32 row = index - 1;
    if (!func_ov044_0220bb48(record, 1))
        row += 50;
    GraphicsSpriteState_ApplyRenderConfig(binding, row,
                   FIELD(s32, record, 0x14), FIELD(s32, record, 0x18),
                   1, 0, 0);
}
