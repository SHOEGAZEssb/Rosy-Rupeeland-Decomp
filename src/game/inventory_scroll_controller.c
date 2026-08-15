/*
 * Scroll-controller construction and lifecycle used by the two inventory
 * grids. It owns one sprite group, two 0xA0-byte arrow presentations, a
 * marker sprite, and a common resource handle.
 */
#include "tingle/types.h"

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void *(*VirtualDestroy)(void *object);
typedef void (*VirtualUpdate)(void *object);

extern u8 data_020f260c[];
extern u8 data_020f263c[];
extern const char data_020f2644[];
extern void *data_020f4e18;
extern u8 gHeapContext[];

extern void func_02071ea4(void *resource);
extern void func_02071eb8(void *resource);
extern void func_02071ee0(void *resource, void *owner, s32 first,
                          s32 second, s32 third);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                        void *resource,
                                                        s32 mode);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *group);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void func_02073e48(void *sprite, s32 animation, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *SpritePresentation_Init(void *presentation, void *sprite);
extern void PresentationScalar_SetImmediate(void *scalar, s32 value);
extern void SpritePresentation_SyncPosition(void *presentation);
extern void SpritePresentation_SetAnimation(void *presentation, s32 animation);
extern void PresentationScalar_TransitionTo(void *scalar, s32 duration,
                                            s32 target);
extern s32 Presentation_InterpolateLinear(s32 start, s32 end, s32 duration,
                                          s32 elapsed);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 func_02092910(void *sprite, const void *point);
extern void func_02072b68(void *sprite, u32 animation);

/* Initialize the 0x4C-byte common indexed-list state to retail defaults. */
void *func_02093cb4(void *controller)
{
    u32 offset;

    FIELD(void *, controller, 0) = data_020f260c;
    for (offset = 4; offset <= 0x20; offset += 4)
        FIELD(u32, controller, offset) = 0;
    FIELD(s32, controller, 0x24) = 0x10;
    FIELD(u32, controller, 0x28) = 0;
    FIELD(u32, controller, 0x2c) = 0;
    FIELD(u32, controller, 0x30) = 0;
    FIELD(s32, controller, 0x34) = 6;
    FIELD(s32, controller, 0x38) = 4;
    FIELD(u32, controller, 0x3c) = 0;
    FIELD(u32, controller, 0x40) = 0;
    FIELD(s32, controller, 0x44) = 0xc0;
    FIELD(u32, controller, 0x48) = 0;
    return controller;
}

/* Configure total/visible counts and reset all current selection indices. */
void func_02093d20(void *controller, s32 total, s32 visible, s32 initial)
{
    FIELD(s32, controller, 4) = total;
    FIELD(s32, controller, 8) = visible > total ? total : visible;
    FIELD(s32, controller, 0x0c) = initial;
    FIELD(s32, controller, 0x10) = initial;
    FIELD(s32, controller, 0x14) = initial;
    FIELD(s32, controller, 0x18) = initial;
    FIELD(u32, controller, 0x1c) = 0;
    FIELD(u32, controller, 0x20) = 0;
}

/* Clamp the selected row into the current visible range and snap both of its
 * transition endpoints. The controller remains caller-owned. */
void func_02093d50(void *controller, s32 selected)
{
    s32 first = FIELD(s32, controller, 0x0c);
    s32 end = first + FIELD(s32, controller, 8);

    if (selected < first)
        selected = first;
    else if (selected >= end)
        selected = end - 1;
    FIELD(s32, controller, 0x14) = selected;
    FIELD(s32, controller, 0x18) = selected;
}

/* Set the first visible row, clamp it to the available page range, and snap
 * both the scroll and selection transition origins. */
void func_02093d7c(void *controller, s32 first)
{
    s32 total = FIELD(s32, controller, 4);
    s32 visible = FIELD(s32, controller, 8);

    if (first < 0)
        first = 0;
    else if (first + visible > total)
        first = total - visible;
    FIELD(s32, controller, 0x0c) = first;
    FIELD(s32, controller, 0x10) = first;
    func_02093d50(controller, FIELD(s32, controller, 0x14));
}

/* Snap the saved scroll and selection origins to their current values. */
void func_02093de4(void *controller)
{
    FIELD(s32, controller, 0x10) = FIELD(s32, controller, 0x0c);
    FIELD(s32, controller, 0x18) = FIELD(s32, controller, 0x14);
}

/* Restore the current scroll and selection values from their saved origins. */
void func_02093df8(void *controller)
{
    FIELD(s32, controller, 0x0c) = FIELD(s32, controller, 0x10);
    FIELD(s32, controller, 0x14) = FIELD(s32, controller, 0x18);
}

/* Move the selected row upward by one when it is not at the first row. */
void func_02093e0c(void *controller)
{
    if (FIELD(s32, controller, 0x14) > 0)
        --FIELD(s32, controller, 0x14);
}

/* Move the selected row downward by one when another row exists. */
void func_02093e20(void *controller)
{
    if (FIELD(s32, controller, 0x14) < FIELD(s32, controller, 4) - 1)
        ++FIELD(s32, controller, 0x14);
}

/* Scroll the visible page upward by one and report whether it moved. */
s32 func_02093e3c(void *controller)
{
    if (FIELD(s32, controller, 0x0c) > 0) {
        --FIELD(s32, controller, 0x0c);
        return 1;
    }
    return 0;
}

/* Scroll the visible page downward by one and report whether it moved. */
s32 func_02093e58(void *controller)
{
    s32 first = FIELD(s32, controller, 0x0c);

    if (first + FIELD(s32, controller, 8) < FIELD(s32, controller, 4)) {
        FIELD(s32, controller, 0x0c) = first + 1;
        return 1;
    }
    return 0;
}

/* Advance the repeated row/page movement state. `repeat` enables the retail
 * initial-delay behavior. Returns one when a new movement phase begins. */
s32 func_02093e78(void *controller, s32 repeat)
{
    s32 phase;

    if (FIELD(s32, controller, 0x18) != FIELD(s32, controller, 0x14)) {
        if (FIELD(s32, controller, 0x1c) == 1) {
            s32 frame = ++FIELD(s32, controller, 0x20);
            if (frame < FIELD(s32, controller, 0x24)) {
                func_02093df8(controller);
                return 0;
            }
        }
        FIELD(s32, controller, 0x20) = 0;
        FIELD(s32, controller, 0x30) = 0;
        phase = ++FIELD(s32, controller, 0x1c);
        FIELD(s32, controller, 0x2c) =
            phase > 8 ? FIELD(s32, controller, 0x38)
                      : FIELD(s32, controller, 0x34);
        if (FIELD(s32, controller, 0x14) >=
            FIELD(s32, controller, 0x0c) + FIELD(s32, controller, 8))
            func_02093e58(controller);
        else if (FIELD(s32, controller, 0x14) <
                 FIELD(s32, controller, 0x0c))
            func_02093e3c(controller);
        FIELD(s32, controller, 0x28) =
            FIELD(s32, controller, 0x10) != FIELD(s32, controller, 0x0c)
                ? 2 : 1;
        return 1;
    }

    if (FIELD(s32, controller, 0x10) != FIELD(s32, controller, 0x0c)) {
        if (repeat != 0) {
            if (FIELD(s32, controller, 0x1c) == 1) {
                s32 frame = ++FIELD(s32, controller, 0x20);
                if (frame < FIELD(s32, controller, 0x24)) {
                    func_02093df8(controller);
                    return 0;
                }
            }
            FIELD(s32, controller, 0x20) = 0;
            FIELD(s32, controller, 0x30) = 0;
            phase = ++FIELD(s32, controller, 0x1c);
            FIELD(s32, controller, 0x2c) =
                phase > 8 ? FIELD(s32, controller, 0x38)
                          : FIELD(s32, controller, 0x34);
        } else {
            FIELD(s32, controller, 0x30) = 0;
            FIELD(s32, controller, 0x2c) = FIELD(s32, controller, 0x34);
        }
        func_02093d50(controller, FIELD(s32, controller, 0x14));
        FIELD(s32, controller, 0x28) = 2;
        return 1;
    }

    FIELD(s32, controller, 0x28) = 0;
    FIELD(s32, controller, 0x1c) = 0;
    return 0;
}

/* Advance the active scroll interpolation and report when it is idle or has
 * reached its final frame. The pixel offset at +0x48 is updated in place. */
s32 func_02093ffc(void *controller)
{
    s32 duration = FIELD(s32, controller, 0x2c);

    if (duration != 0) {
        s32 elapsed = ++FIELD(s32, controller, 0x30);
        if (FIELD(s32, controller, 0x10) != FIELD(s32, controller, 0x0c)) {
            s32 scale = FIELD(s32, controller, 0x44);
            s32 value = Presentation_InterpolateLinear(
                FIELD(s32, controller, 0x10) * scale,
                FIELD(s32, controller, 0x0c) * scale, duration, elapsed);
            FIELD(s32, controller, 0x48) = func_020befec(
                value, FIELD(s32, controller, 4) -
                       FIELD(s32, controller, 8));
        }
        if (elapsed == duration)
            FIELD(s32, controller, 0x2c) = 0;
    }
    return FIELD(s32, controller, 0x2c) == 0;
}

/* Convert a dragged pixel coordinate into a page position. Returns one when
 * the first visible row changed and the selection was clamped to that page. */
s32 func_02094088(void *controller, s32 coordinate)
{
    s32 top = FIELD(s32, controller, 0x40);
    s32 height = FIELD(s32, controller, 0x44);
    s32 page_count = FIELD(s32, controller, 4) -
                     FIELD(s32, controller, 8);
    s32 pixels_per_page;
    s32 half_page_pixels;
    s32 first;

    if (coordinate > top + height)
        coordinate = top + height;
    else if (coordinate < top)
        coordinate = top;
    pixels_per_page = func_020befec(height, page_count);
    half_page_pixels =
        (pixels_per_page + (s32)((u32)pixels_per_page >> 31)) >> 1;
    first = func_020befec(
        (coordinate - top + half_page_pixels) * page_count,
        height);
    if (first < FIELD(s32, controller, 0x0c))
        func_02093e3c(controller);
    else if (first > FIELD(s32, controller, 0x0c))
        func_02093e58(controller);
    else
        return 0;
    func_02093d50(controller, FIELD(s32, controller, 0x14));
    return 1;
}

/* Begin the standard scroll animation when the saved and current pages differ. */
s32 func_02094128(void *controller)
{
    if (FIELD(s32, controller, 0x10) == FIELD(s32, controller, 0x0c))
        return 0;
    FIELD(s32, controller, 0x2c) = FIELD(s32, controller, 0x34);
    FIELD(s32, controller, 0x30) = 0;
    return 1;
}

/* Select the up/down arrow animations from the current scroll boundaries. */
void func_020944f0(void *controller)
{
    s32 first = FIELD(s32, controller, 0x0c);
    s32 total = FIELD(s32, controller, 4);
    s32 visible = FIELD(s32, controller, 8);

    SpritePresentation_SetAnimation(FIELD(void *, controller, 0x64),
                                    first > 0 ? 0 : 1);
    SpritePresentation_SetAnimation(FIELD(void *, controller, 0x68),
                                    first < total - visible ? 2 : 3);
}

/* Assign one OAM priority byte to every sprite in the controller's group. */
void func_02094550(void *controller, s32 priority)
{
    void *node = FIELD(void *, FIELD(void *, controller, 0x50), 0x0c);

    while (node != 0) {
        FIELD(u8, node, 0x3a) = (u8)priority;
        node = FIELD(void *, node, 8);
    }
}

/* Synchronize marker position, arrow animations, child presentations, and the
 * sprite group for one frame. Observable effects are renderer submissions. */
void func_02094574(void *controller)
{
    void *marker = FIELD(void *, controller, 0x60);
    s32 index;

    FIELD(u16, marker, 0x2c) = (u16)FIELD(s32, controller, 0x3c);
    FIELD(u16, marker, 0x2e) =
        (u16)(FIELD(s32, controller, 0x40) +
              FIELD(s32, controller, 0x48));
    func_020944f0(controller);
    for (index = 0; index < 2; ++index) {
        void *part = FIELD(void *, controller, 0x64 + index * 4);
        void **vtable = FIELD(void **, part, 0);
        ((VirtualUpdate)vtable[2])(part);
    }
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, controller, 0x50));
}

