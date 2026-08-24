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
extern u8 data_020d553c[];
extern u8 data_020d5534[];
extern u8 data_020d548c[];
extern u8 data_020d5494[];
extern u8 data_020d549c[];
extern u8 data_020d54a4[];
extern u8 data_020d54ac[];
extern u8 data_020d54c4[];
extern u8 data_020d54bc[];
extern u8 data_020d54cc[];
extern u8 data_020d54dc[];
extern u8 data_020d54e4[];
extern u8 data_020d54ec[];
extern u8 data_020d54f4[];
extern u8 data_020d54fc[];
extern u8 data_020d5504[];
extern u8 data_020d550c[];
extern u8 data_020d5514[];
extern u8 data_020d551c[];
extern u8 data_020d5524[];
extern u8 data_020d54b4[];
extern u8 data_020d552c[];
extern u8 data_020d54d4[];
extern void func_02092c8c(s32 screens, s32 brightness);
extern GraphicsSpriteGroup *ActorCollection_GetSpriteGroup(void *collection);
extern s32 SceneInputBase_Update(void *object, s32 mode);
extern void Sound_SetModalEnvelopeEnabled(void *sound, s32 a, s32 b, s32 c, s32 d);
extern void func_02092418(void *object);
extern void *func_ov059_0220fd20(void *object, s32 mode);
extern void *func_ov059_02210fec(void *object, void *phaseState);
extern u32 GX_VBlankIntr(u32 callback);
extern void GridEffectActorRegistry_FinalizeDepartingActors(void);
extern void func_020923a4(void *object);
extern void RuntimePresentationManager_DisableGraphics3dForActivePhase(
    void *manager);
