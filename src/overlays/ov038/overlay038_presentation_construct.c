#include "tingle/types.h"

/* Overlay 38 presentation construction for a flag-filtered selection/list screen. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov038_021fdd28[];
extern const u8 data_ov038_021fdd3c[];
extern const u8 data_ov038_021fdd44[];
extern const u8 data_ov038_021fdd4c[];
extern const u32 data_ov038_021fdcd0[2];
extern void *data_020f4e18[];
extern void *data_020f4e14[];
extern s32 data_020c37e4[];
extern const u8 data_020d7a48[];
extern void *gGameWork;
extern void *gHeapContext;
extern void *gDebugFont[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Init(void *presentation, void *argument);
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void SpriteMotionController_Init(void *list);
extern void TitleCharacterResourceCollection_Init(void *transform);
extern void TitleInterpolatedValue_Init(void *timer);
extern void AnimationResourceState_ReplaceResources(void *resource, void *archive, s32 firstId,
                          s32 mode, s32 lastId);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *resource);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group, void *source, s32 mode);
extern void SpriteMotionController_BindSprite(void *list, void *resource, s32 count, s32 mode,
                          s32 initial);
extern void SpriteMotionController_SetPosition(void *list, s32 width, s32 height);
extern s32 GameWork_TestFlag(void *gameWork, u16 flag);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *InventoryScroll_Init(void *object, void *resource, s32 count, s32 mode,
                           s32 width, s32 rowHeight, s32 columns);
extern void InventoryScroll_SetSpritePriority(void *object, s32 enabled);
extern void InventoryScroll_UpdatePresentation(void *object);
extern void TitleCharacterResourceCollection_Append(void *transform, s32 command);
extern void func_ov038_021fd210(void *presentation);
extern void func_ov038_021fd28c(void *presentation);
extern void *func_ov046_0220b7bc(void *object, void *font, s32 mode);
extern const void *func_ov038_021fd508(void *presentation);
extern void func_ov046_0220bffc(void *object, const void *text,
                                s32 x, s32 y);
extern void func_ov046_0220c478(void *object, const void *text);
extern void *AreaInfoPanelPresentation_Init(void *object, void *font);
extern void func_02091b98(void *timer, s32 delay);
extern void func_ov038_021fce04(void *node, void *value24, void *value28);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay-38 selection presentation. It initializes embedded
 * resource +0x54, list +0x64, transform +0x318, and timer +0x348 objects; loads
 * archive IDs 0x38/0x39; scans data_020d7a48 records (stride 0x24) and retains
 * indices whose +0x1C flag is set in gGameWork at +0x114 with count +0x110.
 * When entries exist it allocates/configures the +0x314 selection model and
 * its transform. It always creates +0x340/+0x344 debug-font UI objects, starts
 * the timer at 120, sets +0x364 to 1, enables presentation flag 0x400, and
 * initializes node values from data_ov038_021fdcd0. Returns presentation;
 * archive, heap, font/UI, timer, and presentation state change. A zero-entry
 * list leaves +0x314 null, matching the original branch.
 */
extern "C" void *func_ov038_021fce2c(void *presentation, void *argument)
{
    SceneInputBase_Init(presentation, argument);
    FIELD(const void *, presentation, 0) = data_ov038_021fdd28;
    AnimationResourceState_InitEmbedded((u8 *)presentation + 0x54);
    SpriteMotionController_Init((u8 *)presentation + 0x64);
    TitleCharacterResourceCollection_Init((u8 *)presentation + 0x318);
    TitleInterpolatedValue_Init((u8 *)presentation + 0x348);
    FIELD(s32, presentation, 0x33c) = 0;

    AnimationResourceState_ReplaceResources((u8 *)presentation + 0x54, data_020f4e18[0],
                  0x38, 1, 0x39);
    void *owner = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    FIELD(void *, presentation, 0x60) = owner;
    void *resource = GraphicsSpriteGroup_CreateStateFromSource(owner, (u8 *)presentation + 0x54, 2);
    SpriteMotionController_BindSprite((u8 *)presentation + 0x64, resource, 6, 1, 0);
    SpriteMotionController_SetPosition((u8 *)presentation + 0x64, 0xe8, 0xa0);

    FIELD(s32, presentation, 0x110) = 0;
    for (s32 i = 0; i < data_020c37e4[0]; ++i) {
        const u8 *record = data_020d7a48 + i * 0x24;
        if (GameWork_TestFlag(gGameWork, FIELD(u16, record, 0x1c))) {
            s32 count = FIELD(s32, presentation, 0x110);
            FIELD(s32, presentation, 0x114 + count * 4) = i;
            FIELD(s32, presentation, 0x110) = count + 1;
        }
    }

    s32 count = FIELD(s32, presentation, 0x110);
    if (count != 0) {
        void *model = Heap_Alloc(0x80, data_ov038_021fdd3c, 4, gHeapContext);
        if (model != 0)
            model = InventoryScroll_Init(model, data_020f4e14[0], count, 5,
                                  0xe8, 0x20, 4);
        FIELD(void *, presentation, 0x314) = model;
        InventoryScroll_SetSpritePriority(model, 1);
        InventoryScroll_UpdatePresentation(model);
        TitleCharacterResourceCollection_Append((u8 *)presentation + 0x318, 0x7000);
        TitleCharacterResourceCollection_Append((u8 *)presentation + 0x318, 0x7006);
        TitleCharacterResourceCollection_Append((u8 *)presentation + 0x318, 0x7005);
        func_ov038_021fd210(presentation);
        func_ov038_021fd28c(presentation);
    } else {
        FIELD(void *, presentation, 0x314) = 0;
    }

    void *panel = Heap_Alloc(0x118, data_ov038_021fdd44, 4, gHeapContext);
    if (panel != 0)
        panel = func_ov046_0220b7bc(panel, gDebugFont[0], 1);
    FIELD(void *, presentation, 0x340) = panel;
    const void *text = func_ov038_021fd508(presentation);
    func_ov046_0220bffc(panel, text, 0, 0);
    func_ov046_0220c478(panel, func_ov038_021fd508(presentation));

    void *label = Heap_Alloc(0x3c, data_ov038_021fdd4c, 4, gHeapContext);
    if (label != 0)
        label = AreaInfoPanelPresentation_Init(label, gDebugFont[0]);
    FIELD(void *, presentation, 0x344) = label;
    func_02091b98((u8 *)presentation + 0x348, 0x78);
    FIELD(s32, presentation, 0x364) = 1;
    FIELD(u32, presentation, 0x20) |= 0x400;
    func_ov038_021fce04(presentation,
                        (void *)data_ov038_021fdcd0[0],
                        (void *)data_ov038_021fdcd0[1]);
    return presentation;
}
