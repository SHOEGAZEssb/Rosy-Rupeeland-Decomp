#include "tingle/display_controller.h"
#include "tingle/game_phase_area_scene.h"
#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_phase_load_scene.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"
#include "tingle/graphics_sprite_renderer.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/types.h"

/*
 * Portable, address-faithful reconstruction of the six-state game-phase load
 * pipeline. It waits for fades, tears down the active phase, selects and
 * allocates the requested overlay scene, restores display/runtime resources,
 * and dispatches follow-up title/death-demo scenes. Kind 16 is the retail
 * title branch: it loads overlays 94 and 25, constructs the 0x63C-byte scene
 * with func_ov025_021FF27C, waits for the scene callback to complete, fades
 * both engines to black, destroys the scene, and unloads the overlays.
 * Address-derived constants and names remain intact where their semantic roles
 * are not yet confirmed. The retail compiler form is retained separately for
 * exact ROM matching.
 */

typedef struct OwnedSceneObjectVTable {
    void *method00;
    void *method04;
    void (*release)(void *self);
} OwnedSceneObjectVTable;

typedef struct OwnedSceneObject {
    OwnedSceneObjectVTable *vtable;
} OwnedSceneObject;

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseRuntime *gGamePhaseRuntime;
extern void *gSoundContext;
extern GraphicsSpriteRenderer *data_020f4e14;
extern GraphicsSpriteRenderer *gDebugFont;
extern GamePhaseCurrencyHud *gGamePhaseCurrencyHud;
extern u8 gOverlay059FollowupSceneAllocationTag[];
extern u8 gOverlay059PhaseObjectSceneAllocationTag[];
extern u8 gOverlay013DefaultSceneAllocationTag[];
extern u8 gInventorySceneAllocationTag[];
extern u8 gOverlay044SceneAllocationTag[];
extern u8 gOverlay043SceneAllocationTag[];
extern u8 gOverlay018Kind8SceneAllocationTag[];
extern u8 gOverlay022SceneAllocationTag[];
extern u8 gOverlay021SceneAllocationTag[];
extern u8 gOverlay020SceneAllocationTag[];
extern u8 gOverlay013Kind13SceneAllocationTag[];
extern u8 gOverlay016SceneAllocationTag[];
extern u8 gOverlay018Kind15SceneAllocationTag[];
extern u8 gOverlay025TitleSceneAllocationTag[];
extern u8 gOverlay004SceneAllocationTag[];
extern u8 gOverlay028SceneAllocationTag[];
extern u8 gOverlay009SceneAllocationTag[];
extern u8 gOverlay027SceneAllocationTag[];
extern u8 gOverlay017SceneAllocationTag[];
extern u8 gOverlay035Or036SceneAllocationTag[];
extern u8 gOverlay019SceneAllocationTag[];
extern u8 gOverlay037SceneAllocationTag[];
extern u8 gOverlay013Kind25SceneAllocationTag[];
extern void DisplayBrightness_StartMaskedTransitions(s32 screens, s32 brightness);
extern GraphicsSpriteGroup *ActorCollection_GetSpriteGroup(void *collection);
extern s32 SceneInputBase_Update(void *object, s32 mode);
extern void Sound_SetModalEnvelopeEnabled(void *sound, s32 a, s32 b, s32 c, s32 d);
extern void GraphicsBankStateSnapshot_Restore(void *object);
extern void *func_ov059_0220fd20(void *object, s32 mode);
extern void *func_ov059_02210fec(void *object, void *phaseState);
extern u32 GX_VBlankIntr(u32 callback);
extern void GridEffectActorRegistry_FinalizeDepartingActors(void);
extern void GraphicsBankStateSnapshot_Capture(void *object);
extern void RuntimePresentationManager_DisableGraphics3dForActivePhase(
    void *manager);
