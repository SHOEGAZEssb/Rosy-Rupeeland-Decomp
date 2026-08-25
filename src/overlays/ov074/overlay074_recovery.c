#include "tingle/game_phase_resume_scene.h"
#include "tingle/types.h"

/*
 * Recovered overlay 74 gameplay presentation and transition subsystem.
 *
 * The overlay constructs paired scene resources, coordinates actor and UI state,
 * and advances several gameplay/display transition controllers.  Unconfirmed
 * members retain address-derived and offset-based descriptions.
 */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))

extern u8 data_ov074_02211d34[], data_ov074_02211d48[];
extern u8 data_ov074_02211d5c[];
extern u8 data_ov074_02211d8c[], data_ov074_02211db8[];
extern void *gGamePhaseRuntime;
extern void *gGamePhaseTouchPromptTaskNode, *gGameWork, *gSoundContext, *gGamePhaseCurrencyHud;
extern void *gHeapContext, *gSceneManager;
extern u8 data_020f4e14[];
extern const s16 gFx32CosSinTable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GX_SetBankForLCDC(...), GX_SetGraphicsMode(...), Heap_Free(...);
extern void GX_DisableBankForLCDC(...);
extern void *Heap_Alloc(...);
extern void G3X_InitMtxStack(...), VecFx32Object_Init(...);
extern void VecFx32Object_Destroy(...), SplineMover_Init(...);
extern void VecFx32Object_InitCopy(...), SplineMover_Destroy(...);
extern void SplineMover_Evaluate2D(...);
extern s32 SplineMover_Update(...);
extern void VecFx32Object_InitComponents(...), VecFx32Object_Assign(...);
extern void SplineMover_InitTransition(...), SplineMover_Assign(...);
extern void Scene_Init(...), Scene_Destroy(...), Scene_SetFlags03(...);
extern void Scene_ClearFlags03(...);
extern void *SceneManager_GetCurrent(...), *OverlayManager_GetGlobal(...);
extern void OverlayManager_UnloadOverlay(...);
extern void GameWork_SetFlag(...), GameWork_ClearFlag(...);
extern void GamePhaseTouchPrompt_SetEnabled(...);
extern void *ActorDerivedType1_GetSingletonObject(...);
extern void func_ov088_0221ad9c(...), func_ov088_0221aaac(...);
extern void GridEffectActorRegistry_BroadcastStateValue0(...);
extern void GraphicsSpriteRenderer_ClearTextBuffer(...);
extern void *GamePhaseMetadata_GetByIndex(...);
extern void ActorDerivedType1_ResetToBaseState(...);
extern void func_020adff0(...), func_020adfbc(...), func_020aef3c(...);
extern void func_020b0374(...), func_020b0300(...), func_020a7b90(...);
extern void func_020b0808(...), func_020b0844(...), func_020b0880(...);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(...);
extern void RuntimePresentationManager_DestroyAllEffects(...), RuntimePresentationManager_DispatchVBlankCallbacks(...);
extern void Graphics3dPresentation_Clear(...), Graphics3dPresentation_Disable(...), Graphics3dPresentation_Enable(...);
extern void func_02059880(...), DebugText_BeginFrame(...);
extern void OS_WaitVBlankIntr(...);
extern s32 RuntimePresentationManager_UpdatePresentations(...);
extern void GamePhaseCurrencyHud_Update(...);
extern void GamePhaseRuntime_UpdateDualScreenUiPresentation(...);
extern void Type7Actor_ClearBoundaryTransitionFlags(...);
extern void ActorMotionAreaFollower_RefreshCurrentArea(...);
extern void func_ov025_021fd2e8(...), func_ov033_021fd324(...);
extern void GamePhaseRuntime_RunFrameMaintenance(...);
extern void GamePhaseRuntime_ChangeToNeighborArea(...);
extern void GamePhaseRuntime_SynchronizeActorPlacement(...);
extern void GamePhaseRuntime_FinalizeActorCollections(...);
extern void *GamePhaseRuntime_GetActorCollection(...);
extern void GamePhaseState_SetEnabled(...), GamePhaseState_ApplyPlacementState(...);
extern void GamePhaseAreaScene_SetEnabled(...);
extern void DualLayerTileRenderer_SetEmbeddedAnimationPaused(...);
extern void ActorCollection_SetEnabled(...);
extern void GamePhaseVisualEffect_Update(...), GamePhaseAreaScene_Update(...);
extern void GamePhaseState_UpdateRenderHelpers(...);
extern void *ActorMotionAreaFollower_GetPosition(...), *ActorMotion_GetActor(...);
extern void ActorMotion_SetPosition(...), Type7Actor_ProcessBoundaryTransition(...);
extern s32 func_020befec(...);
extern void GamePhaseVisualEffect_SetBlendCoefficients(...);
extern void GamePhaseRuntime_BuildSecondaryTransform(...);
extern void GamePhaseAreaScene_ApplyPlacementState(...);
extern void ActorCollection_DispatchEventToActors(...);
extern void *GamePhaseState_GetConfiguration(...);
#ifdef __cplusplus
}
#endif

