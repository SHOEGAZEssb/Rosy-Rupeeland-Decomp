#include "tingle/types.h"

/*
 * Overlay 94 owner for the ten component effects driven by flag 0x3D3. The
 * object embeds its animation resources at +0x04, owns sprite groups at
 * +0x10/+0x14, an effect list at +0x18, and a title random state at +0x30.
 */

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern u8 gHeapContext[];
extern const s32 data_ov094_02219bd8[];
extern const u8 data_ov094_02219e70[];
extern const u8 data_ov094_02219f14[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *resourceSet);
extern void AnimationResourceState_Destroy(void *resourceSet);
extern void AnimationResourceState_ReplaceResources(void *resourceSet, void *archive, s32 characterId,
                         s32 paletteId, s32 screenId);
extern void TitleInterpolatedValue_Init(void *randomState);
extern u32 genrand_int32(void);
extern void func_ov094_02217c34(void *effectList);
extern void PresentationList_DeleteAll(void *effectList);
extern void PresentationList_Append(void *effectList, void *effect);
extern void PresentationList_UpdateAndDeleteCompleted(void *effectList);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *source);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                       void *resourceSet,
                                                       s32 mode);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *group);
extern s32 func_02091c7c(void *animation, s32 channel);
extern void func_02091b98(void *animation, s32 value);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *func_ov094_02218a2c(void *effect, void *firstState,
                                void *secondState, const s32 *coordinates);
#ifdef __cplusplus
}
#endif

/*
 * Initializes resources 0x2236-0x2238, the effect list/random state, and the
 * normal/debug sprite groups. The debug group uses parameters 0/0x100. Event
 * flags 0x3D3-0x3D6 are cleared. Owned engine resources persist until the
 * paired destroy function; no direct GX access occurs. Returns object.
 */
extern "C" void *func_ov094_02218f14(void *object)
{
    AnimationResourceState_InitEmbedded((u8 *)object + 0x04);
    func_ov094_02217c34((u8 *)object + 0x18);
    *(s32 *)((u8 *)object + 0x2c) = 0;
    TitleInterpolatedValue_Init((u8 *)object + 0x30);
    *(s32 *)object = 0;
    *(u32 *)((u8 *)object + 0x2c) = genrand_int32();
    AnimationResourceState_ReplaceResources((u8 *)object + 0x04, data_020f4e18,
                  0x2236, 0x2237, 0x2238);

    *(void **)((u8 *)object + 0x10) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    void *debugGroup = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    *(void **)((u8 *)object + 0x14) = debugGroup;
    *(s32 *)((u8 *)debugGroup + 0x18) = 0;
    *(s32 *)((u8 *)debugGroup + 0x1c) = 0x100;

    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d4);
    GameWork_ClearFlag(gGameWork, 0x3d5);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    return object;
}

/*
 * Deletes all list effects, destroys both sprite groups, restores and destroys
 * the list base, then releases the embedded resource state. The object storage
 * remains caller-owned and is returned unchanged.
 */
extern "C" void *func_ov094_0221900c(void *object)
{
    PresentationList_DeleteAll((u8 *)object + 0x18);
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x10));
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x14));
    *(const void **)((u8 *)object + 0x18) = data_ov094_02219e70;
    PresentationList_DeleteAll((u8 *)object + 0x18);
    AnimationResourceState_Destroy((u8 *)object + 0x04);
    return object;
}

/*
 * Runs the six-state sequence. Once flag 0x3D3 starts it, every completed
 * six-frame cadence creates paired sprite states and one 0xC0-byte effect for
 * the next of ten Q12 coordinate pairs. It then waits for the tracked effect,
 * list count, and primary group to drain. Returns one only in terminal state;
 * allocation belongs to the presentation list after append.
 */
extern "C" s32 func_ov094_02219050(void *object)
{
    s32 state = *(s32 *)object;
    switch (state) {
    case 0:
        if (GameWork_TestFlag(gGameWork, 0x3d3))
            ++*(s32 *)object;
        break;
    case 1:
        if (func_02091c7c((u8 *)object + 0x30, 2)) {
            s32 index = *(s32 *)((u8 *)object + 0x24);
            if (index < 10) {
                void *firstState = GraphicsSpriteGroup_CreateStateFromSource(
                    *(void **)((u8 *)object + 0x10),
                    (u8 *)object + 0x04, 1);
                void *secondState = GraphicsSpriteGroup_CreateStateFromSource(
                    *(void **)((u8 *)object + 0x14),
                    (u8 *)object + 0x04, 1);
                *(u16 *)((u8 *)firstState + 0x24) |= 2;
                *(u16 *)((u8 *)secondState + 0x24) |= 2;

                void *effect = Heap_Alloc(0xc0, data_ov094_02219f14,
                                          4, gHeapContext);
                if (effect != 0) {
                    effect = func_ov094_02218a2c(
                        effect, firstState, secondState,
                        data_ov094_02219bd8 + index * 2);
                }
                PresentationList_Append((u8 *)object + 0x18, effect);
                func_02091b98((u8 *)object + 0x30, 6);
            } else {
                ++*(s32 *)object;
            }
        }
        break;
    case 2:
        if ((*(u16 *)((u8 *)*(void **)((u8 *)object + 0x20) + 0x98) & 1)
            != 0) {
            GameWork_ClearFlag(gGameWork, 0x3d3);
            ++*(s32 *)object;
        }
        break;
    case 3:
        if (*(s32 *)((u8 *)object + 0x24) == 0)
            *(s32 *)object = state + 1;
        break;
    case 4:
        if (*(s32 *)((u8 *)*(void **)((u8 *)object + 0x10) + 0x14) == 0)
            *(s32 *)object = state + 1;
        break;
    case 5:
        return 1;
    }

    PresentationList_UpdateAndDeleteCompleted((u8 *)object + 0x18);
    GraphicsSpriteGroup_AdvanceAnimations(
        *(void **)((u8 *)object + 0x10));
    GraphicsSpriteGroup_AdvanceAnimations(
        *(void **)((u8 *)object + 0x14));
    return 0;
}

/*
 * Marks both groups resident for mode one. Other modes release their indexed
 * entries while retaining the owner and resource set for later teardown.
 */
extern "C" void func_ov094_022191fc(void *object, s32 mode)
{
    void *primaryGroup = *(void **)((u8 *)object + 0x10);
    void *secondaryGroup = *(void **)((u8 *)object + 0x14);
    if (mode == 1) {
        *(s32 *)((u8 *)primaryGroup + 0x20) = 1;
        *(s32 *)((u8 *)secondaryGroup + 0x20) = 1;
        return;
    }
    GraphicsSpriteGroup_ReleaseIndexedEntries(primaryGroup);
    GraphicsSpriteGroup_ReleaseIndexedEntries(secondaryGroup);
}