extern void GraphicsSpriteRenderer_BuildFrame(GraphicsSpriteRenderer *renderer, s32 mode);
extern void *Overlay013_Scene_Init(void *object);
extern void *InventoryScene_Init(void *object);
extern void *func_ov044_0220be60(void *object);
extern void *func_ov043_0220b76c(void *object);
extern void *Overlay018_Scene_Init(void *object, s32 argument);
extern void *func_ov022_021fdd44(void *object);
extern void *func_ov021_021fd7e8(void *object, s32 argument);
extern void *func_ov020_021fd844(void *object);
extern void *Overlay016_Scene_Init(void *object, s32 mode, s32 argument);
extern void *Overlay018_SetDialogLayout(void *object);
extern void *func_ov025_021ff27c(void *scene);
extern void *Overlay004_VariantController_Init(void *object, s32 argument);
extern void *func_ov028_021fdb00(void *object);
extern void *Overlay009_InitSceneFields(void *object, s32 argument);
extern void *Overlay027Scene_Init(void *object);
extern void *Overlay017_Effect_Delete(void *object);
extern void *func_ov036_022045d4(void *object, s32 argument);
extern void *func_ov035_02202378(void *object, s32 argument);
extern void *func_ov019_021fce28(void *object, s32 argument, void *mode);
extern void *func_ov037_021fe4fc(void *object, s32 argument);
#ifdef __cplusplus
}
#endif

#define UNK_0200e11c ((int **)&gGameWork)
#define UNK_0200e204 (0x389)
#define UNK_0200e208 (0x3b2)
#define UNK_0200e0e8 ((int **)&gSoundContext)
#define UNK_0200e20c ((volatile u16 *)0x04000304)
#define UNK_0200e0f0 (&data_020f4e14)
#define UNK_0200e0fc (&gDebugFont)
#define UNK_0200e3c4 (0x3ba)
#define UNK_0200e0f4 (&gGamePhaseCurrencyHud)
#define UNK_0200e3d0 (0x3cd)
#define UNK_0200e3c8 (0x48)
#define OVERLAY059_FOLLOWUP_SCENE_ALLOCATION_TAG ((const char *)gOverlay059FollowupSceneAllocationTag)
#define UNK_0200e114 (&gHeapContext)
#define UNK_0200e214 (0x3b)
#define OVERLAY059_PHASE_OBJECT_SCENE_ALLOCATION_TAG ((const char *)gOverlay059PhaseObjectSceneAllocationTag)
#define UNK_0200e210 (0x3bd)
#define UNK_0200e0ec ((volatile u16 *)0x04000050)
#define UNK_0200e0f8 ((volatile u16 *)0x04001050)
#define UNK_0200e100 (0x2e)
#define UNK_0200e104 (0x6)
#define UNK_0200e108 (0xd)
#define UNK_0200e10c (0x9ac)
#define OVERLAY013_DEFAULT_SCENE_ALLOCATION_TAG ((const char *)gOverlay013DefaultSceneAllocationTag)
#define INVENTORY_SCENE_ALLOCATION_TAG ((const char *)gInventorySceneAllocationTag)
#define UNK_0200e120 (0x387)
#define UNK_0200e124 (0x1)
#define UNK_0200e128 (0xf)
#define UNK_0200e12c (0x2c)
#define OVERLAY044_SCENE_ALLOCATION_TAG ((const char *)gOverlay044SceneAllocationTag)
#define UNK_0200e134 (0x2b)
#define OVERLAY043_SCENE_ALLOCATION_TAG ((const char *)gOverlay043SceneAllocationTag)
#define UNK_0200e13c (0x3)
#define UNK_0200e140 (0x12)
#define UNK_0200e144 (0x424)
#define OVERLAY018_KIND8_SCENE_ALLOCATION_TAG ((const char *)gOverlay018Kind8SceneAllocationTag)
#define UNK_0200e168 (0x16)
#define OVERLAY022_SCENE_ALLOCATION_TAG ((const char *)gOverlay022SceneAllocationTag)
#define UNK_0200e158 (0x2d)
#define UNK_0200e15c (0x15)
#define UNK_0200e160 (0x428)
#define OVERLAY021_SCENE_ALLOCATION_TAG ((const char *)gOverlay021SceneAllocationTag)
#define UNK_0200e170 (0x14)
#define OVERLAY020_SCENE_ALLOCATION_TAG ((const char *)gOverlay020SceneAllocationTag)
#define UNK_0200e180 (0x5)
#define UNK_0200e184 (0x18)
#define OVERLAY013_KIND13_SCENE_ALLOCATION_TAG ((const char *)gOverlay013Kind13SceneAllocationTag)
#define UNK_0200e18c (0x10)
#define UNK_0200e190 (0x488)
#define OVERLAY016_SCENE_ALLOCATION_TAG ((const char *)gOverlay016SceneAllocationTag)
#define UNK_0200e198 (0x17)
#define UNK_0200e19c (0x4f8)
#define OVERLAY018_KIND15_SCENE_ALLOCATION_TAG ((const char *)gOverlay018Kind15SceneAllocationTag)
#define UNK_0200e1a4 (0x5e)
#define UNK_0200e1a8 (0x19)
#define UNK_0200e1ac (0x63c)
#define OVERLAY025_TITLE_SCENE_ALLOCATION_TAG ((const char *)gOverlay025TitleSceneAllocationTag)
#define UNK_0200e1b4 (0x30)
#define UNK_0200e1b8 (0x4)
#define UNK_0200e1bc (0x1a)
#define OVERLAY004_SCENE_ALLOCATION_TAG ((const char *)gOverlay004SceneAllocationTag)
#define UNK_0200e1c4 (0x1c)
#define OVERLAY028_SCENE_ALLOCATION_TAG ((const char *)gOverlay028SceneAllocationTag)
#define UNK_0200e14c (0x2)
#define UNK_0200e1cc (0x1d)
#define OVERLAY009_SCENE_ALLOCATION_TAG ((const char *)gOverlay009SceneAllocationTag)
#define UNK_0200e1d4 (0x1b)
#define OVERLAY027_SCENE_ALLOCATION_TAG ((const char *)gOverlay027SceneAllocationTag)
#define UNK_0200e1dc (0x1e)
#define OVERLAY017_SCENE_ALLOCATION_TAG ((const char *)gOverlay017SceneAllocationTag)
#define UNK_0200e1ec (0x24)
#define OVERLAY035_OR_036_SCENE_ALLOCATION_TAG ((const char *)gOverlay035Or036SceneAllocationTag)
#define UNK_0200e1e4 (0x132)
#define UNK_0200e1f4 (0x23)
#define UNK_0200e150 (0x13)
#define OVERLAY019_SCENE_ALLOCATION_TAG ((const char *)gOverlay019SceneAllocationTag)
#define UNK_0200e1f8 (0x25)
#define UNK_0200e1fc (0x4bc)
#define OVERLAY037_SCENE_ALLOCATION_TAG ((const char *)gOverlay037SceneAllocationTag)
#define UNK_0200e178 (0x26)
#define OVERLAY013_KIND25_SCENE_ALLOCATION_TAG ((const char *)gOverlay013Kind25SceneAllocationTag)

