

/* Portable reconstruction of the shared retail modal constructor. */
#include "tingle/heap.h"
#include "tingle/types.h"


extern u8 data_020f2754[];
extern const char data_020f276c[];
extern void *data_020f4e14;
extern void *data_020f4e18;

extern void AnimationResourceState_InitEmbedded(void *state);
extern void AnimationResourceState_ReplaceResources(void *state, void *resource, s32 first,
                          s32 second, s32 third);
extern void SpriteMotionController_Init(void *state);
extern void TitleCharacterResourceCollection_Init(void *state);
extern void TitleCharacterResourceCollection_Append(void *state, u32 value);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void *TitleDialog_Init(void *storage, void *owner, void *value);
extern void TitleDialog_ConfigureLayout(void *state, void *first, void *second,
                          s32 third, s32 fourth);
extern void TitleDialog_SetExternalTextRow(void *state, s32 value, void *destination);
extern u8 data_021f3f54[];
extern u8 gSystemState[];
extern void *ModalMessageDatabase_BuildDescriptorById(void *manager,
                                                      s32 message_id);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                       void *source,
                                                       s32 mode);
extern void SpriteMotionController_BindSprite(void *state, void *sprite, s32 animation,
                          s32 mode, s32 flags);
extern void SpriteMotionController_SetPosition(void *state, s32 x, s32 y);
extern void SpriteMotionController_Update(void *state);
extern void ModalState_DrawFrame(void *state);
extern void func_02075598(void *owner, void *resource);
extern void GraphicsSpriteRenderer_DrawText(void *owner, void *text,
                                            s32 x, s32 y, s32 palette,
                                            s32 spacing, s32 flags);
extern void TitleDialog_SetText(void *state, void *text, s32 mode);
extern s32 TitleDialog_UpdateTextPage(void *state, s32 mode);
extern void func_02076428(void *owner, s32 left, s32 top, s32 right,
                          s32 bottom, s32 first, s32 second);
extern s32 SpriteMotionController_BeginHitResponse(void *state, void *input, s32 first, s32 second);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 channel, s32 sound_id);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void TitleCharacterResourceCollection_Destroy(void *state);
extern void AnimationResourceState_Destroy(void *state);
extern void Presentation_DestroyNoOp(void *state);
extern void IndexedSelectionController_Init(void *controller);
extern void IndexedSelectionController_ConfigureRange(void *controller,
                                                       s32 lower, s32 upper,
                                                       s32 current);
extern void IndexedSelectionController_SnapTransitionOrigin(void *controller);
extern s32 IndexedSelectionController_Increment(void *controller);
extern s32 IndexedSelectionController_Decrement(void *controller);
extern s32 IndexedSelectionController_AdvanceTransition(void *controller);
extern s32 IndexedSelectionController_GetLastDirection(void *controller);
extern s32 IndexedSelectionController_IsTransitionIdle(void *controller);
extern s32 IndexedSelectionController_AdvancePacing(void *controller);
extern void *SpritePresentation_Init(void *state, void *sprite);
extern void SpritePresentation_SetAnimation(void *state, s32 animation);
extern void SpritePresentation_SyncPosition(void *state);
extern void PresentationScalar_SetImmediate(void *state, s32 value);
extern void PresentationScalar_TransitionTo(void *state, s32 mode, s32 value);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u32 index);
extern s32 GraphicsSpriteState_TestTouchPoint(void *sprite, const void *point);

extern const u8 data_020f2764[];
extern const char data_020f2774[];
extern const s16 data_020c930c[];

void func_020962a8(void *state);
void func_02096304(void *state);

/* Exact field assignment helper selected at retail 0x02091080. */
void TitleDialog_ConfigureLayout(void *state, void *first, void *second,
                   s32 third, s32 fourth)
{
    u8 *bytes = (u8 *)state;
    *(void **)(bytes + 0xa4) = first;
    *(void **)(bytes + 0xa8) = second;
    *(s32 *)(bytes + 0xac) = third;
    *(s32 *)(bytes + 0xb0) = fourth;
}

