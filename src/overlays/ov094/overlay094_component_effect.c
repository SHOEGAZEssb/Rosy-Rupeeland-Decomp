#include "tingle/types.h"

/*
 * Overlay 94 paired component effect. Positions and transition coordinates
 * use Q12 fixed point; generated child sprite positions use integer pixels.
 * The second sprite state and embedded resource set are owned by the effect.
 */

extern void *data_020f4e18;
extern const s16 gFx32CosSinTable[];
extern const u8 data_ov094_02219ef0[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void SpritePresentation_InitVariant(void *effect, void *firstState);
extern void *SpritePresentation_Destroy(void *effect);
extern void Presentation_SetPosition(void *effect, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *motion, s32 value);
extern void PresentationScalar_TransitionTo(void *motion, s32 mode, s32 value);
extern void Presentation_UpdateScript(void *effect);
extern void AnimationResourceState_InitEmbedded(void *resourceSet);
extern void AnimationResourceState_Destroy(void *resourceSet);
extern void AnimationResourceState_ReplaceResources(void *resourceSet, void *archive, s32 characterId,
                         s32 paletteId, s32 screenId);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern void GraphicsSpriteState_ReleaseFromGroup(void *state);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                       void *resourceSet,
                                                       s32 mode);
extern void GraphicsSpriteState_ApplyRenderConfig(void *state, s32 animationIndex, s32 x, s32 y,
                         s32 unknown0, s32 unknown1, s32 scale);
extern s32 func_0209189c(void *randomState, s32 lower, s32 upper);
extern u32 genrand_int32(void);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern u32 func_020ae024(s32 x, s32 y);
extern s32 func_ov094_02217bc8(void *effect);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/* Synchronizes the owned sprite state positions and both states' Q8 scale. */
extern "C" void func_ov094_02218ed4(void *effect);

/*
 * Initializes the base presentation with firstState, embeds resources
 * 0x2236-0x2238, owns secondState at +0xB4, and stores the caller's two-Q12-
 * coordinate record at +0xB0. Both sprites select animation one. The effect
 * begins at (x+0x80000,y-0xA0000), scales from 0x10 toward 0x100, and starts a
 * 60-frame interval. Returns effect; no direct hardware access occurs.
 */
extern "C" void *func_ov094_02218a2c(void *effect, void *firstState,
                                      void *secondState,
                                      const s32 *coordinates)
{
    SpritePresentation_InitVariant(effect, firstState);
    *(const void **)effect = data_ov094_02219ef0;
    *(s32 *)((u8 *)effect + 0xa0) = 0;
    AnimationResourceState_InitEmbedded((u8 *)effect + 0xa4);
    *(u32 *)((u8 *)effect + 0xa0) = genrand_int32();
    AnimationResourceState_ReplaceResources((u8 *)effect + 0xa4, data_020f4e18,
                  0x2236, 0x2237, 0x2238);
    *(const s32 **)((u8 *)effect + 0xb0) = coordinates;
    *(void **)((u8 *)effect + 0xb4) = secondState;
    GraphicsSpriteState_SetAnimationIndex(
        *(void **)((u8 *)effect + 0x9c), 1);
    GraphicsSpriteState_SetAnimationIndex(secondState, 1);
    Presentation_SetPosition(effect, coordinates[0] + 0x80000,
                             coordinates[1] - 0xa0000, 0);
    PresentationScalar_SetImmediate((u8 *)effect + 0x6c, 0x10);
    PresentationScalar_TransitionTo((u8 *)effect + 0x6c, 1, 0x100);
    *(s32 *)((u8 *)effect + 0x7c) = 0x3c;
    *(s32 *)((u8 *)effect + 0x80) = 0;
    *(s32 *)((u8 *)effect + 0xb8) = 0;
    *(s32 *)((u8 *)effect + 0xbc) = 0;
    *(s32 *)((u8 *)effect + 0x88) = 1;
    return effect;
}

/*
 * Releases the owned second sprite, embedded resources, and base presentation.
 * Allocation remains caller-owned and object is returned unchanged.
 */
extern "C" void *func_ov094_02218b14(void *effect)
{
    *(const void **)effect = data_ov094_02219ef0;
    GraphicsSpriteState_ReleaseFromGroup(
        *(void **)((u8 *)effect + 0xb4));
    AnimationResourceState_Destroy((u8 *)effect + 0xa4);
    SpritePresentation_Destroy(effect);
    return effect;
}

/*
 * Performs the full effect teardown and returns its heap allocation. The
 * returned pointer is only the retail destructor convention and is invalid
 * for dereference after Heap_Free.
 */
extern "C" void *func_ov094_02218b48(void *effect)
{
    *(const void **)effect = data_ov094_02219ef0;
    GraphicsSpriteState_ReleaseFromGroup(
        *(void **)((u8 *)effect + 0xb4));
    AnimationResourceState_Destroy((u8 *)effect + 0xa4);
    SpritePresentation_Destroy(effect);
    Heap_Free(effect);
    return effect;
}

/*
 * Emits two short-lived child sprites every 10-19 frames, one through each
 * parent state's group. Each child is placed within +/-24 pixels of the
 * effect's current Q12 position at animation zero and Q8 scale 0x100.
 */