/* The enclosing runtime type is not fully recovered yet. These accessors keep
 * the confirmed embedded-object boundaries explicit without assigning names
 * to unrelated fields. */
static GamePhaseState *GamePhaseRuntime_GetEmbeddedState(GamePhaseRuntime *runtime)
{
    return (GamePhaseState *)((u8 *)runtime + 0x24);
}

static GamePhaseAreaScene *GamePhaseRuntime_GetAreaScene(GamePhaseRuntime *runtime)
{
    return *(GamePhaseAreaScene **)((u8 *)runtime + 0x2fb8);
}

static void *GamePhaseRuntime_GetPhaseObject(GamePhaseRuntime *runtime)
{
    return *(void **)((u8 *)runtime + 0x30bc);
}

/* Bits 18-19 of the phase object's confirmed word at offset 0x40 select the
 * active display/placement variant used by several load transitions. */
static u32 GamePhaseRuntime_GetPhaseObjectMode(GamePhaseRuntime *runtime)
{
    return (*(u32 *)((u8 *)GamePhaseRuntime_GetPhaseObject(runtime) + 0x40) >> 18) & 3;
}

/*
 * Execute one load-pipeline frame. self is the scene being advanced. Returns
 * one after final teardown/dispatch, otherwise zero. Calls that previously
 * appeared to consume live ARM scratch registers now have explicit arguments.
 */
s32 GamePhaseLoadScene_Update(GamePhaseLoadScene *self)