/* Exact modal-frame rectangle submission selected at retail 0x02095BEC. */
void ModalState_DrawFrame(void *state)
{
    u8 *self = (u8 *)state;
    s32 x = *(s32 *)(self + 0x218);
    s32 y = *(s32 *)(self + 0x21c);
    func_02076428(data_020f4e14, x + 0x2c, y + 0x18,
                  x + 0xd3, y + 0x8f, 0, 0);
}

/* Exact shared modal resource/layout initialization at retail 0x02095C30. */
void ModalState_InitResources(void *state, s32 message_id)
{
    u8 *self = (u8 *)state;
    u8 *message = (u8 *)ModalMessageDatabase_BuildDescriptorById(
        data_021f3f54, message_id);
    u16 layout = *(u16 *)message;
    void *sprite;
    u32 index;

    if (layout == 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 4), self + 8, 1);
        SpriteMotionController_BindSprite(self + 0x14, sprite, 0, 0, 0);
        SpriteMotionController_SetPosition(self + 0x14, 0x80, 0x80);
    } else if (layout == 1) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 4), self + 8, 1);
        SpriteMotionController_BindSprite(self + 0xc0, sprite, 2, 0, 0);
        SpriteMotionController_SetPosition(self + 0xc0, 0x60, 0x80);
        sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 4), self + 8, 1);
        SpriteMotionController_BindSprite(self + 0x16c, sprite, 4, 0, 0);
        SpriteMotionController_SetPosition(self + 0x16c, 0xa0, 0x80);
    }
    for (index = 0; index < 3; ++index)
        SpriteMotionController_Update(self + 0x14 + index * 0xac);
    ModalState_DrawFrame(self);
    if (gSystemState[0x5f] == 3)
        func_02075598(data_020f4e14, *(void **)(self + 0x228));
    else
        func_02075598(data_020f4e14, *(void **)(self + 0x22c));
    GraphicsSpriteRenderer_DrawText(
        data_020f4e14, *(void **)(message + 8),
        *(s32 *)(self + 0x218) + 0x50,
        *(s32 *)(self + 0x21c) + 0x20, 0x0e, 8, 0);
    TitleDialog_SetText(*(void **)(self + 0x24c), *(void **)(message + 0x0c), 1);
    (void)TitleDialog_UpdateTextPage(*(void **)(self + 0x24c), 0);
}

/* Return whether one modal choice has completed its motion, retail 0x02095F30. */
s32 ModalChoice_IsMotionComplete(void *choice)
{
    u8 *bytes = (u8 *)choice;
    return *(s32 *)(bytes + 0x80) >= *(s32 *)(bytes + 0x7c);
}

/*
 * Copy a caller-owned UTF-16 attachment into the modal's inline buffer at
 * +0x250. At most 63 code units are retained and the destination is always
 * terminated; the source remains owned by the caller.
 */
void ModalState_CopyAttachmentText(void *state, const u16 *attachment)
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
s32 ModalState_UpdateInput(void *state, void *input, s32 input_enabled)
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
                    SpriteMotionController_BeginHitResponse(choice, input, 0, 4) != 0) {
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
        if (ModalChoice_IsMotionComplete(self + 0x14 + selected * 0xac) != 0)
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
        SpriteMotionController_Update(self + 0x14 + index * 0xac);
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
    TitleCharacterResourceCollection_Destroy(self + 0x228);
    for (index = 0; index < 3; ++index)
        Presentation_DestroyNoOp(self + 0x14 + index * 0xac);
    AnimationResourceState_Destroy(self + 8);
}

/* Retaining and freeing modal destructors at retail 0x02095B1C/0x02095B80. */
void *ModalState_Destroy(void *state)
{
    ModalDestroyOwnedState((u8 *)state);
    return state;
}

void *ModalState_Delete(void *state)
{
    ModalDestroyOwnedState((u8 *)state);
    Heap_Free(state);
    return state;
}

