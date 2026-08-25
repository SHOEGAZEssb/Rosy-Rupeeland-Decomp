#include "tingle/frame_task.h"
#include "tingle/game_work.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_touch_prompt.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"
#include "tingle/util_animation_resource.h"
#include "tingle/vec_fx32.h"

/*
 * Construction of the game's large, phase-specific runtime scene. The object
 * aggregates scene state, rendering helpers, an overlay slot, and a frame task;
 * most embedded types retain offset-derived identities pending their recovery.
 */

extern u32 gGamePhaseRuntimeVTable[];
extern u8 gGamePhaseTouchPromptAllocationTag[];
extern GamePhaseRuntime *gGamePhaseRuntime;
extern FrameTaskNode *gGamePhaseTouchPromptTaskNode;
extern u8 gActorRuntimeCollection[];
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif

extern void GamePhaseState_Init(void *object);
extern void ActorMotionAreaFollower_Init(void *object, void *source);
extern void ActorMotionGameWork_Init(void *object);
extern void func_020ae90c(void *object);
extern void GamePhaseRuntime_CreateFieldLoader(GamePhaseRuntime *runtime);
extern void GXS_SetGraphicsMode(u32 bgMode);
extern void DisplayController_SetVerticalOffset(s32 value);
extern void ActorMotionAreaFollower_Reset(void *object);
extern void ActorMotion_Reset(void *object);
extern void ActorRuntimeCollection_Reset(void *object);
extern void GamePhaseState_ConfigureForPhase(void *object, const void *config);
extern void ActorInteractionRuntime_Start(void);
extern void ActorDerivedType1_ResetToDisabledState(void *entity);
extern void Actor_AdjustPositionForTerrainHeight(void *entity);
extern void ActorDerivedType1_UpdateGameWorkRuntimeFlags(void *entity, s32 enabled);
extern void ActorMotionAreaFollower_BindActor(void *object, void *entity);
extern void ActorMotion_BindActor(void *object, void *entity);
extern void ActorMotionAreaFollower_RefreshCurrentArea(void *object);
extern void GamePhaseState_SetEnabled(void *object, s32 enabled);
extern void *ActorMotion_GetPosition(void *object);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern void ActorCollection_DispatchEventToActors(void *object, void *value);
extern void GamePhaseRuntime_SetDisplayRouting(s32 value);
extern void TimedSpriteRecordPresentation_SpawnAndRegister(
    void *object, const void *config);
extern void GamePhaseCurrencyHud_SetVisible(void *object, s32 enabled);
extern void GamePhaseAreaScene_ApplyRevealedRegions(void *object, void *source);

#ifdef __cplusplus
}
#endif

/*
 * Initialize the scene and embedded helpers, publish the singleton runtime,
 * allocate/register its GMTK-tagged frame task, run final setup, and return
 * self. This mutates global task state, may allocate from the game heap, and
 * initializes an embedded ARM9 overlay slot at offset 0x30c0.
 */
