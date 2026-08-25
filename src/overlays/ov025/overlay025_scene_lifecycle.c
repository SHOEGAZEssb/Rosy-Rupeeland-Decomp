#include "tingle/types.h"

/* Overlay 25 main title/menu scene construction and owned-object setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
/* Retail copies both six-entry sprite-coordinate tables to stack temporaries. */
struct PositionTable {
    s32 values[6];
};
extern const PositionTable data_ov025_02202c9c;
extern const PositionTable data_ov025_02202cb4;
extern const u8 data_ov025_02202cf0[];
extern const u8 data_ov025_02202d68[];
extern const u32 data_ov025_02202ea8[];
extern const u8 data_ov025_02203318[];
extern const u8 data_ov025_02203370[];
extern const u8 data_ov025_02203384[];
extern const u8 data_ov025_0220338c[];
extern const u8 data_ov025_02203394[];
extern const u8 data_ov025_0220339c[];
extern const u8 data_ov025_022033a4[];
extern void *gDebugFont;
extern void *gGameWork;
extern u8 gHeapContext[];
extern void *gSoundContext;

typedef struct TransitionPair {
    void *callback;
    void *argument;
} TransitionPair;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern u32 genrand_int32(void);
extern void GameWork_ClearFlag(void *, s32);
extern void Sound_LoadGroup(void *, s32);
extern void Sound_ReleaseGroup(void *, s32);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void TitleInterpolatedValue_Init(void *);
extern void SceneInputBase_Init(void *);
extern void *TitleDialog_Init(void *, void *, void *);
extern void TitleDialog_SetExternalTextRow(void *, s32, void *);
extern void TitleScreenResourceCollection_Init(void *);
extern void TitleScreenResourceCollection_Destroy(void *);
extern void TitleScreenResourceCollection_Append(void *, s32);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void TitleScrollValue_Init(void *);
extern void Presentation_SetScript(void *, const void *, s32);
extern void PresentationList_Append(void *, void *);
extern void PresentationList_DeleteAll(void *);
extern void *SpritePresentation_Init(void *, void *);
extern void SpriteMotionController_Init(void *);
extern void SpriteMotionController_BindSprite(void *, void *, s32, s32, s32);
extern void SpriteMotionController_SetPosition(void *, s32, s32);
extern void SpriteMotionController_Hide(void *);
extern void *func_ov025_021fdecc(void *);
extern void func_ov025_021fdec8(void *);
extern void *func_ov025_021ff21c(void *, void *);
extern void func_ov025_021ff23c(void *, s32, s32, s32, s32);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_021ff1c8(void *);
extern void func_ov025_021ff1dc(void *);
extern void func_ov025_021ffdfc(void *);
extern void func_ov025_02200014(void *);
extern void *func_ov094_02219568(void *, s32, s32);
extern void func_ov094_022196a4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the 0x63C-byte overlay-25 scene. It initializes seven resource
 * descriptors, six controller objects (three standalone plus a three-element
 * array), callback holder +0x4F8, touch/input and four transition objects,
 * seeds RNG +0x634, resets selection/owned-pointer fields, and configures both
 * display engines through recovered helpers. It loads all scene resource IDs,
 * creates shared/debug sprite owners and button sprites, and loads the retail
 * anm_main_ttl logo, anm_nin_c_ttl copyright, anm_tach_text touch prompt, and
 * anm_ttl_hata resource sets. It allocates three effects
 * (+0x508/+0xDC/+0xE0), an overlay-94 object +0x5C0, and dialog +0x50C,
 * clears game flags 0x3D3/0x3D6, stops sound 0x16F, enables flag 0x400, and
 * installs callback pair data_ov025_02202EA8, whose retail first word is
 * func_ov025_022009D8 (the introductory record scan). Heap, RNG, input,
 * graphics, game-work, sound, and callback state change; the initialized scene
 * pointer is returned.
 */
