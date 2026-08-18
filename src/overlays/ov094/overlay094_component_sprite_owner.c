#include "tingle/types.h"

/*
 * Overlay 94's compact component-sprite owner. The object embeds an animation
 * resource set at offset 0, owns normal/debug sprite groups at 0x0C/0x10, and
 * keeps its deterministic title-screen random state at 0x14. Sprite positions
 * are integer screen pixels; the configured scale is 0x100 (1.0 in Q8).
 */

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *resourceSet);
extern void AnimationResourceState_Destroy(void *resourceSet);
extern void func_02071ee0(void *resourceSet, void *archive, s32 characterId,
                         s32 paletteId, s32 screenId);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *source);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                       void *resourceSet,
                                                       s32 mode);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *group);
extern s32 TitleRandom_NextBounded(void *randomState, s32 upper);
extern s32 func_0209189c(void *randomState, s32 lower, s32 upper);
extern void func_02073e48(void *state, s32 animationIndex, s32 x, s32 y,
                         s32 unknown0, s32 unknown1, s32 scale);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
#ifdef __cplusplus
}
#endif

/*
 * Initializes the embedded resource set, loads sprite resources 0x4000-
 * 0x4002, creates the two presentation groups, and clears trigger flags
 * 0x3D3-0x3D6. The groups are owned by this object until
 * func_ov094_022199e0; helper calls may allocate engine graphics state but
 * this function performs no direct GX writes. Returns object unchanged.
 */
extern "C" void *func_ov094_0221991c(void *object)
{
    AnimationResourceState_InitEmbedded(object);
    *(s32 *)((u8 *)object + 0x14) = 0;
    func_02071ee0(object, data_020f4e18, 0x4000, 0x4001, 0x4002);
    *(void **)((u8 *)object + 0x0c) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    *(void **)((u8 *)object + 0x10) =
        GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);

    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d4);
    GameWork_ClearFlag(gGameWork, 0x3d5);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    return object;
}

/*
 * Releases both owned sprite groups and the embedded animation resources.
 * Group destruction precedes resource destruction as in retail. The caller
 * retains ownership of the object allocation; this returns object unchanged.
 */
extern "C" void *func_ov094_022199e0(void *object)
{
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x0c));
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x10));
    AnimationResourceState_Destroy(object);
    return object;
}

/*
 * Creates one component sprite at a random pixel position. Flag 0x3D5 limits
 * Y to the upper 192-pixel group; otherwise the 384-pixel combined range
 * selects either group. The animation is chosen from [1,2), scale is 0x100,
 * and state field 0x36 receives a lifetime in [0x80,0xC0). The group owns the
 * returned state; allocation failure behavior is delegated to the engine.
 */
extern "C" void func_ov094_02219a08(void *object)
{
    void *randomState = (u8 *)object + 0x14;
    s32 x = TitleRandom_NextBounded(randomState, 0x100);
    s32 y;
    if (GameWork_TestFlag(gGameWork, 0x3d5)) {
        y = TitleRandom_NextBounded(randomState, 0xc0);
    } else {
        y = TitleRandom_NextBounded(randomState, 0x180);
    }

    void *group;
    if (y < 0xc0) {
        group = *(void **)((u8 *)object + 0x10);
    } else {
        group = *(void **)((u8 *)object + 0x0c);
        y -= 0xc0;
    }

    void *state = GraphicsSpriteGroup_CreateStateFromSource(group, object, 1);
    s32 animation = func_0209189c(randomState, 1, 2);
    func_02073e48(state, animation, x, y, 0, 0, 0x100);
    *(u16 *)((u8 *)state + 0x36) =
        (u16)func_0209189c(randomState, 0x80, 0xc0);
}

/*
 * Consumes trigger 0x3D3 while the primary group is resident, spawning one
 * sprite and a second when 0x3D6 is set, then advances both groups once. The
 * persistent completion flag 0x3D4 is returned as a normalized boolean.
 */
extern "C" s32 func_ov094_02219ad4(void *object)
{
    void *primaryGroup = *(void **)((u8 *)object + 0x0c);
    if (*(s32 *)((u8 *)primaryGroup + 0x20) != 0) {
        if (GameWork_TestFlag(gGameWork, 0x3d3)) {
            GameWork_ClearFlag(gGameWork, 0x3d3);
            func_ov094_02219a08(object);
            if (GameWork_TestFlag(gGameWork, 0x3d6)) {
                func_ov094_02219a08(object);
            }
        }
        GraphicsSpriteGroup_AdvanceAnimations(primaryGroup);
        GraphicsSpriteGroup_AdvanceAnimations(
            *(void **)((u8 *)object + 0x10));
    }
    return GameWork_TestFlag(gGameWork, 0x3d4) != 0;
}

/*
 * Switches both groups to resident state when mode is one. Other modes release
 * their indexed entries while leaving the owner and resource set allocated;
 * observable effects are limited to group residency/resource ownership.
 */
extern "C" void func_ov094_02219b78(void *object, s32 mode)
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