GamePhaseRuntime *GamePhaseRuntime_Init(GamePhaseRuntime *self)
{
    u8 *bytes = (u8 *)self;
    GamePhaseTouchPrompt *task;

    Scene_Init((Scene *)self);
    self->vtable = gGamePhaseRuntimeVTable;
    GamePhaseState_Init(bytes + 0x24);

    /* These adjacent objects share storage at 0x2fa4..0x2fbf. */
    *(s32 *)(bytes + 0x2fb8) = 0;
    ActorMotionAreaFollower_Init(bytes + 0x2fbc, bytes + 0x2fa4);
    ActorMotionGameWork_Init(bytes + 0x3044);
    TouchPoint_InitZero((TouchPoint *)(bytes + 0x30a8));

    *(s32 *)(bytes + 0x30b4) = 0;
    *(s32 *)(bytes + 0x30b8) = 0;
    *(s32 *)(bytes + 0x30bc) = 0;
    OverlaySlot_Init((OverlaySlot *)(bytes + 0x30c0));
    *(u8 *)(bytes + 0x30cc) = 0;
    *(s32 *)(bytes + 0x30e4) = -1;
    *(s32 *)(bytes + 0x30e8) = 0;
    *(s32 *)(bytes + 0x30ec) = 0;
    *(s32 *)(bytes + 0x30f0) = 0;
    *(s32 *)(bytes + 0x30f4) = 0;
    func_020ae90c(bytes + 0x3000);

    gGamePhaseRuntime = self;
    self->field_04 = 1;
    task = (GamePhaseTouchPrompt *)Heap_Alloc(
        sizeof(GamePhaseTouchPrompt),
        (const char *)gGamePhaseTouchPromptAllocationTag, 4, &gHeapContext);
    if (task != 0)
        task = GamePhaseTouchPrompt_Init(task, self);
    gGamePhaseTouchPromptTaskNode =
        FrameTaskList_Add(task != 0 ? &task->base : 0, 0);

    GamePhaseRuntime_CreateFieldLoader(self);
    return self;
}

/*
 * Apply one phase configuration to the runtime. This establishes sub-screen
 * graphics mode, initializes map/entity systems, positions up to two entities,
 * binds render resources, configures the global currency HUD, and enables scene
 * processing. Config field meanings remain offset-derived except where their
 * bit behavior is directly confirmed. Hardware display registers, GameWork,
 * global task state, and numerous embedded runtime objects may change.
 */
