#include "tingle/types.h"

/* Overlay 23 scrollable 24-byte record collection, row sprites, text, and input mapping. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021f5128;
extern const u8 data_ov023_021ffbd8[];
extern const u8 data_ov023_021ffbe0[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *func_02003e20(u32, const void *, u32, void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, ...);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, ...);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, ...);
extern s32 func_0207b4e8(void *);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02094154(void *, void *, s32, s32, ...);
extern void func_02094550(void *, s32);
extern void func_02094574(void *);
extern s32 func_020befec(s32, s32);
extern void func_020c09cc(void *, s32, s32, s32, ...);
extern void func_020c0c24(void *, s32, s32, void *);
extern void *func_ov023_021fce00(void *);
extern void *func_ov023_021fce2c(void *);
extern void func_ov023_021fd0dc(void *);
extern void func_ov023_021fd164(void *, s32);
extern void func_ov023_021fd220(void *, s32);
extern void func_ov023_021fd268(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a record collection around font/context `font` with capacity
 * `capacity`. It initializes input state +8, clones the font owner at +4,
 * allocates and constructs capacity 0x18-byte entries when nonzero, creates a
 * 0x80-byte scrolling UI at +0x38 (using a one-row fallback for zero capacity),
 * hides it, and registers input codes 0x7007/0x7000. Heap, UI, font, and input
 * SDK state change; the initialized collection is returned.
 */
extern "C" void *func_ov023_021fce44(void *collection, void *font, s32 capacity)
{
    func_02092798((u8 *)collection + 8);
    FIELD(void *, collection, 0) = font;
    FIELD(void *, collection, 4) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(s32, FIELD(void *, collection, 4), 0x18) = 40;
    FIELD(s32, FIELD(void *, collection, 4), 0x1c) = 45;
    FIELD(s32, collection, 0x30) = capacity;
    FIELD(s32, collection, 0x34) = 0;
    void *entries = 0;
    if (capacity != 0) {
        entries = func_02003e20(capacity * 0x18 + 8,
                                data_ov023_021ffbd8, 4, gHeapContext);
        if (entries != 0)
            func_020c09cc(entries, capacity, 0x18, 8,
                          func_ov023_021fce00, func_ov023_021fce2c);
    }
    FIELD(void *, collection, 0x2c) = entries;
    void *ui = Heap_Alloc(0x80, data_ov023_021ffbe0, 4, gHeapContext);
    if (ui != 0)
        ui = func_02094154(ui, font, capacity ? capacity : 1,
                          capacity ? 4 : 1, 0xdc, 40, -4);
    FIELD(void *, collection, 0x38) = ui;
    func_02094550(ui, 0);
    func_02094574(ui);
    func_ov023_021fd0dc(collection);
    func_02092814((u8 *)collection + 8, 0x7007);
    func_02092814((u8 *)collection + 8, 0x7000);
    return collection;
}

/*
 * Releases the collection's cloned font, scrolling UI through its virtual
 * destructor, constructed entry array, and input state +8, then returns the
 * collection. Heap and SDK-owned UI/font/input resources change.
 */
extern "C" void *func_ov023_021fcfcc(void *collection)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, collection, 4));
    void *ui = FIELD(void *, collection, 0x38);
    if (ui != 0) {
        typedef void (*VirtualDestructor)(void *);
        ((VirtualDestructor)FIELD(void *, FIELD(void *, ui, 0), 4))(ui);
    }
    void *entries = FIELD(void *, collection, 0x2c);
    if (entries != 0)
        func_020c0c24(entries, 0x18, 8, (void *)func_ov023_021fce2c);
    func_020927b8((u8 *)collection + 8);
    return collection;
}

/*
 * Appends record pointer `record` when capacity remains. The new 0x18-byte
 * entry receives the pointer at +0, clears sprite +0x10 and x halfword +0x14,
 * sets y halfword +0x16 to index*26, increments count +0x34, and returns the
 * entry. At capacity or without storage it returns null without mutation.
 */
