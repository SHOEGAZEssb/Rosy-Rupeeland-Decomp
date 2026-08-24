#include "tingle/types.h"
#include "tingle/vec_fx32.h"

#include <stdint.h>

/* Recovered overlay-64 scripted scene. Structure names remain conservative;
 * confirmed fields are accessed at their retail offsets. */
#define F(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

#ifdef __cplusplus
extern "C" {
#define O64_ARGS ...
#else
#define O64_ARGS
#endif
extern void *gGamePhaseRuntime, *gGamePhaseTouchPromptTaskNode, *data_020f4e14;
extern void *gGameWork, *gSoundContext, *gGamePhaseCurrencyHud, *gDebugFont;
extern void *gHeapContext;
extern u8 data_ov064_02211e98[], data_ov064_02211e40[];
extern u8 data_ov064_02211ec4[], data_ov064_02211ecc[];
extern u8 data_ov064_02211ed4[];
extern s32 data_ov064_02211de4[];
extern s16 data_ov064_02211dd4[];
extern u16 data_020ed530[];
extern u8 data_020ed548[];
extern u32 data_020cdc1c[];
extern void Scene_Init(O64_ARGS), Scene_SetFlags03(O64_ARGS);
extern void GameWork_ClearFlag(O64_ARGS);
extern void *Heap_Alloc(O64_ARGS);
extern void Heap_Free(O64_ARGS);
extern void *AnimationResource_Init(O64_ARGS);
extern void *GamePhaseRuntime_GetActorCollection(O64_ARGS);
extern void *ActorCollection_GetSpriteGroup(void *collection);
extern void *GraphicsSpriteState_Create(O64_ARGS);
extern void *GraphicsSpriteGroup_CreateState(O64_ARGS);
extern void GraphicsSpriteState_SetAnimationIndex(O64_ARGS);
extern void *GraphicsSpriteGroupOwner_CreateGroup(O64_ARGS);
extern void ActorCollection_UnregisterAndDestroyAllActors(O64_ARGS);
extern void ActorCollection_SetEnabled(O64_ARGS), ActorCollection_DestroyUnretainedActors(O64_ARGS);
extern void Actor_ReplaceAttachmentSlotResource(O64_ARGS);
extern void Type7Actor_EnterSpecialPresentationState(O64_ARGS);
extern void GamePhaseTouchPrompt_SetEnabled(O64_ARGS);
extern void GamePhaseCurrencyHud_SetVisible(O64_ARGS);
extern void RuntimePresentationManager_AppendFirstListEffect(O64_ARGS), RuntimePresentationManager_BroadcastSlot1C(O64_ARGS);
extern void *func_02025300(O64_ARGS);
extern void Sound_SetCaptureEnabled(O64_ARGS), Sound_LoadGroup(O64_ARGS);
extern void AuxiliaryInteraction_Destroy(O64_ARGS);
extern s32 ActorDirection_GetPresentationGroup(O64_ARGS), func_020ae1fc(O64_ARGS);
extern void GamePhaseRuntime_SynchronizeActorPlacement(O64_ARGS);
extern void ActorFeedback_UpdatePresentations(O64_ARGS);
extern void *ActorMotionAreaFollower_GetPosition(O64_ARGS);
extern void ActorCollection_DispatchEventToActors(O64_ARGS);
extern void GraphicsSpriteGroup_AdvanceAnimations(O64_ARGS);
extern void GamePhaseRuntime_BuildSecondaryTransform(O64_ARGS);
extern s32 RuntimePresentationManager_UpdatePresentations(O64_ARGS);
extern void GamePhaseCurrencyHud_Update(O64_ARGS);
extern void GamePhaseRuntime_UpdateDualScreenUiPresentation(O64_ARGS);
extern void func_020afce8(O64_ARGS);
extern void DebugText_BeginFrame(O64_ARGS), Sound_Play(O64_ARGS);
extern void GamePhaseCurrencyHud_AddCurrency(O64_ARGS);
extern void *func_02022cb0(O64_ARGS);
extern void Actor_RefreshCachedTerrainHeight(O64_ARGS);
extern void GridEffectActorRegistry_BroadcastSlot1c(O64_ARGS);
extern void ActorInteractionRegistry_UpdateAll(O64_ARGS);
extern s32 func_020befec(O64_ARGS);
extern void GraphicsSpriteState_SetDepthOrderedWorldPosition(O64_ARGS);
extern void VecFx32Bezier_Evaluate3D(O64_ARGS);
extern void Overlay064VecFx32_Scale(VecFx32Object *output,
                                const VecFx32Object *input, s32 scale);
extern void Overlay064VecFx32_Add(VecFx32Object *output,
                                const VecFx32Object *first,
                                const VecFx32Object *second);
extern void *Overlay064VecFx32Path_Init(void *path,
                                 const VecFx32Object *first,
                                 const VecFx32Object *second,
                                 const VecFx32Object *third);
extern void Overlay064Scene_SpawnRewardEffect(void *scene,
                                const VecFx32Object *position);
extern void Overlay064VecFx32_Subtract(VecFx32Object *output,
                                const VecFx32Object *first,
                                const VecFx32Object *second);
extern void Overlay064VecFx32_Divide(VecFx32Object *output,
                                const VecFx32Object *input, s32 value);
extern void Overlay064VecFx32_Set(VecFx32Object *output,
                                s32 x, s32 y, s32 z);
extern void func_020adff0(O64_ARGS), VecFx32Triple_Set(O64_ARGS);
extern u32 genrand_int32(O64_ARGS);
extern u64 func_020bf1f8(O64_ARGS);
extern s32 GameWork_TestFlag(O64_ARGS);
extern void GameWork_SetFlag(O64_ARGS), ActorDescriptor_InitRange(O64_ARGS);
extern void *GridEffectActor_Spawn(O64_ARGS);
extern void GraphicsSpriteState_ReleaseFromGroup(O64_ARGS);
extern void GraphicsSpriteGroupOwner_DestroyGroup(O64_ARGS);
extern void VecFx32Triple_Destroy(O64_ARGS);
extern void ActorDerivedType1_ResetRuntimeState(O64_ARGS);
extern void GamePhaseRuntime_RequestPrimaryWarp(O64_ARGS), Sound_ReleaseGroup(O64_ARGS);
extern void GamePhaseRuntime_StageAreaRequest(O64_ARGS);
extern void Type7Actor_LeaveSpecialPresentationState(O64_ARGS);
extern void *OverlayManager_GetGlobal(O64_ARGS);
extern void OverlayManager_UnloadOverlay(O64_ARGS), Scene_Destroy(O64_ARGS);
extern void func_020adfbc(O64_ARGS);
extern s32 func_020adc90(O64_ARGS);
extern void *gDisplayBrightnessPair;
extern void ActorDerivedType1_ApplyResourceIndex(O64_ARGS);
extern void Sound_StopAllDirectSequences(O64_ARGS), Sound_PlayDirectSequence(O64_ARGS);
extern void *DisplayBrightnessPair_GetScreen(O64_ARGS);
extern void DisplayBrightness_StartTransition(O64_ARGS);
extern void GraphicsSpriteRenderer_ClearTextBuffer(O64_ARGS);
extern void Sound_StopAllManagedPlayers(O64_ARGS), Sound_ConfigureGroupSlots(O64_ARGS);
extern void Sound_SetMasterVolume(O64_ARGS);
#ifdef __cplusplus
}
#endif
#undef O64_ARGS

