#include "tingle/types.h"

/* Overlay 21 list-row ownership, visibility, sprite, selection, and hit-test helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay021Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay021Row;

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern s32 func_020befec(s32, s32);
extern void func_020927b8(void *);
extern void CxxArray_DestroyAndFree(void *, s32, s32, void (*)(void *));
extern void Overlay021Row_DestroyNoOp(void *);
extern void func_ov021_021fd2b4(void *, s32);
extern void func_ov021_021fd354(void *, s32);
extern void func_ov021_021fd39c(void *);
extern void func_ov021_021fd490(void *);
#ifdef __cplusplus
}
#endif

/*
 * Clear a 12-byte row's descriptor, sprite, X, and Y fields. The caller-owned
 * row changes; no allocation, SDK calls, or hardware effects occur. Returns void.
 */
extern "C" void func_ov021_021fce00(Overlay021Row *row)
{
    row->descriptor = 0;
    row->sprite = 0;
    row->x = 0;
    row->y = 0;
}

/*
 * Destroy renderers +0x1C/+0x20, invoke the controller +0x58 virtual
 * destructor when present, destroy the row array +0x4C with 12-byte stride and
 * 8-byte allocation header, then release manager +0x28 and resources +0x10/+4.
 * Return state without freeing it. Heap/UI/resource SDK ownership changes; no
 * direct hardware access occurs.
 */
extern "C" void *func_ov021_021fd074(void *state)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x1c));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x20));
    void *controller = FIELD(void *, state, 0x58);
    if (controller != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, controller, 0)[1](controller);
    }
    if (FIELD(void *, state, 0x4c) != 0)
        CxxArray_DestroyAndFree(FIELD(void *, state, 0x4c), 12, 8,
                      Overlay021Row_DestroyNoOp);
    func_020927b8((u8 *)state + 0x28);
    AnimationResourceState_Destroy((u8 *)state + 0x10);
    AnimationResourceState_Destroy((u8 *)state + 4);
    return state;
}

/* Empty row destructor callback; reads no input, changes no state, and returns void. */
extern "C" void Overlay021Row_DestroyNoOp(void *row)
{
    (void)row;
}

/*
 * Append a descriptor to the next 12-byte row at +0x4C when storage exists and
 * count +0x54 is below capacity +0x50. Clear its sprite, set X=0 and
 * Y=index*24, increment the count, and return the appended row. Return null on
 * failure. Only list memory changes; no SDK/hardware effects.
 */
extern "C" Overlay021Row *func_ov021_021fd0e8(void *state,
                                               const void *descriptor)
{
    Overlay021Row *rows = FIELD(Overlay021Row *, state, 0x4c);
    s32 index = FIELD(s32, state, 0x54);
    if (rows != 0 && index < FIELD(s32, state, 0x50)) {
        rows[index].descriptor = descriptor;
        rows[index].sprite = 0;
        rows[index].x = 0;
        rows[index].y = (s16)(index * 0x18);
        FIELD(s32, state, 0x54) = index + 1;
        return &rows[index];
    }
    return 0;
}

/*
 * Scan populated rows for the first descriptor whose nested record +4 has
 * category bits 8..11 equal to 1, low byte other than 8, and halfword +4 equal
 * to 1. Return its row index or -1. State is read only; no SDK/hardware effects.
 */
extern "C" s32 func_ov021_021fd150(void *state)
{
    Overlay021Row *rows = FIELD(Overlay021Row *, state, 0x4c);
    s32 i;
    for (i = 0; i < FIELD(s32, state, 0x54); i++) {
        const u8 *record = FIELD(const u8 *, rows[i].descriptor, 4);
        u32 flags = FIELD(u32, record, 0xc);
        if (((flags >> 8) & 0xf) == 1 && (flags & 0xff) != 8 &&
            FIELD(u16, record, 4) == 1)
            return i;
    }
    return -1;
}

/*
 * Return descriptor->record(+4) category bits 8..11. Inputs and global state
 * are read only; the value is in range 0..15 and no SDK/hardware effects occur.
 */
extern "C" u32 func_ov021_021fd1b8(const void *descriptor)
{
    const u8 *record = FIELD(const u8 *, descriptor, 4);
    return (FIELD(u32, record, 0xc) >> 8) & 0xf;
}

/*
 * Mark the list visible at +0x5C. For nonempty lists, request the controller's
 * +0x50 object when its +8 position trails +4; for empty lists, hide that
 * object. Mark both renderers +0x1C/+0x20 visible and return void. UI state
 * changes through GraphicsSpriteGroup_ReleaseIndexedEntries or direct visibility words; no MMIO.
 */
extern "C" void func_ov021_021fd1cc(void *state)
{
    FIELD(s32, state, 0x5c) = 1;
    void *controller = FIELD(void *, state, 0x58);
    if (FIELD(s32, state, 0x54) != 0) {
        if (FIELD(s32, controller, 8) < FIELD(s32, controller, 4))
            FIELD(s32, FIELD(void *, controller, 0x50), 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, controller, 0x50));
    }
    FIELD(s32, FIELD(void *, state, 0x1c), 0x20) = 1;
    FIELD(s32, FIELD(void *, state, 0x20), 0x20) = 1;
}

