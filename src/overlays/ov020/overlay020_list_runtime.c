#include "tingle/types.h"

/* Overlay 20 five-row scrolling list construction, rendering, and teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay020Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay020Row;

extern const u8 data_021f3ecc[];
extern void *data_020f4e18[];
extern const u8 data_ov020_021fe518[];
extern const u8 data_ov020_021fe520[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *Heap_AllocAlternateEntry(u32, const void *, s32, void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, s32, s32, s32);
extern const void *RetailTextTable_FindRecordById(const void *, u16);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02094154(void *, void *, s32, s32, s32, s32, s32);
extern void InventoryScroll_SetSpritePriority(void *, s32);
extern void InventoryScroll_UpdatePresentation(void *);
extern void *CxxArray_ConstructWithCookie(void *, s32, s32, s32, void (*)(void *), s32);
extern void CxxArray_DestroyAndFree(void *, s32, s32, void (*)(void *));
extern void func_ov020_021fce00(void *);
extern void func_ov020_021fd034(void *);
extern void func_ov020_021fd100(void *, s32);
extern void func_ov020_021fd184(void *, s32);
extern void func_ov020_021fd1cc(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the scrolling list with caller font +0 and capacity +0x3C. Create
 * renderer +4, initialize resource controller +8 and manager +0x14, set renderer
 * offsets 0x2F/0x1C, and load resources 0x1151..0x1153. For nonzero capacity,
 * allocate/construct capacity 12-byte row records at +0x38. Allocate the 0x80-
 * byte controller +0x44 and construct it with mode 5 for nonzero capacity or 1
 * otherwise, plus constants 0xDA/0x18/0x0C; select zero and update it. Load
 * manager IDs 0x7000/0x7006/0x7005 and return state. Heap, graphics, resource,
 * list-controller, and font SDK state change; no direct hardware access occurs.
 */
extern "C" void *func_ov020_021fce18(void *state, void *font, s32 capacity)
{
    AnimationResourceState_InitEmbedded((u8 *)state + 8);
    TitleCharacterResourceCollection_Init((u8 *)state + 0x14);
    FIELD(void *, state, 0) = font;
    FIELD(void *, state, 4) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(s32, FIELD(void *, state, 4), 0x18) = 0x2f;
    FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x1c;
    AnimationResourceState_ReplaceResources((u8 *)state + 8, data_020f4e18[0],
                  0x1151, 0x1152, 0x1153);
    FIELD(s32, state, 0x3c) = capacity;
    FIELD(s32, state, 0x40) = 0;

    if (capacity != 0) {
        void *rows = Heap_AllocAlternateEntry(capacity * 12 + 8,
                                   data_ov020_021fe518, 4, gHeapContext);
        if (rows != 0)
            rows = CxxArray_ConstructWithCookie(rows, capacity, 12, 8,
                                 func_ov020_021fce00, 0);
        FIELD(void *, state, 0x38) = rows;
    } else {
        FIELD(void *, state, 0x38) = 0;
    }

    void *controller = Heap_Alloc(0x80, data_ov020_021fe520,
                                  4, gHeapContext);
    if (controller != 0)
        controller = func_02094154(controller, font, capacity,
                                   capacity != 0 ? 5 : 1,
                                   0xda, 0x18, 0x0c);
    FIELD(void *, state, 0x44) = controller;
    InventoryScroll_SetSpritePriority(controller, 0);
    InventoryScroll_UpdatePresentation(controller);
    func_02092814((u8 *)state + 0x14, 0x7000);
    func_02092814((u8 *)state + 0x14, 0x7006);
    func_02092814((u8 *)state + 0x14, 0x7005);
    return state;
}

/*
 * Release renderer +4, virtually destroy controller +0x44, destroy the row
 * array at +0x38 through 0x020C0C24 using 12-byte records/header 8 and no-op
 * destructor 0x021FD034, then tear down manager +0x14 and resources +8. Return
 * state without freeing it. Heap/resource/UI ownership changes; no MMIO.
 */
extern "C" void *func_ov020_021fcfd4(void *state)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 4));
    void *controller = FIELD(void *, state, 0x44);
    if (controller != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, controller, 0)[1](controller);
    }
    if (FIELD(void *, state, 0x38) != 0)
        CxxArray_DestroyAndFree(FIELD(void *, state, 0x38), 12, 8,
                      func_ov020_021fd034);
    func_020927b8((u8 *)state + 0x14);
    AnimationResourceState_Destroy((u8 *)state + 8);
    return state;
}

/*
 * Append caller descriptor to the next 12-byte row when storage exists and
 * count +0x40 is below capacity +0x3C. Clear its sprite, set X=0 and Y to
 * index*24, increment count, and return the row pointer. Return null on failure.
 * Only list memory changes; no SDK or hardware effects occur.
 */
