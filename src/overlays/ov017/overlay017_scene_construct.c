#include "tingle/heap.h"
#include "tingle/types.h"

/* Overlay 17 scene construction, resource acquisition, object population, and initial graphics setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern void *data_020f4e14;
extern void *data_020f4e18[];
extern void *data_021e9ac0;
extern u8 data_021e9e1c[];
extern const s32 data_ov017_02201414[];
extern const s32 data_ov017_02201548[2];
extern const u32 data_ov017_02201638[];
extern const char data_ov017_02201684[];
extern const char data_ov017_0220168c[];
extern const char data_ov017_02201694[];
extern const char data_ov017_0220169c[];
extern const char data_ov017_022016a4[];
extern const char data_ov017_022016ac[];
extern u8 data_ov017_022016e0[];
extern HeapContext gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern u32 func_02062a50(void *);
extern s32 ActorDescriptor_GetKind0Value(void *);
extern s32 InventoryRecordCollection_FindId(void *, u16);
extern void InventoryRecordCollection_RemoveQuantity(void *, s32, u16);
extern void RetailPhaseSelection_Reset(void *);
extern void RetailPhaseSelection_AddActor(void *, u16, s32);
extern s32 RetailPhaseSelection_BuildScaledResult(void *, s32);
extern void *RetailPhaseSelection_SelectMatchingRecord(void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsResourceSetVariant_Init(void *);
extern void GraphicsResourceSetVariant_Load(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_ReleaseExtendedPalette(void *, s32);
extern void *Graphics3DResourceOwner_Init(void *, s32, s32);
extern void *Graphics3DResourceOwner_CreateManager(void *);
extern void Graphics3DResourceOwner_PrepareResources(void *, void *);
extern void Graphics3DLightSet_Init(void *);
extern void Graphics3DSceneState_Init(void *);
extern void *Graphics3DRenderObject_Init(void *, void *, void *, s32, s32);
extern s32 TitleRandom_NextBounded(void *, s32);
extern void SceneInputBase_Init(void *);
extern void GraphicsBankStateSnapshot_Init(void *);
extern void GraphicsBankStateSnapshot_Capture(void *);
extern void TitleScreenResourceCollection_Init(void *);
extern void TitleScreenResourceCollection_Append(void *, s32);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void *SpritePresentation_Init(void *, void *);
extern void SpritePresentation_Hide(void *);
extern void SpritePresentation_SyncPosition(void *);
extern void SpriteMotionController_Init(void *);
extern void SpriteMotionController_BindSprite(void *, void *, s32, s32, s32);
extern void SpriteMotionController_SetPosition(void *, s32, s32);
extern void SpriteMotionController_Hide(void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void Sound_LoadGroup(void *, s32);
extern void func_020ae778(void);
extern void func_020ae7b0(void);
extern void *Overlay017_Grid_Init(void *, s32);
extern void *Overlay017_Transform_Init(void *);
extern void Overlay017Transform_ReplaceResource(void *, s32);
extern void *Overlay017_SpritePool_Init(void *, void *);
extern void *Overlay017UiSpriteGroup_Init(void *, s32, s32);
extern void *func_ov017_021fe9c0(void *);
extern void func_ov017_021fea00(void *, s32, s32, s32);
extern void Overlay017Record_SetSecondaryVector(void *, s32, s32, s32);
extern void func_ov017_021fea18(void *, s32, s32, s32, s32, u32, u32, u32);
extern void func_ov017_021fea8c(void *, s32, s32, s32);
extern void func_ov017_021ff150(void *);
extern void func_ov017_021ff58c(void *);
extern void func_ov017_021ff75c(void *);
extern void *func_ov017_021ff8a8(void *, s32, u32, u32, u16);
extern void Overlay017_UpdatePaletteRamp(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the scene from an effect count, an array of effect IDs, a category,
 * and a global radius-table selector. Initialize all embedded controllers and
 * transforms, seed the scene PRNG, configure overlay globals, acquire the main
 * 2D/3D resource sets, and create the two UI objects plus the central resource
 * object. For every caller ID, register its data, update the selected global
 * record, choose a random radial position, spawn an effect, and accumulate its
 * recovered value. Then derive the three five-bit palette components, set up
 * graphics/projection, allocate the sprite pool, progress group, draw object,
 * and 9x9 deformation grid, start sound 0x82, enable display bit 10, and install
 * callback pair data_ov017_02201548. Returns state. Heap, PRNG, resource,
 * graphics, audio, global, and caller-owned scene state all change; setup
 * helpers may access Nintendo DS graphics hardware.
 */