typedef s32 (*O64Method2)(void *, s32, s32);
typedef void (*O64Method2Void)(void *, s32, s32);
typedef s32 (*O64SceneStep)(void *);

static s32 call_method2(void *object, u32 offset, s32 first, s32 second)
{
    O64Method2 method = *(O64Method2 *)((u8 *)F(void *, object, 0) + offset);
    return method(object, first, second);
}

static void call_method2_void(void *object, u32 offset, s32 first, s32 second)
{
    O64Method2Void method =
        *(O64Method2Void *)((u8 *)F(void *, object, 0) + offset);
    method(object, first, second);
}

static void *make_animation(u32 first, u32 second, u32 third)
{
    void *resource = Heap_Alloc(0x10, data_ov064_02211ec4, 4,
                                &gHeapContext);
    if (resource != 0)
        resource = AnimationResource_Init(resource, first, second, third);
    return resource;
}

/* Invoke the retail two-word member-function representation at +0x6c. */
static s32 run_scene_step(void *scene)
{
    s32 function = F(s32, scene, 0x6c);
    s32 adjustment = F(s32, scene, 0x70);
    void *adjusted = (u8 *)scene + (adjustment >> 1);
    O64SceneStep step;

    if ((adjustment & 1) != 0)
        step = *(O64SceneStep *)((u8 *)F(void *, adjusted, 0) + function);
    else
        step = (O64SceneStep)(uintptr_t)(u32)function;
    return step(adjusted);
}

/* Construct the mode-selected scene, its presentation resources, and the
 * actor/runtime relationships used by the overlay state machine. */
