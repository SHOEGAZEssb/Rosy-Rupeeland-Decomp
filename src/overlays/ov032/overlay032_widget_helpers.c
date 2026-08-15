#include "tingle/types.h"

/* Overlay 32 detail-widget row hit testing, rendering, and custom list-object construction/destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *gHeapContext;
extern const u8 data_021f6288[];
extern const u8 data_020f263c[];
extern const u8 data_ov032_02202308[];
extern const u8 data_ov032_02202358[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(...);
extern void func_ov032_02201ea4(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void *func_02097f30(void *);
extern void GraphicsSpriteRenderer_DrawText(...);
extern void *func_02093cb4(void *);
extern void func_02071ea4(void *);
extern void func_02071ee0(...);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(...);
extern void func_02073e48(...);
extern void *Heap_Alloc(...);
extern void Heap_Free(void *);
extern void *SpritePresentation_Init(...);
extern void Presentation_SetPosition(...);
extern void SpritePresentation_SyncPosition(void *);
extern void func_02093d20(...);
extern void func_020944f0(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void func_02094494(void *);
#ifdef __cplusplus
}
#endif

/*
 * Converts touch `point` into a visible row index for `widget`. The active
 * rectangle is X=40..201, Y=26..136; rows are 22 pixels high and clamped to
 * row four. It adds the list's scroll index at [+0x4C]+0x0C and rejects indices
 * beyond widget count +0x0C. Returns the selected index or -1.
 */
extern "C" s32 func_ov032_02201de4(void *widget, void *point)
{
    s32 x = FIELD(s32, point, 4) - 0x28;
    s32 y = FIELD(s32, point, 8) - 0x1a;
    if (x < 0 || x > 0xa1 || y < 0 || y > 0x6e) return -1;
    s32 row = func_020befec(y, 0x16);
    if (row >= 5) row = 4;
    s32 index = row + FIELD(s32, FIELD(void *, widget, 0x4c), 0xc);
    return index >= FIELD(s32, widget, 0xc) + 1 ? -1 : index;
}

/*
 * Tests whether list animation +0x30 reached signed half of +0x2C. At that
 * midpoint it redraws rows if indices +0x0C/+0x10 differ and returns one;
 * otherwise it returns zero. The list object is at widget +0x4C.
 */
extern "C" s32 func_ov032_02201e58(void *widget)
{
    void *list = FIELD(void *, widget, 0x4c);
    s32 value = FIELD(s32, list, 0x2c);
    if (FIELD(s32, list, 0x30) != (value + ((u32)value >> 31)) >> 1) return 0;
    if (FIELD(s32, list, 0xc) != FIELD(s32, list, 0x10)) func_ov032_02201ea4(widget);
    return 1;
}

/*
 * Clears the shared canvas and draws up to five records beginning at the list's
 * scroll index. Records come from 0x021F6288; halfword +2 selects style 3 when
 * equal to one, otherwise style 1. Text is placed at X=40 and Y=28+24*row with
 * confirmed SDK parameters style, 8, and 0. Returns void.
 */
extern "C" void func_ov032_02201ea4(void *widget)
{
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
    s32 base = FIELD(s32, FIELD(void *, widget, 0x4c), 0xc);
    for (s32 row = 0; row < 5 && row + base < FIELD(s32, widget, 0xc) + 1; ++row) {
        u8 *record = (u8 *)data_021f6288 + (row + base) * 8;
        s32 style = FIELD(u16, record, 2) == 1 ? 3 : 1;
        GraphicsSpriteRenderer_DrawText(data_020f4e14[0], func_02097f30(record), 0x28,
                      row * 0x18 + 0x1c, style, 8, 0);
    }
}

/* Constructs the SDK list base, installs vtable 0x020F263C, initializes resource set +0x54, and returns `object`. */
extern "C" void *func_ov032_02201f58(void *object)
{
    func_02093cb4(object);
    FIELD(const void *, object, 0) = data_020f263c;
    func_02071ea4((u8 *)object + 0x54);
    return object;
}

/*
 * Constructs the 0x80-byte custom list object. It installs overlay vtable
 * 0x02202308, loads archive resources 7/8/9, creates header/marker sprites and
 * two 0xA0-byte scroll elements, configures list bounds from `arg4`/`arg5` and
 * vertical extent `height`, and hides the end marker when the initial range is
 * exhausted. Returns `object`; heap/renderer/resource SDK state changes.
 */
extern "C" void *func_ov032_02201f80(void *object, void *canvas, s32 arg2, s32 arg3,
                                      s32 arg4, s32 arg5, s32 height)
{
    func_ov032_02201f58(object);
    FIELD(const void *, object, 0) = data_ov032_02202308;
    FIELD(void *, object, 0x4c) = canvas;
    FIELD(s32, object, 0x6c) = height;
    func_02071ee0((u8 *)object + 0x54, data_020f4e18[0], 7, 8, 9);
    void *resource = GraphicsSpriteGroupOwner_CreateGroup(canvas);
    FIELD(void *, object, 0x50) = resource;
    FIELD(s32, resource, 0x18) = arg4;
    FIELD(s32, resource, 0x1c) = arg5;

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(resource, (u8 *)object + 0x54, 1);
    func_02073e48(sprite, 6, 0, 0x2e, 2, 0x4000, 0);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(resource, (u8 *)object + 0x54, 1);
    func_02073e48(sprite, 7, 0, height + 0x2e, 2, 0x4000, 0);
    if (height > 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(resource, (u8 *)object + 0x54, 1);
        func_02073e48(sprite, 8, 0, height / 2 + 0x2e, 2, 0x4001, 0);
    }

    s32 secondOffset = (height + 0x5c) << 12;
    for (s32 i = 0; i < 2; ++i) {
        void *part = Heap_Alloc(0xa0, data_ov032_02202358, 4, gHeapContext);
        if (part != 0)
            part = SpritePresentation_Init(part, GraphicsSpriteGroup_CreateStateFromSource(resource, (u8 *)object + 0x54, 1));
        FIELD(void *, object, 0x64 + i * 4) = part;
        void *sdk = FIELD(void *, part, 0x9c);
        FIELD(u8, sdk, 0x3a) = 2;
        FIELD(u16, sdk, 0x28) = 0x3000;
        Presentation_SetPosition(part, 0, i == 0 ? 0 : secondOffset, 0);
        SpritePresentation_SyncPosition(part);
    }
    FIELD(void *, object, 0x60) = GraphicsSpriteGroup_CreateStateFromSource(resource, (u8 *)object + 0x54, 1);
    func_02073e48(FIELD(void *, object, 0x60), 4, 0, 0, 2, 0x2000, 0);
    func_02093d20(object, arg2, arg3, 0);
    FIELD(s32, object, 0x3c) = 0;
    FIELD(s32, object, 0x40) = 0x10;
    FIELD(s32, object, 0x44) = height + 0x3c;
    func_020944f0(object);
    if (FIELD(s32, object, 8) >= FIELD(s32, object, 4)) {
        FIELD(u16, FIELD(void *, object, 0x60), 0x24) |= 4;
        GraphicsSpriteGroup_ReleaseIndexedEntries(resource);
    }
    return object;
}

/* Runs the SDK list destructor for `object` and returns the same pointer without freeing it. */
extern "C" void *func_ov032_022021f0(void *object)
{
    func_02094494(object);
    return object;
}

/* Frees `object` from the heap and returns the original pointer; no SDK teardown is performed here. */
extern "C" void *func_ov032_02202204(void *object)
{
    Heap_Free(object);
    return object;
}