extern "C" Overlay020Row *func_ov020_021fd038(void *state,
                                               const void *descriptor)
{
    Overlay020Row *rows = FIELD(Overlay020Row *, state, 0x38);
    s32 index = FIELD(s32, state, 0x40);
    if (rows == 0 || index >= FIELD(s32, state, 0x3c))
        return 0;
    rows[index].descriptor = descriptor;
    rows[index].sprite = 0;
    rows[index].x = 0;
    rows[index].y = index * 0x18;
    FIELD(s32, state, 0x40) = index + 1;
    return &rows[index];
}

/*
 * Set renderer +4 vertical offset to 0x1C minus controller first-visible index
 * +0x0C times 24, then lazily create every row from that index through its
 * visible-count +8 inclusive endpoint. Returns void. Sprite/renderer SDK and
 * list state may change; no direct hardware access occurs.
 */
extern "C" void func_ov020_021fd0a0(void *state)
{
    void *controller = FIELD(void *, state, 0x44);
    s32 first = FIELD(s32, controller, 0xc);
    FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x1c - first * 0x18;
    s32 last = first + FIELD(s32, controller, 8) - 1;
    for (s32 index = first; index <= last; index++)
        func_ov020_021fd100(state, index);
}

/*
 * For an in-range populated row whose sprite is null, create kind-1 sprite from
 * renderer +4/resource +8, configure it with descriptor byte +0x12 and row X/Y
 * halfwords, and use zero trailing values. Returns void. Row and sprite SDK
 * state may change; no direct hardware access occurs.
 */
extern "C" void func_ov020_021fd100(void *state, s32 index)
{
    if (index < FIELD(s32, state, 0x40)) {
        Overlay020Row *row = &FIELD(Overlay020Row *, state, 0x38)[index];
        if (row->sprite == 0) {
            row->sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 4),
                                        (u8 *)state + 8, 1);
            GraphicsSpriteState_ApplyRenderConfig(row->sprite, FIELD(u8, row->descriptor, 0x12),
                          row->x, row->y, 0, 0, 0);
        }
    }
}

/*
 * Destroy and clear the sprite for an in-range populated row when present.
 * Returns void. Sprite SDK and row state may change; no hardware effects.
 */
extern "C" void func_ov020_021fd184(void *state, s32 index)
{
    if (index < FIELD(s32, state, 0x40)) {
        Overlay020Row *row = &FIELD(Overlay020Row *, state, 0x38)[index];
        if (row->sprite != 0) {
            GraphicsSpriteState_ReleaseFromGroup(row->sprite);
            row->sprite = 0;
        }
    }
}

/*
 * Commit font +0, then render up to five localized row labels beginning at the
 * controller first-visible index +0x0C. Each descriptor message ID is halfword
 * +0x0C; render returned text +2 at X=0x42 and Y=0x15+row*24 using confirmed
 * style constants 14/8/0 and target +0x18. Returns void. Font/render SDK state
 * changes; no direct hardware access occurs.
 */
extern "C" void func_ov020_021fd1cc(void *state)
{
    GraphicsSpriteRenderer_ClearTextBuffer(FIELD(void *, state, 0));
    if (FIELD(s32, state, 0x40) == 0)
        return;
    s32 first = FIELD(s32, FIELD(void *, state, 0x44), 0xc);
    for (s32 rowIndex = 0; rowIndex < 5; rowIndex++) {
        s32 index = first + rowIndex;
        if (index >= FIELD(s32, state, 0x40))
            return;
        const void *descriptor =
            FIELD(Overlay020Row *, state, 0x38)[index].descriptor;
        GraphicsSpriteRenderer_SetFontResource(FIELD(void *, state, 0), (u8 *)state + 0x18);
        const void *text = RetailTextTable_FindRecordById(
            data_021f3ecc, FIELD(u16, descriptor, 0xc));
        GraphicsSpriteRenderer_DrawText(FIELD(void *, state, 0), (u8 *)text + 2,
                      0x42, 0x15 + rowIndex * 0x18, 14, 8, 0);
    }
}

/*
 * Return zero until controller +0x30 reaches half of signed +0x2C (with
 * truncation toward zero). At that point, if first-visible +0x0C differs from
 * target +0x10, update renderer offset, destroy row index +0x74, create row
 * +0x70, and rerender labels; return one regardless of whether a swap was
 * needed. List, sprite, renderer, and font SDK state may change; no MMIO.
 */
extern "C" s32 func_ov020_021fd280(void *state)
{
    void *controller = FIELD(void *, state, 0x44);
    if (FIELD(s32, controller, 0x30) != FIELD(s32, controller, 0x2c) / 2)
        return 0;
    s32 first = FIELD(s32, controller, 0xc);
    if (first != FIELD(s32, controller, 0x10)) {
        FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x1c - first * 0x18;
        func_ov020_021fd184(state, FIELD(s32, controller, 0x74));
        func_ov020_021fd100(state, FIELD(s32, controller, 0x70));
        func_ov020_021fd1cc(state);
    }
    return 1;
}