void *Overlay064Scene_Construct(void *scene, s32 mode, u32 parameter)
{
    void *presentation;
    void *actorCollection;
    void *target;
    void *actor;
    void *actorResource;
    s16 actorX;
    s16 actorY;

    Scene_Init(scene, mode, parameter);
    F(void *, scene, 0) = data_ov064_02211e98;
    F(u16, scene, 0x74) = 0;
    F(u8, scene, 0x77) = (u8)mode;
    F(u16, scene, 0x7c) = 0;
    F(u16, scene, 0x7e) = 0;
    F(u32, scene, 0x80) = parameter;
    F(void *, scene, 0x84) = 0;
    actor = F(void *, gGamePhaseRuntime, 0x2ea4);
    actorResource = F(void *, actor, 0x54);
    actorX = F(s16, actorResource, 0x2c);
    actorY = F(s16, actorResource, 0x2e);
    F(s16, scene, 0x78) = (s16)(F(s32, actor, 0x1c) >> 16);
    F(s16, scene, 0x7a) = (s16)(F(s32, actor, 0x20) >> 16);
    F(void *, scene, 0x28) = 0;
    F(void *, scene, 0x2c) = 0;
    F(void *, scene, 0x34) = 0;
    F(void *, scene, 0x38) = 0;
    F(void *, scene, 0x3c) = 0;
    F(void *, scene, 0x40) = 0;
    GameWork_ClearFlag(gGameWork, 0x3f5);

    if (mode == 0) {
        s32 direction;
        s32 index;
        s32 special = 0;

        F(void *, scene, 0x24) = make_animation(0x1092, 0x1001, 0x1093);
        actorCollection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        presentation = GraphicsSpriteState_Create(
            ActorCollection_GetSpriteGroup(actorCollection),
            F(void *, scene, 0x24), 0, F(u8, actorResource, 0x3a),
            F(u16, actorResource, 0x28), 4, 2);
        F(void *, scene, 0x30) = presentation;
        F(u32, scene, 0x6c) = F(u32, data_ov064_02211e40, 0);
        F(u32, scene, 0x70) = F(u32, data_ov064_02211e40, 4);
        direction = call_method2(F(void *, gGamePhaseRuntime, 0x2ed4), 0x2c,
                                 F(s16, scene, 0x78), F(s16, scene, 0x7a));
        index = ((u32)direction >> 5) & 0x1f;
        if ((u32)(index - 0x11) < 4 &&
            ((1u << (index - 0x11)) & 0xb) != 0)
            special = 1;
        if (special)
            actorY -= 0x18;
        F(u8, scene, 0x76) = index != 6 && index != 0x14;
        index = ActorDirection_GetPresentationGroup(F(void *, F(void *, gGamePhaseRuntime, 0x30bc), 0));
        F(u32, scene, 0x80) = data_020ed530[index * 2 + F(u8, scene, 0x76)];
        F(s16, presentation, 0x2c) = actorX;
        F(s16, presentation, 0x2e) = actorY;
    } else if (mode == 1) {
        void *replacement;

        F(void *, scene, 0x24) = make_animation(0x11ff, 0x1200, 0x1201);
        actorCollection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        presentation = GraphicsSpriteState_Create(
            ActorCollection_GetSpriteGroup(actorCollection),
            F(void *, scene, 0x24), 0x10, F(u8, actorResource, 0x3a),
            F(u16, actorResource, 0x28) - 2, 0, 2);
        F(void *, scene, 0x30) = presentation;
        F(u32, scene, 0x6c) = F(u32, data_ov064_02211e40, 0x18);
        F(u32, scene, 0x70) = F(u32, data_ov064_02211e40, 0x1c);
        F(u8, scene, 0x76) = 0;
        F(s16, presentation, 0x2c) = actorX;
        F(s16, presentation, 0x2e) = actorY;
        Sound_LoadGroup(gSoundContext, 0x52);
        replacement = F(void *, actor, 0x26c);
        if (replacement != 0) {
            AuxiliaryInteraction_Destroy(replacement);
            Heap_Free(replacement);
            GameWork_ClearFlag(gGameWork, 0x3ee);
            F(void *, actor, 0x26c) = 0;
            replacement = Heap_Alloc(0x38, data_ov064_02211ecc, 4,
                                     &gHeapContext);
            if (replacement != 0) {
                actorCollection =
                    GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
                replacement = func_02025300(
                    replacement, (u8 *)actor + 0x18,
                    ActorCollection_GetSpriteGroup(actorCollection), 0x1e,
                    1, 0);
            }
            RuntimePresentationManager_AppendFirstListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, replacement);
        }
    } else if (mode == 2) {
        s32 direction;
        s32 index;
        s32 special = 0;

        F(void *, scene, 0x24) = make_animation(0x1096, 0x1097, 0x1098);
        actorCollection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        presentation = GraphicsSpriteState_Create(
            ActorCollection_GetSpriteGroup(actorCollection),
            F(void *, scene, 0x24), 2, F(u8, actorResource, 0x3a),
            F(u16, actorResource, 0x28), 4, 2);
        F(void *, scene, 0x30) = presentation;
        F(u32, scene, 0x6c) = F(u32, data_ov064_02211e40, 8);
        F(u32, scene, 0x70) = F(u32, data_ov064_02211e40, 0xc);
        direction = call_method2(F(void *, gGamePhaseRuntime, 0x2ed4), 0x2c,
                                 F(s16, scene, 0x78), F(s16, scene, 0x7a));
        index = (((u32)direction >> 5) & 0x1f) - 0x11;
        if ((u32)index < 4 && ((1u << index) & 0xb) != 0)
            special = 1;
        F(u8, scene, 0x76) = 0;
        if (special)
            actorY -= 0x12;
        F(s16, presentation, 0x2c) = actorX;
        F(s16, presentation, 0x2e) = actorY;
        Sound_LoadGroup(gSoundContext, 0x53);
    } else if (mode == 3) {
        s32 i;

        RuntimePresentationManager_BroadcastSlot1C((u8 *)gGamePhaseRuntime + 0x2f7c, 1);
        Sound_SetCaptureEnabled(gSoundContext, 0);
        actorCollection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 2);
        ActorCollection_UnregisterAndDestroyAllActors(actorCollection);
        GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 0);
        target = F(void *, actor, 0x26c);
        if (target != 0)
            F(u32, target, 0x20) |= 0x40000;
        target = F(void *, gGamePhaseRuntime, 0x2ea8);
        if (target != 0 && F(void *, target, 0x234) != 0)
            F(u32, F(void *, target, 0x234), 0x20) |= 0x40000;
        actorCollection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        ActorCollection_DestroyUnretainedActors(actorCollection);
        actorCollection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        ActorCollection_SetEnabled(actorCollection, 0);
        call_method2_void(F(void *, gGamePhaseRuntime, 0x30e8), 0xc, 0, 0x1f);
        GamePhaseTouchPrompt_SetEnabled(F(void *, gGamePhaseTouchPromptTaskNode, 8), 0);
        F(void *, scene, 0x3c) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
        F(void *, scene, 0x40) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
        F(void *, scene, 0x24) = make_animation(0x104c, 0x104d, 0x104e);
        F(void *, scene, 0x30) = GraphicsSpriteState_Create(
            F(void *, scene, 0x3c), F(void *, scene, 0x24), 0, 0, 0, 0x12, 0);
        F(void *, scene, 0x34) = GraphicsSpriteState_Create(
            F(void *, scene, 0x3c), F(void *, scene, 0x24), 1, 1, 0, 0x12, 0);
        if (F(s32, F(void *, actorResource, 0x14), 0x10) == 0x1000 &&
            F(u8, actorResource, 0x38) < 0x10) {
            Actor_ReplaceAttachmentSlotResource(actor, 0, 0x106a, 0x1001, 0x106b);
            target = F(void *, actor, 0x208);
            F(void *, scene, 0x38) = GraphicsSpriteGroup_CreateState(
                F(void *, scene, 0x3c), F(void *, target, 4),
                F(void *, target, 8), F(void *, target, 0xc), 2);
            GraphicsSpriteState_SetAnimationIndex(F(void *, scene, 0x38), 1);
        } else {
            F(void *, scene, 0x38) = GraphicsSpriteGroup_CreateState(
                F(void *, scene, 0x3c), F(void *, actorResource, 0x14),
                F(void *, actorResource, 0x18), F(void *, actorResource, 0x1c), 2);
            GraphicsSpriteState_SetAnimationIndex(F(void *, scene, 0x38),
                                                  F(u8, actorResource, 0x38));
        }
        F(u8, F(void *, scene, 0x38), 0x3a) = 0;
        F(u16, F(void *, scene, 0x38), 0x24) |= 2;
        F(void *, scene, 0x28) = make_animation(0x3303, 0x3304, 0x3305);
        F(void *, scene, 0x68) = GraphicsSpriteState_Create(
            F(void *, scene, 0x40), F(void *, scene, 0x28), 0, 0, 0, 2, 0);
        F(s16, F(void *, scene, 0x68), 0x2c) = 0x100;
        F(s16, F(void *, scene, 0x68), 0x2e) = 0x20;
        F(void *, scene, 0x2c) = make_animation(0x3306, 0x3307, 0x3308);
        F(void *, scene, 0x44) = GraphicsSpriteState_Create(
            F(void *, scene, 0x40), F(void *, scene, 0x2c), 0, 0x10, 0, 0x10, 0);
        F(s16, F(void *, scene, 0x44), 0x2c) = 0x80;
        F(s16, F(void *, scene, 0x44), 0x2e) = 0x60;
        for (i = 0; i < 8; ++i) {
            target = GraphicsSpriteState_Create(
                F(void *, scene, 0x40), F(void *, scene, 0x28),
                data_ov064_02211dd4[i], 0, 0, 0x12, 0);
            F(void *, scene, 0x48 + i * 4) = target;
            F(s16, target, 0x2c) = (s16)(0x50 + i * 0x10);
            F(s16, target, 0x2e) = 0x60;
        }
        F(u32, scene, 0x6c) = F(u32, data_ov064_02211e40, 0x20);
        F(u32, scene, 0x70) = F(u32, data_ov064_02211e40, 0x24);
        F(u8, scene, 0x76) = 0;
        F(s16, scene, 0x7c) = actorX - 0x80;
        F(s16, scene, 0x7e) = actorY - 0x60;
        F(s32, F(void *, scene, 0x3c), 0x18) = F(s16, scene, 0x7c);
        F(s32, F(void *, scene, 0x3c), 0x1c) = F(s16, scene, 0x7e);
        F(s32, F(void *, scene, 0x3c), 0x20) = 1;
        F(s32, F(void *, scene, 0x40), 0x18) = 0;
        F(s32, F(void *, scene, 0x40), 0x1c) = 0;
        F(s32, F(void *, scene, 0x40), 0x20) = 1;
        F(s16, F(void *, scene, 0x30), 0x2c) = 0x80;
        F(s16, F(void *, scene, 0x30), 0x2e) = 0x60;
        F(s16, F(void *, scene, 0x34), 0x2c) = 0x80;
        F(s16, F(void *, scene, 0x34), 0x2e) = 0x60;
        F(s16, F(void *, scene, 0x38), 0x2c) = 0x80;
        F(s16, F(void *, scene, 0x38), 0x2e) = 0x60;
        F(u16, (void *)0x05000000, 0) = 0;
        F(u16, (void *)0x05000400, 0) = 0;
        if (func_020ae1fc((void *)0x0400006c) == -0x10) {
            u32 display = F(u32, (void *)0x04000000, 0);
            u32 planes = ((display & 0x1f00) >> 8) & ~6u;
            F(u32, (void *)0x04000000, 0) =
                (display & ~0x1f00u) | (planes << 8);
        }
    } else {
        F(u32, scene, 0x6c) = data_020cdc1c[0];
        F(u32, scene, 0x70) = data_020cdc1c[1];
        F(u8, scene, 0x76) = 0;
    }

    target = F(void *, gGamePhaseRuntime, 0x2ea8);
    if (target != 0)
        Type7Actor_EnterSpecialPresentationState(target);
    Scene_SetFlags03(scene);
    return scene;
}