extern void GraphicsSpriteRenderer_BuildFrame(GraphicsSpriteRenderer *renderer, s32 mode);
extern void *func_ov013_021fce2c(void *object);
extern void *InventoryScene_Init(void *object);
extern void *func_ov044_0220be60(void *object);
extern void *func_ov043_0220b76c(void *object);
extern void *func_ov018_021fcf68(void *object, s32 argument);
extern void *func_ov022_021fdd44(void *object);
extern void *func_ov021_021fd7e8(void *object, s32 argument);
extern void *func_ov020_021fd844(void *object);
extern void *func_ov016_021fe77c(void *object, s32 mode, s32 argument);
extern void *func_ov018_021fd9f8(void *object);
extern void *func_ov025_021ff27c(void *scene);
extern void *func_ov004_021fc944(void *object, s32 argument);
extern void *func_ov028_021fdb00(void *object);
extern void *func_ov009_021fce74(void *object, s32 argument);
extern void *Overlay027Scene_Init(void *object);
extern void *func_ov017_021fda3c(void *object);
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
#define UNK_0200e3cc ((const char *)data_020d553c)
#define UNK_0200e114 (&gHeapContext)
#define UNK_0200e214 (0x3b)
#define UNK_0200e218 ((const char *)data_020d5534)
#define UNK_0200e210 (0x3bd)
#define UNK_0200e0ec ((volatile u16 *)0x04000050)
#define UNK_0200e0f8 ((volatile u16 *)0x04001050)
#define UNK_0200e100 (0x2e)
#define UNK_0200e104 (0x6)
#define UNK_0200e108 (0xd)
#define UNK_0200e10c (0x9ac)
#define UNK_0200e110 ((const char *)data_020d548c)
#define UNK_0200e118 ((const char *)data_020d5494)
#define UNK_0200e120 (0x387)
#define UNK_0200e124 (0x1)
#define UNK_0200e128 (0xf)
#define UNK_0200e12c (0x2c)
#define UNK_0200e130 ((const char *)data_020d549c)
#define UNK_0200e134 (0x2b)
#define UNK_0200e138 ((const char *)data_020d54a4)
#define UNK_0200e13c (0x3)
#define UNK_0200e140 (0x12)
#define UNK_0200e144 (0x424)
#define UNK_0200e148 ((const char *)data_020d54ac)
#define UNK_0200e168 (0x16)
#define UNK_0200e16c ((const char *)data_020d54c4)
#define UNK_0200e158 (0x2d)
#define UNK_0200e15c (0x15)
#define UNK_0200e160 (0x428)
#define UNK_0200e164 ((const char *)data_020d54bc)
#define UNK_0200e170 (0x14)
#define UNK_0200e174 ((const char *)data_020d54cc)
#define UNK_0200e180 (0x5)
#define UNK_0200e184 (0x18)
#define UNK_0200e188 ((const char *)data_020d54dc)
#define UNK_0200e18c (0x10)
#define UNK_0200e190 (0x488)
#define UNK_0200e194 ((const char *)data_020d54e4)
#define UNK_0200e198 (0x17)
#define UNK_0200e19c (0x4f8)
#define UNK_0200e1a0 ((const char *)data_020d54ec)
#define UNK_0200e1a4 (0x5e)
#define UNK_0200e1a8 (0x19)
#define UNK_0200e1ac (0x63c)
#define UNK_0200e1b0 ((const char *)data_020d54f4)
#define UNK_0200e1b4 (0x30)
#define UNK_0200e1b8 (0x4)
#define UNK_0200e1bc (0x1a)
#define UNK_0200e1c0 ((const char *)data_020d54fc)
#define UNK_0200e1c4 (0x1c)
#define UNK_0200e1c8 ((const char *)data_020d5504)
#define UNK_0200e14c (0x2)
#define UNK_0200e1cc (0x1d)
#define UNK_0200e1d0 ((const char *)data_020d550c)
#define UNK_0200e1d4 (0x1b)
#define UNK_0200e1d8 ((const char *)data_020d5514)
#define UNK_0200e1dc (0x1e)
#define UNK_0200e1e0 ((const char *)data_020d551c)
#define UNK_0200e1ec (0x24)
#define UNK_0200e1f0 ((const char *)data_020d5524)
#define UNK_0200e1e4 (0x132)
#define UNK_0200e1f4 (0x23)
#define UNK_0200e150 (0x13)
#define UNK_0200e154 ((const char *)data_020d54b4)
#define UNK_0200e1f8 (0x25)
#define UNK_0200e1fc (0x4bc)
#define UNK_0200e200 ((const char *)data_020d552c)
#define UNK_0200e178 (0x26)
#define UNK_0200e17c ((const char *)data_020d54d4)

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
  u32 uVar4;
  int iVar5;
  int iVar6;
  s32 bVar7;
  void *object;
  OverlayManager *overlayManager;
  
  switch(self->loadState) {
  case 0:
    self->loadState++;
    iVar5 = self->phase;
    if (iVar5 < 2) {
      if (iVar5 != 1) goto code_r0x0200d170;
      func_02092c8c(1,0xfffffff0);
      if (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) != 2) {
        func_02092c8c(2,0xfffffff0);
      }
      goto code_r0x0200d17c;
    }
    switch(iVar5) {
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
      func_02092c8c(1,0xfffffff0);
      goto code_r0x0200d17c;
    case 0x18:
code_r0x0200d150:
      func_02092c8c(3,0x10);
      goto code_r0x0200d17c;
    }
code_r0x0200d170:
    func_02092c8c(3,0xfffffff0);
code_r0x0200d17c:
    iVar5 = DisplayBrightness_IsMainTransitionComplete();
    if ((iVar5 == 0) || (iVar5 = DisplayBrightness_IsSubTransitionComplete(), iVar5 == 0)) {
      GraphicsSpriteGroup_AdvanceAnimations(ActorCollection_GetSpriteGroup(
          GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1)));
      return 0;
    }
    break;
  case 1:
    goto code_r0x0200d17c;
  case 2:
    SceneInputBase_Update(self->ownedObject, 0);
    if (-1 < *(int *)((u8 *)self->ownedObject + 0x20) << 0x1f) {
      return 0;
    }
    func_02092c8c(3,0);
    self->loadState++;
    return 0;
  case 3:
    SceneInputBase_Update(self->ownedObject, 0);
    iVar5 = DisplayBrightness_IsMainTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = DisplayBrightness_IsSubTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    self->loadState++;
    return 0;
  case 4:
    iVar5 = SceneInputBase_Update(self->ownedObject, 1);
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = self->phase;
    if (iVar5 < 2) {
      if (iVar5 == 1) {
        uVar4 = GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime);
        bVar7 = uVar4 == 2;
        if (bVar7) {
          uVar4 = *(u32 *)((u8 *)self->ownedObject + 0x980);
        }
        if (bVar7 && uVar4 == 0) {
          func_02092c8c(1,0xfffffff0);
          goto code_r0x0200dd3c;
        }
      }
      goto code_r0x0200dd30;
    }
    switch(iVar5) {
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
      func_02092c8c(1,0xfffffff0);
      goto code_r0x0200dd3c;
    case 0x18:
code_r0x0200dce0:
      func_02092c8c(3,0x10);
      goto code_r0x0200dd3c;
    }