void func_ov074_02211a68(void *);
void *func_ov074_02211a8c(void *, s32, s32, s32, s32, s32);
void func_ov074_02211b28(void *, const void *);
void func_ov074_02211b58(void *, const void *);
void func_ov074_022116a8(void *);
void *func_ov074_02210008(void *, const void *);
void func_ov074_022105b4(void *, s32, void *, void *);
void func_ov074_02210730(void *, void *);
void func_ov074_022107f8(void *, void *, void *, void *);
void func_ov074_02210878(void *, void *, s32);
void func_ov074_02210a04(void *, void *, void *);
void func_ov074_02210b90(void *);
void func_ov074_02211644(void *, void *, void *);
void *func_ov074_0221167c(void *);
void func_ov074_02211790(void *);
void func_ov074_022117d0(void *, s32, s32);
void func_ov074_022119b8(void *, s32);
void func_ov074_02211960(s32, s32);
void func_ov074_02211a0c(void *);

/* Initializes the first compact runtime record through the local helper; mutates the record and returns its initialization result. */
void *func_ov074_0220fd20(void *record) {
  func_ov074_02211a68(record);
  F(void *, record, 0) = data_ov074_02211d5c;
  return record;
}

/* Empty callback that changes no state and returns no meaningful value without SDK interaction. */
void func_ov074_0220fd40(void) {}

/* Initializes the paired compact runtime record through the local helper; mutates the record and returns its initialization result. */
void *func_ov074_0220fd44(void *record) {
  func_ov074_02211a68(record);
  F(void *, record, 0) = data_ov074_02211d34;
  return record;
}

/* Empty callback that changes no state and returns no meaningful value without SDK interaction. */
void func_ov074_0220fd64(void) {}

/* Initializes an offset-based event/controller record and callback state; mutates the record and returns its result. */
void *func_ov074_0220fd68(void *record, s32 first, s32 second) {
  func_ov074_02211a8c(record, first, 0, second, 0x10, 7);
  F(void *, record, 0) = data_ov074_02211d5c;
  return record;
}

/* Constructs the main scene, resources, presentation records, gameplay links, and display state; returns the initialized scene. */
void *func_ov074_0220fda8(void *scene, s32 direction) {
  volatile u32 *display_control = (volatile u32 *)0x04000000;
  void *presentationManager;
  void *actor;
  s32 transition[6];
  s8 target_area;
  s8 current_area;
  u32 display;

  Scene_Init(scene);
  F(void *, scene, 0) = data_ov074_02211d8c;
  F(s32, scene, 0x24) = direction;
  VecFx32Object_Init((u8 *)scene + 0x28);
  func_ov074_0221167c((u8 *)scene + 0x38);
  SplineMover_Init((u8 *)scene + 0x8c);
  SplineMover_Init((u8 *)scene + 0xc8);
  VecFx32Object_Init((u8 *)scene + 0x104);
  VecFx32Object_Init((u8 *)scene + 0x114);
  F(s32, scene, 0x124) = 0;
  F(s32, scene, 0x128) = 0;
  VecFx32Object_Init((u8 *)scene + 0x12c);
  F(s32, scene, 0x140) = 0;
  func_ov074_0220fd20((u8 *)scene + 0x144);
  func_ov074_0220fd44((u8 *)scene + 0x15c);
  F(s32, scene, 4) = 3;
  F(u8, gGamePhaseRuntime, 0x30cc) |= 4;
  func_ov074_02210b90(scene);

  presentationManager = (u8 *)gGamePhaseRuntime + 0x2f7c;
  actor = RuntimePresentationManager_GetGraphics3dPresentation(presentationManager);
  Graphics3dPresentation_Clear(actor);
  Graphics3dPresentation_Disable(actor, 1, 0);
  RuntimePresentationManager_DestroyAllEffects(presentationManager);
  func_02059880(gSoundContext, 1);
  display = *display_control;
  *display_control = (display & ~0x1f00U) |
                     ((((display & 0x1f00U) >> 8) & ~1U) << 8);
  *(volatile u32 *)0x04000010 = 0;
  GamePhaseTouchPrompt_SetEnabled(F(void *, gGamePhaseTouchPromptTaskNode, 8), 0);
  actor = ActorDerivedType1_GetSingletonObject();
  if (actor != 0 && F(s16, actor, 0x230) == 1)
    func_ov088_0221ad9c(actor, 0);
  GridEffectActorRegistry_BroadcastStateValue0();
  GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);

  actor = GamePhaseMetadata_GetByIndex(
      F(s16, F(void *, gGamePhaseRuntime, 0x30bc), 0x14 + direction * 2));
  target_area = F(s8, actor, 0x4c);
  current_area = F(s8, F(void *, gGamePhaseRuntime, 0x30bc), 0x4c);
  if (current_area != target_area) {
    F(s32, scene, 0x124) = 1;
    if (F(s32, F(void *, gGamePhaseRuntime, 0x30bc), 0x40) < 0)
      F(u32, scene, 0x140) |= 4;
    func_ov074_0220fd68(transition, F(s16, gGamePhaseRuntime, 0x2ef4),
                       F(s16, gGamePhaseRuntime, 0x2ef6));
    func_ov074_02210008((u8 *)scene + 0x144, transition);
    GameWork_SetFlag(gGameWork, 0x412);
  }
  ActorDerivedType1_ResetToBaseState(F(void *, gGamePhaseRuntime, 0x2ea4));
  Scene_SetFlags03(scene);
  return scene;
}