/* Latch a new press on the upper arrow and report only its initial frame. */
s32 func_020945c8(void *controller, const void *point)
{
    void *part = FIELD(void *, controller, 0x64);

    if (func_02092910(FIELD(void *, part, 0x9c), point) != 0 &&
        FIELD(s32, controller, 0x78) == 0) {
        FIELD(s32, controller, 0x78) = 1;
        return 1;
    }
    return 0;
}

/* Latch a new press on the lower arrow and report only its initial frame. */
s32 func_02094600(void *controller, const void *point)
{
    void *part = FIELD(void *, controller, 0x68);

    if (func_02092910(FIELD(void *, part, 0x9c), point) != 0 &&
        FIELD(s32, controller, 0x7c) == 0) {
        FIELD(s32, controller, 0x7c) = 1;
        return 1;
    }
    return 0;
}

/* Report a continued upper-arrow press and clear its latch on release. */
s32 func_02094638(void *controller, const void *point)
{
    void *part = FIELD(void *, controller, 0x64);

    if (func_02092910(FIELD(void *, part, 0x9c), point) != 0 &&
        FIELD(s32, controller, 0x78) != 0)
        return 1;
    FIELD(s32, controller, 0x78) = 0;
    return 0;
}

/* Report a continued lower-arrow press and clear its latch on release. */
s32 func_02094668(void *controller, const void *point)
{
    void *part = FIELD(void *, controller, 0x68);

    if (func_02092910(FIELD(void *, part, 0x9c), point) != 0 &&
        FIELD(s32, controller, 0x7c) != 0)
        return 1;
    FIELD(s32, controller, 0x7c) = 0;
    return 0;
}

