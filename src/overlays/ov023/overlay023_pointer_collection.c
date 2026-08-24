#include "tingle/types.h"

/* Overlay 23 pointer-backed collection with one shared icon, grouped text, and scrolling input. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern void *data_021f5128;
extern const u8 data_ov023_021ffbe0[];
extern const u8 data_ov023_021ffbe8[];
extern u8 gSystemState[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *func_02003e20(u32, const void *, u32, void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, ...);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, ...);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, ...);
extern const void *RecordMode_GetMessageGroup(void *);
extern s32 func_0207b464(void *);
extern s32 func_0207b490(void *);
extern s32 func_0207b4bc(void *);
extern s32 func_0207b4e8(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02094154(void *, void *, s32, s32, ...);
extern void InventoryScroll_SetSpritePriority(void *, s32);
extern void InventoryScroll_UpdatePresentation(void *);
extern s32 func_020befec(s32, s32);
extern void func_020c09cc(void *, s32, s32, s32, ...);
extern void func_020c0c24(void *, s32, s32, void *);
extern void func_ov023_021fd438(void *);
extern void func_ov023_021fd630(void *);
extern void func_ov023_021fd780(void *);
extern void func_ov023_021fd7a8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a pointer-backed collection with capacity `capacity`. It
 * initializes resource descriptor +8 and input +0x18, clones font +4, allocates
 * a constructed pointer array +0x3C, creates scrolling UI +0x48, hides it, and
 * registers input codes 0x7007/0x7000/0x7005. The zero-capacity UI uses a
 * one-row fallback. Heap/font/UI/input state changes; returns the collection.
 */
extern "C" void *func_ov023_021fd444(void *collection, void *font, s32 capacity)
{
    AnimationResourceState_InitEmbedded((u8 *)collection + 8);
    TitleCharacterResourceCollection_Init((u8 *)collection + 0x18);
    FIELD(void *, collection, 0) = font;
    FIELD(void *, collection, 4) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(s32, collection, 0x40) = capacity;
    FIELD(s32, collection, 0x44) = 0;
    FIELD(void *, collection, 0x14) = 0;
    void *items = 0;
    if (capacity) {
        items = func_02003e20(capacity * 4 + 8,
                              data_ov023_021ffbe8, 4, gHeapContext);
        if (items) func_020c09cc(items, capacity, 4, 8,
                                func_ov023_021fd438, 0);
    }
    FIELD(void *, collection, 0x3c) = items;
    void *ui = Heap_Alloc(0x80, data_ov023_021ffbe0, 4, gHeapContext);
    if (ui) ui = func_02094154(ui, font, capacity ? capacity : 1,
                              capacity ? 4 : 1, 0xdc, 58, -22);
    FIELD(void *, collection, 0x48) = ui;
    InventoryScroll_SetSpritePriority(ui, 0);
    InventoryScroll_UpdatePresentation(ui);
    func_ov023_021fd780(collection);
    func_02092814((u8 *)collection + 0x18, 0x7007);
    func_02092814((u8 *)collection + 0x18, 0x7000);
    func_02092814((u8 *)collection + 0x18, 0x7005);
    return collection;
}

/*
 * Releases cloned font +4, the scrolling UI through its virtual destructor,
 * pointer array +0x3C, input +0x18, and resource descriptor +8, then returns
 * the collection. Heap and SDK resource ownership change.
 */
extern "C" void *func_ov023_021fd5d0(void *collection)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, collection, 4));
    void *ui = FIELD(void *, collection, 0x48);
    if (ui) {
        typedef void (*Dtor)(void *);
        ((Dtor)FIELD(void *, FIELD(void *, ui, 0), 4))(ui);
    }
    if (FIELD(void *, collection, 0x3c))
        func_020c0c24(FIELD(void *, collection, 0x3c), 4, 8,
                      (void *)func_ov023_021fd630);
    func_020927b8((u8 *)collection + 0x18);
    AnimationResourceState_Destroy((u8 *)collection + 8);
    return collection;
}

/*
 * Appends `record` and returns its four-byte array element, or null when full.
 * The first append also initializes shared descriptor +8 from the record's
 * bank, creates slot-2 sprite +0x14, and places it at (42,48). Collection,
 * sprite, and resource state change.
 */
extern "C" void *func_ov023_021fd634(void *collection, void *record)
{
    u8 *items = FIELD(u8 *, collection, 0x3c);
    s32 index = FIELD(s32, collection, 0x44);
    if (!items || index >= FIELD(s32, collection, 0x40)) return 0;
    FIELD(void *, items, index * 4) = record;
    void *element = items + index * 4;
    if (!FIELD(void *, collection, 0x14)) {
        u32 bank_index = FIELD(u32, FIELD(void *, record, 4), 0xc) & 0xff;
        void *bank = ((void **)data_021f5128)[bank_index];
        s32 a = func_0207b464((u8 *)bank + 0x660);
        s32 b = func_0207b490((u8 *)bank + 0x660);
        s32 c = func_0207b4bc((u8 *)bank + 0x660);
        func_02071ee0((u8 *)collection + 8, data_020f4e18, a, b, c);
        FIELD(void *, collection, 0x14) = GraphicsSpriteGroup_CreateStateFromSource(
            FIELD(void *, collection, 4), (u8 *)collection + 8, 2);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, collection, 0x14),
                      func_0207b4e8((u8 *)bank + 0x660), 42, 48, 1, 0, 0);
    }
    FIELD(s32, collection, 0x44) = index + 1;
    return element;
}