void GamePhaseRuntime_Configure(GamePhaseRuntime *self, const void *configPointer,
                   s32 x, s32 y, s32 z)
{
    const u8 *config = (const u8 *)configPointer;
    u8 *bytes = (u8 *)self;
    void *entity;
    void *secondary;
    s32 fixedY = y << 12;
    s32 fixedZ = z << 12;
    u32 modeBits;

    Scene_ClearFlags03((Scene *)self);
    *(const void **)(bytes + 0x30bc) = configPointer;
    GXS_SetGraphicsMode(0);

    /* Select BG0 for the 3D engine on both DS display-control registers. */
    *(volatile u32 *)0x04000000 =
        (*(volatile u32 *)0x04000000 & ~0x1f00) | 0x1000;
    *(volatile u32 *)0x04001000 =
        (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1000;

    DisplayController_SetVerticalOffset(*(const s16 *)(config + 0x54));
    ActorMotionAreaFollower_Reset(bytes + 0x2fbc);
    ActorMotion_Reset(bytes + 0x3044);
    ActorRuntimeCollection_Reset(gActorRuntimeCollection);
    GamePhaseRuntime_CreateSecondaryActorSubsystem(self, (void *)configPointer, 1);
    GamePhaseState_ConfigureForPhase(bytes + 0x24, configPointer);
    GamePhaseRuntime_RefreshAreaAuxiliaryObject(self, (void *)configPointer, 1);
    ((void (*)(s32))*(const void *const *)(config + 0x24))(0);
    ActorInteractionRuntime_Start();

    entity = *(void **)(bytes + 0x2ea4);
    *(s32 *)((u8 *)entity + 0x1c) = x << 12;
    *(s32 *)((u8 *)entity + 0x20) = fixedY;
    *(s32 *)((u8 *)entity + 0x24) = fixedZ;
    VecFx32Object_Assign((VecFx32Object *)((u8 *)entity + 0x28),
                  (VecFx32Object *)((u8 *)entity + 0x18));
    if (GameWork_TestFlag(gGameWork, 0x3f2) != 0) {
        *(s32 *)((u8 *)entity + 0x24) = 0x60000;
        ActorDerivedType1_ResetToDisabledState(entity);
    } else if (*(s32 *)((u8 *)entity + 0x24) == 0) {
        Actor_AdjustPositionForTerrainHeight(entity);
    }

    secondary = *(void **)(bytes + 0x2ea8);
    if (secondary != 0 &&
        (*(u32 *)((u8 *)secondary + 0x268) & 0x10) != 0 &&
        (*(u32 *)((u8 *)secondary + 0x268) & 0x20) == 0) {
        *(s32 *)((u8 *)secondary + 0x1c) = (x + 0x14) << 12;
        *(s32 *)((u8 *)secondary + 0x20) = fixedY;
        *(s32 *)((u8 *)secondary + 0x24) = fixedZ;
        VecFx32Object_Assign((VecFx32Object *)((u8 *)secondary + 0x28),
                      (VecFx32Object *)((u8 *)secondary + 0x18));
        if (GameWork_TestFlag(gGameWork, 0x3f2) != 0) {
            *(s32 *)((u8 *)secondary + 0x24) = 0x60000;
        } else if (*(s32 *)((u8 *)secondary + 0x24) == 0) {
            Actor_AdjustPositionForTerrainHeight(secondary);
        }
    }

    ActorDerivedType1_UpdateGameWorkRuntimeFlags(entity,
                  (u32)(*(const s32 *)config - 2) <= 2 ? 1 : 0);
    ActorMotionAreaFollower_BindActor(bytes + 0x2fbc, entity);
    ActorMotion_BindActor(bytes + 0x3044, entity);
    ActorMotionAreaFollower_RefreshCurrentArea(bytes + 0x2fbc);
    GamePhaseRuntime_RecreateDualScreenUiPresentation(self, GamePhaseRuntime_GetActiveAreaPlacementVariant(self), (void *)configPointer);
    *(s32 *)(bytes + 0x30fc) = 1;
    GamePhaseRuntime_SetPlacementMode(self, 1, 0);
    GamePhaseState_SetEnabled(bytes + 0x24, 1);

    ActorCollection_DispatchEventToActors((u8 *)*(void **)(bytes + 0x2fb8) + 8,
                  ActorMotion_GetPosition(bytes + 0x3044));
    ActorCollection_DispatchEventToActors(bytes + 0x28, ActorMotionAreaFollower_GetPosition(bytes + 0x2fbc));

    modeBits = *(const u32 *)(config + 0x40);
    /* Retail's LSL #9 / ASR #31 tests metadata bit 22. Keep the mask explicit:
     * MSVC otherwise reduces the signed-shift expression to a bit-31 test. */
    if ((modeBits & 0x00400000) != 0)
        GamePhaseRuntime_SetDisplayRouting(0);
    else
        GamePhaseRuntime_SetDisplayRouting(1);

    switch ((modeBits >> 18) & 3) {
    case 1:
        if (*(const s16 *)(config + 0x12) >= 0)
            TimedSpriteRecordPresentation_SpawnAndRegister(
                ActorMotionAreaFollower_GetPosition(bytes + 0x2fbc),
                configPointer);
        break;
    case 2:
        if (*(const s16 *)(config + 0x12) >= 0)
            TimedSpriteRecordPresentation_SpawnAndRegister(
                ActorMotionAreaFollower_GetPosition(bytes + 0x2fbc),
                configPointer);
        break;
    }

    *(s32 *)(bytes + 0x30e4) = -1;
    GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);
    *(u16 *)((u8 *)gGamePhaseCurrencyHud + 0xbc) = 250;
    *(u16 *)((u8 *)gGamePhaseCurrencyHud + 0xbe) = 30;

    if (((modeBits >> 18) & 3) == 2 &&
        *(const s32 *)(config + 0x48) != -1) {
        GamePhaseAreaScene_ApplyRevealedRegions(*(void **)(bytes + 0x2fb8), bytes + 0x2fa4);
    }

    *(void **)(bytes + 0x30f0) = entity;
    GamePhaseTouchPrompt_SetEnabled(
        (GamePhaseTouchPrompt *)gGamePhaseTouchPromptTaskNode->task, 1);
    *(u32 *)(bytes + 0x30b8) |= 0x30;
    Scene_SetFlags03((Scene *)self);
}