/* Release scene-owned presentation objects, restore the affected actor and
 * runtime state, unload overlay slot two, and optionally free the scene. */
static void *destroy_scene(void *scene, s32 freeScene)
{
    void *object;
    void *actor;
    s32 mode;

    F(void *, scene, 0) = data_ov064_02211e98;
    GraphicsSpriteState_ReleaseFromGroup(F(void *, scene, 0x30));
    if (F(void *, scene, 0x3c) != 0)
        GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14,
                                               F(void *, scene, 0x3c));
    if (F(void *, scene, 0x40) != 0)
        GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont,
                                               F(void *, scene, 0x40));
    object = F(void *, scene, 0x28);
    if (object != 0)
        (*(void (**)(void *, s32))((u8 *)F(void *, object, 0) + 4))(object, 1);
    object = F(void *, scene, 0x2c);
    if (object != 0)
        (*(void (**)(void *, s32))((u8 *)F(void *, object, 0) + 4))(object, 1);
    object = F(void *, scene, 0x24);
    if (object != 0)
        (*(void (**)(void *, s32))((u8 *)F(void *, object, 0) + 4))(object, 1);
    object = F(void *, scene, 0x84);
    if (object != 0) {
        VecFx32Triple_Destroy(object);
        Heap_Free(object);
    }

    actor = F(void *, gGamePhaseRuntime, 0x2ea4);
    F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~4;
    ActorDerivedType1_ResetRuntimeState(actor);
    mode = F(u8, scene, 0x77);
    if (mode == 0) {
        GamePhaseRuntime_RequestPrimaryWarp(gGamePhaseRuntime, F(s16, scene, 0x78) << 16,
                      F(s16, scene, 0x7a) << 16);
    } else if (mode == 1 || mode == 2) {
        Sound_ReleaseGroup(gSoundContext, mode == 1 ? 0x52 : 0x53);
        GamePhaseRuntime_StageAreaRequest(
            gGamePhaseRuntime, F(s16, gGameWork, 0x188),
            F(s16, gGameWork, 0x18a), F(s16, gGameWork, 0x18c), 0, 0);
        GameWork_SetFlag(gGameWork, 0x3f8);
    } else if (mode == 3) {
        GamePhaseRuntime_StageAreaRequest(gGamePhaseRuntime, 0xc6, 0x100,
                                          0xc0, 0, 0);
        GameWork_SetFlag(gGameWork, 0x3f8);
    }

    object = F(void *, gGamePhaseRuntime, 0x2ea8);
    if (object != 0)
        Type7Actor_LeaveSpecialPresentationState(object);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(scene);
    if (freeScene)
        Heap_Free(scene);
    return scene;
}

/* Destroy in place while retaining the caller-owned scene allocation. */
void *Overlay064Scene_Destroy(void *scene)
{
    return destroy_scene(scene, 0);
}

/* Deleting destructor: perform ordinary teardown and release the allocation. */
void *Overlay064Scene_Delete(void *scene)
{
    return destroy_scene(scene, 1);
}