/* Forwards controller state into the local pair-update helper; mutates the supplied records and returns its status. */
void *func_ov074_02210008(void *destination, const void *source) {
  if (destination != source)
    func_ov074_02211b58(destination, source);
  return destination;
}

/* Destroys the first scene variant's graphics, callbacks, and embedded resources; returns no meaningful value. */
static void *func_ov074_destroy_scene(void *scene, s32 free_allocation) {
  void *actor;
  F(void *, scene, 0) = data_ov074_02211d8c;
  GamePhaseTouchPrompt_SetEnabled(F(void *, gGamePhaseTouchPromptTaskNode, 8), 1);
  actor = ActorDerivedType1_GetSingletonObject();
  if (actor != 0 && F(s16, actor, 0x230) == 1)
    func_ov088_0221ad9c(actor, 1);
  OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
  GameWork_ClearFlag(gGameWork, 0x412);
  VecFx32Object_Destroy((u8 *)scene + 0x12c);
  VecFx32Object_Destroy((u8 *)scene + 0x114);
  VecFx32Object_Destroy((u8 *)scene + 0x104);
  SplineMover_Destroy((u8 *)scene + 0xc8);
  SplineMover_Destroy((u8 *)scene + 0x8c);
  SplineMover_Destroy((u8 *)scene + 0x50);
  VecFx32Object_Destroy((u8 *)scene + 0x40);
  VecFx32Object_Destroy((u8 *)scene + 0x28);
  Scene_Destroy(scene);
  if (free_allocation)
    Heap_Free(scene);
  return scene;
}

void *func_ov074_02210024(void *scene) {
  return func_ov074_destroy_scene(scene, 0);
}

/* Destroys the paired scene variant's graphics, callbacks, and embedded resources; returns no meaningful value. */
void *func_ov074_022100fc(void *scene) {
  return func_ov074_destroy_scene(scene, 1);
}

/* Advances the scene's large gameplay/presentation state machine, coordinating actors, UI, sound, and transitions; returns one when the scene has handed control back. */
s32 func_ov074_022101dc(void *scene) {
  typedef s32 (*UpdateFn)(void *);
  typedef void (*SceneFn)(void *);
  typedef void (*UiFn)(void *, s32, s32);
  s32 point[4];
  s32 transition[6];
  void *runtime = gGamePhaseRuntime;
  void *object;
  UpdateFn update;

  switch (F(s32, scene, 8)) {
  case 0:
    if (F(s32, scene, 0x124) != 0 &&
        (F(u32, scene, 0x140) & 4) != 0) {
      update = F(UpdateFn, F(void *, scene, 0x144), 8);
      if (!update((u8 *)scene + 0x144))
        break;
    }
    ++F(s32, scene, 8);
    /* Fall through: retail starts the capture as soon as the gate opens. */
  case 1:
    if (F(u16, scene, 0x38) < 2)
      break;
    func_ov074_022117d0((u8 *)scene + 0x38, 0, 0);
    OS_WaitVBlankIntr();
    func_ov074_022119b8((u8 *)scene + 0x38, 1);
    ++F(s32, scene, 8);
    object = F(void *, runtime, 0x2ea8);
    if (object != 0)
      Type7Actor_ClearBoundaryTransitionFlags(object);
    DebugText_BeginFrame();
    object = F(void *, runtime, 0x30e8);
    F(UiFn, F(void *, object, 0), 0xc)(object, 0, 2);
    break;
  case 2:
    if (F(s32, scene, 0x124) != 0) {
      if (SplineMover_Update((u8 *)scene + 0xc8)) {
        func_ov074_022107f8(scene, (u8 *)scene + 0xc8, 0, 0);
        break;
      }
      GamePhaseAreaScene_SetEnabled(F(void *, runtime, 0x2fb8), 0);
    }
    func_ov074_022117d0((u8 *)scene + 0x38, 0, 0);
    func_ov074_022105b4(scene, F(s32, scene, 0x24),
                       (u8 *)scene + 0x8c, (u8 *)scene + 0xc8);
    func_ov074_02211a8c(transition, 0, F(s16, runtime, 0x2ef4), 0x10,
                       F(s16, runtime, 0x2ef6), 7);
    F(void *, transition, 0) = data_ov074_02211d34;
    func_ov074_02211b58((u8 *)scene + 0x15c, transition);
    ++F(s32, scene, 8);
    break;
  case 3:
    Scene_SetFlags03(scene);
    if (F(s32, scene, 0x124) != 0)
      func_ov074_022107f8(scene, (u8 *)scene + 0xc8, 0, 0);
    ++F(s32, scene, 8);
    break;
  case 4:
    SplineMover_Update((u8 *)scene + 0x50);
    func_ov074_02211790((u8 *)scene + 0x38);
    if ((F(u32, scene, 0x140) & 4) != 0)
      GamePhaseVisualEffect_SetBlendCoefficients((u8 *)runtime + 0x2ed8, 0,
                                                 0x10);
    if (!SplineMover_Update((u8 *)scene + 0x8c)) {
      func_ov074_022119b8((u8 *)scene + 0x38, 0);
      ActorMotionAreaFollower_RefreshCurrentArea((u8 *)runtime + 0x2fbc);
      F(u32, scene, 0x140) |= 1;
      ++F(s32, scene, 8);
    } else {
      func_ov074_02210730(scene, (u8 *)scene + 0x8c);
    }
    break;
  case 5:
    if ((F(u32, scene, 0x140) & 2) == 0)
      break;
    object = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)runtime + 0x2f7c);
    Graphics3dPresentation_Enable(object, 1, 0);
    F(u8, runtime, 0x30cc) &= (u8)~4;
    {
      volatile u32 *display = (volatile u32 *)0x04000000;
      u32 value = *display;
      *display = (value & ~0x1f00U) |
                 (((((value & 0x1f00U) >> 8) | 1U) & 0x1fU) << 8);
    }
    object = F(void *, runtime, 0x30e8);
    F(UiFn, F(void *, object, 0), 0xc)(object, 1, 0x1f);
    ++F(s32, scene, 8);
    /* Fall through: update and test the exit controller immediately. */
  case 6:
    GamePhaseRuntime_UpdateDualScreenUiPresentation(runtime);
    if (F(s32, scene, 0x124) != 0 &&
        (F(u32, scene, 0x140) & 4) != 0) {
      update = F(UpdateFn, F(void *, scene, 0x15c), 8);
      if (!update((u8 *)scene + 0x15c))
        break;
    }
    if (scene != 0) {
      SceneFn destroy = F(SceneFn, F(void *, scene, 0), 4);
      destroy(scene);
    }
    return 1;
  }

  RuntimePresentationManager_UpdatePresentations((u8 *)runtime + 0x2f7c, 1);
  if (F(void *, scene, 0x128) != 0) {
    SplineMover_Evaluate2D(point, (u8 *)scene + 0x8c);
    func_ov033_021fd324(F(void *, scene, 0x128), point);
    VecFx32Object_Destroy(point);
    func_ov025_021fd2e8(F(void *, scene, 0x128));
  }
  GamePhaseCurrencyHud_Update(gGamePhaseCurrencyHud);
  return 0;
}

