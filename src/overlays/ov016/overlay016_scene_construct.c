#include "tingle/types.h"

/* Overlay 16 main scene construction and mode-specific initial setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *data_021e9ac0;
extern u8 data_021e9e00[];
extern const u32 data_ov016_022013e8[];
extern const u32 data_ov016_02201410[];
extern const u32 data_ov016_02201540[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, s32);
extern void InventoryRecordCollection_Sort(void *, s32);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void SceneInputBase_Init(void *);
extern void TitleScreenResourceCollection_Init(void *);
extern void TitleScreenResourceCollection_Append(void *, s32);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void SpriteMotionController_Init(void *);
extern void SpriteMotionController_BindSprite(void *, void *, s32, s32, s32);
extern void SpriteMotionController_SetPosition(void *, s32, s32);
extern void SpriteMotionController_Hide(void *);
extern void func_ov016_021fe740(void *);
extern void Overlay016ActorValue_Init(void *, u32, u32);
extern void Overlay016_SetupGraphics(void *);
extern void Overlay016_SetupPrimaryModeGraphics(void *);
extern void Overlay016_SetupAlternateModeGraphics(void *);
extern void Overlay016_PopulateScene(void *);
extern void Overlay016_CreateSceneSprite(void *);
extern void Overlay016_PopulateAuxiliaryList(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the main overlay scene from owner and mode. Initialize its inherited
 * base, install vtable 0x02201540, initialize embedded state/resources at +0x60,
 * +0x84, +0xC8, +0xD4, five 0xAC-byte actor records (+0xE8..+0x443), and the
 * value helper at +0x454. Clear all confirmed runtime pointers/counters, store
 * cooking mode +0x54, game value +0x58, and five times game value+1 at +0x5C.
 * Register resource IDs
 * 0x801B/0x801C/0x8010/0x8011/0x800B and 0x7005/0x7001, load triples 0x0D-0x0F
 * and 0x1C-0x1E, acquire child +0xE0, and run common setup helpers.
 * Modes 0/2 use the 0x02201410 transition pair; mode 1 creates and stops three
 * additional actor records at +0x240/+0x2EC/+0x398 and uses pair 0x022013E8.
 * Finally clear game flag 0x3A6, set state bit 10 at +0x20, and return state.
 * Numerous SDK graphics/actor resources change; no direct MMIO occurs.
 */
extern "C" void *Overlay016_Scene_Init(void *state, s32 cookingMode,
                                      s32 gameValue)
{
    void *sprite;

    SceneInputBase_Init(state);
    FIELD(const u32 *, state, 0) = data_ov016_02201540;
    TitleCharacterResourceCollection_Init((u8 *)state + 0x60);
    TitleScreenResourceCollection_Init((u8 *)state + 0x84);
    AnimationResourceState_InitEmbedded((u8 *)state + 0xc8);
    AnimationResourceState_InitEmbedded((u8 *)state + 0xd4);
    SpriteMotionController_Init((u8 *)state + 0xe8);
    SpriteMotionController_Init((u8 *)state + 0x194);
    SpriteMotionController_Init((u8 *)state + 0x240);
    SpriteMotionController_Init((u8 *)state + 0x2ec);
    SpriteMotionController_Init((u8 *)state + 0x398);
    func_ov016_021fe740((u8 *)state + 0x454);

    FIELD(s32, state, 0x54) = cookingMode;
    FIELD(s32, state, 0x58) = gameValue;
    FIELD(s32, state, 0x5c) = (gameValue + 1) * 5;
    FIELD(u32, state, 0x444) = 0;
    FIELD(u32, state, 0x460) = 0;
    FIELD(u32, state, 0x464) = 0;
    FIELD(u32, state, 0xe4) = 0;
    FIELD(u32, state, 0x468) = 0;
    FIELD(u32, state, 0x46c) = 0;
    FIELD(u32, state, 0x44c) = 0;
    FIELD(u32, state, 0x450) = 0;
    FIELD(u32, state, 0x470) = 0;
    FIELD(u32, state, 0x47c) = 0;
    FIELD(u32, state, 0x478) = 0;
    FIELD(u32, state, 0x480) = 0;
    FIELD(u32, state, 0x484) = 1;

    InventoryRecordCollection_Sort(data_021e9ac0, 0);
    TitleScreenResourceCollection_Append((u8 *)state + 0x84, 0x801b);
    TitleScreenResourceCollection_Append((u8 *)state + 0x84, 0x801c);
    TitleScreenResourceCollection_Append((u8 *)state + 0x84, 0x8010);
    TitleScreenResourceCollection_Append((u8 *)state + 0x84, 0x8011);
    TitleScreenResourceCollection_Append((u8 *)state + 0x84, 0x800b);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x60, 0x7005);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x60, 0x7001);
    AnimationResourceState_ReplaceResources((u8 *)state + 0xc8, data_020f4e18, 0xd, 0xe, 0xf);
    AnimationResourceState_ReplaceResources((u8 *)state + 0xd4, data_020f4e18, 0x1c, 0x1d, 0x1e);
    FIELD(void *, state, 0xe0) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    Overlay016_PopulateScene(state);
    Overlay016_SetupGraphics(state);

    if (cookingMode == 0 || cookingMode == 2) {
        Overlay016_SetupPrimaryModeGraphics(state);
        Overlay016_CreateSceneSprite(state);
        Overlay016ActorValue_Init(state,
                            data_ov016_02201410[0], data_ov016_02201410[1]);
    } else if (cookingMode == 1) {
        Overlay016_SetupAlternateModeGraphics(state);
        Overlay016_PopulateAuxiliaryList(state);

        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xd4, 1);
        SpriteMotionController_BindSprite((u8 *)state + 0x240, sprite, 0, 1, 0x100);
        SpriteMotionController_SetPosition((u8 *)state + 0x240, 0x14, 0x10);
        if (FIELD(s32, data_021e9e00, 4) == 0) {
            SpriteMotionController_Hide((u8 *)state + 0x240);
        }

        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xd4, 1);
        SpriteMotionController_BindSprite((u8 *)state + 0x2ec, sprite, 5, 1, 0);
        SpriteMotionController_SetPosition((u8 *)state + 0x2ec, 0x14, 0x3b);
        SpriteMotionController_Hide((u8 *)state + 0x2ec);

        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xd4, 1);
        SpriteMotionController_BindSprite((u8 *)state + 0x398, sprite, 4, 1, 0);
        SpriteMotionController_SetPosition((u8 *)state + 0x398, 0x14, 0x25);
        SpriteMotionController_Hide((u8 *)state + 0x398);
        Overlay016ActorValue_Init(state,
                            data_ov016_022013e8[0], data_ov016_022013e8[1]);
    }

    GameWork_ClearFlag(gGameWork, 0x3a6);
    FIELD(u32, state, 0x20) |= 0x400;
    return state;
}
