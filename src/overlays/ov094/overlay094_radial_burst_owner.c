#include "tingle/types.h"

/* Overlay 94's continuous radial-burst owner; its spawn cadence is in frames. */

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern u8 gHeapContext[];
extern const u8 data_ov094_02219e70[];
extern const u8 data_ov094_02219f04[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *resourceSet);
extern void AnimationResourceState_Destroy(void *resourceSet);
extern void AnimationResourceState_ReplaceResources(void *resourceSet, void *archive, s32 characterId,
                         s32 paletteId, s32 screenId);
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
extern s32 TitleRandom_NextBounded(void *randomState, s32 upper);
extern s32 func_0209189c(void *randomState, s32 lower, s32 upper);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *func_ov094_022177e0(void *effect, void *firstState,
                                void *secondState, s32 animationBase,
                                s32 scale, s32 angle, u32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Initializes resources 0x4009-0x400B, list/random state, and normal/debug
 * groups. It sets the shared signed spawn cadence at GameWork+0x202 to ten
 * frames and configures the normal group at (0,-192). Returns object.
 */
extern "C" void *func_ov094_02217c74(void *object)
{
    AnimationResourceState_InitEmbedded(object);
    func_ov094_02217c34((u8 *)object + 0x14);
    *(s32 *)((u8 *)object + 0x28) = 0;
    *(u32 *)((u8 *)object + 0x28) = genrand_int32();
    *(s16 *)((u8 *)gGameWork + 0x202) = 10;
    AnimationResourceState_ReplaceResources(object, data_020f4e18, 0x4009, 0x400a, 0x400b);
    void *primaryGroup = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    *(void **)((u8 *)object + 0x0c) = primaryGroup;
    *(s32 *)((u8 *)primaryGroup + 0x18) = 0;
    *(s32 *)((u8 *)primaryGroup + 0x1c) = -0xc0;
    *(void **)((u8 *)object + 0x10) =
        GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    return object;
}

/* Deletes all effects/groups/resources while retaining caller-owned storage. */
extern "C" void *func_ov094_02217d20(void *object)
{
    PresentationList_DeleteAll((u8 *)object + 0x14);
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x0c));
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x10));
    *(const void **)((u8 *)object + 0x14) = data_ov094_02219e70;
    PresentationList_DeleteAll((u8 *)object + 0x14);
    AnimationResourceState_Destroy(object);
    return object;
}

/*
 * Spawns a burst after the positive GameWork cadence is exceeded. Each burst
 * owns paired sprite states and a 0xBC-byte effect with randomized animation,
 * Q8 scale, turn angle, and 420-479-frame duration. A negative cadence stops
 * the owner and returns one; zero merely updates existing effects/groups.
 */
extern "C" s32 func_ov094_02217d64(void *object)
{
    s32 interval = *(s16 *)((u8 *)gGameWork + 0x202);
    if (interval < 0) return 1;
    if (interval > 0) {
        s32 counter = ++*(s32 *)((u8 *)object + 0x24);
        if (counter > interval) {
            *(s32 *)((u8 *)object + 0x24) = 0;
            void *firstState = GraphicsSpriteGroup_CreateStateFromSource(
                *(void **)((u8 *)object + 0x0c), object, 1);
            void *secondState = GraphicsSpriteGroup_CreateStateFromSource(
                *(void **)((u8 *)object + 0x10), object, 1);
            void *effect = Heap_Alloc(0xbc, data_ov094_02219f04,
                                      4, gHeapContext);
            if (effect != 0) {
                s32 animationBase =
                    TitleRandom_NextBounded((u8 *)object + 0x28, 4) << 1;
                s32 scale = func_0209189c(
                    (u8 *)object + 0x28, 0x80, 0x100);
                s32 angle = TitleRandom_NextBounded(
                    (u8 *)object + 0x28, 0x1000) << 4;
                u32 duration = (u32)func_0209189c(
                    (u8 *)object + 0x28, 0x1a4, 0x1e0);
                effect = func_ov094_022177e0(
                    effect, firstState, secondState, animationBase,
                    scale, angle, duration);
            }
            PresentationList_Append((u8 *)object + 0x14, effect);
        }
    }
    PresentationList_UpdateAndDeleteCompleted((u8 *)object + 0x14);
    GraphicsSpriteGroup_AdvanceAnimations(
        *(void **)((u8 *)object + 0x0c));
    GraphicsSpriteGroup_AdvanceAnimations(
        *(void **)((u8 *)object + 0x10));
    return 0;
}

/* Marks both groups resident for mode one, otherwise releases their entries. */
extern "C" void func_ov094_02217e94(void *object, s32 mode)
{
    void *primaryGroup = *(void **)((u8 *)object + 0x0c);
    void *secondaryGroup = *(void **)((u8 *)object + 0x10);
    if (mode == 1) {
        *(s32 *)((u8 *)primaryGroup + 0x20) = 1;
        *(s32 *)((u8 *)secondaryGroup + 0x20) = 1;
        return;
    }
    GraphicsSpriteGroup_ReleaseIndexedEntries(primaryGroup);
    GraphicsSpriteGroup_ReleaseIndexedEntries(secondaryGroup);
}