/* Runs a scene transition branch that updates actors, UI resources, and display state; hands the newly allocated resume scene to the scene manager. */
void func_ov074_022105b4(void *scene, s32 direction, void *source_spline,
                         void *unused_spline) {
  typedef void (*SceneFn)(void *);
  s32 point[4];
  s32 spline[15];
  void *resume;
  void *current;
  (void)unused_spline;
  Scene_ClearFlags03(scene);
  GamePhaseRuntime_RunFrameMaintenance(gGamePhaseRuntime);
  GamePhaseRuntime_ChangeToNeighborArea(gGamePhaseRuntime, direction);
  SplineMover_Evaluate2D(point, source_spline);
  GamePhaseState_ApplyPlacementState((u8 *)gGamePhaseRuntime + 0x24, point);
  VecFx32Object_Destroy(point);
  GamePhaseState_SetEnabled((u8 *)gGamePhaseRuntime + 0x24, 1);
  DualLayerTileRenderer_SetEmbeddedAnimationPaused(
      F(void *, gGamePhaseRuntime, 0x2ed4), 1);
  GamePhaseRuntime_SynchronizeActorPlacement(gGamePhaseRuntime, 1);
  GamePhaseRuntime_FinalizeActorCollections(gGamePhaseRuntime, F(s32, scene, 4), 2);
  func_ov074_02210878(spline, scene, F(s32, scene, 0x24));
  SplineMover_Assign((u8 *)scene + 0xc8, spline);
  SplineMover_Destroy(spline);
  if (F(s32, scene, 0x124) == 0)
    GamePhaseAreaScene_SetEnabled(F(void *, gGamePhaseRuntime, 0x2fb8), 1);
  else
    ActorCollection_SetEnabled(
        GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 2), 0);
  DualLayerTileRenderer_SetEmbeddedAnimationPaused(
      F(void *, gGamePhaseRuntime, 0x2ed4), 0);
  resume = Heap_Alloc(0x28, data_ov074_02211db8, -4, gHeapContext);
  if (resume != 0)
    GamePhaseResumeScene_Init((GamePhaseResumeScene *)resume, 1);
  current = SceneManager_GetCurrent(gSceneManager);
  F(SceneFn, F(void *, current, 0), 8)(current);
}