/*
 * Clear visible flag +0x5C and hide the controller +0x50 object plus renderers
 * +0x1C/+0x20. UI visibility changes through GraphicsSpriteGroup_ReleaseIndexedEntries; returns void and
 * performs no direct hardware access.
 */
extern "C" void func_ov021_021fd224(void *state)
{
    FIELD(s32, state, 0x5c) = 0;
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, state, 0x58), 0x50));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, state, 0x1c));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, state, 0x20));
}

/*
 * Align renderer +0x1C to controller first-visible index +0x0C using
 * Y=0x1C-index*24, then ensure sprites exist for each visible row from that
 * index through index+visibleCount(+8)-1. Sprite/UI state may change; returns
 * void and performs no direct MMIO.
 */
extern "C" void Overlay021List_SyncFirstVisibleRow(void *state)
{
    void *controller = FIELD(void *, state, 0x58);
    s32 first = FIELD(s32, controller, 0xc);
    FIELD(s32, FIELD(void *, state, 0x1c), 0x1c) = 0x1c - first * 0x18;
    s32 i;
    for (i = first; i <= first + FIELD(s32, controller, 8) - 1; i++)
        func_ov021_021fd2b4(state, i);
}

/*
 * If row index is populated, has a descriptor, and lacks a sprite, create it
 * from renderer +0x1C/resource +0x10. Use animation 3 when descriptor record
 * halfword +4 is at least 2, otherwise 1, and place it at stored row X/Y with
 * constants 0,0,2. Sprite SDK state changes; returns void and no MMIO occurs.
 */
extern "C" void func_ov021_021fd2b4(void *state, s32 index)
{
    if (index >= FIELD(s32, state, 0x54))
        return;
    Overlay021Row *row = &FIELD(Overlay021Row *, state, 0x4c)[index];
    if (row->descriptor == 0 || row->sprite != 0)
        return;
    row->sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x1c),
                                (u8 *)state + 0x10, 1);
    const u8 *record = FIELD(const u8 *, row->descriptor, 4);
    GraphicsSpriteState_ApplyRenderConfig(row->sprite, FIELD(u16, record, 4) >= 2 ? 3 : 1,
                  row->x, row->y, 0, 0, 2);
}

/*
 * Destroy and clear the sprite for a populated row index when one exists.
 * Sprite SDK ownership changes; returns void and performs no hardware access.
 */
extern "C" void func_ov021_021fd354(void *state, s32 index)
{
    if (index < FIELD(s32, state, 0x54)) {
        Overlay021Row *row = &FIELD(Overlay021Row *, state, 0x4c)[index];
        if (row->sprite != 0) {
            GraphicsSpriteState_ReleaseFromGroup(row->sprite);
            row->sprite = 0;
        }
    }
}

/*
 * Map input +4/+8 inside X=16..216,Y=16..112 to a 24-pixel visible row,
 * clamping row 4+ to 3, add controller first-visible +0x0C, and return it when
 * below populated count +0x54; otherwise return -1. State is read only;
 * division uses func_020BEFEC and no hardware is accessed.
 */
extern "C" s32 func_ov021_021fd678(void *state, const void *input)
{
    s32 x = FIELD(s32, input, 4) - 0x10;
    s32 y = FIELD(s32, input, 8) - 0x10;
    if (x < 0 || x > 0xc8 || y < 0 || y > 0x60)
        return -1;
    s32 row = func_020befec(y, 0x18);
    if (row >= 4)
        row = 3;
    row += FIELD(s32, FIELD(void *, state, 0x58), 0xc);
    return row < FIELD(s32, state, 0x54) ? row : -1;
}

/*
 * Return the current 12-byte row selected by controller index +0x14. State is
 * read only; the returned pointer aliases list storage and no SDK/MMIO occurs.
 */
extern "C" Overlay021Row *func_ov021_021fd6e8(void *state)
{
    s32 index = FIELD(s32, FIELD(void *, state, 0x58), 0x14);
    return &FIELD(Overlay021Row *, state, 0x4c)[index];
}

/*
 * When controller motion fields +0x2C/+0x30 reach their midpoint condition,
 * update renderer Y for a changed first-visible index, destroy row +0x74,
 * create row +0x70, redraw the list and details, and return 1. Return 0 while
 * motion has not reached the condition. Sprite/UI state changes; no MMIO.
 */
extern "C" s32 func_ov021_021fd700(void *state)
{
    void *controller = FIELD(void *, state, 0x58);
    s32 value = FIELD(s32, controller, 0x2c);
    if (FIELD(s32, controller, 0x30) !=
        (value + (value < 0 ? 1 : 0)) / 2)
        return 0;
    if (FIELD(s32, controller, 0xc) != FIELD(s32, controller, 0x10)) {
        FIELD(s32, FIELD(void *, state, 0x1c), 0x1c) =
            0x1c - FIELD(s32, controller, 0xc) * 0x18;
        func_ov021_021fd354(state, FIELD(s32, controller, 0x74));
        func_ov021_021fd2b4(state, FIELD(s32, controller, 0x70));
        func_ov021_021fd39c(state);
    }
    func_ov021_021fd490(state);
    return 1;
}