/* Shows this collection and enables its UI/font objects where rows remain. */
extern "C" void func_ov023_021fd730(void *collection)
{
    FIELD(s32, collection, 0x4c) = 1;
    void *ui = FIELD(void *, collection, 0x48);
    if (FIELD(s32, collection, 0x44)) {
        if (FIELD(s32, ui, 8) < FIELD(s32, ui, 4))
            FIELD(s32, FIELD(void *, ui, 0x50), 0x20) = 1;
    } else GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, ui, 0x50));
    FIELD(s32, FIELD(void *, collection, 4), 0x20) = 1;
}

/* Hides this collection's UI +0x50 and cloned font/object +4. */
extern "C" void func_ov023_021fd780(void *collection)
{
    FIELD(s32, collection, 0x4c) = 0;
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, collection, 0x48), 0x50));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, collection, 4));
}

/*
 * Clears and redraws up to four visible rows. The first row additionally draws
 * a bank-derived group label at x=64 and y=32 (or 30 when system byte +0x5F is
 * nonzero); every row draws record text at x=68, y=53+22*row. Font/render state
 * changes; collection data is read only.
 */
extern "C" void func_ov023_021fd7a8(void *collection)
{
    GraphicsSpriteCanvas_FillRect(FIELD(void *, collection, 0), 0, 0, 0xff, 0xb0, 0);
    s32 drew_header = 0;
    for (s32 row = 0; row < 4; ++row) {
        s32 index = row + FIELD(s32, FIELD(void *, collection, 0x48), 0xc);
        if (index >= FIELD(s32, collection, 0x44)) break;
        void *record = ((void **)FIELD(void *, collection, 0x3c))[index];
        if (!drew_header) {
            GraphicsSpriteRenderer_SetFontResource(FIELD(void *, collection, 0),
                          FIELD(void *, collection, 0x20));
            u32 bank_index = FIELD(u32, FIELD(void *, record, 4), 0xc) & 0xff;
            const void *label = RecordMode_GetMessageGroup(
                (u8 *)((void **)data_021f5128)[bank_index] + 0x660);
            GraphicsSpriteRenderer_DrawText(FIELD(void *, collection, 0), label, 0x40,
                          gSystemState[0x5f] ? 0x1e : 0x20, 14, 8, 0);
            drew_header = 1;
        }
        GraphicsSpriteRenderer_SetFontResource(FIELD(void *, collection, 0),
                      FIELD(void *, collection, 0x18));
        GraphicsSpriteRenderer_DrawText(FIELD(void *, collection, 0),
                      (u8 *)FIELD(void *, record, 4) + 0x2c,
                      0x44, 0x35 + row * 0x16, 14, 8, -2);
    }
}

/* Maps x=64..208 and y=49..137 touch coordinates to a valid 22-pixel row. */
extern "C" s32 func_ov023_021fd8e4(void *collection, const void *touch)
{
    s32 x = FIELD(s32, touch, 4) - 0x40;
    s32 y = FIELD(s32, touch, 8) - 0x31;
    if (x < 0 || x > 0x90 || y < 0 || y > 0x58) return -1;
    s32 row = func_020befec(y, 0x16);
    if (row >= 4) row = 3;
    s32 index = row + FIELD(s32, FIELD(void *, collection, 0x48), 0xc);
    return index < FIELD(s32, collection, 0x44) ? index : -1;
}

/* Returns the four-byte pointer element selected by UI field +0x14. */
extern "C" void *func_ov023_021fd954(void *collection)
{
    return FIELD(u8 *, collection, 0x3c) +
           FIELD(s32, FIELD(void *, collection, 0x48), 0x14) * 4;
}

/*
 * Returns zero before the scroll animation midpoint and one at midpoint. When
 * scroll +0xC changed from target +0x10, it redraws visible rows. Rendering may
 * change; no collection records are mutated.
 */
extern "C" s32 func_ov023_021fd968(void *collection)
{
    void *ui = FIELD(void *, collection, 0x48);
    s32 extent = FIELD(s32, ui, 0x2c);
    if (FIELD(s32, ui, 0x30) != (extent + ((u32)extent >> 31)) / 2) return 0;
    if (FIELD(s32, ui, 0xc) != FIELD(s32, ui, 0x10))
        func_ov023_021fd7a8(collection);
    return 1;
}