code_r0x0200dd30:
    func_02092c8c(3,0xfffffff0);
code_r0x0200dd3c:
    self->loadState++;
    return 0;
  case 5:
    SceneInputBase_Update(self->ownedObject, 0);
    iVar5 = DisplayBrightness_IsMainTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = DisplayBrightness_IsSubTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = 0;
    self->runtimeCallbacksEnabled = 0;
    if (self->phase == 1) {
      iVar5 = *(int *)((u8 *)self->ownedObject + 0x980);
    }
    iVar6 = GameWork_TestFlag(gGameWork,UNK_0200e204);
    if (iVar6 == 0) {
      iVar6 = GameWork_TestFlag(gGameWork,UNK_0200e208);
      if (iVar6 != 0) {
        iVar5 = 0xb;
      }
    }
    else {
      GameWork_ClearFlag(gGameWork,UNK_0200e204);
      iVar5 = 1;
    }
    if (self->ownedObject != 0) {
      ((OwnedSceneObject *)self->ownedObject)->vtable->release(
          self->ownedObject);
    }
    self->ownedObject = 0;
    OverlaySlot_UnloadOverlay((OverlaySlot *)self->field_74);
    OverlaySlot_UnloadOverlay((OverlaySlot *)self->field_80);
    OverlaySlot_UnloadOverlay((OverlaySlot *)self->field_8c);
    *UNK_0200e20c = *UNK_0200e20c & 0x7fff |
                    (u16)(self->savedPowerControlBit15 << 0xf);
    Sound_SetModalEnvelopeEnabled(gSoundContext,0,0,0x14,0x1e);
    func_02092418(self->field_40);
    switch(iVar5) {
    case 0:
      iVar5 = self->phase;
      if (iVar5 < 2) {
        if ((iVar5 == 1) &&
           (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) == 2)) {
          GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0f0);
          GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,0,1);
          GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
          func_02092c8c(1,0);
          goto code_r0x0200e2ac;
        }
        goto code_r0x0200e21c;
      }
      switch(iVar5) {
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
        func_02092c8c(1,0);
        goto code_r0x0200e2ac;
      }
code_r0x0200e21c:
      GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0f0);
      GraphicsSpriteRenderer_ClearTextBuffer(*UNK_0200e0fc);
      GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,2,1);
      GamePhaseAreaScene_SetEnabled(
          GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 1);
      GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
      iVar5 = GameWork_TestFlag(gGameWork,UNK_0200e3c4);
      if (iVar5 == 0) {
        func_02092c8c(3,0);
      }
      else {
        GameWork_ClearFlag(gGameWork,UNK_0200e3c4);
      }