/* Hit-test the draggable page marker against one borrowed touch point. */
s32 func_02094698(void *controller, const void *point)
{
    return func_02092910(FIELD(void *, controller, 0x60), point);
}

/* Select the marker's pressed animation and store the requested timing value. */
void func_020946a8(void *controller, s32 timing)
{
    func_02072b68(FIELD(void *, controller, 0x60), 9);
    FIELD(s32, controller, 0x34) = timing;
}

/* Apply a marker drag, update the exposed changed-row interval, and start the
 * standard scroll animation. The touch point is borrowed for this call. */
s32 func_020946c8(void *controller, const void *point)
{
    void *group = FIELD(void *, controller, 0x50);
    s32 coordinate = FIELD(s32, point, 8) - FIELD(s32, group, 0x1c);

    if (!func_02094088(controller, coordinate))
        return 0;
    if (FIELD(s32, controller, 0x0c) < FIELD(s32, controller, 0x10)) {
        FIELD(s32, controller, 0x70) = FIELD(s32, controller, 0x0c);
        FIELD(s32, controller, 0x74) =
            FIELD(s32, controller, 0x0c) + FIELD(s32, controller, 8);
    } else {
        FIELD(s32, controller, 0x70) =
            FIELD(s32, controller, 0x0c) +
            FIELD(s32, controller, 8) - 1;
        FIELD(s32, controller, 0x74) = FIELD(s32, controller, 0x0c) - 1;
    }
    return func_02094128(controller);
}