/* Drive the mode-zero actor presentation through its five retail states. */
s32 Overlay064Scene_UpdateMode0(void *scene)
{
    void *actor = F(void *, gGamePhaseRuntime, 0x2ea4);
    s32 state;
    s32 result = 0;

    DebugText_BeginFrame();
    state = F(s32, scene, 8);
    if (state == 0) {
        void *actorSprite;
        void *sceneSprite;

        F(s32, scene, 8) = 1;
        actorSprite = F(void *, F(void *, gGamePhaseRuntime, 0x2ea4), 0x54);
        F(u16, actorSprite, 0x24) |= 4;
        sceneSprite = F(void *, scene, 0x30);
        F(u16, sceneSprite, 0x24) &= (u16)~4;
        Sound_Play(gSoundContext, 0, 0x56);
        state = 1;
    }
    if (state == 1) {
        void *sprite = F(void *, scene, 0x30);

        if ((F(u16, sprite, 0x24) & 1) != 0) {
            F(s32, scene, 8) = 2;
            F(u16, sprite, 0x24) |= 4;
            F(s16, scene, 0x74) = 0;
        }
    } else if (state == 2) {
        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x14) {
            VecFx32Object destination;
            VecFx32Object savedPosition;
            VecFx32Object transformedA;
            VecFx32Object transformedB;
            u8 curve[0x30];
            void *motion;

            F(s32, scene, 8) = 3;
            F(s16, scene, 0x74) = 0;
            GraphicsSpriteState_SetAnimationIndex(F(void *, scene, 0x30), 1);
            F(u16, F(void *, scene, 0x30), 0x24) |= 6;
            VecFx32Object_InitCopy(
                &savedPosition, (const VecFx32Object *)((u8 *)actor + 0x284));
            Overlay064VecFx32_Scale(
                &transformedA,
                (const VecFx32Object *)((u8 *)actor + 0x18), 0x4cd);
            Overlay064VecFx32_Scale(&transformedB, &savedPosition, 0xb33);
            Overlay064VecFx32_Add((VecFx32Object *)curve,
                                &transformedA, &transformedB);
            VecFx32Object_Destroy(&transformedB);
            VecFx32Object_Destroy(&transformedA);
            motion = Heap_Alloc(0x30, data_ov064_02211ed4, 4,
                                &gHeapContext);
            if (motion != 0)
                motion = Overlay064VecFx32Path_Init(
                    motion, (const VecFx32Object *)((u8 *)actor + 0x18),
                    &savedPosition, (const VecFx32Object *)curve);
            F(void *, scene, 0x84) = motion;
            GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud,
                                             -F(s32, scene, 0x80), 0);
            VecFx32Object_InitCopy(
                &destination, (const VecFx32Object *)((u8 *)actor + 0x18));
            VecFx32Object_Assign((VecFx32Object *)((u8 *)actor + 0x18),
                                 &savedPosition);
            motion = Heap_Alloc(0x44, data_ov064_02211ecc, 4,
                                &gHeapContext);
            if (motion != 0) {
                void *position = ActorMotionAreaFollower_GetPosition(
                    (u8 *)gGamePhaseRuntime + 0x2fbc);
                motion = func_02022cb0(
                    motion, position, actor, -F(s32, scene, 0x80),
                    0x2000, -0xc0);
            }
            RuntimePresentationManager_AppendFirstListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, motion);
            Overlay064Scene_SpawnRewardEffect(scene, &savedPosition);
            VecFx32Object_Assign((VecFx32Object *)((u8 *)actor + 0x18),
                                 &destination);
            VecFx32Object_Destroy(&destination);
            VecFx32Object_Destroy((VecFx32Object *)curve);
            VecFx32Object_Destroy(&savedPosition);
        }
    } else if (state == 3) {
        VecFx32Object position;
        s32 progress;

        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x3c)
            F(s16, scene, 0x74) = 0x3c;
        progress = func_020befec(F(s16, scene, 0x74) << 12, 0x3c);
        VecFx32Bezier_Evaluate3D(&position, F(void *, scene, 0x84), progress);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)actor + 0x18),
                             &position);
        Actor_RefreshCachedTerrainHeight(actor);
        F(u16, F(void *, actor, 0x54), 0x24) |= 4;
        if ((F(s16, scene, 0x74) & 4) != 0) {
            F(u16, F(void *, scene, 0x30), 0x24) |= 4;
        } else {
            GraphicsSpriteState_SetDepthOrderedWorldPosition(
                F(void *, scene, 0x30), F(s32, actor, 0x288),
                F(s32, actor, 0x28c), F(s32, actor, 0x290), 4);
        }
        if (F(s16, scene, 0x74) == 0x3c) {
            F(s32, scene, 8) = 4;
            F(s16, scene, 0x74) = 0;
            VecFx32Object_Assign(
                (VecFx32Object *)((u8 *)actor + 0x18),
                (const VecFx32Object *)((u8 *)F(void *, scene, 0x84) + 0x10));
            GraphicsSpriteState_SetAnimationIndex(F(void *, scene, 0x30), 2);
            F(u16, F(void *, scene, 0x30), 0x24) &= (u16)~3;
            GraphicsSpriteState_SetDepthOrderedWorldPosition(
                F(void *, scene, 0x30), F(s32, actor, 0x288),
                F(s32, actor, 0x28c), F(s32, actor, 0x290), 4);
        }
        VecFx32Object_Destroy(&position);
    } else if (state == 4 &&
               (F(u16, F(void *, scene, 0x30), 0x24) & 1) != 0) {
        result = 1;
    }

    GridEffectActorRegistry_BroadcastSlot1c();
    ActorInteractionRegistry_UpdateAll();
    return result;
}

