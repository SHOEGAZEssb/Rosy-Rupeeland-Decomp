#include "tingle/types.h"

/* Overlay 30 main scene construction and its graphics/UI object graph. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov030_021ff8b0[];
extern const u8 data_ov030_021ff8cc[];
extern const u8 data_ov030_021ff8d4[];
extern const s32 data_ov030_021ff788[];
extern void *data_020f4e18[];
extern void *data_020f4e14[];
extern void *data_021e9ac0[];
extern void *gGameWork;
extern void *gDebugFont;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void SceneInputBase_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void SpriteMotionController_Init(void *);
extern void TitleInterpolatedValue_Init(void *);
extern void TitleScrollValue_Init(void *);
extern void *GraphicsArchive_AcquirePaletteResource(void *, s32);
extern s32 InventoryRecordCollection_FindId(void *, s32);
extern void GameWork_SetFlag(void *, s32);
extern s32 GameWork_TestFlag(void *, s32);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *func_ov045_0220c48c(s32, s32, s32);
extern void *TitleDialog_Init(void *, void *, void *);
extern void func_02092f88(void *, s32, void *);
extern void SpriteMotionController_BindSprite(void *, void *, s32, s32, s32);
extern void SpriteMotionController_SetPosition(void *, s32, s32);
extern void *func_ov045_0220b83c(void *);
extern void func_ov030_021fe2b4(void *);
extern void func_ov030_021fe448(void *);
extern void func_ov030_021fe808(void *);
extern void func_ov030_021fd9fc(void *, s32, s32, s32, s32);
extern void func_ov030_021fda14(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the 0x394-byte main scene in caller-provided `scene`. It installs
 * vtable 0x021FF8B0, initializes the base scene, graphics configuration +0x54,
 * three resource sets +0x7C/+0x88/+0x94, three controllers +0xB8/+0x164/+0x210,
 * palette/animation helpers +0x340/+0x364, sprite renderer +0x78, a dialog at
 * +0x2BC, four pairs of menu sprites +0xA0..+0xB4, an auxiliary object +0x2C0,
 * and a 0x70-byte overlay-45 object +0x2C8. Persistent flag 0x3B9 selects the
 * one-row or two-row menu layout; discovering resource 0x165 sets that flag.
 * It clears three 16-entry halfword arrays, seeds the embedded coordinate state
 * from table 0x021FF788, enables scene flag 0x400, and returns `scene`. Numerous
 * engine resource, heap, sprite, flag, and renderer states change; this routine
 * performs no direct MMIO.
 */