extern "C" void *func_ov025_021ff27c(void *scene)
{
    SceneInputBase_Init(scene);
    FIELD(const void *, scene, 0) = data_ov025_02203370;
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x5c);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x68);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x74);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x80);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x8c);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x98);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0xa4);
    SpriteMotionController_Init((u8 *)scene + 0xf0);
    SpriteMotionController_Init((u8 *)scene + 0x19c);
    SpriteMotionController_Init((u8 *)scene + 0x248);
    __construct_array((u8 *)scene + 0x2f4, 3, 0xac,
                      (void *)SpriteMotionController_Init,
                      (void *)func_ov025_021ff1c8);
    func_ov025_021ff1dc((u8 *)scene + 0x4f8);
    TitleScreenResourceCollection_Init((u8 *)scene + 0x530);
    TitleCharacterResourceCollection_Init((u8 *)scene + 0x574);
    TitleScrollValue_Init((u8 *)scene + 0x5a0);
    TitleInterpolatedValue_Init((u8 *)scene + 0x5c4);
    TitleInterpolatedValue_Init((u8 *)scene + 0x5e0);
    TitleInterpolatedValue_Init((u8 *)scene + 0x5fc);
    TitleInterpolatedValue_Init((u8 *)scene + 0x618);
    FIELD(u32, scene, 0x634) = 0;
    FIELD(u32, scene, 0x634) = genrand_int32();
    FIELD(void *, scene, 0x598) = 0;
    FIELD(s32, scene, 0x54) = -1;
    FIELD(void *, scene, 0x5b8) = 0;
    FIELD(void *, scene, 0x5bc) = 0;
    FIELD(void *, scene, 0x638) = 0;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    TitleScreenResourceCollection_Append((u8 *)scene + 0x530, 0x8032);
    TitleScreenResourceCollection_Append((u8 *)scene + 0x530, 0x8033);
    TitleScreenResourceCollection_Append((u8 *)scene + 0x530, 0x8034);
    TitleScreenResourceCollection_Append((u8 *)scene + 0x530, 0x8035);
    TitleScreenResourceCollection_Append((u8 *)scene + 0x530, 0x8036);
    TitleScreenResourceCollection_Append((u8 *)scene + 0x530, 0x8037);
    func_ov025_021ffdfc(scene);
    func_ov025_02200014(scene);
    TitleCharacterResourceCollection_Append((u8 *)scene + 0x574, 0x7001);
    TitleCharacterResourceCollection_Append((u8 *)scene + 0x574, 0x7005);
    TitleCharacterResourceCollection_Append((u8 *)scene + 0x574, 0x7007);

    AnimationResourceState_ReplaceResources((u8 *)scene + 0x5c, data_020f4e18, 0x4f, 0x50, 0x51);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x68, data_020f4e18, 0x52, 0x53, 0x54);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x98, data_020f4e18, 0x1046, 0x1047, 0x1048);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x74, data_020f4e18, 0x241b, 0x241c, 0x241d);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x80, data_020f4e18, 0x2421, 0x2422, 0x2423);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x8c, data_020f4e18, 0x2427, 0x2428, 0x2429);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0xa4, data_020f4e18, 0x242d, 0x242e, 0x242f);
    FIELD(void *, scene, 0xb0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    void *debug_group = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(void *, scene, 0xb4) = debug_group;
    FIELD(s32, debug_group, 0x18) = 0;
    FIELD(s32, debug_group, 0x1c) = 0x100;
    s32 i;
    /* Distinct loop lifetimes preserve the retail register assignment. */
    for (s32 j = 0; j < 3; ++j)
        FIELD(void *, (u32)scene + (j << 2), 0xe4) = 0;

    /* Keep these loop invariants explicit for MWCC's retail register coloring. */
    s32 one = 1;
    u8 *controllers = (u8 *)scene + 0x2f4;
    s32 count = 16;
    s32 stride = 0xac;
    for (i = 0; i < 3; ++i) {
        SpriteMotionController_BindSprite(controllers + i * stride,
                      GraphicsSpriteGroup_CreateStateFromSource(
                          FIELD(void *, scene, 0xb0),
                          (u8 *)scene + 0x5c, one),
                      0x20 + i * 2, one, count);
        SpriteMotionController_SetPosition(controllers + i * stride, 0xd4, 0);
        SpriteMotionController_Hide(controllers + i * stride);
    }
    FIELD(void *, scene, 0xbc) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb0),
                                                (u8 *)scene + 0x8c, 2);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xbc), 0, 0x80, 0x60, 0, 0, 6);
    PositionTable x_positions = data_ov025_02202c9c;
    PositionTable y_positions = data_ov025_02202cb4;
    for (i = 0; i < 6; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                                     (u8 *)scene + 0xa4, 2);
        FIELD(void *, (u32)scene + (i << 2), 0xc4) = sprite;
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, (u32)scene + (i << 2), 0xc4),
                      i, x_positions.values[i],
                      y_positions.values[i] - 0x100, 1, 0xf000, 2);
    }
    FIELD(void *, scene, 0xc0) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                                                (u8 *)scene + 0x98, 2);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xc0), 8, 0x80, -0xa0, 1, 0, 6);
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xb0), (u8 *)scene + 0x5c, 1);
    SpriteMotionController_BindSprite((u8 *)scene + 0xf0, sprite, 0x2c, 1, 16);
    SpriteMotionController_SetPosition((u8 *)scene + 0xf0, 0x94, 0xb3);
    SpriteMotionController_Hide((u8 *)scene + 0xf0);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xb0), (u8 *)scene + 0x5c, 1);
    SpriteMotionController_BindSprite((u8 *)scene + 0x19c, sprite, 0x26, 1, 16);
    SpriteMotionController_SetPosition((u8 *)scene + 0x19c, 0xe4, 0xa0);
    SpriteMotionController_Hide((u8 *)scene + 0x19c);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xb0), (u8 *)scene + 0x5c, 1);
    SpriteMotionController_BindSprite((u8 *)scene + 0x248, sprite, 0x32, 1, 16);
    SpriteMotionController_SetPosition((u8 *)scene + 0x248, 0xe0, 0xb3);
    SpriteMotionController_Hide((u8 *)scene + 0x248);

    void *effect = Heap_Alloc(0xfc, data_ov025_02203384, 4, gHeapContext);
    if (effect) effect = func_ov025_021fdecc(effect);
    FIELD(void *, scene, 0x508) = effect;
    PresentationList_Append((u8 *)scene + 0x4f8, FIELD(void *, scene, 0x508));

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                                                       (u8 *)scene + 0x74, 2);
    GraphicsSpriteState_ApplyRenderConfig(sprite, 0, 0, 0, 1, 0x4000, 2);
    effect = Heap_Alloc(0xa0, data_ov025_0220338c, 4, gHeapContext);
    if (effect) effect = func_ov025_021ff21c(effect, sprite);
    FIELD(void *, scene, 0xdc) = effect;
    PresentationList_Append((u8 *)scene + 0x4f8, FIELD(void *, scene, 0xdc));
    Presentation_SetScript(FIELD(void *, scene, 0xdc), data_ov025_02202d68, 1);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                            (u8 *)scene + 0x80, 2);
    GraphicsSpriteState_ApplyRenderConfig(sprite, 0, 0x80, 0xb0, 1, 0x4000, 2);
    effect = Heap_Alloc(0xa0, data_ov025_02203394, 4, gHeapContext);
    if (effect) effect = SpritePresentation_Init(effect, sprite);
    FIELD(void *, scene, 0xe0) = effect;
    PresentationList_Append((u8 *)scene + 0x4f8, FIELD(void *, scene, 0xe0));
    Presentation_SetScript(FIELD(void *, scene, 0xe0), data_ov025_02202cf0, 1);

    void *overlay94 = Heap_Alloc(0x4c, data_ov025_0220339c, 4, gHeapContext);
    if (overlay94) overlay94 = func_ov094_02219568(overlay94, 0xd8, 0xd8);
    FIELD(void *, scene, 0x5c0) = overlay94;
    void *dialog = Heap_Alloc(0xec, data_ov025_022033a4, 4, gHeapContext);
    if (dialog) dialog = TitleDialog_Init(dialog, gDebugFont,
                                      FIELD(void *, scene, 0x57c));
    FIELD(void *, scene, 0x50c) = dialog;
    func_ov025_021ff23c(FIELD(void *, scene, 0x50c),
                        0x10, 0x70, 0xe0, 0x40);
    void *dialog_fields = FIELD(void *, scene, 0x50c);
    FIELD(s32, dialog_fields, 0xd0) = 13;
    FIELD(s32, dialog_fields, 0xd4) = 0;
    FIELD(s32, FIELD(void *, scene, 0x50c), 0xb4) = 0;
    FIELD(s32, FIELD(void *, scene, 0x50c), 0xbc) = -2;
    FIELD(s32, FIELD(void *, scene, 0x50c), 0xc0) = 0;
    TitleDialog_SetExternalTextRow(FIELD(void *, scene, 0x50c), 1, (u8 *)scene + 0x510);
    FIELD(void *, scene, 0x59c) = 0;
    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    Sound_LoadGroup(gSoundContext, 0x16f);
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov025_021ff254(scene,
        *(const TransitionPair *)data_ov025_02202ea8);
    return scene;
}