/* Drive the mode-one replacement, payment, sound, and fade sequence. */
s32 Overlay064Scene_UpdateMode1(void *scene)
{
    void *actor = F(void *, gGamePhaseRuntime, 0x2ea4);
    s32 state;
    s32 result = 0;

    DebugText_BeginFrame();
    state = F(s32, scene, 8);
    if (state == 0) {
        F(s32, scene, 8) = 1;
        Actor_ReplaceAttachmentSlotResource(actor, 0, 0x1001, 0x1003,
                                            0x1004);
        ActorDerivedType1_ApplyResourceIndex(actor, 0);
        GraphicsSpriteState_SetAnimationIndex(F(void *, actor, 0x54), 0);
        Sound_Play(gSoundContext, 0x52, 0);
        state = 1;
    }
    if (state == 1) {
        void *sprite = F(void *, scene, 0x30);

        if ((F(u16, sprite, 0x24) & 1) != 0) {
            void *effect = Heap_Alloc(0x44, data_ov064_02211ecc, 4,
                                      &gHeapContext);

            F(s32, scene, 8) = 2;
            F(s16, scene, 0x74) = 0;
            F(u16, F(void *, actor, 0x54), 0x24) |= 4;
            GraphicsSpriteState_SetAnimationIndex(sprite, 0x11);
            F(u16, sprite, 0x24) &= (u16)~1;
            GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud,
                                             -F(s32, scene, 0x80), 0);
            if (effect != 0) {
                effect = func_02022cb0(
                    effect,
                    ActorMotionAreaFollower_GetPosition(
                        (u8 *)gGamePhaseRuntime + 0x2fbc),
                    actor, -F(s32, scene, 0x80), 0x2000, -0xc0);
            }
            RuntimePresentationManager_AppendFirstListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, effect);
            Sound_StopAllDirectSequences(gSoundContext, 0);
            Sound_PlayDirectSequence(gSoundContext, 0x27, 0x7f);
        }
    } else if (state == 2) {
        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x3c) {
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 0),
                0, -0x10, 0x3c);
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1),
                0, -0x10, 0x3c);
            F(s16, scene, 0x74) = 0;
            F(s32, scene, 8) = 3;
            Sound_Play(gSoundContext, 0, 0x44);
        }
    } else if (state == 3) {
        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x3c)
            result = 1;
    }

    if (!result) {
        GridEffectActorRegistry_BroadcastSlot1c();
        ActorInteractionRegistry_UpdateAll();
    }
    return result;
}

/* Drive the mode-two payment, sound, and immediate fade sequence. */
s32 Overlay064Scene_UpdateMode2(void *scene)
{
    void *actor = F(void *, gGamePhaseRuntime, 0x2ea4);
    s32 state;
    s32 result = 0;

    DebugText_BeginFrame();
    state = F(s32, scene, 8);
    if (state == 0) {
        F(s32, scene, 8) = 1;
        F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
        F(u16, F(void *, scene, 0x30), 0x24) &= (u16)~4;
        Sound_Play(gSoundContext, 0x53, 0);
        state = 1;
    }
    if (state == 1) {
        void *sprite = F(void *, scene, 0x30);

        if ((F(u16, sprite, 0x24) & 1) != 0) {
            void *effect = Heap_Alloc(0x44, data_ov064_02211ecc, 4,
                                      &gHeapContext);

            F(s32, scene, 8) = 2;
            F(s16, scene, 0x74) = 0;
            F(u16, sprite, 0x24) |= 4;
            GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud,
                                             -F(s32, scene, 0x80), 0);
            if (effect != 0) {
                effect = func_02022cb0(
                    effect,
                    ActorMotionAreaFollower_GetPosition(
                        (u8 *)gGamePhaseRuntime + 0x2fbc),
                    actor, -F(s32, scene, 0x80), 0x2000, -0xc0);
            }
            RuntimePresentationManager_AppendFirstListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, effect);
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 0),
                0, -0x10, 0x3c);
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1),
                0, -0x10, 0x3c);
            Sound_StopAllDirectSequences(gSoundContext, 0);
            Sound_PlayDirectSequence(gSoundContext, 0x27, 0x7f);
        }
    } else if (state == 2) {
        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x3c)
            result = 1;
    }

    if (!result) {
        GridEffectActorRegistry_BroadcastSlot1c();
        ActorInteractionRegistry_UpdateAll();
    }
    return result;
}

/* Drive the mode-three scripted sprite arcs, reveal, sound sequence, and
 * closing fade. Direct display/palette writes are the original DS effects. */