{
  u32 savedVBlankState;
  u32 phaseObjectModeOrFlag;
  int value;
  int comparisonValue;
  s32 usesAlternateScreenMode;
  void *object;
  OverlayManager *overlayManager;
  
  switch(self->state) {
  case 0:
    self->state++;
    value = self->sceneKind;
    if (value < 2) {
      if (value != 1) goto code_r0x0200d170;
      DisplayBrightness_StartMaskedTransitions(1,0xfffffff0);
      if (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) != 2) {
        DisplayBrightness_StartMaskedTransitions(2,0xfffffff0);
      }
      goto code_r0x0200d17c;
    }
    switch(value) {
    case 0x11:
      goto code_r0x0200d150;
    case 0x12:
      goto code_r0x0200d160;
    case 0x13:
      break;
    case 0x14:
      break;
    case 0x15:
      break;
    case 0x16:
      goto code_r0x0200d150;
    case 0x17:
code_r0x0200d160:
      DisplayBrightness_StartMaskedTransitions(1,0xfffffff0);
      goto code_r0x0200d17c;
    case 0x18:
code_r0x0200d150:
      DisplayBrightness_StartMaskedTransitions(3,0x10);
      goto code_r0x0200d17c;
    }
code_r0x0200d170:
    DisplayBrightness_StartMaskedTransitions(3,0xfffffff0);
code_r0x0200d17c:
    value = DisplayBrightness_IsMainTransitionComplete();
    if ((value == 0) || (value = DisplayBrightness_IsSubTransitionComplete(), value == 0)) {
      GraphicsSpriteGroup_AdvanceAnimations(ActorCollection_GetSpriteGroup(
          GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1)));
      return 0;
    }
    break;
  case 1:
    goto code_r0x0200d17c;
  case 2:
    SceneInputBase_Update(self->loadedScene, 0);
    if (-1 < *(int *)((u8 *)self->loadedScene + 0x20) << 0x1f) {
      return 0;
    }
    DisplayBrightness_StartMaskedTransitions(3,0);
    self->state++;
    return 0;
  case 3:
    SceneInputBase_Update(self->loadedScene, 0);
    value = DisplayBrightness_IsMainTransitionComplete();
    if (value == 0) {
      return 0;
    }
    value = DisplayBrightness_IsSubTransitionComplete();
    if (value == 0) {
      return 0;
    }
    self->state++;
    return 0;
  case 4:
    value = SceneInputBase_Update(self->loadedScene, 1);
    if (value == 0) {
      return 0;
    }
    value = self->sceneKind;
    if (value < 2) {
      if (value == 1) {
        phaseObjectModeOrFlag = GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime);
        usesAlternateScreenMode = phaseObjectModeOrFlag == 2;
        if (usesAlternateScreenMode) {
          phaseObjectModeOrFlag = *(u32 *)((u8 *)self->loadedScene + 0x980);
        }
        if (usesAlternateScreenMode && phaseObjectModeOrFlag == 0) {
          DisplayBrightness_StartMaskedTransitions(1,0xfffffff0);
          goto code_r0x0200dd3c;
        }
      }
      goto code_r0x0200dd30;
    }
    switch(value) {
    case 0x12:
      goto code_r0x0200dcd0;
    case 0x13:
      break;
    case 0x14:
      break;
    case 0x15:
      break;
    case 0x16:
      goto code_r0x0200dce0;
    case 0x17:
code_r0x0200dcd0:
      DisplayBrightness_StartMaskedTransitions(1,0xfffffff0);
      goto code_r0x0200dd3c;
    case 0x18:
code_r0x0200dce0:
      DisplayBrightness_StartMaskedTransitions(3,0x10);
      goto code_r0x0200dd3c;
    }
code_r0x0200dd30:
    DisplayBrightness_StartMaskedTransitions(3,0xfffffff0);
