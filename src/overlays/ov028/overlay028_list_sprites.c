#include "tingle/types.h"

/* Overlay 28 visible-row sprite activation, creation, and destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay028Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay028Row;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_ov028_021fd390(void *, s32);
extern void func_ov028_021fd420(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clears active flag +0x48 and resets both the controller object at +0x44/+0x50
 * and renderer +4 through the SDK. Returns void and changes UI SDK state.
 */
extern "C" void func_ov028_021fd2c4(void *state)
{
    FIELD(s32, state, 0x48) = 0;
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, state, 0x44), 0x50));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, state, 4));
}

/*
 * Sets renderer +4 Y offset to 0x1C minus first-visible index +0x0C times 24,
 * then lazily creates each sprite in the controller's visible range +8.
 * Returns void; row storage and sprite/renderer SDK state may change.
 */
extern "C" void func_ov028_021fd2ec(void *state)
{
    void *controller = FIELD(void *, state, 0x44);
    s32 first = FIELD(s32, controller, 0xc);
    FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x1c - first * 0x18;
    s32 last = first + FIELD(s32, controller, 8) - 1;
    for (s32 index = first; index <= last; ++index)
        func_ov028_021fd390(state, index);
}

/*
 * Destroys each existing sprite in the controller's visible range beginning at
 * first-visible +0x0C and spanning count +8. Returns void; sprite SDK state and
 * row sprite pointers may change.
 */
extern "C" void func_ov028_021fd34c(void *state)
{
    void *controller = FIELD(void *, state, 0x44);
    s32 first = FIELD(s32, controller, 0xc);
    s32 last = first + FIELD(s32, controller, 8) - 1;
    for (s32 index = first; index <= last; ++index)
        func_ov028_021fd420(state, index);
}

/*
 * For an in-range row with no sprite, creates a kind-1 sprite from renderer +4
 * and resources +8. It uses the row index as the sprite selector, adding 0x32
 * when descriptor +0 is non-null, and applies the row X/Y halfwords with three
 * zero trailing parameters. Returns void; row and sprite SDK state may change.
 */
extern "C" void func_ov028_021fd390(void *state, s32 index)
{
    if (index < FIELD(s32, state, 0x40)) {
        Overlay028Row *row = &FIELD(Overlay028Row *, state, 0x38)[index];
        if (row->sprite == 0) {
            row->sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 4),
                                        (u8 *)state + 8, 1);
            s32 selector = index;
            if (row->descriptor != 0)
                selector += 0x32;
            func_02073e48(row->sprite, selector, row->x, row->y, 0, 0, 0);
        }
    }
}

/*
 * Destroys and clears the sprite for an in-range populated row when present.
 * Returns void; sprite SDK state and the row's +4 pointer change.
 */
extern "C" void func_ov028_021fd420(void *state, s32 index)
{
    if (index < FIELD(s32, state, 0x40)) {
        Overlay028Row *row = &FIELD(Overlay028Row *, state, 0x38)[index];
        if (row->sprite != 0) {
            GraphicsSpriteState_ReleaseFromGroup(row->sprite);
            row->sprite = 0;
        }
    }
}