/* Retail 0x020959D4, including all three embedded choice rows and ownership. */
void *ModalState_Init(void *storage, s32 first, s32 second)
{
    u8 *self = (u8 *)storage;
    void *dialog;
    u32 index;

    *(void **)self = data_020f2754;
    AnimationResourceState_InitEmbedded(self + 8);
    for (index = 0; index < 3; ++index)
        SpriteMotionController_Init(self + 0x14 + index * 0xac);
    TitleCharacterResourceCollection_Init(self + 0x228);
    *(s32 *)(self + 0x218) = first;
    *(s32 *)(self + 0x21c) = second;
    *(u32 *)(self + 0x220) = 0;
    *(s32 *)(self + 0x224) = -1;
    *(u16 *)(self + 0x250) = 0;
    AnimationResourceState_ReplaceResources(self + 8, data_020f4e18, 0x38, 1, 0x39);

    *(void **)(self + 4) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    *(s32 *)((u8 *)*(void **)(self + 4) + 0x18) = first;
    *(s32 *)((u8 *)*(void **)(self + 4) + 0x1c) = second;
    TitleCharacterResourceCollection_Append(self + 0x228, 0x7000);
    TitleCharacterResourceCollection_Append(self + 0x228, 0x7001);

    dialog = Heap_Alloc(0xec, data_020f276c, 4, &gHeapContext);
    if (dialog != 0)
        dialog = TitleDialog_Init(dialog, data_020f4e14,
                               *(void **)(self + 0x228));
    *(void **)(self + 0x24c) = dialog;
    TitleDialog_ConfigureLayout(dialog, (u8 *)(u32)first + 0x50,
                  (u8 *)(u32)second + 0x34, 0x78, 0x40);
    TitleDialog_SetExternalTextRow(dialog, 1, self + 0x250);
    return self;
}

/*
 * Construct the shared numeric confirmation prompt at retail 0x02095F8C.
 * Storage is caller-owned and must provide 0x1C0 bytes. The sprite group and
 * two arrow presentations are owned by the prompt; the renderer owner is
 * borrowed. Coordinates are integer pixels and animation motion uses 20.12
 * fixed point. The inclusive range is initialized to currentValue.
 */
void *func_02095f8c(void *storage, void *renderer_owner, s32 lower, s32 upper,
                    s32 current_value, s32 x, s32 y)
{
    u8 *self = (u8 *)storage;
    s32 index;

    IndexedSelectionController_Init(self);
    *(const void **)self = data_020f2764;
    AnimationResourceState_InitEmbedded(self + 0x40);
    SpriteMotionController_Init(self + 0x5c);
    SpriteMotionController_Init(self + 0x108);
    *(void **)(self + 0x38) = renderer_owner;
    IndexedSelectionController_ConfigureRange(self, lower, upper, current_value);
    *(s32 *)(self + 0x1b4) = 0;
    *(s32 *)(self + 0x1b8) = 0;
    *(s32 *)(self + 0x1bc) = 0;
    AnimationResourceState_ReplaceResources(self + 0x40, data_020f4e18,
                                             3, 1, 4);
    *(void **)(self + 0x3c) =
        GraphicsSpriteGroupOwner_CreateGroup(renderer_owner);
    *(s32 *)((u8 *)*(void **)(self + 0x3c) + 0x18) = x;
    *(s32 *)((u8 *)*(void **)(self + 0x3c) + 0x1c) = y;

    SpriteMotionController_BindSprite(
        self + 0x5c,
        GraphicsSpriteGroup_CreateStateFromSource(*(void **)(self + 0x3c),
                                                   self + 0x40, 1),
        0x0e, 0, 0);
    SpriteMotionController_SetPosition(self + 0x5c, -0x1a, 0x28);
    SpriteMotionController_BindSprite(
        self + 0x108,
        GraphicsSpriteGroup_CreateStateFromSource(*(void **)(self + 0x3c),
                                                   self + 0x40, 1),
        0x10, 0, 0);
    SpriteMotionController_SetPosition(self + 0x108, 0x1a, 0x28);

    for (index = 0; index < 2; ++index) {
        void *presentation = Heap_Alloc(0xa0, data_020f2774, 4,
                                        &gHeapContext);
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 0x3c), self + 0x40, 1);
        presentation = SpritePresentation_Init(presentation, sprite);
        *(void **)(self + 0x4c + index * 4) = presentation;
        *(u8 *)((u8 *)sprite + 0x3a) = 0;
        *(u16 *)((u8 *)sprite + 0x28) = 0;
        PresentationScalar_SetImmediate((u8 *)presentation + 0x1c,
                                         index == 0 ? -0x12000 : 0x12000);
        SpritePresentation_SyncPosition(presentation);
    }

    func_020962a8(self);
    for (index = 0; index < 2; ++index) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(
            *(void **)(self + 0x3c), self + 0x40, 1);
        *(void **)(self + 0x54 + index * 4) = sprite;
        *(s16 *)((u8 *)sprite + 0x2c) = data_020c930c[index];
    }
    func_02096304(self);
    return self;
}