/* Runs the paired transition/cleanup branch, updating actors and graphics resources from the supplied spline. */
void func_ov074_02210730(void *scene, void *spline) {
  s32 point[4];
  void *actor;
  SplineMover_Evaluate2D(point, spline);
  GamePhaseState_ApplyPlacementState((u8 *)gGamePhaseRuntime + 0x24, point);
  ActorCollection_DispatchEventToActors(
      GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1), point);
  actor = ActorDerivedType1_GetSingletonObject();
  if (actor != 0 && F(s16, actor, 0x230) == 1)
    func_ov088_0221aaac(actor);
  if (F(s32, scene, 0x124) != 0 &&
      SplineMover_Update((u8 *)scene + 0xc8))
    func_ov074_022107f8(scene, (u8 *)scene + 0xc8, 0, 0);
  GamePhaseAreaScene_SetEnabled(F(void *, gGamePhaseRuntime, 0x2fb8), 1);
  VecFx32Object_Destroy(point);
}

/* Disables the active area object, evaluates the supplied spline twice, and applies its placement to the area scene and actor collection. */
void func_ov074_022107f8(void *unused, void *spline, void *unused2,
                          void *unused3) {
  typedef void (*DisableFn)(void *, s32);
  s32 point[4];
  void *phase = F(void *, gGamePhaseRuntime, 0x2fb8);
  void *area = F(void *, phase, 0x2ebc);
  DisableFn disable = F(DisableFn, F(void *, area, 0), 0x54);
  (void)unused;
  (void)unused2;
  (void)unused3;
  disable(area, 0);
  SplineMover_Evaluate2D(point, spline);
  GamePhaseAreaScene_ApplyPlacementState(phase, point);
  VecFx32Object_Destroy(point);
  SplineMover_Evaluate2D(point, spline);
  ActorCollection_DispatchEventToActors((u8 *)phase + 8, point);
  VecFx32Object_Destroy(point);
}

/* Constructs a four-entry presentation/effect collection and its transform resources; returns the initialized owner. */
void func_ov074_02210878(void *spline, void *unused, s32 direction) {
  s32 base[4];
  s32 target[4];
  s32 offset[4];
  s32 adjusted[4];
  s32 x = 0;
  s32 y = 0;
  (void)unused;
  VecFx32Object_Init(target);
  GamePhaseRuntime_BuildSecondaryTransform(base, gGamePhaseRuntime);
  if (direction == 0)
    x = 0x80000;
  else if (direction == 1)
    x = -0x80000;
  else if (direction == 2)
    y = 0x60000;
  else if (direction == 3)
    y = -0x60000;
  if ((u32)direction <= 3) {
    VecFx32Object_InitComponents(offset, x, y, 0);
    func_ov074_02210a04(adjusted, base, offset);
    VecFx32Object_Assign(target, adjusted);
    VecFx32Object_Destroy(adjusted);
    VecFx32Object_Destroy(offset);
  }
  SplineMover_InitTransition(spline, base, target, base, 0x20);
  VecFx32Object_Destroy(base);
  VecFx32Object_Destroy(target);
}

/* Initializes a transform helper and copies optional source payloads through the shared transform service; returns its result. */
void func_ov074_02210a04(void *out, void *left, void *right) {
  VecFx32Object_Init(out);
  func_020adff0(left != 0 ? (u8 *)left + 4 : 0,
                right != 0 ? (u8 *)right + 4 : 0, (u8 *)out + 4);
}

/* Advances the scene's render-side controller selected by its state and always services the presentation manager; returns zero while active. */
s32 func_ov074_02210a3c(void *scene) {
  void *area;
  switch (F(s32, scene, 8)) {
  case 0:
    GamePhaseVisualEffect_Update((u8 *)gGamePhaseRuntime + 0x2ed8);
    break;
  case 1:
    GamePhaseVisualEffect_Update((u8 *)gGamePhaseRuntime + 0x2ed8);
    func_ov074_02211a0c((u8 *)scene + 0x38);
    break;
  case 2:
    area = F(void *, gGamePhaseRuntime, 0x2fb8);
    if (area != 0)
      GamePhaseAreaScene_Update(area);
    break;
  case 3:
  case 4:
    GamePhaseState_UpdateRenderHelpers((u8 *)gGamePhaseRuntime + 0x24);
    area = F(void *, gGamePhaseRuntime, 0x2fb8);
    if (area != 0)
      GamePhaseAreaScene_Update(area);
    break;
  case 5:
    if ((F(u32, scene, 0x140) & 1) != 0) {
      F(u32, scene, 0x140) = (F(u32, scene, 0x140) & ~1U) | 2U;
      GX_DisableBankForLCDC();
      GX_SetGraphicsMode(1, 0, 1);
    }
    area = F(void *, gGamePhaseRuntime, 0x2fb8);
    if (area != 0)
      GamePhaseAreaScene_Update(area);
    break;
  case 6:
    GamePhaseState_UpdateRenderHelpers((u8 *)gGamePhaseRuntime + 0x24);
    area = F(void *, gGamePhaseRuntime, 0x2fb8);
    if (area != 0)
      GamePhaseAreaScene_Update(area);
    break;
  }
  RuntimePresentationManager_DispatchVBlankCallbacks((u8 *)gGamePhaseRuntime + 0x2f7c);
  return 0;
}

