/*
 * Scroll-controller construction and lifecycle used by the two inventory
 * grids. It owns one sprite group, two 0xA0-byte arrow presentations, a
 * marker sprite, and a common resource handle.
 */
#include "tingle/types.h"

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void *(*VirtualDestroy)(void *object);

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
extern void func_02073e48(void *sprite, s32 animation, s32 x, s32 y,
                          s32 enabled, s32 field28, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *SpritePresentation_Init(void *presentation, void *sprite);
extern void PresentationScalar_SetImmediate(void *scalar, s32 value);
extern void SpritePresentation_SyncPosition(void *presentation);
extern void SpritePresentation_SetAnimation(void *presentation, s32 animation);

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
