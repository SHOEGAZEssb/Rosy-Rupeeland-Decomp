#include "tingle/types.h"

/*
 * Overlay 5 presentation construction. This recovered constructor assembles
 * the overlay's font-backed controller, populated scene, auxiliary helper,
 * game-work selection state, initial coordinates, and transition callback.
 */

typedef struct Overlay005Presentation {
    u8 bytes[0x84];
} Overlay005Presentation;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;
extern const u8 data_ov005_021fcad4[];
extern const u8 data_ov005_021fcb0c[];
extern const u8 data_ov005_021fcb14[];
extern const u8 data_ov005_021fcb1c[];
extern const u8 data_ov005_021fc95c[];
extern const s32 data_ov005_021fc8f0[];
extern const s32 data_ov005_021fc9e8[2];
extern const u8 data_020d780c[];
extern void SceneInputBase_Init(void *state);
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *context, void *resource, s32 mode);
extern void *SpritePresentation_Init(void *memory, void *drawObject);
extern void Presentation_SetPosition(void *object, s32 first, s32 second, s32 third);
extern void Presentation_SetScript(void *object, const void *data, s32 mode);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern void func_ov005_021fc278(void *state);
extern void *func_ov005_021fb86c(void *memory, void *owner,
                                s32 createMarkers);
extern void func_ov005_021fbd74(void *scene, s32 index);
extern void func_ov005_021fbd64(void *scene, s32 first, s32 second);
extern void *AreaInfoPanelPresentation_Init(void *memory, void *owner);
extern void func_ov005_021fbe44(void *state, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/* Clamp only the confirmed upper bound; negative values are preserved. */
static s32 overlay005_clamp_index(s32 value)
{
    return value > 11 ? 11 : value;
}

/* Read one signed coordinate from a 0x34-byte shared record. */
static s16 overlay005_presentation_coordinate(s32 index, s32 offset)
{
    return *(const s16 *)(data_020d780c + index * 0x34 + offset);
}

/*
 * Initialize the inherited base and install data_ov005_021fcad4. Construct
 * resource +0x54 with IDs 0x1023..0x1025 and cache the gDebugFont context at
 * +0x60. Allocate a 0xA0-byte helper tagged by data_ov005_021fcb0c; on
 * success create a mode-2 draw from +0x54 and construct SpritePresentation_Init. Store
 * it at +0x64, configure coordinates 0x130000/-0x20000/0, set its draw
 * halfwords +0x32/+0x34 to 0x200, and apply data_ov005_021fc95c in mode 1.
 *
 * Read signed gGameWork halfwords +0x1DE/+0x12E/+0x1CE into +0x68/+0x6C/+0x70
 * and clamp each only above 11. Clear game-work flags 0x3D3..0x3D6 and invoke
 * func_ov005_021fc278. Allocate the 0x15C-byte populated scene tagged by
 * data_ov005_021fcb14, constructing it with gDebugFont and markers disabled;
 * store +0x74, select index +0x68, set its context pair to 0 and the negated
 * data_ov005_021fc8f0 entry, and set scene +0x158 to one. Allocate a 0x3C-byte
 * helper tagged by data_ov005_021fcb1c, construct AreaInfoPanelPresentation_Init with gDebugFont,
 * and store +0x78. Derive +0x7C/+0x80 as 20.12 coordinates from record +0x18
 * and record +0x1A minus the same table entry. Set +0x20 bit 10, initialize
 * transition state from data_ov005_021fc9e8 through func_ov005_021fbe44, and
 * return state. Allocator failure handling is delegated and several callees
 * are assumed by the original to succeed before later dereference.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005Presentation *func_ov005_021fbe6c(Overlay005Presentation *state)
{
    void *controller;
    void *scene;
    void *auxiliary;
    s32 selected;

    SceneInputBase_Init(state);
    FIELD(const void *, state, 0x000) = data_ov005_021fcad4;
    AnimationResourceState_InitEmbedded((u8 *)state + 0x54);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x54, data_020f4e18, 0x1023, 0x1024,
                  0x1025);
    FIELD(void *, state, 0x060) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);

    controller = Heap_Alloc(0xa0, data_ov005_021fcb0c, 4, gHeapContext);
    if (controller != 0) {
        void *draw = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x060),
                                   (u8 *)state + 0x54, 2);
        controller = SpritePresentation_Init(controller, draw);
    }
    FIELD(void *, state, 0x064) = controller;
    Presentation_SetPosition(controller, 0x130000, -0x20000, 0);
    {
        void *draw = FIELD(void *, controller, 0x09c);
        FIELD(u16, draw, 0x32) = 0x200;
        FIELD(u16, draw, 0x34) = 0x200;
    }
    Presentation_SetScript(controller, data_ov005_021fc95c, 1);

    FIELD(s32, state, 0x068) =
        overlay005_clamp_index(FIELD(s16, gGameWork, 0x1de));
    FIELD(s32, state, 0x06c) =
        overlay005_clamp_index(FIELD(s16, gGameWork, 0x12e));
    FIELD(s32, state, 0x070) =
        overlay005_clamp_index(FIELD(s16, gGameWork, 0x1ce));
    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d4);
    GameWork_ClearFlag(gGameWork, 0x3d5);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    func_ov005_021fc278(state);

    scene = Heap_Alloc(0x15c, data_ov005_021fcb14, 4, gHeapContext);
    if (scene != 0) {
        scene = func_ov005_021fb86c(scene, gDebugFont, 0);
    }
    FIELD(void *, state, 0x074) = scene;
    selected = FIELD(s32, state, 0x068);
    func_ov005_021fbd74(scene, selected);
    func_ov005_021fbd64(scene, 0, -data_ov005_021fc8f0[selected]);
    FIELD(s32, scene, 0x158) = 1;

    auxiliary = Heap_Alloc(0x3c, data_ov005_021fcb1c, 4, gHeapContext);
    if (auxiliary != 0) {
        auxiliary = AreaInfoPanelPresentation_Init(auxiliary, gDebugFont);
    }
    FIELD(void *, state, 0x078) = auxiliary;
    FIELD(s32, state, 0x07c) =
        (s32)overlay005_presentation_coordinate(selected, 0x18) << 12;
    FIELD(s32, state, 0x080) =
        (overlay005_presentation_coordinate(selected, 0x1a) -
         data_ov005_021fc8f0[selected])
        << 12;
    FIELD(u32, state, 0x020) |= 0x400;
    func_ov005_021fbe44(state, data_ov005_021fc9e8[0],
                        data_ov005_021fc9e8[1]);
    return state;
}

#undef FIELD
