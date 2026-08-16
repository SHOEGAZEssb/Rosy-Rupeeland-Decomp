

/* Portable reconstruction of the shared retail modal constructor. */
#include "tingle/heap.h"
#include "tingle/types.h"


extern u8 data_020f2754[];
extern const char data_020f276c[];
extern void *data_020f4e14;
extern void *data_020f4e18;

extern void func_02071ea4(void *state);
extern void func_02071ee0(void *state, void *resource, s32 first,
                          s32 second, s32 third);
extern void func_020957bc(void *state);
extern void func_02092798(void *state);
extern void func_02092814(void *state, u32 value);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void *func_02092cc0(void *storage, void *owner, void *value);
extern void func_02091080(void *state, void *first, void *second,
                          s32 third, s32 fourth);
extern void func_02092f88(void *state, s32 value, void *destination);
extern u8 data_021f3f54[];
extern u8 gSystemState[];
extern void *func_020795e8(void *manager, s32 message_id);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                       void *source,
                                                       s32 mode);
extern void func_020957f0(void *state, void *sprite, s32 animation,
                          s32 mode, s32 flags);
extern void func_02095820(void *state, s32 x, s32 y);
extern void func_020958d8(void *state);
extern void func_02095bec(void *state);
extern void func_02075598(void *owner, void *resource);
extern void GraphicsSpriteRenderer_DrawText(void *owner, void *text,
                                            s32 x, s32 y, s32 palette,
                                            s32 spacing, s32 flags);
extern void func_02092e9c(void *state, void *text, s32 mode);
extern s32 func_02093360(void *state, s32 mode);
extern void func_02076428(void *owner, s32 left, s32 top, s32 right,
                          s32 bottom, s32 first, s32 second);
extern s32 func_02095860(void *state, void *input, s32 first, s32 second);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 channel, s32 sound_id);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void func_020927b8(void *state);
extern void func_02071eb8(void *state);
extern void Presentation_DestroyNoOp(void *state);

/* Exact field assignment helper selected at retail 0x02091080. */
void func_02091080(void *state, void *first, void *second,
                   s32 third, s32 fourth)
{
    u8 *bytes = (u8 *)state;
    *(void **)(bytes + 0xa4) = first;
    *(void **)(bytes + 0xa8) = second;
    *(s32 *)(bytes + 0xac) = third;
    *(s32 *)(bytes + 0xb0) = fourth;
}

/* Exact modal-frame rectangle submission selected at retail 0x02095BEC. */
void func_02095bec(void *state)
{
    u8 *self = (u8 *)state;
    s32 x = *(s32 *)(self + 0x218);
    s32 y = *(s32 *)(self + 0x21c);
    func_02076428(data_020f4e14, x + 0x2c, y + 0x18,
                  x + 0xd3, y + 0x8f, 0, 0);
}

/* Exact shared modal resource/layout initialization at retail 0x02095C30. */
void func_02095c30(void *state, s32 message_id)
{
    u8 *self = (u8 *)state;
    u8 *message = (u8 *)func_020795e8(data_021f3f54, message_id);
    u16 layout = *(u16 *)message;
    void *sprite;
    u32 index;

    if (layout == 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 4), self + 8, 1);
        func_020957f0(self + 0x14, sprite, 0, 0, 0);
        func_02095820(self + 0x14, 0x80, 0x80);
    } else if (layout == 1) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 4), self + 8, 1);
        func_020957f0(self + 0xc0, sprite, 2, 0, 0);
        func_02095820(self + 0xc0, 0x60, 0x80);
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 4), self + 8, 1);
        func_020957f0(self + 0x16c, sprite, 4, 0, 0);
        func_02095820(self + 0x16c, 0xa0, 0x80);
    }
    for (index = 0; index < 3; ++index)
        func_020958d8(self + 0x14 + index * 0xac);
    func_02095bec(self);
    if (gSystemState[0x5f] == 3)
        func_02075598(data_020f4e14, *(void **)(self + 0x228));
    else
        func_02075598(data_020f4e14, *(void **)(self + 0x22c));
    GraphicsSpriteRenderer_DrawText(
        data_020f4e14, *(void **)(message + 8),
        *(s32 *)(self + 0x218) + 0x50,
        *(s32 *)(self + 0x21c) + 0x20, 0x0e, 8, 0);
    func_02092e9c(*(void **)(self + 0x24c), *(void **)(message + 0x0c), 1);
    (void)func_02093360(*(void **)(self + 0x24c), 0);
}