extern "C" void *func_ov023_021fd024(void *collection, void *record)
{
    u8 *entries = FIELD(u8 *, collection, 0x2c);
    s32 index = FIELD(s32, collection, 0x34);
    if (entries == 0 || index >= FIELD(s32, collection, 0x30))
        return 0;
    u8 *entry = entries + index * 0x18;
    FIELD(void *, entry, 0) = record;
    FIELD(void *, entry, 0x10) = 0;
    FIELD(u16, entry, 0x14) = 0;
    FIELD(u16, entry, 0x16) = (u16)(index * 0x1a);
    FIELD(s32, collection, 0x34) = index + 1;
    return entry;
}

/*
 * Marks the collection visible at +0x3C. With records present it enables the
 * UI's +0x50 object while the visible range is not exhausted; with no records
 * it hides that object. It always enables cloned font/object +4. UI visibility
 * changes and no value is returned.
 */
extern "C" void func_ov023_021fd08c(void *collection)
{
    FIELD(s32, collection, 0x3c) = 1;
    void *ui = FIELD(void *, collection, 0x38);
    if (FIELD(s32, collection, 0x34) != 0) {
        if (FIELD(s32, ui, 8) < FIELD(s32, ui, 4))
            FIELD(s32, FIELD(void *, ui, 0x50), 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, ui, 0x50));
    }
    FIELD(s32, FIELD(void *, collection, 4), 0x20) = 1;
}

/*
 * Marks the collection hidden at +0x3C and hides both UI +0x50 and cloned
 * font/object +4. UI visibility changes; no value is returned.
 */
extern "C" void func_ov023_021fd0dc(void *collection)
{
    FIELD(s32, collection, 0x3c) = 0;
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, collection, 0x38), 0x50));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, collection, 4));
}

/*
 * Repositions cloned font/object +4 from scroll index +0xC, then lazily creates
 * row sprites for the UI's visible inclusive range (+0xC through +0xC+0x8-1).
 * Sprite and display-position state may change; no value is returned.
 */
extern "C" void func_ov023_021fd104(void *collection)
{
    void *ui = FIELD(void *, collection, 0x38);
    s32 first = FIELD(s32, ui, 0xc);
    FIELD(s32, FIELD(void *, collection, 4), 0x1c) = 45 - first * 26;
    for (s32 i = first; i <= first + FIELD(s32, ui, 8) - 1; ++i)
        func_ov023_021fd164(collection, i);
}

/*
 * Lazily creates the row sprite for a valid populated entry. It derives a
 * resource bank from record +4/+0xC low byte through data_021F5128, creates a
 * slot-2 sprite from cloned owner +4 and entry descriptor +4, obtains its frame
 * from the bank's +0x668 object, and places it at entry halfwords +0x14/+0x16.
 * Sprite/resource state changes; invalid, empty, or existing rows are ignored.
 */
extern "C" void func_ov023_021fd164(void *collection, s32 index)
{
    if (index >= FIELD(s32, collection, 0x34)) return;
    u8 *entry = FIELD(u8 *, collection, 0x2c) + index * 0x18;
    void *record = FIELD(void *, entry, 0);
    if (record == 0 || FIELD(void *, entry, 0x10) != 0) return;
    u32 bank_index = FIELD(u32, FIELD(void *, record, 4), 0xc) & 0xff;
    void *bank = ((void **)data_021f5128)[bank_index];
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, collection, 4), entry + 4, 2);
    FIELD(void *, entry, 0x10) = sprite;
    s32 frame = func_0207b4e8((u8 *)bank + 0x668);
    func_02073e48(sprite, frame, FIELD(s16, entry, 0x14),
                  FIELD(s16, entry, 0x16), 0, 0, 0);
}

/*
 * Destroys the row sprite at `index` when valid and present, then clears entry
 * +0x10. Sprite/graphics ownership changes; other entry data is preserved.
 */