/* Builds one of the four directional spline triplets used while crossing an area boundary. */
static void func_ov074_build_boundary_splines(void *scene, s32 direction,
                                               s32 width, s32 height,
                                               const s32 *current) {
  s32 start[4], target[4], curve[4];
  s32 first_control[4], zero[4], last_control[4];
  s32 secondary_target[4], offset[4], secondary_start[4];
  s32 spline[15];
  s32 x0 = 0, x1 = 0, y0 = current[2], y1 = current[2];
  s32 offset_x = 0, offset_y = 0;

  if (direction == 0) {
    F(s32, scene, 0x2c) += ((width - 0x20) << 12) - 0x20000;
    x0 = (width - 0x100) << 12;
    x1 = (width - 0x40) << 12;
    offset_x = -0x80000;
  } else if (direction == 1) {
    F(s32, scene, 0x2c) -= ((width - 0x20) << 12) - 0x20000;
    x0 = 0;
    x1 = -0xc0000;
    offset_x = 0x80000;
  } else if (direction == 2) {
    F(s32, scene, 0x30) += ((height - 0x20) << 12) - 0x20000;
    x0 = current[1];
    x1 = current[1];
    y0 = (height - 0xc0) << 12;
    y1 = (height - 0x40) << 12;
    offset_y = -0x60000;
  } else {
    F(s32, scene, 0x30) -= ((height - 0x20) << 12) - 0x20000;
    x0 = current[1];
    x1 = current[1];
    y0 = 0;
    y1 = -0x80000;
    offset_y = 0x60000;
  }

  VecFx32Object_InitComponents(target, x1, y1, 0);
  VecFx32Object_InitComponents(start, x0, y0, 0);
  VecFx32Object_Init(curve);
  VecFx32Object_Assign(curve, start);
  SplineMover_InitTransition(spline, start, target, curve, 0x20);
  SplineMover_Assign((u8 *)scene + 0x8c, spline);
  SplineMover_Destroy(spline);

  func_ov074_02211644(first_control, start, target);
  VecFx32Object_InitComponents(zero, 0, 0, 0);
  func_ov074_02211644(last_control, start, target);
  SplineMover_InitTransition(spline, first_control, zero, last_control, 0x20);
  SplineMover_Assign((u8 *)scene + 0x50, spline);
  SplineMover_Destroy(spline);
  VecFx32Object_Destroy(last_control);
  VecFx32Object_Destroy(zero);
  VecFx32Object_Destroy(first_control);

  GamePhaseRuntime_BuildSecondaryTransform(secondary_target, gGamePhaseRuntime);
  VecFx32Object_InitComponents(offset, offset_x, offset_y, 0);
  func_ov074_02210a04(secondary_start, secondary_target, offset);
  SplineMover_InitTransition(spline, secondary_start, secondary_target,
                             secondary_start, 0x20);
  SplineMover_Assign((u8 *)scene + 0xc8, spline);
  SplineMover_Destroy(spline);
  VecFx32Object_Destroy(secondary_start);
  VecFx32Object_Destroy(offset);
  VecFx32Object_Destroy(secondary_target);
  VecFx32Object_Destroy(curve);
  VecFx32Object_Destroy(start);
  VecFx32Object_Destroy(target);
}

/* Builds the overlay's directional motion splines, transfers positions to the affected actors, and applies the first evaluated frame. */
void func_ov074_02210b90(void *scene) {
  s32 current[4];
  s32 zero[4];
  s32 point[4];
  void *follower = (u8 *)gGamePhaseRuntime + 0x2fbc;
  void *actor;
  void *actor_a;
  void *actor_b;
  void *collection;
  u32 dimensions;
  s32 width;
  s32 height;

  VecFx32Object_InitCopy(current, ActorMotionAreaFollower_GetPosition(follower));
  actor = ActorMotion_GetActor(follower);
  VecFx32Object_Assign((u8 *)scene + 0x28, (u8 *)actor + 0x18);
  dimensions = F(u32, F(void *, gGamePhaseRuntime, 0x2ed4), 0x20);
  width = (s32)(dimensions << 16) >> 12;
  height = (s32)(dimensions >> 16) << 4;
  func_ov074_build_boundary_splines(scene, F(s32, scene, 0x24), width,
                                     height, current);

  collection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
  actor_a = F(void *, collection, 0x2e7c);
  collection = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
  actor_b = F(void *, collection, 0x2e7c);
  VecFx32Object_Assign((u8 *)actor_a + 0x28, (u8 *)scene + 0x28);
  VecFx32Object_Assign((u8 *)actor_b + 0x18, (u8 *)actor_a + 0x28);
  VecFx32Object_InitComponents(zero, 0, 0, 0);
  VecFx32Object_Assign((u8 *)actor_b + 0x38, zero);
  VecFx32Object_Destroy(zero);

  actor = ActorDerivedType1_GetSingletonObject();
  if (actor != 0 && F(s16, actor, 0x230) == 1) {
    VecFx32Object_Assign((u8 *)actor + 0x28, (u8 *)scene + 0x28);
    VecFx32Object_Assign((u8 *)actor + 0x18, (u8 *)actor + 0x28);
  }
  actor = F(void *, gGamePhaseRuntime, 0x2ea8);
  if (actor != 0)
    Type7Actor_ProcessBoundaryTransition(actor, (u8 *)scene + 0x28,
                                         F(s32, scene, 0x24));

  SplineMover_Evaluate2D(point, (u8 *)scene + 0x8c);
  ActorMotion_SetPosition(follower, point);
  VecFx32Object_Destroy(point);
  SplineMover_Evaluate2D(point, (u8 *)scene + 0xc8);
  ActorMotion_SetPosition((u8 *)gGamePhaseRuntime + 0x3044, point);
  VecFx32Object_Destroy(point);
  VecFx32Object_Destroy(current);
}