/* Restore the marker's idle animation and update the repeated-input timing. */
void func_02094738(void *controller, s32 timing)
{
    func_02072b68(FIELD(void *, controller, 0x60), 4);
    FIELD(s32, controller, 0x34) = timing;
}

/* Advance repeated selection movement, animate the entering arrow when a page
 * changes, expose the changed-row interval, and release stale touch latches. */
s32 func_02094758(void *controller)
{
    s32 changed = func_02093e78(controller, 1);

    if (changed != 0 && FIELD(s32, controller, 0x28) == 2) {
        if (FIELD(s32, controller, 0x0c) < FIELD(s32, controller, 0x10)) {
            void *part = FIELD(void *, controller, 0x64);
            PresentationScalar_SetImmediate((u8 *)part + 0x1c, -0x4000);
            PresentationScalar_TransitionTo((u8 *)part + 0x1c, 1, 0);
            FIELD(s32, part, 0x7c) = 4;
            FIELD(s32, part, 0x80) = 0;
            FIELD(s32, controller, 0x70) = FIELD(s32, controller, 0x0c);
            FIELD(s32, controller, 0x74) =
                FIELD(s32, controller, 0x0c) + FIELD(s32, controller, 8);
        } else {
            void *part = FIELD(void *, controller, 0x68);
            s32 height = FIELD(s32, controller, 0x6c);
            PresentationScalar_SetImmediate((u8 *)part + 0x1c,
                                            (height + 0x60) << 12);
            PresentationScalar_TransitionTo((u8 *)part + 0x1c, 1,
                                            (height + 0x5c) << 12);
            FIELD(s32, part, 0x7c) = 4;
            FIELD(s32, part, 0x80) = 0;
            FIELD(s32, controller, 0x70) =
                FIELD(s32, controller, 0x0c) +
                FIELD(s32, controller, 8) - 1;
            FIELD(s32, controller, 0x74) = FIELD(s32, controller, 0x0c) - 1;
        }
    }
    if (FIELD(s32, controller, 0x28) == 0) {
        FIELD(s32, controller, 0x78) = 0;
        FIELD(s32, controller, 0x7c) = 0;
    }
    return changed;
}