extern "C" void func_ov094_02218da0(void *effect)
{
    s32 *cooldown = (s32 *)((u8 *)effect + 0xb8);
    if (*cooldown > 0) {
        --*cooldown;
        return;
    }

    void *randomState = (u8 *)effect + 0xa0;
    *cooldown = func_0209189c(randomState, 10, 20);
    s32 baseX = *(s32 *)((u8 *)effect + 0x10) / 0x1000;
    s32 baseY = *(s32 *)((u8 *)effect + 0x20) / 0x1000;
    void *resourceSet = (u8 *)effect + 0xa4;

    void *firstParent = *(void **)((u8 *)effect + 0x9c);
    void *state = GraphicsSpriteGroup_CreateStateFromSource(
        *(void **)firstParent, resourceSet, 1);
    s32 x = baseX + func_0209189c(randomState, -24, 24);
    s32 y = baseY + func_0209189c(randomState, -24, 24);
    GraphicsSpriteState_ApplyRenderConfig(state, 0, x, y, 0, 0, 0x100);

    void *secondParent = *(void **)((u8 *)effect + 0xb4);
    state = GraphicsSpriteGroup_CreateStateFromSource(
        *(void **)secondParent, resourceSet, 1);
    x = baseX + func_0209189c(randomState, -24, 24);
    y = baseY + func_0209189c(randomState, -24, 24);
    GraphicsSpriteState_ApplyRenderConfig(state, 0, x, y, 0, 0, 0x100);
}

/*
 * Advances the four-state effect. Before completion flag 0x3D4, expiry marks
 * the effect's status bit and retargets it with small random offsets. With the
 * flag set, it derives an angle from the source coordinates and follows the
 * retail sine table, then scales/moves into its 120-frame terminal interval.
 * Returns one only after state three; all nonterminal frames update/sync.
 */
extern "C" s32 func_ov094_02218b84(void *effect)
{
    s32 *state = (s32 *)((u8 *)effect + 0xbc);
    const s32 *coordinates =
        *(const s32 **)((u8 *)effect + 0xb0);
    switch (*state) {
    case 0:
        func_ov094_02218da0(effect);
        if (GameWork_TestFlag(gGameWork, 0x3d4)) {
            u32 angle = func_020ae024(coordinates[0] / 0x1000,
                                     coordinates[1] / 0x1000);
            s32 index = (s32)(angle & 0xffff) >> 4;
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x0c, 4,
                gFx32CosSinTable[index * 2] * 0x60 + 0x80000);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x1c, 4,
                gFx32CosSinTable[index * 2 + 1] * 0x60 - 0xa0000);
            *(s32 *)((u8 *)effect + 0x7c) = 0x14;
            *(s32 *)((u8 *)effect + 0x80) = 0;
            ++*state;
        } else if (func_ov094_02217bc8(effect)) {
            *(u16 *)((u8 *)effect + 0x98) |= 1;
            s32 offset = func_0209189c((u8 *)effect + 0xa0, -16, 16);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x0c, 2,
                coordinates[0] + 0x80000 + offset * 0x1000);
            offset = func_0209189c((u8 *)effect + 0xa0, -16, 16);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x1c, 2,
                coordinates[1] - 0xa0000 + offset * 0x1000);
            *(s32 *)((u8 *)effect + 0x7c) = 0x1e;
            *(s32 *)((u8 *)effect + 0x80) = 0;
        }
        break;
    case 1:
        func_ov094_02218da0(effect);
        if (func_ov094_02217bc8(effect)) {
            PresentationScalar_TransitionTo((u8 *)effect + 0x6c, 1, 0x10);
            PresentationScalar_TransitionTo((u8 *)effect + 0x0c, 2, 0x80000);
            PresentationScalar_TransitionTo((u8 *)effect + 0x1c, 2, 0x40000);
            *(s32 *)((u8 *)effect + 0x7c) = 0x78;
            *(s32 *)((u8 *)effect + 0x80) = 0;
            ++*state;
        }
        break;
    case 2:
        func_ov094_02218da0(effect);
        if (func_ov094_02217bc8(effect)) ++*state;
        break;
    case 3:
        return 1;
    }
    Presentation_UpdateScript(effect);
    func_ov094_02218ed4(effect);
    return 0;
}

/*
 * Mirrors the first state's signed pixel position to the owned second state
 * and narrows the effect's current Q8 scale at +0x70 into both axes of both
 * states. This performs no allocation or ownership changes.
 */
extern "C" void func_ov094_02218ed4(void *effect)
{
    void *firstState = *(void **)((u8 *)effect + 0x9c);
    void *secondState = *(void **)((u8 *)effect + 0xb4);
    *(s16 *)((u8 *)secondState + 0x2c) =
        *(s16 *)((u8 *)firstState + 0x2c);
    *(s16 *)((u8 *)secondState + 0x2e) =
        *(s16 *)((u8 *)firstState + 0x2e);
    s16 scale = (s16)*(s32 *)((u8 *)effect + 0x70);
    *(s16 *)((u8 *)firstState + 0x32) = scale;
    *(s16 *)((u8 *)firstState + 0x34) = scale;
    *(s16 *)((u8 *)secondState + 0x32) = scale;
    *(s16 *)((u8 *)secondState + 0x34) = scale;
}