code_r0x0200e2ac:
      if (self->field_34 != 0) {
        GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4, 1);
      }
      GraphicsSpriteGroup_PrepareResources(ActorCollection_GetSpriteGroup(
          GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1)));
      if (self != 0) {
        self->base.vtable->destroyAndFree(&self->base);
      }
      iVar5 = GameWork_TestFlag(gGameWork,0x3cc);
      if (iVar5 == 0) {
        iVar5 = GameWork_TestFlag(gGameWork,UNK_0200e3d0);
        if (iVar5 != 0) {
          GameWork_ClearFlag(gGameWork,UNK_0200e3d0);
          overlayManager = OverlayManager_GetGlobal();
          OverlayManager_LoadOverlay(overlayManager,2,UNK_0200e3c8);
          object = Heap_Alloc(0x80,UNK_0200e3cc,4,UNK_0200e114);
          if (object != 0) {
            func_ov059_0220fd20(object,1);
          }
        }
      }
      else {
        GameWork_ClearFlag(gGameWork,0x3cc);
        overlayManager = OverlayManager_GetGlobal();
        OverlayManager_LoadOverlay(overlayManager,2,UNK_0200e3c8);
        object = Heap_Alloc(0x80,UNK_0200e3cc,4,UNK_0200e114);
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
      object = Heap_Alloc(0x90,UNK_0200e218,4,UNK_0200e114);
      if (object != 0) {
        func_ov059_02210fec(object, GamePhaseRuntime_GetPhaseObject(gGamePhaseRuntime));
      }
      return 1;
    case 10:
      break;
    case 0xb:
      self->phase = iVar5;
      self->phaseArgument = (s32)*(s16 *)((u8 *)gGameWork + 0x204);
      self->loadState = 0;
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
      self->phase = iVar5;
      self->loadState = 0;
      return 0;
    }
    self->phase = iVar5;
    self->loadState = 0;
  default:
    goto LAB_0200e3bc;
  }
  savedVBlankState = GX_VBlankIntr(0);
  /* Retail clears +0x3c while VBlank is suspended so the retained phase
   * renderer cannot upload stale maps during construction of the new scene. */
  self->runtimeCallbacksEnabled = 0;
  GridEffectActorRegistry_FinalizeDepartingActors();
  switch(self->phase) {
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
  if (self->phase == 10) {
    func_020923a4(self->field_40);
  }
  else {
    RuntimePresentationManager_DisableGraphics3dForActivePhase((u8 *)gGamePhaseRuntime + 0x2f7c);
    func_020923a4(self->field_40);
    *UNK_0200e0ec = 0;
    GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 0);
    GraphicsSpriteGroup_ReleaseResources(ActorCollection_GetSpriteGroup(
        GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1)));
    GraphicsSpriteRenderer_BuildFrame(*UNK_0200e0f0,0);
  }
  iVar5 = self->phase;
  if (iVar5 == 1) {
    if (GamePhaseRuntime_GetPhaseObjectMode(gGamePhaseRuntime) != 2)
    goto code_r0x0200d2f0;
    GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4, 1);
  }
  else if (iVar5 != 0x12 && iVar5 != 0x17) {
code_r0x0200d2f0:
    *UNK_0200e0f8 = 0;
    GamePhaseRuntime_SetPlacementMode(gGamePhaseRuntime, 0, 1);
    GamePhaseAreaScene_SetEnabled(
        GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 0);
    GraphicsSpriteRenderer_BuildFrame(*UNK_0200e0fc,0);
    GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4, 0);
  }
  switch(self->phase) {
  case 0:
  default:
code_r0x0200d3bc:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e100);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e104);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e108);
    object = Heap_Alloc(UNK_0200e10c,UNK_0200e110,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov013_021fce2c(object);
    }
    self->ownedObject = object;
    break;
  case 1:
    goto code_r0x0200d3bc;
  case 2:
    object = Heap_Alloc(0x88,UNK_0200e118,4,UNK_0200e114);
    if (object != 0) {
      object = InventoryScene_Init(object);
    }
    self->ownedObject = object;
    break;
  case 3:
    GameWork_SetFlag(gGameWork,UNK_0200e120);
    GameWork_ClearFlag(gGameWork,0x388);
    object = Heap_Alloc(0x88,UNK_0200e118,4,UNK_0200e114);
    if (object != 0) {
      object = InventoryScene_Init(object);
    }
    self->ownedObject = object;
    break;
  case 4:
    GameWork_ClearFlag(gGameWork,UNK_0200e120);
    GameWork_SetFlag(gGameWork,0x388);
    object = Heap_Alloc(0x88,UNK_0200e118,4,UNK_0200e114);
    if (object != 0) {
      object = InventoryScene_Init(object);
    }
    self->ownedObject = object;
    break;
  case 5:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e124);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e128);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e12c);
    object = Heap_Alloc(0x240,UNK_0200e130,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov044_0220be60(object);
    }
    self->ownedObject = object;
    break;
  case 6:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e134);
    object = Heap_Alloc(0x2f8,UNK_0200e138,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov043_0220b76c(object);
    }
    self->ownedObject = object;
    break;
  case 7:
    goto code_r0x0200d3bc;
  case 8:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e13c);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e140);
    GamePhaseRuntime_ApplyScreenMode(gGamePhaseRuntime,0,1);
    GamePhaseRuntime_SetPlacementMode(gGamePhaseRuntime, 2, 0);
    GamePhaseAreaScene_SetEnabled(
        GamePhaseRuntime_GetAreaScene(gGamePhaseRuntime), 1);
    GamePhaseState_SetEnabled(GamePhaseRuntime_GetEmbeddedState(gGamePhaseRuntime), 1);
    object = Heap_Alloc(UNK_0200e144,UNK_0200e148,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov018_021fcf68(object,self->phaseArgument);
    }
    self->ownedObject = object;
    break;
  case 9:
    goto code_r0x0200d3bc;
  case 10:
    goto code_r0x0200d5d8;
  case 0xb:
    if (self->phaseArgument == 7) {
      OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e100);
      OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e168);
      object = Heap_Alloc(0x394,UNK_0200e16c,4,UNK_0200e114);
      if (object != 0) {
        object = func_ov022_021fdd44(object);
      }
      self->ownedObject = object;
    }
    else {
      OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e158);
      OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e15c);
      object = Heap_Alloc(UNK_0200e160,UNK_0200e164,4,UNK_0200e114);
      if (object != 0) {
        object = func_ov021_021fd7e8(object,self->phaseArgument);
      }
      self->ownedObject = object;
    }
    break;
  case 0xc:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e170);
    object = Heap_Alloc(0x1e8,UNK_0200e174,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov020_021fd844(object);
    }
    self->ownedObject = object;
    break;
  case 0xd:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e180);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e100);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e184);
    object = Heap_Alloc(0x2f8,UNK_0200e188,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov013_021fce2c(object);
    }
    self->ownedObject = object;
    break;
  case 0xe:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e18c);
    object = Heap_Alloc(UNK_0200e190,UNK_0200e194,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov016_021fe77c(
          object, 2, (int)*(s16 *)((u8 *)gGameWork + 0x206));
    }
    self->ownedObject = object;
    break;
  case 0xf:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e158);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e198);
    object = Heap_Alloc(UNK_0200e19c,UNK_0200e1a0,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov018_021fd9f8(object);
    }
    self->ownedObject = object;
    break;
  case 0x10:
    /*
     * Phase 90 reaches this branch through overlay 195's actor bytecode.
     * Retail loads overlay 94 and overlay 25, allocates the 0x63c overlay-25
     * scene, and calls its constructor. These are NDS overlay boundaries, not
     * host-side title abstractions.
     */
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e1a4);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1a8);
    object = Heap_Alloc(UNK_0200e1ac,UNK_0200e1b0,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov025_021ff27c(object);
    }
    self->ownedObject = object;
    break;
  case 0x11:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e1b4);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1b8);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e1bc);
    object = Heap_Alloc(100,UNK_0200e1c0,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov004_021fc944(object,self->phaseArgument);
    }
    self->ownedObject = object;
    break;
  case 0x12:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1c4);
    object = Heap_Alloc(0x29c,UNK_0200e1c8,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov028_021fdb00(object);
    }
    self->ownedObject = object;
    break;
  case 0x13:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e14c);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e158);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e1cc);
    object = Heap_Alloc(0x104,UNK_0200e1d0,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov009_021fce74(object,self->phaseArgument);
    }
    self->ownedObject = object;
    break;
  case 0x14:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e1b4);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1d4);
    object = Heap_Alloc(0x5e0,UNK_0200e1d8,4,UNK_0200e114);
    if (object != 0) {
      object = Overlay027Scene_Init(object);
    }
    self->ownedObject = object;
    break;
  case 0x15:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e14c);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e158);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_8c,UNK_0200e1dc);
    object = Heap_Alloc(0x398,UNK_0200e1e0,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov017_021fda3c(object);
    }
    self->ownedObject = object;
    break;
  case 0x16:
    iVar5 = self->phaseArgument;
    if (iVar5 < 0x12d) {
      if (iVar5 < 300) {
        if (iVar5 < 0xcc) {
          if (iVar5 < 0xcb) {
            if (iVar5 < 0xc9) {
              if (iVar5 < 200) {
                if (0x4d < iVar5) {
                  switch(iVar5) {
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
            else if (iVar5 < 0xca) {
              if (iVar5 != 0xc9) goto code_r0x0200db0c;
            }
            else if (iVar5 != 0xca) goto code_r0x0200db0c;
          }
        }
        else if (iVar5 < 0xcf) {
          if (iVar5 < 0xce) {
            if (iVar5 < 0xcd) {
              if (iVar5 != 0xcc) goto code_r0x0200db0c;
            }
            else if (iVar5 != 0xcd) goto code_r0x0200db0c;
          }
        }
        else if (iVar5 < 0xd0) {
          if (iVar5 != 0xcf) {
code_r0x0200db0c:
            OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e1b4);
            OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1ec);
            object = Heap_Alloc(0x4c0,UNK_0200e1f0,4,UNK_0200e114);
            if (object != 0) {
              object = func_ov036_022045d4(object,self->phaseArgument);
            }
            self->ownedObject = object;
            break;
          }
        }
        else if (iVar5 != 0xd0) goto code_r0x0200db0c;
      }
    }
    else {
      if (UNK_0200e1e4 < iVar5) {
        if ((iVar5 < 0x259) && (iVar5 < 600)) {
          iVar6 = UNK_0200e1e4 + 1;
          if (iVar5 <= iVar6) goto joined_r0x0200dac4;
          if (iVar5 == 0x134) goto code_r0x0200db50;
        }
        goto code_r0x0200db0c;
      }
      if (iVar5 < UNK_0200e1e4) {
        if (UNK_0200e1e4 + -3 < iVar5) {
          if (0x130 < iVar5) {
            iVar6 = UNK_0200e1e4 + -1;
            goto joined_r0x0200dac4;
          }
          if (iVar5 != 0x130) goto code_r0x0200db0c;
        }
        else if (iVar5 < UNK_0200e1e4 + -3) {
          iVar6 = UNK_0200e1e4 + -5;
          if (iVar6 < iVar5) {
            iVar6 = UNK_0200e1e4 + -4;
          }
joined_r0x0200dac4:
          if (iVar5 != iVar6) goto code_r0x0200db0c;
        }
      }
    }
code_r0x0200db50:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e1b4);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1f4);
    object = Heap_Alloc(0x4c0,UNK_0200e1f0,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov035_02202378(object,self->phaseArgument);
    }
    self->ownedObject = object;
    break;
  case 0x17:
code_r0x0200d5d8:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e14c);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e150);
    object = Heap_Alloc(100,UNK_0200e154,4,UNK_0200e114);
    if (object != 0) {
      /* Retail selects the alternate LCD route for phase 10 so the live main
       * scene remains visible while overlay 19 owns the keypad screen. */
      object = func_ov019_021fce28(
          object, self->phaseArgument,
          (void *)(u64)(self->phase == 10));
    }
    self->ownedObject = object;
    break;
  case 0x18:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e1b4);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e1f8);
    object = Heap_Alloc(UNK_0200e1fc,UNK_0200e200,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov037_021fe4fc(object,self->phaseArgument);
    }
    self->ownedObject = object;
    break;
  case 0x19:
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_74,UNK_0200e100);
    OverlaySlot_LoadOverlay((OverlaySlot *)self->field_80,UNK_0200e178);
    object = Heap_Alloc(0x368,UNK_0200e17c,4,UNK_0200e114);
    if (object != 0) {
      object = func_ov013_021fce2c(object);
    }
    self->ownedObject = object;
  }
  /* Retail writes one to +0x38 here: enable the newly constructed owned
   * object's VBlank/HBlank callbacks. The runtime callback gate at +0x3c
   * remains unchanged across this construction step. */
  self->ownedObjectCallbacksEnabled = 1;
  GX_VBlankIntr(savedVBlankState);
  self->loadState++;
LAB_0200e3bc:
  return 0;
}