/* Reset transition phase/frame state and both arrow touch latches when a
 * scroll presentation opens. The caller retains ownership; no I/O occurs. */
void func_02094874(void *controller)
{
    FIELD(s32, controller, 0x1c) = 0;
    FIELD(s32, controller, 0x20) = 0;
    FIELD(s32, controller, 0x78) = 0;
    FIELD(s32, controller, 0x7c) = 0;
}

/*
 * Construct a complete 0x80-byte scroll controller in caller-owned storage.
 * Coordinates and height are pixels; presentation offsets use 20.12 fixed
 * point. Allocation and sprite ownership pass through their engine services.
 */
void *func_02094154(void *controller, void *owner, s32 total, s32 visible,
                    s32 x, s32 y, s32 height)
{
    void *group;
    void *sprite;
    s32 index;
    s32 secondOffset;

    func_02093cb4(controller);
    FIELD(void *, controller, 0) = data_020f263c;
    func_02071ea4((u8 *)controller + 0x54);
    FIELD(void *, controller, 0x4c) = owner;
    FIELD(s32, controller, 0x6c) = height;
    func_02071ee0((u8 *)controller + 0x54, data_020f4e18, 5, 1, 6);

    group = GraphicsSpriteGroupOwner_CreateGroup(owner);
    FIELD(void *, controller, 0x50) = group;
    FIELD(s32, group, 0x18) = x;
    FIELD(s32, group, 0x1c) = y;
    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        group, (u8 *)controller + 0x54, 1);
    func_02073e48(sprite, 6, 0, 0x2e, 2, 0x4000, 0);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        group, (u8 *)controller + 0x54, 1);
    func_02073e48(sprite, 7, 0, height + 0x2e, 2, 0x4000, 0);
    if (height > 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            group, (u8 *)controller + 0x54, 1);
        func_02073e48(sprite, 8, 0, height / 2 + 0x2e, 2, 0x4001, 0);
    }

    secondOffset = (height + 0x5c) << 12;
    for (index = 0; index < 2; ++index) {
        void *part = Heap_Alloc(0xa0, data_020f2644, 4, gHeapContext);
        if (part != 0) {
            part = SpritePresentation_Init(
                part, GraphicsSpriteGroup_CreateStateFromSource(
                          group, (u8 *)controller + 0x54, 1));
        }
        FIELD(void *, controller, 0x64 + index * 4) = part;
        FIELD(u8, FIELD(void *, part, 0x9c), 0x3a) = 2;
        FIELD(u16, FIELD(void *, part, 0x9c), 0x28) = 0x3000;
        PresentationScalar_SetImmediate((u8 *)part + 0x1c,
                                        index == 0 ? 0 : secondOffset);
        SpritePresentation_SyncPosition(part);
        FIELD(u32, controller, 0x78 + index * 4) = 0;
    }

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        group, (u8 *)controller + 0x54, 1);
    FIELD(void *, controller, 0x60) = sprite;
    func_02073e48(sprite, 4, 0, 0, 2, 0x2000, 0);
    func_02093d20(controller, total, visible, 0);
    FIELD(s32, controller, 0x3c) = 0;
    FIELD(s32, controller, 0x40) = 0x10;
    FIELD(s32, controller, 0x44) = height + 0x3c;
    func_020944f0(controller);
    if (FIELD(s32, controller, 8) >= FIELD(s32, controller, 4)) {
        FIELD(u16, sprite, 0x24) |= 4;
        GraphicsSpriteGroup_ReleaseIndexedEntries(group);
    }
    return controller;
}

/* Destroy owned presentations, group, and resource without freeing storage. */
void *func_020943d4(void *controller)
{
    s32 index;

    FIELD(void *, controller, 0) = data_020f263c;
    for (index = 0; index < 2; ++index) {
        void *part = FIELD(void *, controller, 0x64 + index * 4);
        if (part != 0) {
            void **vtable = FIELD(void **, part, 0);
            ((VirtualDestroy)vtable[1])(part);
        }
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, controller, 0x50));
    func_02071eb8((u8 *)controller + 0x54);
    return controller;
}

/* Destroy the scroll controller, free its storage, and return its address. */
void *func_02094430(void *controller)
{
    func_020943d4(controller);
    Heap_Free(controller);
    return controller;
}
