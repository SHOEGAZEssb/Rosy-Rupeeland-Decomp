#include "tingle/types.h"

/* Overlay 16 visible-row creation, destruction, and selected-row refresh. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void InventoryScroll_UpdatePresentation(void *);
extern void func_ov016_021fd270(void *, s32);
extern void *func_ov016_021fd628(void *);
#ifdef __cplusplus
}
#endif

/*
 * Align the first child object's vertical position to the presentation's first
 * visible row, then create sprites for every visible index in the inclusive
 * range [+0x0C, +0x0C + +0x08 - 1] of the object at +0x58. Child fields and
 * descriptor sprite pointers may change. Return void; graphics resources are
 * created through SDK helpers, with no direct MMIO.
 */
extern "C" void func_ov016_021fd210(void *state)
{
    void *presentation = FIELD(void *, state, 0x58);
    s32 index = FIELD(s32, presentation, 0xc);
    s32 end = index + FIELD(s32, presentation, 8) - 1;

    FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x20 - index * 0x18;
    for (; index <= end; index++) {
        func_ov016_021fd270(state, index);
    }
}

/*
 * Create the sprite for one descriptor index when it is populated and lacks a
 * sprite at +4. The signed coordinates come from +8/+0xA; resource index is the
 * row index, offset by 0x32 when flag bits 0-2 at +0xC are all clear. Store the
 * new sprite pointer and return void. SDK graphics state changes; no direct MMIO.
 */
extern "C" void func_ov016_021fd270(void *state, s32 index)
{
    void *descriptor;
    void *sprite;
    s32 resourceIndex;

    if (index >= FIELD(s32, state, 0x54)) {
        return;
    }
    descriptor = (u8 *)FIELD(void *, state, 0x4c) + index * 0x14;
    if (FIELD(void *, descriptor, 4) != 0) {
        return;
    }
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 4), (u8 *)state + 0xc, 1);
    FIELD(void *, descriptor, 4) = sprite;
    resourceIndex = index;
    if ((FIELD(u16, descriptor, 0xc) & 7) == 0) {
        resourceIndex += 0x32;
    }
    GraphicsSpriteState_ApplyRenderConfig(sprite, resourceIndex, FIELD(s16, descriptor, 8),
                  FIELD(s16, descriptor, 0xa), 1, 0, 0);
}

/*
 * Destroy and clear the sprite at descriptor +4 for one valid index. Invalid
 * indices and descriptors without sprites are ignored. Return void; the SDK
 * releases graphics state and there are no direct hardware effects.
 */
extern "C" void func_ov016_021fd310(void *state, s32 index)
{
    void *descriptor;

    if (index >= FIELD(s32, state, 0x54)) {
        return;
    }
    descriptor = (u8 *)FIELD(void *, state, 0x4c) + index * 0x14;
    if (FIELD(void *, descriptor, 4) != 0) {
        GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, descriptor, 4));
        FIELD(void *, descriptor, 4) = 0;
    }
}

/*
 * Refresh the presentation at +0x58, derive an eight-bit graphic selector from
 * base +0x60 plus the selected descriptor's linked table entries, apply it to
 * sprite +0x24, then update the two owner children at +4/+8. The linked table
 * layout is confirmed only by offsets: count +0x100 and 0x24-byte entries with
 * a halfword at +0x2C. Return void; SDK presentation state changes, no MMIO.
 */
extern "C" void func_ov016_021fd358(void *state)
{
    InventoryScroll_UpdatePresentation(FIELD(void *, state, 0x58));
    if (FIELD(s32, state, 0x50) != 0) {
        void *descriptor = func_ov016_021fd628(state);
        void *linked = FIELD(void *, descriptor, 0);
        s32 sum = 0;

        if (linked != 0) {
            void *table = FIELD(void *, linked, 0);
            s32 count = FIELD(s32, table, 0x100);
            s32 i;

            for (i = 0; i < count; i++) {
                sum += FIELD(u16, (u8 *)table + i * 0x24, 0x2c);
            }
        }
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x24),
                      (FIELD(u32, state, 0x60) + sum) & 0xff);
    }
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 4));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 8));
}