/* Initializes a transform helper and copies optional payloads through the shared transform service; returns its result. */
void func_ov074_02211644(void *out, void *left, void *right) {
  VecFx32Object_Init(out);
  func_020adfbc(left != 0 ? (u8 *)left + 4 : 0,
                right != 0 ? (u8 *)right + 4 : 0, (u8 *)out + 4);
}

/* Constructs a compact graphics resource pair in the supplied record; returns the initialized record. */
void *func_ov074_0221167c(void *record) {
  F(u16, record, 0) = 0;
  F(u16, record, 2) = 0;
  VecFx32Object_Init((u8 *)record + 8);
  SplineMover_Init((u8 *)record + 0x18);
  return record;
}

/* Queries and updates an actor-related offset record through shared gameplay services; returns the resulting status. */
void func_ov074_022116a8(void *unused) {
  volatile u16 *display_control = (volatile u16 *)0x04000008;
  volatile u16 *capture_control = (volatile u16 *)0x04000060;
  (void)unused;
  *display_control &= (u16)~3;
  G3X_InitMtxStack();
  GX_SetGraphicsMode(1, 0, 1);
  func_020aef3c(2);
  *capture_control &= 0xcffd;
  *capture_control &= 0xcffb;
  *capture_control = (*capture_control & 0xcfff) | 8;
  *capture_control = (*capture_control & 0xcfff) | 0x10;
  *capture_control &= 0xcfdf;
  func_020b0374(0, 0, 0, 0);
  func_020b0300(0, 0, 0x7fff, 0x3f, 0);
  *(volatile u32 *)0x04000580 = 0xbfff0000;
  func_020a7b90();
}

/* Releases a gameplay/UI transition resource and its local state; returns no meaningful value. */
void func_ov074_02211790(void *record) {
  s32 point[4];
  SplineMover_Evaluate2D(point, (u8 *)record + 0x18);
  func_ov074_022117d0(record, point[1] >> 12, point[2] >> 12);
  VecFx32Object_Destroy(point);
}

/* Initializes a four-entry UI/presentation descriptor collection and shared resources; returns setup status. */
void func_ov074_022117d0(void *record, s32 x, s32 y) {
  volatile u32 *matrix = (volatile u32 *)0x04000444;
  volatile u32 *scale = (volatile u32 *)0x0400046c;
  volatile u32 *vertex = (volatile u32 *)0x0400048c;
  s32 angle = F(u16, record, 2) >> 4;
  s32 sine = gFx32CosSinTable[angle * 2];
  s32 cosine = gFx32CosSinTable[angle * 2 + 1];
  s16 color;
  *matrix = 0;
  matrix[11] = (0x80 - x) << 12;
  matrix[11] = (0x60 - y) << 12;
  matrix[11] = 0;
  func_020b0880(sine, cosine);
  func_020b0844(sine, cosine);
  func_020b0808(sine, cosine);
  *scale = 0x100000;
  *scale = 0xc0000;
  *scale = 0x1000;
  scale[15] = 0x5ed00000;
  scale[14] = 0x001f00c0;
  color = F(s16, GamePhaseState_GetConfiguration((u8 *)gGamePhaseRuntime + 0x24),
            0x56);
  *(volatile u32 *)0x04000480 =
      ((u32)(color | color << 5 | color << 10) & 0xffff) | 0;
  *(volatile u32 *)0x04000500 = 1;
  func_ov074_02211960(0, 0);
  *vertex = 0xf800f800;
  *vertex = 0;
  func_ov074_02211960(0x100000, 0);
  *vertex = 0xf8000800;
  *vertex = 0;
  func_ov074_02211960(0x100000, 0xc0000);
  *vertex = 0x08000800;
  *vertex = 0;
  func_ov074_02211960(0, 0xc0000);
  *vertex = 0x0800f800;
  *vertex = 0;
  *(volatile u32 *)0x04000504 = 0;
  *(volatile u32 *)0x04000448 = 1;
  *(volatile u32 *)0x04000540 = 0;
}

/* Stores supplied values into an offset-based descriptor record without direct SDK or hardware effects. */
void func_ov074_02211960(s32 first, s32 second) {
  *(volatile u32 *)0x04000488 =
      (u32)(((second << 8) >> 16) << 16) | ((first << 8) >> 16) & 0xffff;
}