s32 Overlay064Scene_UpdateMode3(void *scene)
{
    s32 state;
    s32 index;

    DebugText_BeginFrame();
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    state = F(s32, scene, 8);
    if (state == 0) {
        void *sound = gSoundContext;
        s32 volume = F(s32, sound, 0xa4) - 1;

        if (volume > 0x7f)
            volume = 0x7f;
        if (volume < 0)
            volume = 0;
        if (volume >= 0x7f)
            volume = 0x7f;
        F(s32, sound, 0xa4) = volume;
        Sound_SetMasterVolume();
        if (F(s16, scene, 0x74) <= 0x78) {
            VecFx32Object start;
            VecFx32Object end;
            VecFx32Object difference;
            VecFx32Object scaled;
            VecFx32Object control;
            VecFx32Object position;
            u8 pathA[0x30];
            u8 pathB[0x30];
            s32 progress;
            void *sprite;

            VecFx32Object_InitComponents(&start, 0x100000, 0x20000, 0);
            VecFx32Object_InitComponents(&end, 0xc8000, 0x70000, 0);
            Overlay064VecFx32_Subtract(&difference, &end, &start);
            Overlay064VecFx32_Divide(&scaled, &difference, 0x2000);
            Overlay064VecFx32_Add(&control, &start, &scaled);
            VecFx32Object_Destroy(&scaled);
            VecFx32Object_Destroy(&difference);
            Overlay064VecFx32Path_Init(pathA, &start, &end, &control);
            progress = func_020befec(F(s16, scene, 0x74) << 12, 0x78);
            VecFx32Bezier_Evaluate3D(&position, pathA, progress);
            sprite = F(void *, scene, 0x68);
            F(s16, sprite, 0x2c) = (s16)(position.value.x >> 12);
            F(s16, sprite, 0x2e) = (s16)(position.value.y >> 12);
            if ((F(u16, sprite, 0x24) & 1) != 0) {
                if (F(u8, sprite, 0x38) == 1) {
                    GraphicsSpriteState_SetAnimationIndex(sprite, 2);
                    F(u16, sprite, 0x24) &= (u16)~1;
                    F(u16, sprite, 0x24) |= 2;
                }
            } else if (F(s16, scene, 0x74) == 0x0a) {
                GraphicsSpriteState_SetAnimationIndex(sprite, 1);
                F(u16, sprite, 0x24) &= (u16)~3;
            } else if (F(s16, scene, 0x74) == 0x74) {
                GraphicsSpriteState_SetAnimationIndex(sprite, 3);
            }

            Overlay064VecFx32_Set(
                &start, F(s16, scene, 0x7c) << 12,
                F(s16, scene, 0x7e) << 12, 0);
            Overlay064VecFx32_Set(&end, 0, 0x14000, 0);
            Overlay064VecFx32_Subtract(&difference, &end, &start);
            Overlay064VecFx32_Divide(&scaled, &difference, 0x2000);
            Overlay064VecFx32_Add(&difference, &start, &scaled);
            VecFx32Object_Assign(&control, &difference);
            VecFx32Object_Destroy(&difference);
            VecFx32Object_Destroy(&scaled);
            Overlay064VecFx32Path_Init(pathB, &start, &end, &control);
            VecFx32Bezier_Evaluate3D(&difference, pathB, progress);
            VecFx32Object_Assign(&position, &difference);
            VecFx32Object_Destroy(&difference);
            F(s32, F(void *, scene, 0x3c), 0x18) = position.value.x >> 12;
            F(s32, F(void *, scene, 0x3c), 0x1c) = position.value.y >> 12;
            VecFx32Triple_Destroy(pathB);
            VecFx32Object_Destroy(&position);
            VecFx32Triple_Destroy(pathA);
            VecFx32Object_Destroy(&control);
            VecFx32Object_Destroy(&end);
            VecFx32Object_Destroy(&start);
        }

        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) >= 0xb4) {
            u32 display;

            F(s32, scene, 8) = 1;
            display = F(u32, (void *)0x04000000, 0);
            F(u32, (void *)0x04000000, 0) =
                (display & ~0x1f00u) | 0x1000;
            display = F(u32, (void *)0x04001000, 0);
            F(u32, (void *)0x04001000, 0) =
                (display & ~0x1f00u) | 0x1000;
            F(u16, F(void *, scene, 0x30), 0x24) &= (u16)~0x10;
            F(u16, F(void *, scene, 0x34), 0x24) &= (u16)~0x10;
            F(u16, F(void *, scene, 0x38), 0x24) |= 0x10;
            F(u16, F(void *, scene, 0x68), 0x24) |= 0x10;
            for (index = 0; index < 8; ++index)
                F(u16, F(void *, scene, 0x48 + index * 4), 0x24) &=
                    (u16)~0x10;
            F(u16, F(void *, scene, 0x44), 0x24) &= (u16)~0x10;
            F(s16, scene, 0x74) = 0;
            Sound_StopAllManagedPlayers(gSoundContext, 0);
            Sound_ConfigureGroupSlots(gSoundContext, 0xfff, 0x20a,
                          -1, -1, -1, -1);
            F(s32, gSoundContext, 0xa4) = 0x7f;
            Sound_SetMasterVolume();
            Sound_Play(gSoundContext, 0, 0x44);
            Sound_Play(gSoundContext, 0x167, 0);
            Sound_Play(gSoundContext, 0x167, 1);
        }
    } else if (state == 1) {
        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x3c) {
            F(s32, scene, 8) = 2;
            F(s16, scene, 0x74) = 0;
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 0),
                0, -0x10, 0x5a);
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair, 1),
                0, -0x10, 0x5a);
        }
        for (index = 0; index < 8; ++index) {
            void *sprite = F(void *, scene, 0x48 + index * 4);
            F(s16, sprite, 0x2c) += (s16)data_ov064_02211de4[index * 2];
            F(s16, sprite, 0x2e) +=
                (s16)data_ov064_02211de4[index * 2 + 1];
        }
    } else if (state == 2) {
        for (index = 0; index < 8; ++index) {
            void *sprite = F(void *, scene, 0x48 + index * 4);
            F(s16, sprite, 0x2c) += (s16)data_ov064_02211de4[index * 2];
            F(s16, sprite, 0x2e) +=
                (s16)data_ov064_02211de4[index * 2 + 1];
        }
        F(s16, scene, 0x74)++;
        if (F(s16, scene, 0x74) > 0x5a)
            return 1;
    }
    return 0;
}

/* Select and spawn the mode-zero reward effect using the retail weighted
 * table, preserving the one-time GameWork selection rule. */
void Overlay064Scene_SpawnRewardEffect(void *scene, const VecFx32Object *position)
{
    u64 division = func_020bf1f8(genrand_int32(), 0x64);
    s32 random = (s32)(division >> 32);
    s32 category = ActorDirection_GetPresentationGroup(
        F(s32, F(void *, gGamePhaseRuntime, 0x30bc), 0));
    s32 selection = 0;
    s32 cumulative = 0;
    s32 direction = F(s8, scene, 0x76);
    u8 *row = data_020ed548 + category * 0x28 + direction * 0x14;
    u16 id;

    if (!GameWork_TestFlag(gGameWork, 0x411)) {
        GameWork_SetFlag(gGameWork, 0x411);
    } else {
        for (selection = 0; selection < 4; ++selection) {
            cumulative += *(u16 *)(row + selection * 4 + 2);
            if (cumulative >= random)
                break;
        }
    }
    id = *(u16 *)(row + selection * 4);
    if (id != 0xffff && id != 0x55) {
        u8 descriptor[0x24] = {0};
        VecFx32Object offset;
        VecFx32Object spawnPosition;
        void *effect;

        *(void **)(descriptor + 0x14) = descriptor;
        *(s32 *)(descriptor + 0x18) = 1;
        *(void **)(descriptor + 0x1c) = descriptor;
        ActorDescriptor_InitRange(descriptor, id, 1);
        VecFx32Object_InitComponents(&offset, 0, 0, 0x20000);
        Overlay064VecFx32_Add(&spawnPosition, position, &offset);
        VecFx32Object_Destroy(&offset);
        effect = GridEffectActor_Spawn(&spawnPosition, descriptor, 0x168);
        VecFx32Object_InitComponents(&offset, 0, 0, 0x5000);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)effect + 0x38), &offset);
        VecFx32Object_Destroy(&offset);
        VecFx32Object_Destroy(&spawnPosition);
    }
}