extern "C" void *func_ov030_021fda3c(void *scene)
{
    SceneInputBase_Init(scene);
    FIELD(const void *, scene, 0) = data_ov030_021ff8b0;
    TitleCharacterResourceCollection_Init((u8 *)scene + 0x54);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x7c);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x88);
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x94);
    SpriteMotionController_Init((u8 *)scene + 0xb8);
    SpriteMotionController_Init((u8 *)scene + 0x164);
    SpriteMotionController_Init((u8 *)scene + 0x210);
    TitleInterpolatedValue_Init((u8 *)scene + 0x340);
    TitleScrollValue_Init((u8 *)scene + 0x364);

    FIELD(void *, scene, 0x360) = GraphicsArchive_AcquirePaletteResource(data_020f4e18[0], 0xc007);
    FIELD(s32, scene, 0x33c) = 0;
    FIELD(s32, scene, 0x338) = 0;
    FIELD(s32, scene, 0x35c) = -1;
    FIELD(s32, scene, 0x390) = 0;
    func_ov030_021fe2b4(scene);
    func_ov030_021fe448(scene);

    FIELD(void *, scene, 0x37c) = data_021e9ac0[0];
    FIELD(s32, scene, 0x380) = InventoryRecordCollection_FindId(FIELD(void *, scene, 0x37c), 0x164);
    FIELD(s32, scene, 0x388) = InventoryRecordCollection_FindId(FIELD(void *, scene, 0x37c), 0x165);
    if (FIELD(s32, scene, 0x388) >= 0)
        GameWork_SetFlag(gGameWork, 0x3b9);

    TitleCharacterResourceCollection_Append((u8 *)scene + 0x54, 0x7007);
    TitleCharacterResourceCollection_Append((u8 *)scene + 0x54, 0x7005);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x7c, data_020f4e18[0], 0x42, 1, 0x43);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x88, data_020f4e18[0], 0xd0e4, 0xd081, 0xd082);
    AnimationResourceState_ReplaceResources((u8 *)scene + 0x94, data_020f4e18[0], 0xd0e5, 0xd081, 0xd082);

    void *renderer = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    FIELD(void *, scene, 0x78) = renderer;
    FIELD(void *, scene, 0xa0) = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x88, 2);
    FIELD(void *, scene, 0xa4) = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x94, 2);
    for (s32 i = 0; i < 2; ++i) {
        FIELD(void *, scene, 0xa8 + i * 4) =
            GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x7c, 1);
        FIELD(void *, scene, 0xb0 + i * 4) =
            GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x7c, 1);
    }

    FIELD(void *, scene, 0x2c0) = func_ov045_0220c48c(8, 0x21, 0);
    for (s32 i = 0; i < 16; ++i) {
        FIELD(u16, scene, 0x30c + i * 2) = 0;
        FIELD(u16, scene, 0x2ec + i * 2) = 0;
        FIELD(u16, scene, 0x2cc + i * 2) = 0;
    }

    void *dialog = Heap_Alloc(0xec, data_ov030_021ff8cc, 4, gHeapContext);
    if (dialog != 0)
        dialog = TitleDialog_Init(dialog, gDebugFont, FIELD(void *, scene, 0x54));
    FIELD(void *, scene, 0x2bc) = dialog;
    func_ov030_021fd9fc(dialog, 0x50, 0x28, 0xa8, 0x84);
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xd0) = 13;
    FIELD(s32, dialog, 0xd4) = 0;
    func_02092f88(dialog, 1, (u8 *)scene + 0x2cc);
    func_02092f88(dialog, 2, (u8 *)scene + 0x2ec);
    func_02092f88(dialog, 3, (u8 *)scene + 0x30c);

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x7c, 1);
    SpriteMotionController_BindSprite((u8 *)scene + 0xb8, sprite, 0, 0, 0);
    if (GameWork_TestFlag(gGameWork, 0x3b9) != 0) {
        SpriteMotionController_SetPosition((u8 *)scene + 0xb8, 0x80, 0x40);
        sprite = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x7c, 1);
        SpriteMotionController_BindSprite((u8 *)scene + 0x164, sprite, 2, 0, 0);
        SpriteMotionController_SetPosition((u8 *)scene + 0x164, 0x80, 0x70);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xa0), 0, 0x20, 0x40, 0, 0, 0);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xa4), 0, 0x20, 0x70, 0, 0, 0);
        for (s32 i = 0; i < 2; ++i) {
            GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xa8 + i * 4), 0,
                          0x32 + i * 8, 0x40, 0, i, 0);
            GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xb0 + i * 4), 0,
                          0x32 + i * 8, 0x70, 0, i, 0);
        }
    } else {
        SpriteMotionController_SetPosition((u8 *)scene + 0xb8, 0x80, 0x60);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xa0), 0, 0x20, 0x60, 0, 0, 0);
        FIELD(u16, FIELD(void *, scene, 0xa4), 0x24) |= 0x10;
        for (s32 i = 0; i < 2; ++i) {
            GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, scene, 0xa8 + i * 4), 0,
                          0x32 + i * 8, 0x60, 0, i, 0);
            FIELD(u16, FIELD(void *, scene, 0xb0 + i * 4), 0x24) |= 0x10;
        }
    }
    func_ov030_021fe808(scene);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)scene + 0x7c, 1);
    SpriteMotionController_BindSprite((u8 *)scene + 0x210, sprite, 6, 0, 0);
    SpriteMotionController_SetPosition((u8 *)scene + 0x210, 0xe4, 0xb0);
    FIELD(void *, scene, 0x2c4) = 0;
    void *auxiliary = Heap_Alloc(0x70, data_ov030_021ff8d4, 4, gHeapContext);
    if (auxiliary != 0)
        auxiliary = func_ov045_0220b83c(auxiliary);
    FIELD(void *, scene, 0x2c8) = auxiliary;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov030_021fda14(scene, data_ov030_021ff788[0],
                        data_ov030_021ff788[1]);
    return scene;
}