/* Release every prompt-owned sprite object while retaining caller storage. */
void *func_020961c8(void *state)
{
    u8 *self = (u8 *)state;
    s32 index;

    *(const void **)self = data_020f2764;
    for (index = 0; index < 2; ++index) {
        void *presentation = *(void **)(self + 0x4c + index * 4);
        if (presentation != 0) {
            void (**vtable)(void *) = *(void (***)(void *))presentation;
            vtable[1](presentation);
        }
    }
    GraphicsSpriteGroup_Destroy(*(void **)(self + 0x3c));
    Presentation_DestroyNoOp(self + 0x108);
    Presentation_DestroyNoOp(self + 0x5c);
    AnimationResourceState_Destroy(self + 0x40);
    return self;
}

/* Release a prompt and its caller-designated heap allocation. */
void *func_02096234(void *state)
{
    func_020961c8(state);
    Heap_Free(state);
    return state;
}

/* Select enabled/disabled arrow images from the current inclusive bounds. */
void func_020962a8(void *state)
{
    u8 *self = (u8 *)state;

    SpritePresentation_SetAnimation(*(void **)(self + 0x4c),
        *(s32 *)(self + 0x0c) < *(s32 *)(self + 0x08) ? 0x0a : 0x0b);
    SpritePresentation_SetAnimation(*(void **)(self + 0x50),
        *(s32 *)(self + 0x0c) > *(s32 *)(self + 0x04) ? 0x0c : 0x0d);
}

/* Publish the two decimal digits and advance all prompt sprite animations. */
void func_02096304(void *state)
{
    u8 *self = (u8 *)state;
    s32 value = *(s32 *)(self + 0x0c) % 100;
    s32 index;

    GraphicsSpriteState_SetAnimationIndex(*(void **)(self + 0x54),
                                           (u32)(value / 10));
    GraphicsSpriteState_SetAnimationIndex(*(void **)(self + 0x58),
                                           (u32)(value % 10));
    for (index = 0; index < 2; ++index) {
        void *presentation = *(void **)(self + 0x4c + index * 4);
        void (**vtable)(void *) = *(void (***)(void *))presentation;
        vtable[2](presentation);
    }
    SpriteMotionController_Update(self + 0x5c);
    SpriteMotionController_Update(self + 0x108);
    GraphicsSpriteGroup_AdvanceAnimations(*(void **)(self + 0x3c));
}

/* Animate an accepted selection step and return whether its value changed. */
s32 func_02096390(void *state)
{
    u8 *self = (u8 *)state;
    s32 changed = IndexedSelectionController_AdvanceTransition(self);

    if (changed != 0) {
        void *presentation;
        s32 start;
        s32 target;

        func_020962a8(self);
        if (IndexedSelectionController_GetLastDirection(self) != 0) {
            presentation = *(void **)(self + 0x4c);
            start = -0x16000;
            target = -0x12000;
        } else {
            presentation = *(void **)(self + 0x50);
            start = 0x16000;
            target = 0x12000;
        }
        PresentationScalar_SetImmediate((u8 *)presentation + 0x1c, start);
        PresentationScalar_TransitionTo((u8 *)presentation + 0x1c, 1, target);
        *(s32 *)((u8 *)presentation + 0x7c) = 4;
        *(s32 *)((u8 *)presentation + 0x80) = 0;
    }
    if (IndexedSelectionController_IsTransitionIdle(self) != 0)
        *(s32 *)(self + 0x1bc) = 0;
    return changed;
}