/* Scale a value-object's three fx32 components with retail rounding. */
void Overlay064VecFx32_Scale(VecFx32Object *output,
                         const VecFx32Object *input, s32 scale)
{
    s32 index;

    VecFx32Object_Init(output);
    for (index = 0; index < 3; ++index) {
        s64 product = (s64)((const s32 *)&input->value)[index] * scale;
        ((s32 *)&output->value)[index] = (s32)((product + 0x800) >> 12);
    }
}

/* Initialize an output value and calculate the shared vector helper result. */
void Overlay064VecFx32_Add(VecFx32Object *output,
                         const VecFx32Object *first,
                         const VecFx32Object *second)
{
    VecFx32Object_Init(output);
    func_020adff0(first != 0 ? &first->value : 0,
                  second != 0 ? &second->value : 0, &output->value);
}

/* Construct the three-point fx32 path object used by the actor arc. */
void *Overlay064VecFx32Path_Init(void *path, const VecFx32Object *first,
                          const VecFx32Object *second,
                          const VecFx32Object *third)
{
    VecFx32Object_Init((VecFx32Object *)path);
    VecFx32Object_Init((VecFx32Object *)((u8 *)path + 0x10));
    VecFx32Object_Init((VecFx32Object *)((u8 *)path + 0x20));
    VecFx32Triple_Set(path, first, second, third);
    return path;
}

/* Initialize an output value and calculate the companion shared vector op. */
void Overlay064VecFx32_Subtract(VecFx32Object *output,
                         const VecFx32Object *first,
                         const VecFx32Object *second)
{
    VecFx32Object_Init(output);
    func_020adfbc(first != 0 ? &first->value : 0,
                  second != 0 ? &second->value : 0, &output->value);
}

/* Apply the shared scalar transform independently to all three components. */
void Overlay064VecFx32_Divide(VecFx32Object *output,
                         const VecFx32Object *input, s32 value)
{
    VecFx32Object_Init(output);
    output->value.x = func_020adc90(input->value.x, value);
    output->value.y = func_020adc90(input->value.y, value);
    output->value.z = func_020adc90(input->value.z, value);
}

/* Store three fx32 components in an optional value-object payload. */
void Overlay064VecFx32_Set(VecFx32Object *output, s32 x, s32 y, s32 z)
{
    VecFx32Value *value = output != 0 ? &output->value : 0;

    value->x = x;
    value->y = y;
    value->z = z;
}

/* Advance the selected scene branch and synchronize its shared actor/UI
 * presentation state. A completed branch deletes the scene and returns one. */
s32 Overlay064Scene_Update(void *scene)
{
    s32 complete = run_scene_step(scene);

    if (F(u8, scene, 0x77) != 3) {
        VecFx32Object position;
        void *collection;

        GamePhaseRuntime_SynchronizeActorPlacement(gGamePhaseRuntime, 0);
        GamePhaseRuntime_SynchronizeActorPlacement(gGamePhaseRuntime, 1);
        ActorFeedback_UpdatePresentations();
        collection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        ActorCollection_DispatchEventToActors(
            collection,
            ActorMotionAreaFollower_GetPosition((u8 *)gGamePhaseRuntime + 0x2fbc));
        collection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        GraphicsSpriteGroup_AdvanceAnimations(
            ActorCollection_GetSpriteGroup(collection));
        GamePhaseRuntime_BuildSecondaryTransform(&position, gGamePhaseRuntime);
        collection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 2);
        ActorCollection_DispatchEventToActors(collection, &position);
        VecFx32Object_Destroy(&position);
        collection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 2);
        GraphicsSpriteGroup_AdvanceAnimations(
            ActorCollection_GetSpriteGroup(collection));
        RuntimePresentationManager_UpdatePresentations((u8 *)gGamePhaseRuntime + 0x2f7c, 1);
        GamePhaseCurrencyHud_Update(gGamePhaseCurrencyHud);
        GamePhaseRuntime_UpdateDualScreenUiPresentation(gGamePhaseRuntime);
    } else {
        GraphicsSpriteGroup_AdvanceAnimations(F(void *, scene, 0x3c));
        GraphicsSpriteGroup_AdvanceAnimations(F(void *, scene, 0x40));
    }

    if (complete != 0) {
        if (scene != 0) {
            void (*destroyAndFree)(void *, s32) =
                *(void (**)(void *, s32))((u8 *)F(void *, scene, 0) + 4);
            destroyAndFree(scene, 1);
        }
        return 1;
    }
    return 0;
}

/* Update the scene's selected display effect. Modes zero through two defer to
 * the shared runtime object; mode three performs the retail fade registers. */
s32 Overlay064Scene_UpdateDisplayEffect(void *scene)
{
    if (F(u8, scene, 0x77) != 3) {
        void *runtime = gGamePhaseRuntime;
        void (*update)(void *) =
            *(void (**)(void *))((u8 *)F(void *, runtime, 0) + 0xc);
        update(runtime);
    } else if (F(s32, scene, 8) == 0) {
        s32 brightness = -(F(s16, scene, 0x74) * 2);
        u32 display;
        u32 planes;

        if (brightness < -0x10)
            brightness = -0x10;
        display = F(u32, (void *)0x04000000, 0);
        planes = ((display & 0x1f00) >> 8) & ~2u;
        F(u32, (void *)0x04000000, 0) =
            (display & ~0x1f00u) | (planes << 8);
        F(u16, (void *)0x04000050, 0) = 0;
        func_020afce8((void *)0x04000050, 0xf, brightness, 0);
        func_020afce8((void *)0x04001050, 0xf, brightness, 0);
    } else if (F(s32, scene, 8) == 1) {
        s32 brightness = F(s16, scene, 0x74) / 8;

        if (brightness > 0)
            brightness = 0x1f;
        F(u16, (void *)0x05000000, 0) = (u16)brightness;
        F(u16, (void *)0x05000400, 0) = (u16)brightness;
    }
    return 0;
}
