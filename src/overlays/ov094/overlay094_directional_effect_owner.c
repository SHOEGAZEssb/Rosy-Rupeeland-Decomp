#include "tingle/types.h"

/*
 * Overlay 94 owner for the sixteen directional effects. Mode 0 is centered,
 * mode 1 derives launch vectors from the first coordinate table, and mode 2
 * walks a full-circle table. Coordinates are Q12 and group scales are Q8.
 */

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern u8 gHeapContext[];
extern const s16 gFx32CosSinTable[];
extern const s32 data_ov094_02219c98[];
extern const s32 data_ov094_02219d18[];
extern const u8 data_ov094_02219e70[];
extern const u8 data_ov094_02219f0c[];

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
extern u32 func_020ae024(s32 x, s32 y);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *func_ov094_02217ec8(void *effect, void *firstState,
                                void *secondState, s32 startX, s32 startY,
                                const s32 *coordinates, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Initializes resources 0x2236-0x2238, list/random state, and both sprite
 * groups, recording mode at +0. The debug group uses 0/0x100 parameters and
 * flags 0x3D3-0x3D6 are cleared. Returns the caller-owned object.
 */
extern "C" void *func_ov094_022185e4(void *object, s32 mode)
{
    AnimationResourceState_InitEmbedded((u8 *)object + 0x08);
    func_ov094_02217c34((u8 *)object + 0x1c);
    *(s32 *)((u8 *)object + 0x30) = 0;
    TitleInterpolatedValue_Init((u8 *)object + 0x34);
    *(s32 *)object = mode;
    *(s32 *)((u8 *)object + 0x04) = 0;
    *(u32 *)((u8 *)object + 0x30) = genrand_int32();
    AnimationResourceState_ReplaceResources((u8 *)object + 0x08, data_020f4e18,
                  0x2236, 0x2237, 0x2238);
    *(void **)((u8 *)object + 0x14) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    void *debugGroup = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    *(void **)((u8 *)object + 0x18) = debugGroup;
    *(s32 *)((u8 *)debugGroup + 0x18) = 0;
    *(s32 *)((u8 *)debugGroup + 0x1c) = 0x100;
    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d4);
    GameWork_ClearFlag(gGameWork, 0x3d5);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    return object;
}

/* Deletes all effects/groups/resources but leaves object storage to caller. */
extern "C" void *func_ov094_022186dc(void *object)
{
    PresentationList_DeleteAll((u8 *)object + 0x1c);
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x14));
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x18));
    *(const void **)((u8 *)object + 0x1c) = data_ov094_02219e70;
    PresentationList_DeleteAll((u8 *)object + 0x1c);
    AnimationResourceState_Destroy((u8 *)object + 0x08);
    return object;
}

/*
 * Advances the seven-state sequence. Flag 0x3D3 starts creation; a six-frame
 * cadence appends sixteen 0xCC-byte effects. Mode selects the coordinate table
 * and launch origin. The owner then observes status bits one/two on the tracked
 * effect, drains list/group state, and returns one at terminal state six.
 */
extern "C" s32 func_ov094_02218720(void *object)
{
    s32 state = *(s32 *)((u8 *)object + 0x04);
    switch (state) {
    case 0:
        if (GameWork_TestFlag(gGameWork, 0x3d3))
            ++*(s32 *)((u8 *)object + 0x04);
        break;
    case 1:
        if (func_02091c7c((u8 *)object + 0x34, 2)) {
            s32 index = *(s32 *)((u8 *)object + 0x28);
            if (index < 16) {
                void *firstState = GraphicsSpriteGroup_CreateStateFromSource(
                    *(void **)((u8 *)object + 0x14),
                    (u8 *)object + 0x08, 1);
                void *secondState = GraphicsSpriteGroup_CreateStateFromSource(
                    *(void **)((u8 *)object + 0x18),
                    (u8 *)object + 0x08, 1);
                *(u16 *)((u8 *)firstState + 0x24) |= 2;
                *(u16 *)((u8 *)secondState + 0x24) |= 2;

                s32 mode = *(s32 *)object;
                const s32 *coordinates;
                s32 startX;
                s32 startY;
                if (mode == 0) {
                    coordinates = data_ov094_02219c98 + index * 2;
                    startX = 0x80000;
                    startY = 0x40000;
                } else if (mode == 1) {
                    coordinates = data_ov094_02219c98 + index * 2;
                    u32 angle = func_020ae024(coordinates[0] / 0x1000,
                                             coordinates[1] / 0x1000);
                    s32 angleIndex = (s32)(angle & 0xffff) >> 4;
                    startX = gFx32CosSinTable[angleIndex * 2] * 0x80 + 0x80000;
                    startY = gFx32CosSinTable[angleIndex * 2 + 1] * 0x80 - 0x80000;
                } else {
                    coordinates = data_ov094_02219d18 + index * 2;
                    s32 angleIndex = index * 0x100;
                    startX = gFx32CosSinTable[angleIndex * 2] * 0x80 + 0x80000;
                    startY = gFx32CosSinTable[angleIndex * 2 + 1] * 0x80 - 0xa0000;
                }

                void *effect = Heap_Alloc(0xcc, data_ov094_02219f0c,
                                          4, gHeapContext);
                if (effect != 0) {
                    effect = func_ov094_02217ec8(
                        effect, firstState, secondState, startX, startY,
                        coordinates, mode);
                }
                PresentationList_Append((u8 *)object + 0x1c, effect);
                func_02091b98((u8 *)object + 0x34, 6);
            } else {
                ++*(s32 *)((u8 *)object + 0x04);
            }
        }
        break;
    case 2:
        if ((*(u16 *)((u8 *)*(void **)((u8 *)object + 0x24) + 0x98) & 1)
            != 0) {
            GameWork_ClearFlag(gGameWork, 0x3d3);
            ++*(s32 *)((u8 *)object + 0x04);
        }
        break;
    case 3:
        if ((*(u16 *)((u8 *)*(void **)((u8 *)object + 0x24) + 0x98) & 2)
            != 0) {
            GameWork_ClearFlag(gGameWork, 0x3d4);
            ++*(s32 *)((u8 *)object + 0x04);
        }
        break;
    case 4:
        if (*(s32 *)((u8 *)object + 0x28) == 0)
            *(s32 *)((u8 *)object + 0x04) = state + 1;
        break;
    case 5:
        if (*(s32 *)((u8 *)*(void **)((u8 *)object + 0x14) + 0x14) == 0)
            *(s32 *)((u8 *)object + 0x04) = state + 1;
        break;
    case 6:
        return 1;
    }
    PresentationList_UpdateAndDeleteCompleted((u8 *)object + 0x1c);
    GraphicsSpriteGroup_AdvanceAnimations(
        *(void **)((u8 *)object + 0x14));
    GraphicsSpriteGroup_AdvanceAnimations(
        *(void **)((u8 *)object + 0x18));
    return 0;
}

/* Marks both groups resident for mode one, otherwise releases their entries. */
extern "C" void func_ov094_022189f8(void *object, s32 mode)
{
    void *primaryGroup = *(void **)((u8 *)object + 0x14);
    void *secondaryGroup = *(void **)((u8 *)object + 0x18);
    if (mode == 1) {
        *(s32 *)((u8 *)primaryGroup + 0x20) = 1;
        *(s32 *)((u8 *)secondaryGroup + 0x20) = 1;
        return;
    }
    GraphicsSpriteGroup_ReleaseIndexedEntries(primaryGroup);
    GraphicsSpriteGroup_ReleaseIndexedEntries(secondaryGroup);
}