/* Return whether an embedded sprite-motion response has completed. */
static s32 NumericPrompt_IsMotionComplete(const void *motion)
{
    const u8 *bytes = (const u8 *)motion;
    return *(const s32 *)(bytes + 0x80) >= *(const s32 *)(bytes + 0x7c);
}

/*
 * Drive numeric prompt keys/touch and OK/Back completion (0x02096450).
 * Input pointers are borrowed for this frame. The two integer flags enable
 * arrow and action-button touch handling respectively. Returns one only after
 * the selected button's four-pixel response motion has completed.
 */
s32 func_02096450(void *state, void *touch, const void *keys,
                  s32 arrows_enabled, s32 buttons_enabled)
{
    u8 *self = (u8 *)state;

    switch (*(s32 *)(self + 0x1b4)) {
    case 0:
        if (IndexedSelectionController_AdvancePacing(self) == 0)
            return 0;
        ++*(s32 *)(self + 0x1b4);
        /* Deliberate fallthrough: retail accepts input on the opening frame. */
    case 1: {
        u16 held;

        IndexedSelectionController_SnapTransitionOrigin(self);
        held = *(const u16 *)keys;
        if ((held & 0x40) != 0) {
            IndexedSelectionController_Increment(self);
        } else if ((held & 0x80) != 0) {
            IndexedSelectionController_Decrement(self);
        } else if (arrows_enabled != 0) {
            if (GraphicsSpriteState_TestTouchPoint(
                    *(void **)((u8 *)*(void **)(self + 0x4c) + 0x9c), touch) &&
                *(s32 *)(self + 0x1bc) != 0) {
                IndexedSelectionController_Increment(self);
            } else if (GraphicsSpriteState_TestTouchPoint(
                           *(void **)((u8 *)*(void **)(self + 0x50) + 0x9c),
                           touch) && *(s32 *)(self + 0x1bc) != 0) {
                IndexedSelectionController_Decrement(self);
            } else if (buttons_enabled != 0 &&
                       GraphicsSpriteState_TestTouchPoint(
                           *(void **)((u8 *)*(void **)(self + 0x4c) + 0x9c),
                           touch)) {
                if (IndexedSelectionController_Increment(self) == 0)
                    Sound_Play(gSoundContext, 0, 0x16);
                *(s32 *)(self + 0x1bc) = 1;
            } else if (buttons_enabled != 0 &&
                       GraphicsSpriteState_TestTouchPoint(
                           *(void **)((u8 *)*(void **)(self + 0x50) + 0x9c),
                           touch)) {
                if (IndexedSelectionController_Decrement(self) == 0)
                    Sound_Play(gSoundContext, 0, 0x16);
                *(s32 *)(self + 0x1bc) = 1;
            } else if (buttons_enabled != 0 &&
                       SpriteMotionController_BeginHitResponse(
                           self + 0x108, touch, 0, 4)) {
                Sound_Play(gSoundContext, 0, 3);
                ++*(s32 *)(self + 0x1b4);
            } else if (buttons_enabled != 0 &&
                       SpriteMotionController_BeginHitResponse(
                           self + 0x5c, touch, 0, 4)) {
                Sound_Play(gSoundContext, 0, 2);
                *(s32 *)(self + 0x1b8) = 1;
                ++*(s32 *)(self + 0x1b4);
            }
        }
        if (func_02096390(self) != 0) {
            Sound_Play(gSoundContext, 0, 0);
            *(s32 *)(self + 0x1b4) = 0;
        }
        break;
    }
    case 2:
        if (*(s32 *)(self + 0x1b8) != 0) {
            if (NumericPrompt_IsMotionComplete(self + 0x5c))
                ++*(s32 *)(self + 0x1b4);
        } else if (NumericPrompt_IsMotionComplete(self + 0x108)) {
            ++*(s32 *)(self + 0x1b4);
        }
        break;
    case 3:
        return 1;
    }
    return 0;
}