/* Returns or copies an offset-based descriptor value without mutating shared state or invoking SDK services. */
void func_ov074_02211994(void) {
  GX_SetBankForLCDC(2);
  *(volatile u32 *)0x04000064 = 0x80310000;
}

/* Copies or updates a compact descriptor from supplied arguments; mutates destination state and returns its result. */
void func_ov074_022119b8(void *unused, s32 enabled) {
  volatile u32 *display_control = (volatile u32 *)0x04000000;
  u32 value;
  (void)unused;
  value = *display_control;
  value = (value & ~0x1f00U) |
          ((((value & 0x1f00U) >> 8) & ~1U) | (enabled != 0)) << 8;
  *display_control = value;
}

/* Dispatches actor/resource work based on the compact descriptor and local helper state; returns operation status. */
void func_ov074_02211a0c(void *record) {
  if (F(u16, record, 0) == 0) {
    func_ov074_02211994();
    ++F(u16, record, 0);
  } else if (F(u16, record, 0) == 1) {
    GX_SetGraphicsMode(6, 0, 0);
    func_ov074_022116a8(record);
    ++F(u16, record, 0);
  }
}

/* Initializes a two-word compact runtime record from supplied arguments; changes only that record. */
void func_ov074_02211a68(void *record) {
  F(void *, record, 0) = data_ov074_02211d48;
  F(s32, record, 4) = 0;
  F(s32, record, 8) = 0;
  F(s32, record, 0xc) = 0;
  F(s32, record, 0x10) = 0;
}

/* Updates paired effect/controller records through shared services and local completion helpers; returns current status. */
void *func_ov074_02211a8c(void *record, s32 first_start,
                           s32 first_end, s32 second_start,
                           s32 second_end, s32 duration) {
  s32 first[2];
  s32 second[2];
  F(void *, record, 0) = data_ov074_02211d48;
  F(s32, record, 4) = 0;
  F(s32, record, 8) = 0;
  F(s32, record, 0xc) = 0;
  F(s32, record, 0x10) = 0;
  first[0] = first_start << 12;
  first[1] = func_020befec((first_end - first_start) * 0x1000, duration);
  func_ov074_02211b28((u8 *)record + 4, first);
  second[0] = second_start << 12;
  second[1] = func_020befec((second_end - second_start) * 0x1000, duration);
  func_ov074_02211b28((u8 *)record + 0xc, second);
  F(s32, record, 0x14) = 0;
  return record;
}

/* Stores a value in an offset-based record and returns no meaningful value without SDK interaction. */
void func_ov074_02211b28(void *destination, const void *source) {
  if (destination != source) {
    F(s32, destination, 0) = F(const s32, source, 0);
    F(s32, destination, 4) = F(const s32, source, 4);
  }
}

/* Returns a constant or offset-based status value without changing state or invoking SDK services. */
void func_ov074_02211b40(void) {}

/* Empty callback that changes no state and returns no meaningful value without SDK interaction. */
void *func_ov074_02211b44(void *allocation) {
  Heap_Free(allocation);
  return allocation;
}

/* Applies the local record update to both paired entries; mutates them and returns no meaningful value. */
void func_ov074_02211b58(void *destination, const void *source) {
  func_ov074_02211b28((u8 *)destination + 4, (const u8 *)source + 4);
  func_ov074_02211b28((u8 *)destination + 0xc, (const u8 *)source + 0xc);
  F(s32, destination, 0x14) = F(const s32, source, 0x14);
}

/* Updates one branch of a small state dispatcher and invokes shared system callbacks; returns dispatch status. */
s32 func_ov074_02211b88(void *record) {
  s32 frame = ++F(s32, record, 0x14);
  void *effect = (u8 *)gGamePhaseRuntime + 0x2ed8;
  if (frame > 7) {
    GamePhaseVisualEffect_SetBlendCoefficients(effect, 0, 0x10);
    return 1;
  }
  GamePhaseVisualEffect_SetBlendCoefficients(
      effect,
      (F(s32, record, 4) + F(s32, record, 8) * frame) >> 12,
      (F(s32, record, 0xc) + F(s32, record, 0x10) * frame) >> 12);
  return 0;
}

/* Updates the paired branch of the small state dispatcher and invokes shared system callbacks; returns dispatch status. */
s32 func_ov074_02211c08(void *record) {
  s32 frame = ++F(s32, record, 0x14);
  s32 complete = frame > 7;
  if (complete)
    frame = F(s32, record, 0x14) = 7;
  GamePhaseVisualEffect_SetBlendCoefficients(
      (u8 *)gGamePhaseRuntime + 0x2ed8,
      (F(s32, record, 4) + F(s32, record, 8) * frame) >> 12,
      (F(s32, record, 0xc) + F(s32, record, 0x10) * frame) >> 12);
  return complete;
}

/* Returns an offset-based status field from the supplied record without observable side effects. */
void *func_ov074_02211c70(void *allocation) {
  Heap_Free(allocation);
  return allocation;
}

/* Returns a second offset-based status field from the supplied record without observable side effects. */
void *func_ov074_02211c84(void *allocation) {
  Heap_Free(allocation);
  return allocation;
}