/* Return whether one modal choice has completed its motion, retail 0x02095F30. */
s32 func_02095f30(void *choice)
{
    u8 *bytes = (u8 *)choice;
    return *(s32 *)(bytes + 0x80) >= *(s32 *)(bytes + 0x7c);
}

/*
 * Copy a caller-owned UTF-16 attachment into the modal's inline buffer at
 * +0x250. At most 63 code units are retained and the destination is always
 * terminated; the source remains owned by the caller.
 */
void func_02095f48(void *state, const u16 *attachment)
{
    u16 *destination = (u16 *)((u8 *)state + 0x250);
    s32 index = 0;

    while (index < 0x3f && attachment[index] != 0) {
        destination[index] = attachment[index];
        ++index;
    }
    destination[index] = 0;
}

/* Exact three-choice modal input/update state machine at retail 0x02095DD4. */
s32 func_02095dd4(void *state, void *input, s32 input_enabled)
{
    u8 *self = (u8 *)state;
    s32 result = -1;
    u32 index;

    switch (*(u32 *)(self + 0x220)) {
    case 0:
        if (input_enabled != 0) {
            for (index = 0; index < 3; ++index) {
                u8 *choice = self + 0x14 + index * 0xac;
                if (*(void **)(self + 0xb0 + index * 0xac) != 0 &&
                    func_02095860(choice, input, 0, 4) != 0) {
                    *(u32 *)(self + 0x224) = index;
                    Sound_Play(gSoundContext, 0, 2);
                    ++*(u32 *)(self + 0x220);
                    break;
                }
            }
        }
        break;
    case 1: {
        u32 selected = *(u32 *)(self + 0x224);
        if (func_02095f30(self + 0x14 + selected * 0xac) != 0)
            ++*(u32 *)(self + 0x220);
        break;
    }
    case 2:
        result = *(s32 *)(self + 0x224);
        break;
    default:
        break;
    }
    for (index = 0; index < 3; ++index)
        func_020958d8(self + 0x14 + index * 0xac);
    GraphicsSpriteGroup_AdvanceAnimations(*(void **)(self + 4));
    return result;
}

static void ModalDestroyOwnedState(u8 *self)
{
    void *dialog = *(void **)(self + 0x24c);
    u32 index;

    *(void **)self = data_020f2754;
    if (dialog != 0) {
        void (**vtable)(void *) = *(void (***)(void *))dialog;
        vtable[1](dialog);
    }
    GraphicsSpriteGroup_Destroy(*(void **)(self + 4));
    func_020927b8(self + 0x228);
    for (index = 0; index < 3; ++index)
        Presentation_DestroyNoOp(self + 0x14 + index * 0xac);
    func_02071eb8(self + 8);
}

/* Retaining and freeing modal destructors at retail 0x02095B1C/0x02095B80. */
void *func_02095b1c(void *state)
{
    ModalDestroyOwnedState((u8 *)state);
    return state;
}

void *func_02095b80(void *state)
{
    ModalDestroyOwnedState((u8 *)state);
    Heap_Free(state);
    return state;
}

/* Retail 0x020959D4, including all three embedded choice rows and ownership. */
void *func_020959d4(void *storage, s32 first, s32 second)
{
    u8 *self = (u8 *)storage;
    void *dialog;
    u32 index;

    *(void **)self = data_020f2754;
    func_02071ea4(self + 8);
    for (index = 0; index < 3; ++index)
        func_020957bc(self + 0x14 + index * 0xac);
    func_02092798(self + 0x228);
    *(s32 *)(self + 0x218) = first;
    *(s32 *)(self + 0x21c) = second;
    *(u32 *)(self + 0x220) = 0;
    *(s32 *)(self + 0x224) = -1;
    *(u16 *)(self + 0x250) = 0;
    func_02071ee0(self + 8, data_020f4e18, 0x38, 1, 0x39);

    *(void **)(self + 4) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    *(s32 *)((u8 *)*(void **)(self + 4) + 0x18) = first;
    *(s32 *)((u8 *)*(void **)(self + 4) + 0x1c) = second;
    func_02092814(self + 0x228, 0x7000);
    func_02092814(self + 0x228, 0x7001);

    dialog = Heap_Alloc(0xec, data_020f276c, 4, &gHeapContext);
    if (dialog != 0)
        dialog = func_02092cc0(dialog, data_020f4e14,
                               *(void **)(self + 0x228));
    *(void **)(self + 0x24c) = dialog;
    func_02091080(dialog, (u8 *)(u32)first + 0x50,
                  (u8 *)(u32)second + 0x34, 0x78, 0x40);
    func_02092f88(dialog, 1, self + 0x250);
    return self;
}