code_r0x0200dd3c:
    self->state++;
    return 0;
  case 5:
    SceneInputBase_Update(self->loadedScene, 0);
    value = DisplayBrightness_IsMainTransitionComplete();
    if (value == 0) {
      return 0;
    }
    value = DisplayBrightness_IsSubTransitionComplete();
    if (value == 0) {
      return 0;
    }
    value = 0;
    self->runtimeCallbacksEnabled = 0;
    if (self->sceneKind == 1) {
      value = *(int *)((u8 *)self->loadedScene + 0x980);
    }
    comparisonValue = GameWork_TestFlag(gGameWork,UNK_0200e204);
    if (comparisonValue == 0) {
      comparisonValue = GameWork_TestFlag(gGameWork,UNK_0200e208);
      if (comparisonValue != 0) {
        value = 0xb;
      }
    }
    else {
      GameWork_ClearFlag(gGameWork,UNK_0200e204);
      value = 1;
    }
    if (self->loadedScene != 0) {
      ((OwnedSceneObject *)self->loadedScene)->vtable->release(
          self->loadedScene);
    }
    self->loadedScene = 0;
    OverlaySlot_UnloadOverlay(&self->overlaySlot0);
    OverlaySlot_UnloadOverlay(&self->overlaySlot1);
    OverlaySlot_UnloadOverlay(&self->overlaySlot2);
    *UNK_0200e20c = *UNK_0200e20c & 0x7fff |
                    (u16)(self->savedScreenSwap << 0xf);
    Sound_SetModalEnvelopeEnabled(gSoundContext,0,0,0x14,0x1e);
    GraphicsBankStateSnapshot_Restore(&self->graphicsBankStateSnapshot);
    switch(value) {
    case 0:
      value = self->sceneKind;
      if (value < 2) {
        if ((value == 1) &&
           (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) == 2)) {
          GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0f0);
          GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,0,1);
          GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
          DisplayBrightness_StartMaskedTransitions(1,0);
          goto code_r0x0200e2ac;
        }
        goto code_r0x0200e21c;
      }
      switch(value) {
      case 0x10:
        goto code_r0x0200e2ac;
      case 0x11:
        break;
      case 0x12:
        goto code_r0x0200e038;
      case 0x13:
        break;
      case 0x14:
        goto code_r0x0200e2ac;
      case 0x15:
        break;
      case 0x16:
        break;
      case 0x17:
code_r0x0200e038:
        GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0f0);
        GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,0,1);
        GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
        DisplayBrightness_StartMaskedTransitions(1,0);
        goto code_r0x0200e2ac;
      }
code_r0x0200e21c:
      GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0f0);
      GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0fc);
      GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,2,1);
      GamePhaseAreaScene_SetEnabled(
          GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 1);
      GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
      value = GameWork_TestFlag(gGameWork,UNK_0200e3c4);
      if (value == 0) {
        DisplayBrightness_StartMaskedTransitions(3,0);
      }
      else {
        GameWork_ClearFlag(gGameWork,UNK_0200e3c4);
      }
