#include "tingle/types.h"

/* Overlay 28 main scene construction and owned graphics/UI object assembly. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *data_021052fc;
extern void *gDebugFont;
extern void *gHeapContext;
extern const u8 data_ov028_021ff2ac[];
extern const s32 data_ov028_021ff238[];
extern const s32 data_ov028_021ff250[];
extern const s32 data_ov028_021ff210[];
extern const u8 data_ov028_021ff2d8[];
extern const u8 data_ov028_021ff2e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern u32 genrand_int32(void);
extern void AnimationResourceState_InitEmbedded(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroup_ReplaceStateResources(void *, s32, s32, s32);
extern void SceneInputBase_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_02092814(void *, s32);
extern void IndexedSelectionController_Init(void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void PresentationList_Append(void *, void *);
extern void *SpritePresentation_Init(void *, void *);
extern void SpritePresentation_Hide(void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_ov028_021fce00(void *);
extern void func_ov028_021fd680(void *, void *);
extern void func_ov028_021fda98(void *);
extern void func_ov028_021fdad8(void *, s32, s32);
extern void func_ov028_021fdf94(void *, const s32 *);
extern void func_ov028_021fe1b0(void *);
extern void func_ov028_021fe3a4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay's main scene object. It initializes the inherited
 * base and installs vtable 0x021FF2AC; constructs resource sets +0x5C/+0x68/
 * +0x74, two sprite controllers +0x98/+0x144, manager +0x1FC, input/UI state
 * +0x228, child base +0x264, and randomized scanline state +0x280. It loads the
 * scene's resource triples and manager IDs, creates renderers +0x54/+0x58,
 * sprites and two 0xA0-byte child objects, an effect owner +0x224, and imports
 * an optional global sprite at +0x90 while preserving its original fields at
 * +0x80..+0x94. Finally it selects one of two callback/value pairs according
 * to child +0x220/+0x40, sets state bit 0x400 at +0x20, and returns `state`.
 * Numerous heap allocations and graphics, resource, input, and UI SDK objects
 * change ownership; no direct hardware registers are accessed here.
 */
extern "C" void *func_ov028_021fdb00(void *state)
{
    SceneInputBase_Init(state);
    FIELD(const void *, state, 0) = data_ov028_021ff2ac;
    AnimationResourceState_InitEmbedded((u8 *)state + 0x5c);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x68);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x74);
    func_020957bc((u8 *)state + 0x98);
    func_020957bc((u8 *)state + 0x144);
    TitleCharacterResourceCollection_Init((u8 *)state + 0x1fc);
    IndexedSelectionController_Init((u8 *)state + 0x228);
    func_ov028_021fda98((u8 *)state + 0x264);
    FIELD(u32, state, 0x27c) = 0;
    func_ov028_021fce00((u8 *)state + 0x280);
    FIELD(u32, state, 0x27c) = genrand_int32();
    FIELD(void *, state, 0x220) = 0;
    func_ov028_021fdf94((u8 *)state + 0x274, data_ov028_021ff238);
    func_ov028_021fe1b0(state);
    func_02092814((u8 *)state + 0x1fc, 0x7007);
    func_02092814((u8 *)state + 0x1fc, 0x7005);
    func_02071ee0((u8 *)state + 0x5c, data_020f4e18[0],
                  0x5d, 0x5e, 0x5f);
    func_02071ee0((u8 *)state + 0x68, data_020f4e18[0],
                  0x1f, 1, 0x20);
    func_02071ee0((u8 *)state + 0x74, data_020f4e18[0],
                  0x138a, 0x1078, 0x138b);
    FIELD(void *, state, 0x54) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    FIELD(void *, state, 0x58) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    func_ov028_021fe1b0(state);
    func_ov028_021fe3a4(state);

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x54),
                                 (u8 *)state + 0x68, 1);
    FIELD(void *, state, 0x8c) = sprite;
    GraphicsSpriteState_ApplyRenderConfig(sprite, 1, 0x84, 0x1e, 1, 0, 6);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x54),
                           (u8 *)state + 0x5c, 1);
    func_020957f0((u8 *)state + 0x98, sprite, 1, 1, 0);
    func_02095820((u8 *)state + 0x98, 0x80, 0xaa);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x54),
                           (u8 *)state + 0x5c, 1);
    func_020957f0((u8 *)state + 0x144, sprite, 0, 1, 0);
    func_02095820((u8 *)state + 0x144, 0xe8, 0xaa);

    void *child = Heap_Alloc(0xa0, data_ov028_021ff2d8, 4, gHeapContext);
    if (child != 0) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x58),
                               (u8 *)state + 0x74, 1);
        child = SpritePresentation_Init(child, sprite);
    }
    FIELD(void *, state, 0x260) = child;
    PresentationList_Append((u8 *)state + 0x264, child);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0x9c), 7);
    FIELD(u16, FIELD(void *, child, 0x9c), 0x24) |= 6;
    Presentation_SetPosition(child, FIELD(s32, state, 0x274),
                  FIELD(s32, state, 0x278), 0);

    for (s32 i = 0; i < 2; ++i) {
        child = Heap_Alloc(0xa0, data_ov028_021ff2d8, 4, gHeapContext);
        if (child != 0) {
            sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x54),
                                   (u8 *)state + 0x5c, 1);
            child = SpritePresentation_Init(child, sprite);
        }
        FIELD(void *, state, 0x1f0 + i * 4) = child;
        PresentationList_Append((u8 *)state + 0x264, child);
        Presentation_SetPosition(child, (i != 0 ? 0xf0 : 0x10) << 12,
                      0x4a000, 0);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child, 0x9c), i != 0 ? 5 : 3);
        SpritePresentation_Hide(child);
    }

    void *effect = Heap_Alloc(0x74, data_ov028_021ff2e0, 4, gHeapContext);
    if (effect != 0)
        func_ov028_021fd680(effect, data_020f4e14[0]);
    FIELD(void *, state, 0x224) = effect;

    void *owner = FIELD(void *, (u8 *)data_021052fc + 0x2000, 0xea4);
    sprite = FIELD(void *, owner, 0x58);
    FIELD(void *, state, 0x90) = sprite;
    if (sprite != 0) {
        FIELD(s32, state, 0x80) = FIELD(s32, sprite, 0x14);
        FIELD(s32, state, 0x84) = FIELD(s32, sprite, 0x18);
        FIELD(s32, state, 0x88) = FIELD(s32, sprite, 0x1c);
        FIELD(u32, state, 0x94) = FIELD(u8, sprite, 0x38);
        const s32 *ids = FIELD(const s32 *, owner, 0x208);
        GraphicsSpriteGroup_ReplaceStateResources(FIELD(void *, sprite, 0), ids[1], ids[2], ids[3]);
        GraphicsSpriteState_SetAnimationIndex(sprite, 0xc);
        FIELD(u16, sprite, 0x36) = 0x100;
        FIELD(u16, sprite, 0x24) |= 2;
        FIELD(u16, sprite, 0x24) &= (u16)~1;
    }

    const s32 *pair;
    if (FIELD(s32, FIELD(void *, state, 0x220), 0x40) == 0) {
        FIELD(u32, state, 0x20) = (FIELD(u32, state, 0x20) & ~1u) | 1;
        pair = data_ov028_021ff250;
    } else {
        pair = data_ov028_021ff210;
    }
    func_ov028_021fdad8(state, pair[0], pair[1]);
    FIELD(u32, state, 0x20) |= 0x400;
    return state;
}
