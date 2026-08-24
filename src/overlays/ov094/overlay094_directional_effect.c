#include "tingle/types.h"

/* Overlay 94's mode-dependent paired directional effect; coordinates are Q12. */

extern void *data_020f4e18;
extern const s16 gFx32CosSinTable[];
extern const u8 data_ov094_02219e80[];
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
extern void func_02071ee0(void *resourceSet, void *archive, s32 characterId,
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

extern "C" void func_ov094_02218470(void *effect);
extern "C" void func_ov094_022185a4(void *effect);

/*
 * Initializes the base with firstState, owns secondState and embedded resources
 * 0x2236-0x2238, stores mode/coordinate record, and starts at caller Q12
 * coordinates. Both sprites select animation one; scale moves 0x10->0x100.
 * Mode two uses base Y -0xA0000, other modes -0x80000. Returns effect.
 */
extern "C" void *func_ov094_02217ec8(void *effect, void *firstState,
                                      void *secondState, s32 startX,
                                      s32 startY, const s32 *coordinates,
                                      s32 mode)
{
    SpritePresentation_InitVariant(effect, firstState);
    *(const void **)effect = data_ov094_02219e80;
    *(s32 *)((u8 *)effect + 0xac) = 0;
    AnimationResourceState_InitEmbedded((u8 *)effect + 0xb0);
    *(s32 *)((u8 *)effect + 0xa0) = mode;
    *(u32 *)((u8 *)effect + 0xac) = genrand_int32();
    func_02071ee0((u8 *)effect + 0xb0, data_020f4e18,
                  0x2236, 0x2237, 0x2238);
    *(const s32 **)((u8 *)effect + 0xbc) = coordinates;
    *(void **)((u8 *)effect + 0xc0) = secondState;
    GraphicsSpriteState_SetAnimationIndex(
        *(void **)((u8 *)effect + 0x9c), 1);
    GraphicsSpriteState_SetAnimationIndex(secondState, 1);
    Presentation_SetPosition(effect, startX, startY, 0);
    PresentationScalar_SetImmediate((u8 *)effect + 0x6c, 0x10);
    PresentationScalar_TransitionTo((u8 *)effect + 0x6c, 1, 0x100);
    *(s32 *)((u8 *)effect + 0xa4) = 0x80000;
    *(s32 *)((u8 *)effect + 0xa8) =
        mode == 2 ? -0xa0000 : -0x80000;
    PresentationScalar_TransitionTo(
        (u8 *)effect + 0x0c, 2,
        *(s32 *)((u8 *)effect + 0xa4) + coordinates[0]);
    PresentationScalar_TransitionTo(
        (u8 *)effect + 0x1c, 2,
        *(s32 *)((u8 *)effect + 0xa8) + coordinates[1]);
    *(s32 *)((u8 *)effect + 0x7c) = 0x3c;
    *(s32 *)((u8 *)effect + 0x80) = 0;
    *(s32 *)((u8 *)effect + 0xc4) = 0;
    *(s32 *)((u8 *)effect + 0xc8) = 0;
    *(s32 *)((u8 *)effect + 0x88) = 1;
    return effect;
}

/* Releases owned sprite/resources/base presentation but not object storage. */
extern "C" void *func_ov094_0221800c(void *effect)
{
    *(const void **)effect = data_ov094_02219e80;
    GraphicsSpriteState_ReleaseFromGroup(
        *(void **)((u8 *)effect + 0xc0));
    AnimationResourceState_Destroy((u8 *)effect + 0xb0);
    SpritePresentation_Destroy(effect);
    return effect;
}

/* Runs full teardown, frees object storage, and returns the retail stale pointer. */
extern "C" void *func_ov094_02218040(void *effect)
{
    *(const void **)effect = data_ov094_02219e80;
    GraphicsSpriteState_ReleaseFromGroup(
        *(void **)((u8 *)effect + 0xc0));
    AnimationResourceState_Destroy((u8 *)effect + 0xb0);
    SpritePresentation_Destroy(effect);
    Heap_Free(effect);
    return effect;
}

/* Emits paired child sprites at +/-24 pixels every 10-19 frames. */
extern "C" void func_ov094_02218470(void *effect)
{
    s32 *cooldown = (s32 *)((u8 *)effect + 0xc4);
    if (*cooldown > 0) {
        --*cooldown;
        return;
    }
    void *randomState = (u8 *)effect + 0xac;
    *cooldown = func_0209189c(randomState, 10, 20);
    s32 baseX = *(s32 *)((u8 *)effect + 0x10) / 0x1000;
    s32 baseY = *(s32 *)((u8 *)effect + 0x20) / 0x1000;
    void *resourceSet = (u8 *)effect + 0xb0;
    void *firstParent = *(void **)((u8 *)effect + 0x9c);
    void *child = GraphicsSpriteGroup_CreateStateFromSource(
        *(void **)firstParent, resourceSet, 1);
    s32 x = baseX + func_0209189c(randomState, -24, 24);
    s32 y = baseY + func_0209189c(randomState, -24, 24);
    GraphicsSpriteState_ApplyRenderConfig(child, 0, x, y, 0, 0, 0x100);
    void *secondParent = *(void **)((u8 *)effect + 0xc0);
    child = GraphicsSpriteGroup_CreateStateFromSource(
        *(void **)secondParent, resourceSet, 1);
    x = baseX + func_0209189c(randomState, -24, 24);
    y = baseY + func_0209189c(randomState, -24, 24);
    GraphicsSpriteState_ApplyRenderConfig(child, 0, x, y, 0, 0, 0x100);
}

/*
 * Mirrors first-state signed pixel coordinates into the second state and
 * narrows the current Q8 scale at +0x70 into both axes of both sprites.
 */
extern "C" void func_ov094_022185a4(void *effect)
{
    void *firstState = *(void **)((u8 *)effect + 0x9c);
    void *secondState = *(void **)((u8 *)effect + 0xc0);
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

/*
 * Runs the six-state mode-dependent transition script. Flags 0x3D4/0x3D5
 * switch from randomized holding motion to radial transitions; modes zero/one
 * complete a first radial pass, while mode two jumps to the second pass.
 * Status bits at +0x98 signal the owner. Returns one only in state five.
 */
extern "C" s32 func_ov094_0221807c(void *effect)
{
    s32 *state = (s32 *)((u8 *)effect + 0xc8);
    s32 mode = *(s32 *)((u8 *)effect + 0xa0);
    s32 baseX = *(s32 *)((u8 *)effect + 0xa4);
    s32 baseY = *(s32 *)((u8 *)effect + 0xa8);
    const s32 *coordinates =
        *(const s32 **)((u8 *)effect + 0xbc);
    switch (*state) {
    case 0:
        func_ov094_02218470(effect);
        if (GameWork_TestFlag(gGameWork, 0x3d4)) {
            if (mode == 2) {
                *(u16 *)((u8 *)effect + 0x98) |= 2;
                *state = 3;
            } else {
                u32 angle = func_020ae024(coordinates[0] / 0x1000,
                                         coordinates[1] / 0x1000);
                s32 index = (s32)(angle & 0xffff) >> 4;
                PresentationScalar_TransitionTo(
                    (u8 *)effect + 0x0c, 4,
                    baseX + gFx32CosSinTable[index * 2] * 0x60);
                PresentationScalar_TransitionTo(
                    (u8 *)effect + 0x1c, 4,
                    baseY + gFx32CosSinTable[index * 2 + 1] * 0x60);
                *(s32 *)((u8 *)effect + 0x7c) = 0x14;
                *(s32 *)((u8 *)effect + 0x80) = 0;
                ++*state;
            }
        } else if (func_ov094_02217bc8(effect)) {
            *(u16 *)((u8 *)effect + 0x98) |= 1;
            s32 offset = func_0209189c((u8 *)effect + 0xac, -16, 16);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x0c, 2,
                baseX + coordinates[0] + offset * 0x1000);
            offset = func_0209189c((u8 *)effect + 0xac, -16, 16);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x1c, 2,
                baseY + coordinates[1] + offset * 0x1000);
            *(s32 *)((u8 *)effect + 0x7c) = 0x1e;
            *(s32 *)((u8 *)effect + 0x80) = 0;
        }
        break;
    case 1:
        func_ov094_02218470(effect);
        if (func_ov094_02217bc8(effect)) {
            PresentationScalar_TransitionTo((u8 *)effect + 0x6c, 1, 0x100);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x0c, 5, baseX + coordinates[0]);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x1c, 5, baseY + coordinates[1]);
            *(s32 *)((u8 *)effect + 0x7c) = 0x14;
            *(s32 *)((u8 *)effect + 0x80) = 0;
            ++*state;
        }
        break;
    case 2:
        func_ov094_02218470(effect);
        if (func_ov094_02217bc8(effect)) {
            *(u16 *)((u8 *)effect + 0x98) |= 2;
            ++*state;
        }
        break;
    case 3:
        func_ov094_02218470(effect);
        if (GameWork_TestFlag(gGameWork, 0x3d5)) {
            u32 angle = func_020ae024(coordinates[0] / 0x1000,
                                     coordinates[1] / 0x1000);
            s32 index = (s32)(angle & 0xffff) >> 4;
            PresentationScalar_TransitionTo((u8 *)effect + 0x6c, 1, 0x10);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x0c, 4,
                baseX + gFx32CosSinTable[index * 2] * 0x80);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x1c, 4,
                baseY + gFx32CosSinTable[index * 2 + 1] * 0x80);
            *(s32 *)((u8 *)effect + 0x7c) = 0x28;
            *(s32 *)((u8 *)effect + 0x80) = 0;
            ++*state;
        } else if (mode == 2 && func_ov094_02217bc8(effect)) {
            s32 offset = func_0209189c((u8 *)effect + 0xac, -16, 16);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x0c, 2,
                baseX + coordinates[0] + offset * 0x1000);
            offset = func_0209189c((u8 *)effect + 0xac, -16, 16);
            PresentationScalar_TransitionTo(
                (u8 *)effect + 0x1c, 2,
                baseY + coordinates[1] + offset * 0x1000);
            *(s32 *)((u8 *)effect + 0x7c) = 0x1e;
            *(s32 *)((u8 *)effect + 0x80) = 0;
        }
        break;
    case 4:
        func_ov094_02218470(effect);
        if (func_ov094_02217bc8(effect)) ++*state;
        break;
    case 5:
        return 1;
    }
    Presentation_UpdateScript(effect);
    func_ov094_022185a4(effect);
    return 0;
}