code_r0x0200e2ac:
      if (self->restoreCurrencyHudVisibility != 0) {
        GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4, 1);
      }
      GraphicsSpriteGroup_PrepareResources(ActorCollection_GetSpriteGroup(
          GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1)));
      if (self != 0) {
        self->base.vtable->destroyAndFree(&self->base);
      }
      value = GameWork_TestFlag(gGameWork,0x3cc);
      if (value == 0) {
        value = GameWork_TestFlag(gGameWork,UNK_0200e3d0);
        if (value != 0) {
          GameWork_ClearFlag(gGameWork,UNK_0200e3d0);
          overlayManager = OverlayManager_GetGlobal();
          OverlayManager_LoadOverlay(overlayManager,2,UNK_0200e3c8);
          object = Heap_Alloc(0x80,OVERLAY059_FOLLOWUP_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
          if (object != 0) {
            func_ov059_0220fd20(object,1);
          }
        }
      }
      else {
        GameWork_ClearFlag(gGameWork,0x3cc);
        overlayManager = OverlayManager_GetGlobal();
        OverlayManager_LoadOverlay(overlayManager,2,UNK_0200e3c8);
        object = Heap_Alloc(0x80,OVERLAY059_FOLLOWUP_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
        if (object != 0) {
          func_ov059_0220fd20(object,0);
        }
      }
      return 1;
    case 1:
      if (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) == 2) {
        GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,1,1);
        GamePhaseAreaScene_SetEnabled(
            GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 1);
      }
      break;
    case 2:
      break;
    case 3:
      goto code_r0x0200defc;
    case 4:
      goto code_r0x0200defc;
    case 5:
      break;
    case 6:
      break;
    case 7:
      break;
    case 8:
      break;
    case 9:
      if (self != 0) {
        self->base.vtable->destroyAndFree(&self->base);
      }
      GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,2,1);
      GamePhaseRuntime_SetPlacementMode(gGamePhaseRuntime, 3, 1);
      GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
      GamePhaseAreaScene_SetEnabled(
          GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 1);
      overlayManager = OverlayManager_GetGlobal();
      OverlayManager_LoadOverlay(overlayManager,2,UNK_0200e214);
      object = Heap_Alloc(0x90,OVERLAY059_PHASE_OBJECT_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
      if (object != 0) {
        func_ov059_02210fec(object, GamePhaseRuntime_GetPhaseObject(gGamePhaseRuntime));
      }
      return 1;
    case 10:
      break;
    case 0xb:
      self->sceneKind = value;
      self->sceneArgument = (s32)*(s16 *)((u8 *)gGameWork + 0x204);
      self->state = 0;
      return 0;
    case 0xc:
      goto code_r0x0200deec;
    case 0xd:
      break;
    case 0xe:
      goto code_r0x0200deec;
    case 0xf:
code_r0x0200deec:
      GameWork_SetFlag(gGameWork,UNK_0200e210);
code_r0x0200defc:
      GameWork_SetFlag(gGameWork,UNK_0200e204);
      self->sceneKind = value;
      self->state = 0;
      return 0;
    }
    self->sceneKind = value;
    self->state = 0;
  default:
    goto LAB_0200e3bc;
  }
  savedVBlankState = GX_VBlankIntr(0);
  /* Retail clears +0x3c while VBlank is suspended so the retained phase
   * renderer cannot upload stale maps during construction of the new scene. */
  self->runtimeCallbacksEnabled = 0;
  GridEffectActorRegistry_FinalizeDepartingActors();
  switch(self->sceneKind) {
  case 0x10:
    goto code_r0x0200d224;
  case 0x11:
    goto code_r0x0200d224;
  case 0x12:
    break;
  case 0x13:
    break;
  case 0x14:
    break;
  case 0x15:
    break;
  case 0x16:
    Sound_SetModalEnvelopeEnabled(*UNK_0200e0e8,1,0,0x14,0);
    goto code_r0x0200d224;
  case 0x17:
    break;
  case 0x18:
    goto code_r0x0200d224;
  }
  Sound_SetModalEnvelopeEnabled(*UNK_0200e0e8,1,0,0x14,0x1e);