extern "C" void *func_ov017_021feab4(void *state, s32 effectCount,
                                      const s32 *effectIds, s32 category,
                                      s32 radiusIndex)
{
    void *object;
    void *global;
    s32 i;

    SceneInputBase_Init(state);
    FIELD(const u32 *, state, 0) = data_ov017_02201638;
    AnimationResourceState_InitEmbedded((u8 *)state + 0x5c);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x68);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x74);
    SpriteMotionController_Init((u8 *)state + 0x80);
    SpriteMotionController_Init((u8 *)state + 0x12c);
    TitleCharacterResourceCollection_Init((u8 *)state + 0x1d8);
    TitleScreenResourceCollection_Init((u8 *)state + 0x1fc);
    GraphicsResourceSetVariant_Init((u8 *)state + 0x248);
    Overlay017_Transform_Init((u8 *)state + 0x264);
    Overlay017_Transform_Init((u8 *)state + 0x290);
    Graphics3DLightSet_Init((u8 *)state + 0x2d0);
    Graphics3DSceneState_Init((u8 *)state + 0x310);
    func_ov017_021ff150((u8 *)state + 0x3ac);
    func_ov017_021fe9c0((u8 *)state + 0x3d8);
    func_ov017_021fe9c0((u8 *)state + 0x3ec);
    FIELD(s32, state, 0x3fc) = 0;
    GraphicsBankStateSnapshot_Init((u8 *)state + 0x404);
    FIELD(s32, state, 0x50) = 0;
    FIELD(u32, state, 0x3fc) = genrand_int32();

    FIELD(s32, data_ov017_022016e0, 0xc) = radiusIndex;
    FIELD(s32, data_ov017_022016e0, 0) = 0;
    FIELD(s32, data_ov017_022016e0, 8) = 0x708;
    FIELD(s32, state, 0x3d4) = 0;
    FIELD(s32, state, 0x3e8) = 0;
    FIELD(void *, state, 0x400) = 0;
    FIELD(void *, state, 0x440) = 0;
    GraphicsSpriteRenderer_ReleaseExtendedPalette(data_020f4e14, 0);
    GraphicsBankStateSnapshot_Capture((u8 *)state + 0x404);
    func_020ae7b0();
    func_020ae778();

    object = Heap_Alloc(0x624, data_ov017_02201684, 4, &gHeapContext);
    if (object != 0)
        object = Graphics3DResourceOwner_Init(object, 1, 1);
    FIELD(void *, state, 0x240) = object;
    FIELD(void *, state, 0x244) = Graphics3DResourceOwner_CreateManager(object);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x1d8, 0x7006);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x5c, data_020f4e18[0], 0xd, 0xe, 0xf);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x68, data_020f4e18[0], 0x10, 0x11, 0x12);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x74, data_020f4e18[0], 0x13, 0x14, 0x15);
    GraphicsResourceSetVariant_Load((u8 *)state + 0x248, data_020f4e18[0],
                  0x601b, 0x601c, 0x601d);
    Graphics3DResourceOwner_PrepareResources(FIELD(void *, state, 0x240), (u8 *)state + 0x248);
    TitleScreenResourceCollection_Append((u8 *)state + 0x1fc, 0x8002);
    TitleScreenResourceCollection_Append((u8 *)state + 0x1fc, 0x8003);

    FIELD(void *, state, 0x58) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    object = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x58), (u8 *)state + 0x5c, 1);
    SpriteMotionController_BindSprite((u8 *)state + 0x12c, object, 5, 2, 0);
    SpriteMotionController_SetPosition((u8 *)state + 0x12c, 0x50, 0xa0);
    SpriteMotionController_Hide((u8 *)state + 0x12c);
    object = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x58), (u8 *)state + 0x5c, 1);
    SpriteMotionController_BindSprite((u8 *)state + 0x80, object, 3, 2, 0);
    SpriteMotionController_SetPosition((u8 *)state + 0x80, 0xb0, 0xa0);
    SpriteMotionController_Hide((u8 *)state + 0x80);

    object = Heap_Alloc(0xa0, data_ov017_0220168c, 4, &gHeapContext);
    if (object != 0) {
        object = SpritePresentation_Init(
            object, GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x58),
                                  (u8 *)state + 0x68, 1));
    }
    FIELD(void *, state, 0x260) = object;
    FIELD(u8, FIELD(void *, object, 0x9c), 0x3a) = 2;
    SpritePresentation_Hide(object);
    Presentation_SetPosition(object, -0x40000, 0x60000, 0);
    SpritePresentation_SyncPosition(object);

    FIELD(s32, state, 0x310) = 1;
    func_ov017_021fea00((u8 *)state + 0x310, 0, 0x1800, 0x1000);
    Overlay017Record_SetSecondaryVector((u8 *)state + 0x310, 0, 0, 0);
    func_ov017_021fea18((u8 *)state + 0x2d0, 0,
                        0x1000, -0x1000, -0x1000, 0x1f, 0x1f, 0x1f);
    func_ov017_021fea18((u8 *)state + 0x2d0, 1,
                        0x800, -0x1000, 0, 0x1f, 0x1f, 0x1f);

    RetailPhaseSelection_Reset(data_021e9e1c);
    global = data_021e9ac0;
    FIELD(s32, state, 0x3c0) = effectCount;
    FIELD(s32, state, 0x3c4) = category;
    FIELD(s32, state, 0x3c8) = 0;
    FIELD(s32, state, 0x3cc) = 0;
    FIELD(s32, state, 0x3d0) = 0;
    for (i = 0; i < effectCount; i++) {
        u16 effectId = (u16)effectIds[i];
        s32 recordIndex;
        s32 recordValue;
        s32 angle;
        s32 radius;

        RetailPhaseSelection_AddActor(data_021e9e1c, effectId, 1);
        recordIndex = InventoryRecordCollection_FindId(global, effectId);
        recordValue = ActorDescriptor_GetKind0Value(
            (u8 *)FIELD(void *, global, 8) + recordIndex * 0x24);
        InventoryRecordCollection_RemoveQuantity(global, recordIndex, (u16)category);
        angle = TitleRandom_NextBounded((u8 *)state + 0x3fc, 0x1000) << 1;
        radius = TitleRandom_NextBounded(
            (u8 *)state + 0x3fc,
            data_ov017_02201414[radiusIndex] - 0xc);
        func_ov017_021ff8a8(
            state, effectId,
            radius * gFx32CosSinTable[angle * 2],
            radius * gFx32CosSinTable[angle * 2 + 1],
            (u16)recordValue);
        FIELD(s32, state, 0x3c8) += recordValue;
    }

    FIELD(s32, state, 0x3b8) = 0;
    FIELD(s32, state, 0x3bc) = RetailPhaseSelection_BuildScaledResult(data_021e9e1c, category);
    FIELD(void *, state, 0x258) = RetailPhaseSelection_SelectMatchingRecord(data_021e9e1c);
    if (FIELD(void *, state, 0x258) == 0) {
        FIELD(s32, state, 0x2c4) = 0xc;
        FIELD(s32, state, 0x2c8) = 0x10;
        FIELD(s32, state, 0x2cc) = 8;
    } else {
        u32 color = func_02062a50(
            (u8 *)FIELD(void *, FIELD(void *, state, 0x258), 0) + 4);
        FIELD(s32, state, 0x2c4) = color & 0x1f;
        FIELD(s32, state, 0x2c8) = (color >> 5) & 0x1f;
        FIELD(s32, state, 0x2cc) = (color >> 10) & 0x1f;
    }

    Overlay017_UpdatePaletteRamp(state);
    func_ov017_021ff58c(state);
    func_ov017_021ff75c(state);
    Overlay017Transform_ReplaceResource((u8 *)state + 0x264, 0x5011);
    FIELD(s32, state, 0x278) = 0x400;
    FIELD(s32, state, 0x27c) = 0x400;
    FIELD(s32, state, 0x280) = 0x400;
    Overlay017Transform_ReplaceResource((u8 *)state + 0x290, 0x5052);

    object = Heap_Alloc(0x58, data_ov017_02201694, 4, &gHeapContext);
    if (object != 0)
        object = Overlay017_SpritePool_Init(object, FIELD(void *, state, 0x240));
    FIELD(void *, state, 0x254) = object;
    object = Heap_Alloc(0x68, data_ov017_0220169c, 4, &gHeapContext);
    if (object != 0)
        object = Overlay017UiSpriteGroup_Init(
            object, FIELD(s32, state, 0x3c0), FIELD(s32, state, 0x3c8));
    FIELD(void *, state, 0x25c) = object;
    object = Heap_Alloc(0x10, data_ov017_022016a4, 4, &gHeapContext);
    if (object != 0) {
        object = Graphics3DRenderObject_Init(object, data_020f4e18[0],
                               FIELD(void *, state, 0x240), 0x6122, 0x6123);
    }
    FIELD(void *, state, 0x2bc) = object;
    object = Heap_Alloc(0xca8, data_ov017_022016ac, 4, &gHeapContext);
    if (object != 0) {
        object = Overlay017_Grid_Init(
            object, data_ov017_02201414[radiusIndex] + 0xc);
    }
    FIELD(void *, state, 0x2c0) = object;

    Sound_LoadGroup(gSoundContext, 0x82);
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov017_021fea8c(state, data_ov017_02201548[0],
                        data_ov017_02201548[1], 0);
    return state;
}