extern "C" void func_ov023_021fd220(void *collection, s32 index)
{
    if (index >= FIELD(s32, collection, 0x34)) return;
    u8 *entry = FIELD(u8 *, collection, 0x2c) + index * 0x18;
    if (FIELD(void *, entry, 0x10) != 0) {
        GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, entry, 0x10));
        FIELD(void *, entry, 0x10) = 0;
    }
}

/*
 * Clears the 176-pixel text region and redraws up to four rows beginning at UI
 * scroll +0xC. Each populated record selects its font through record +8 and
 * draws UTF-16 text at record +4/+0x2C, x=64, y=36+26*row with style 14,
 * palette 8, and final style -2. Font/render state changes; returns void.
 */
extern "C" void func_ov023_021fd268(void *collection)
{
    GraphicsSpriteCanvas_FillRect(FIELD(void *, collection, 0), 0, 0, 0xff, 0xb0, 0);
    for (s32 row = 0; row < 4; ++row) {
        s32 index = row + FIELD(s32, FIELD(void *, collection, 0x38), 0xc);
        if (index >= FIELD(s32, collection, 0x34)) break;
        void *record = FIELD(void *, FIELD(u8 *, collection, 0x2c) + index * 0x18, 0);
        GraphicsSpriteRenderer_SetFontResource(FIELD(void *, collection, 0), FIELD(void *, record, 8));
        GraphicsSpriteRenderer_DrawText(FIELD(void *, collection, 0),
                      (u8 *)FIELD(void *, record, 4) + 0x2c,
                      0x40, row * 0x1a + 0x24, 14, 8, -2);
    }
}

/*
 * Maps touch coordinates (+4 x,+8 y) into a record index within x=24..208 and
 * y=32..136. Y uses 26-pixel rows clamped to visible row 3, then adds scroll
 * +0xC. Returns the valid absolute index or -1; no state changes.
 */
extern "C" s32 func_ov023_021fd328(void *collection, const void *touch)
{
    s32 x = FIELD(s32, touch, 4) - 0x18;
    s32 y = FIELD(s32, touch, 8) - 0x20;
    if (x < 0 || x > 0xb8 || y < 0 || y > 0x68) return -1;
    s32 row = func_020befec(y, 0x1a);
    if (row >= 4) row = 3;
    s32 index = row + FIELD(s32, FIELD(void *, collection, 0x38), 0xc);
    return index < FIELD(s32, collection, 0x34) ? index : -1;
}

/*
 * Returns the 0x18-byte entry selected by UI field +0x14. No validation or
 * state mutation is performed.
 */
extern "C" void *func_ov023_021fd398(void *collection)
{
    s32 selected = FIELD(s32, FIELD(void *, collection, 0x38), 0x14);
    return FIELD(u8 *, collection, 0x2c) + selected * 0x18;
}

/*
 * Handles the scrolling UI midpoint. Before midpoint it returns zero. At the
 * rounded halfway frame it returns one; when scroll +0xC differs from target
 * +0x10, it repositions the cloned font, destroys outgoing row +0x74, creates
 * incoming row +0x70, and redraws text. UI/sprite/render state may change.
 */
extern "C" s32 func_ov023_021fd3b0(void *collection)
{
    void *ui = FIELD(void *, collection, 0x38);
    s32 extent = FIELD(s32, ui, 0x2c);
    if (FIELD(s32, ui, 0x30) != (extent + ((u32)extent >> 31)) / 2)
        return 0;
    if (FIELD(s32, ui, 0xc) != FIELD(s32, ui, 0x10)) {
        FIELD(s32, FIELD(void *, collection, 4), 0x1c) =
            45 - FIELD(s32, ui, 0xc) * 26;
        func_ov023_021fd220(collection, FIELD(s32, ui, 0x74));
        func_ov023_021fd164(collection, FIELD(s32, ui, 0x70));
        func_ov023_021fd268(collection);
    }
    return 1;
}