code_r0x0200d224:
  if (self->sceneKind == 10) {
    GraphicsBankStateSnapshot_Capture(&self->graphicsBankStateSnapshot);
  }
  else {
    RuntimePresentationManager_DisableGraphics3dForActivePhase((u8 *)gGamePhaseRuntime + 0x2f7c);
    GraphicsBankStateSnapshot_Capture(&self->graphicsBankStateSnapshot);
    *UNK_0200e0ec = 0;
    GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 0);
    GraphicsSpriteGroup_ReleaseResources(ActorCollection_GetSpriteGroup(
        GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1)));
    GraphicsSpriteRenderer_BuildFrame(*UNK_0200e0f0,0);
  }
  value = self->sceneKind;
  if (value == 1) {
    if (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) != 2)
    goto code_r0x0200d2f0;
    GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4, 1);
  }
  else if (value != 0x12 && value != 0x17) {
code_r0x0200d2f0:
    *UNK_0200e0f8 = 0;
    GamePhaseRuntime_SetPlacementMode(gGamePhaseRuntime, 0, 1);
    GamePhaseAreaScene_SetEnabled(
        GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 0);
    GraphicsSpriteRenderer_BuildFrame(*UNK_0200e0fc,0);
    GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4, 0);
  }
  switch(self->sceneKind) {
  case 0:
  default:
code_r0x0200d3bc:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e100);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e104);
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e108);
    object = Heap_Alloc(UNK_0200e10c,OVERLAY013_DEFAULT_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay013_Scene_Init(object);
    }
    self->loadedScene = object;
    break;
  case 1:
    goto code_r0x0200d3bc;
  case 2:
    object = Heap_Alloc(0x88,INVENTORY_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = InventoryScene_Init(object);
    }
    self->loadedScene = object;
    break;
  case 3:
    GameWork_SetFlag(gGameWork,UNK_0200e120);
    GameWork_ClearFlag(gGameWork,0x388);
    object = Heap_Alloc(0x88,INVENTORY_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = InventoryScene_Init(object);
    }
    self->loadedScene = object;
    break;
  case 4:
    GameWork_ClearFlag(gGameWork,UNK_0200e120);
    GameWork_SetFlag(gGameWork,0x388);
    object = Heap_Alloc(0x88,INVENTORY_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = InventoryScene_Init(object);
    }
    self->loadedScene = object;
    break;
  case 5:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e124);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e128);
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e12c);
    object = Heap_Alloc(0x240,OVERLAY044_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov044_0220be60(object);
    }
    self->loadedScene = object;
    break;
  case 6:
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e134);
    object = Heap_Alloc(0x2f8,OVERLAY043_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov043_0220b76c(object);
    }
    self->loadedScene = object;
    break;
  case 7:
    goto code_r0x0200d3bc;
  case 8:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e13c);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e140);
    GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,0,1);
    GamePhaseRuntime_SetPlacementMode(gGamePhaseRuntime, 2, 0);
    GamePhaseAreaScene_SetEnabled(
        GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 1);
    GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
    object = Heap_Alloc(UNK_0200e144,OVERLAY018_KIND8_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay018_Scene_Init(object,self->sceneArgument);
    }
    self->loadedScene = object;
    break;
  case 9:
    goto code_r0x0200d3bc;
  case 10:
    goto code_r0x0200d5d8;
  case 0xb:
    if (self->sceneArgument == 7) {
      OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e100);
      OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e168);
      object = Heap_Alloc(0x394,OVERLAY022_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
      if (object != 0) {
        object = func_ov022_021fdd44(object);
      }
      self->loadedScene = object;
    }
    else {
      OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e158);
      OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e15c);
      object = Heap_Alloc(UNK_0200e160,OVERLAY021_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
      if (object != 0) {
        object = func_ov021_021fd7e8(object,self->sceneArgument);
      }
      self->loadedScene = object;
    }
    break;
  case 0xc:
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e170);
    object = Heap_Alloc(0x1e8,OVERLAY020_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov020_021fd844(object);
    }
    self->loadedScene = object;
    break;
  case 0xd:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e180);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e100);
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e184);
    object = Heap_Alloc(0x2f8,OVERLAY013_KIND13_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay013_Scene_Init(object);
    }
    self->loadedScene = object;
    break;
  case 0xe:
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e18c);
    object = Heap_Alloc(UNK_0200e190,OVERLAY016_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay016_Scene_Init(
          object, 2, (int)*(s16 *)((u8 *)gGameWork + 0x206));
    }
    self->loadedScene = object;
    break;
  case 0xf:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e158);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e198);
    object = Heap_Alloc(UNK_0200e19c,OVERLAY018_KIND15_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay018_SetDialogLayout(object);
    }
    self->loadedScene = object;
    break;
  case 0x10:
    /*
     * Phase 90 reaches this branch through overlay 195's actor bytecode.
     * Retail loads overlay 94 and overlay 25, allocates the 0x63c overlay-25
     * scene, and calls its constructor. These are NDS overlay boundaries, not
     * host-side title abstractions.
     */
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e1a4);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1a8);
    object = Heap_Alloc(UNK_0200e1ac,OVERLAY025_TITLE_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov025_021ff27c(object);
    }
    self->loadedScene = object;
    break;
  case 0x11:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1b8);
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e1bc);
    object = Heap_Alloc(100,OVERLAY004_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay004_VariantController_Init(object,self->sceneArgument);
    }
    self->loadedScene = object;
    break;
  case 0x12:
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1c4);
    object = Heap_Alloc(0x29c,OVERLAY028_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov028_021fdb00(object);
    }
    self->loadedScene = object;
    break;
  case 0x13:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e14c);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e158);
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e1cc);
    object = Heap_Alloc(0x104,OVERLAY009_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay009_InitSceneFields(object,self->sceneArgument);
    }
    self->loadedScene = object;
    break;
  case 0x14:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1d4);
    object = Heap_Alloc(0x5e0,OVERLAY027_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay027Scene_Init(object);
    }
    self->loadedScene = object;
    break;
  case 0x15:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e14c);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e158);
    OverlaySlot_LoadOverlay(&self->overlaySlot2,UNK_0200e1dc);
    object = Heap_Alloc(0x398,OVERLAY017_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay017_Effect_Delete(object);
    }
    self->loadedScene = object;
    break;
  case 0x16:
    value = self->sceneArgument;
    if (value < 0x12d) {
      if (value < 300) {
        if (value < 0xcc) {
          if (value < 0xcb) {
            if (value < 0xc9) {
              if (value < 200) {
                if (0x4d < value) {
                  switch(value) {
                  case 100:
                    break;
                  case 0x65:
                    break;
                  case 0x66:
                    break;
                  case 0x67:
                    break;
                  case 0x68:
                    break;
                  case 0x69:
                    break;
                  case 0x6a:
                    break;
                  case 0x6b:
                    break;
                  case 0x6c:
                    break;
                  }
                }
                goto code_r0x0200db0c;
              }
            }
            else if (value < 0xca) {
              if (value != 0xc9) goto code_r0x0200db0c;
            }
            else if (value != 0xca) goto code_r0x0200db0c;
          }
        }
        else if (value < 0xcf) {
          if (value < 0xce) {
            if (value < 0xcd) {
              if (value != 0xcc) goto code_r0x0200db0c;
            }
            else if (value != 0xcd) goto code_r0x0200db0c;
          }
        }
        else if (value < 0xd0) {
          if (value != 0xcf) {
code_r0x0200db0c:
            OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e1b4);
            OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1ec);
            object = Heap_Alloc(0x4c0,OVERLAY035_OR_036_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
            if (object != 0) {
              object = func_ov036_022045d4(object,self->sceneArgument);
            }
            self->loadedScene = object;
            break;
          }
        }
        else if (value != 0xd0) goto code_r0x0200db0c;
      }
    }
    else {
      if (UNK_0200e1e4 < value) {
        if ((value < 0x259) && (value < 600)) {
          comparisonValue = UNK_0200e1e4 + 1;
          if (value <= comparisonValue) goto joined_r0x0200dac4;
          if (value == 0x134) goto code_r0x0200db50;
        }
        goto code_r0x0200db0c;
      }
      if (value < UNK_0200e1e4) {
        if (UNK_0200e1e4 + -3 < value) {
          if (0x130 < value) {
            comparisonValue = UNK_0200e1e4 + -1;
            goto joined_r0x0200dac4;
          }
          if (value != 0x130) goto code_r0x0200db0c;
        }
        else if (value < UNK_0200e1e4 + -3) {
          comparisonValue = UNK_0200e1e4 + -5;
          if (comparisonValue < value) {
            comparisonValue = UNK_0200e1e4 + -4;
          }
joined_r0x0200dac4:
          if (value != comparisonValue) goto code_r0x0200db0c;
        }
      }
    }
code_r0x0200db50:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1f4);
    object = Heap_Alloc(0x4c0,OVERLAY035_OR_036_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov035_02202378(object,self->sceneArgument);
    }
    self->loadedScene = object;
    break;
  case 0x17:
code_r0x0200d5d8:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e14c);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e150);
    object = Heap_Alloc(100,OVERLAY019_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      /* Retail selects the alternate LCD route for phase 10 so the live main
       * scene remains visible while overlay 19 owns the keypad screen. */
      object = func_ov019_021fce28(
          object, self->sceneArgument,
          (void *)(u64)(self->sceneKind == 10));
    }
    self->loadedScene = object;
    break;
  case 0x18:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e1f8);
    object = Heap_Alloc(UNK_0200e1fc,OVERLAY037_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov037_021fe4fc(object,self->sceneArgument);
    }
    self->loadedScene = object;
    break;
  case 0x19:
    OverlaySlot_LoadOverlay(&self->overlaySlot0,UNK_0200e100);
    OverlaySlot_LoadOverlay(&self->overlaySlot1,UNK_0200e178);
    object = Heap_Alloc(0x368,OVERLAY013_KIND25_SCENE_ALLOCATION_TAG,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay013_Scene_Init(object);
    }
    self->loadedScene = object;
  }
  /* Retail writes one to +0x38 here: enable the newly constructed owned
   * object's VBlank/HBlank callbacks. The runtime callback gate at +0x3c
   * remains unchanged across this construction step. */
  self->loadedSceneCallbacksEnabled = 1;
  GX_VBlankIntr(savedVBlankState);
  self->state++;
LAB_0200e3bc:
  return 0;
}
