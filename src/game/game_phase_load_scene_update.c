#include "tingle/types.h"

/*
 * Portable, address-faithful reconstruction of the six-state game-phase load
 * pipeline. It waits for fades, tears down the active phase, selects and
 * allocates the requested overlay scene, restores display/runtime resources,
 * and dispatches follow-up title/death-demo scenes. Address-derived constants
 * and names remain intact where their semantic roles are not yet confirmed.
 * The retail compiler form is retained separately for exact ROM matching.
 */

typedef u32 undefined4;
typedef u32 uint;
typedef u16 ushort;
typedef void (*code)(void);
typedef int bool;

#ifdef __cplusplus
extern "C" {
#endif
extern int data_021052fc;
extern int gGameWork;
extern int gSoundContext;
extern int data_020f4e14;
extern int gDebugFont;
extern int gLupyContext;
extern u8 data_020d553c[];
extern int gHeapContext;
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
extern int func_02092c8c(...);
extern int DisplayBrightness_IsMainTransitionComplete(...);
extern int DisplayBrightness_IsSubTransitionComplete(...);
extern int GamePhaseRuntime_GetActorCollection(...);
extern int ActorCollection_GetSpriteOwner(...);
extern int func_020740a4(...);
extern int func_02091fb0(...);
extern int func_02001970(...);
extern int func_0200199c(...);
extern int OverlaySlot_UnloadOverlay(...);
extern int func_02058eb8(...);
extern int func_02092418(...);
extern int func_020755bc(...);
extern int func_02008570(...);
extern int GamePhaseState_SetEnabled(...);
extern int GamePhaseAreaScene_SetEnabled(...);
extern int GamePhaseCurrencyHud_SetVisible(...);
extern int func_02074178(...);
extern int OverlayManager_GetGlobal(...);
extern int OverlayManager_LoadOverlay(...);
extern int func_02003e14(...);
extern int func_ov059_0220fd20(...);
extern int GamePhaseRuntime_SetPlacementMode(...);
extern int func_ov059_02210fec(...);
extern int func_02001944(...);
extern int GX_VBlankIntr(...);
extern int func_0204fbdc(...);
extern int func_020923a4(...);
extern int func_0201e0f4(...);
extern int func_02074154(...);
extern int func_020745c4(...);
extern int OverlaySlot_LoadOverlay(...);
extern int func_ov013_021fce2c(...);
extern int func_02068444(...);
extern int func_ov044_0220be60(...);
extern int func_ov043_0220b76c(...);
extern int func_ov018_021fcf68(...);
extern int func_ov022_021fdd44(...);
extern int func_ov021_021fd7e8(...);
extern int func_ov020_021fd844(...);
extern int func_ov016_021fe77c(...);
extern int func_ov018_021fd9f8(...);
extern int func_ov025_021ff27c(...);
extern int func_ov004_021fc944(...);
extern int func_ov028_021fdb00(...);
extern int func_ov009_021fce74(...);
extern int func_ov027_021fda30(...);
extern int func_ov017_021fda3c(...);
extern int func_ov036_022045d4(...);
extern int func_ov035_02202378(...);
extern int func_ov019_021fce28(...);
extern int func_ov037_021fe4fc(...);
extern int tingle_eu_arm9(...);
extern int SecureAction(...);
extern int module(...);
#ifdef __cplusplus
}
#endif

#define UNK_0200e0e4 ((int *)&data_021052fc)
#define UNK_0200e11c ((int *)&gGameWork)
#define UNK_0200e204 ((int *)0x389)
#define UNK_0200e208 ((int *)0x3b2)
#define UNK_0200e0e8 ((int *)&gSoundContext)
#define UNK_0200e20c ((int *)0x4000304)
#define UNK_0200e0f0 ((int *)&data_020f4e14)
#define UNK_0200e0fc ((int *)&gDebugFont)
#define UNK_0200e3c4 ((int *)0x3ba)
#define UNK_0200e0f4 ((int *)&gLupyContext)
#define UNK_0200e3d0 ((int *)0x3cd)
#define UNK_0200e3c8 ((int *)0x48)
#define UNK_0200e3cc ((int *)&data_020d553c)
#define UNK_0200e114 ((int *)&gHeapContext)
#define UNK_0200e214 ((int *)0x3b)
#define UNK_0200e218 ((int *)&data_020d5534)
#define UNK_0200e210 ((int *)0x3bd)
#define UNK_0200e0ec ((int *)0x4000050)
#define UNK_0200e0f8 ((int *)0x4001050)
#define UNK_0200e100 ((int *)0x2e)
#define UNK_0200e104 ((int *)0x6)
#define UNK_0200e108 ((int *)0xd)
#define UNK_0200e10c ((int *)0x9ac)
#define UNK_0200e110 ((int *)&data_020d548c)
#define UNK_0200e118 ((int *)&data_020d5494)
#define UNK_0200e120 ((int *)0x387)
#define UNK_0200e124 ((int *)0x1)
#define UNK_0200e128 ((int *)0xf)
#define UNK_0200e12c ((int *)0x2c)
#define UNK_0200e130 ((int *)&data_020d549c)
#define UNK_0200e134 ((int *)0x2b)
#define UNK_0200e138 ((int *)&data_020d54a4)
#define UNK_0200e13c ((int *)0x3)
#define UNK_0200e140 ((int *)0x12)
#define UNK_0200e144 ((int *)0x424)
#define UNK_0200e148 ((int *)&data_020d54ac)
#define UNK_0200e168 ((int *)0x16)
#define UNK_0200e16c ((int *)&data_020d54c4)
#define UNK_0200e158 ((int *)0x2d)
#define UNK_0200e15c ((int *)0x15)
#define UNK_0200e160 ((int *)0x428)
#define UNK_0200e164 ((int *)&data_020d54bc)
#define UNK_0200e170 ((int *)0x14)
#define UNK_0200e174 ((int *)&data_020d54cc)
#define UNK_0200e180 ((int *)0x5)
#define UNK_0200e184 ((int *)0x18)
#define UNK_0200e188 ((int *)&data_020d54dc)
#define UNK_0200e18c ((int *)0x10)
#define UNK_0200e190 ((int *)0x488)
#define UNK_0200e194 ((int *)&data_020d54e4)
#define UNK_0200e198 ((int *)0x17)
#define UNK_0200e19c ((int *)0x4f8)
#define UNK_0200e1a0 ((int *)&data_020d54ec)
#define UNK_0200e1a4 ((int *)0x5e)
#define UNK_0200e1a8 ((int *)0x19)
#define UNK_0200e1ac ((int *)0x63c)
#define UNK_0200e1b0 ((int *)&data_020d54f4)
#define UNK_0200e1b4 ((int *)0x30)
#define UNK_0200e1b8 ((int *)0x4)
#define UNK_0200e1bc ((int *)0x1a)
#define UNK_0200e1c0 ((int *)&data_020d54fc)
#define UNK_0200e1c4 ((int *)0x1c)
#define UNK_0200e1c8 ((int *)&data_020d5504)
#define UNK_0200e14c ((int *)0x2)
#define UNK_0200e1cc ((int *)0x1d)
#define UNK_0200e1d0 ((int *)&data_020d550c)
#define UNK_0200e1d4 ((int *)0x1b)
#define UNK_0200e1d8 ((int *)&data_020d5514)
#define UNK_0200e1dc ((int *)0x1e)
#define UNK_0200e1e0 ((int *)&data_020d551c)
#define UNK_0200e1ec ((int *)0x24)
#define UNK_0200e1f0 ((int *)&data_020d5524)
#define UNK_0200e1e4 (0x132)
#define UNK_0200e1f4 ((int *)0x23)
#define UNK_0200e150 ((int *)0x13)
#define UNK_0200e154 ((int *)&data_020d54b4)
#define UNK_0200e1f8 ((int *)0x25)
#define UNK_0200e1fc ((int *)0x4bc)
#define UNK_0200e200 ((int *)&data_020d552c)
#define UNK_0200e178 ((int *)0x26)
#define UNK_0200e17c ((int *)&data_020d54d4)

/*
 * Execute one load-pipeline frame. param_1 is the scene; the other arguments
 * are decompiler-visible scratch registers passed through only to an unresolved
 * helper signature. Returns one after final teardown/dispatch, otherwise zero.
 */
s32 GamePhaseLoadScene_Update(int *param_1, undefined4 param_2,
                             undefined4 param_3, undefined4 param_4)

{
  int *piVar1;
  int *puVar2;
  undefined4 uVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  
  switch(param_1[10]) {
  case 0:
    param_1[10] = param_1[10] + 1;
    iVar5 = param_1[0xb];
    if (iVar5 < 2) {
      if (iVar5 != 1) goto code_r0x0200d170;
      func_02092c8c(1,0xfffffff0);
      if ((uint)(*(int *)(*(int *)(*UNK_0200e0e4 + 0x30bc) + 0x40) << 0xc) >> 0x1e != 2) {
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
      GamePhaseRuntime_GetActorCollection(*UNK_0200e0e4,1);
      ActorCollection_GetSpriteOwner();
      func_020740a4();
      return 0;
    }
    break;
  case 1:
    goto code_r0x0200d17c;
  case 2:
    func_02091fb0(param_1[9],0,param_3,param_4,param_4);
    if (-1 < *(int *)(param_1[9] + 0x20) << 0x1f) {
      return 0;
    }
    func_02092c8c(3,0);
    param_1[10] = param_1[10] + 1;
    return 0;
  case 3:
    func_02091fb0(param_1[9],0,param_3,param_4,param_4);
    iVar5 = DisplayBrightness_IsMainTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = DisplayBrightness_IsSubTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    param_1[10] = param_1[10] + 1;
    return 0;
  case 4:
    iVar5 = func_02091fb0(param_1[9],1,param_3,param_4,param_4);
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = param_1[0xb];
    if (iVar5 < 2) {
      if (iVar5 == 1) {
        uVar4 = (uint)(*(int *)(*(int *)(*UNK_0200e0e4 + 0x30bc) + 0x40) << 0xc) >> 0x1e;
        bVar7 = uVar4 == 2;
        if (bVar7) {
          uVar4 = *(uint *)(param_1[9] + 0x980);
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
    param_1[10] = param_1[10] + 1;
    return 0;
  case 5:
    func_02091fb0(param_1[9],0,param_3,param_4,param_4);
    iVar5 = DisplayBrightness_IsMainTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = DisplayBrightness_IsSubTransitionComplete();
    if (iVar5 == 0) {
      return 0;
    }
    iVar5 = 0;
    param_1[0xe] = 0;
    if (param_1[0xb] == 1) {
      iVar5 = *(int *)(param_1[9] + 0x980);
    }
    iVar6 = func_02001970(*UNK_0200e11c,UNK_0200e204);
    if (iVar6 == 0) {
      iVar6 = func_02001970(*UNK_0200e11c,UNK_0200e208);
      if (iVar6 != 0) {
        iVar5 = 0xb;
      }
    }
    else {
      func_0200199c(*UNK_0200e11c,UNK_0200e204);
      iVar5 = 1;
    }
    if ((int *)param_1[9] != (int *)0x0) {
      (**(code **)(*(int *)param_1[9] + 8))();
    }
    param_1[9] = 0;
    OverlaySlot_UnloadOverlay(param_1 + 0x1d);
    OverlaySlot_UnloadOverlay(param_1 + 0x20);
    OverlaySlot_UnloadOverlay(param_1 + 0x23);
    puVar2 = UNK_0200e0e8;
    *UNK_0200e20c = *UNK_0200e20c & 0x7fff | (ushort)(param_1[0x26] << 0xf);
    func_02058eb8(*puVar2,0,0,0x14,0x1e);
    func_02092418(param_1 + 0x10);
    piVar1 = UNK_0200e11c;
    switch(iVar5) {
    case 0:
      iVar5 = param_1[0xb];
      if (iVar5 < 2) {
        if ((iVar5 == 1) &&
           ((uint)(*(int *)(*(int *)(*UNK_0200e0e4 + 0x30bc) + 0x40) << 0xc) >> 0x1e == 2)) {
          func_020755bc(*UNK_0200e0f0);
          func_02008570(*UNK_0200e0e4,0,1);
          GamePhaseState_SetEnabled(*UNK_0200e0e4 + 0x24,1);
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
        func_020755bc(*UNK_0200e0f0);
        func_02008570(*UNK_0200e0e4,0,1);
        GamePhaseState_SetEnabled(*UNK_0200e0e4 + 0x24,1);
        func_02092c8c(1,0);
        goto code_r0x0200e2ac;
      }
code_r0x0200e21c:
      func_020755bc(*UNK_0200e0f0);
      func_020755bc(*UNK_0200e0fc);
      func_02008570(*UNK_0200e0e4,2,1);
      GamePhaseAreaScene_SetEnabled(*(undefined4 *)(*UNK_0200e0e4 + 0x2fb8),1);
      GamePhaseState_SetEnabled(*UNK_0200e0e4 + 0x24,1);
      iVar5 = func_02001970(*UNK_0200e11c,UNK_0200e3c4);
      if (iVar5 == 0) {
        func_02092c8c(3,0);
      }
      else {
        func_0200199c(*UNK_0200e11c,UNK_0200e3c4);
      }
code_r0x0200e2ac:
      if (param_1[0xd] != 0) {
        GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4,1);
      }
      GamePhaseRuntime_GetActorCollection(*UNK_0200e0e4,1);
      ActorCollection_GetSpriteOwner();
      func_02074178();
      if (param_1 != (int *)0x0) {
        (**(code **)(*param_1 + 4))();
      }
      iVar5 = func_02001970(*UNK_0200e11c,0x3cc);
      if (iVar5 == 0) {
        iVar5 = func_02001970(*UNK_0200e11c,UNK_0200e3d0);
        if (iVar5 != 0) {
          func_0200199c(*UNK_0200e11c,UNK_0200e3d0);
          uVar3 = OverlayManager_GetGlobal();
          OverlayManager_LoadOverlay(uVar3,2,UNK_0200e3c8);
          iVar5 = func_02003e14(0x80,UNK_0200e3cc,4,UNK_0200e114);
          if (iVar5 != 0) {
            func_ov059_0220fd20(iVar5,1);
          }
        }
      }
      else {
        func_0200199c(*UNK_0200e11c,0x3cc);
        uVar3 = OverlayManager_GetGlobal();
        OverlayManager_LoadOverlay(uVar3,2,UNK_0200e3c8);
        iVar5 = func_02003e14(0x80,UNK_0200e3cc,4,UNK_0200e114);
        if (iVar5 != 0) {
          func_ov059_0220fd20(iVar5,0);
        }
      }
      return 1;
    case 1:
      if ((uint)(*(int *)(*(int *)(*UNK_0200e0e4 + 0x30bc) + 0x40) << 0xc) >> 0x1e == 2) {
        func_02008570(*UNK_0200e0e4,1,1);
        GamePhaseAreaScene_SetEnabled(*(undefined4 *)(*UNK_0200e0e4 + 0x2fb8),1);
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
      if (param_1 != (int *)0x0) {
        (**(code **)(*param_1 + 4))();
      }
      func_02008570(*UNK_0200e0e4,2,1);
      GamePhaseRuntime_SetPlacementMode(*UNK_0200e0e4,3,1);
      GamePhaseState_SetEnabled(*UNK_0200e0e4 + 0x24,1);
      GamePhaseAreaScene_SetEnabled(*(undefined4 *)(*UNK_0200e0e4 + 0x2fb8),1);
      uVar3 = OverlayManager_GetGlobal();
      OverlayManager_LoadOverlay(uVar3,2,UNK_0200e214);
      iVar5 = func_02003e14(0x90,UNK_0200e218,4,UNK_0200e114);
      if (iVar5 != 0) {
        func_ov059_02210fec(iVar5,*(undefined4 *)(*UNK_0200e0e4 + 0x30bc));
      }
      return 1;
    case 10:
      break;
    case 0xb:
      param_1[0xb] = iVar5;
      param_1[0xc] = (int)*(short *)(*piVar1 + 0x204);
      param_1[10] = 0;
      return 0;
    case 0xc:
      goto code_r0x0200deec;
    case 0xd:
      break;
    case 0xe:
      goto code_r0x0200deec;
    case 0xf:
code_r0x0200deec:
      func_02001944(*UNK_0200e11c,UNK_0200e210);
code_r0x0200defc:
      func_02001944(*UNK_0200e11c,UNK_0200e204);
      param_1[0xb] = iVar5;
      param_1[10] = 0;
      return 0;
    }
    param_1[0xb] = iVar5;
    param_1[10] = 0;
  default:
    goto LAB_0200e3bc;
  }
  uVar3 = GX_VBlankIntr(0);
  param_1[0xf] = 0;
  func_0204fbdc();
  switch(param_1[0xb]) {
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
    func_02058eb8(*UNK_0200e0e8,1,0,0x14,0);
    goto code_r0x0200d224;
  case 0x17:
    break;
  case 0x18:
    goto code_r0x0200d224;
  }
  func_02058eb8(*UNK_0200e0e8,1,0,0x14,0x1e);
code_r0x0200d224:
  if (param_1[0xb] == 10) {
    func_020923a4(param_1 + 0x10);
  }
  else {
    func_0201e0f4(*UNK_0200e0e4 + 0x2f7c);
    func_020923a4(param_1 + 0x10);
    piVar1 = UNK_0200e0e4;
    *UNK_0200e0ec = 0;
    GamePhaseState_SetEnabled(*piVar1 + 0x24);
    GamePhaseRuntime_GetActorCollection(*UNK_0200e0e4,1);
    ActorCollection_GetSpriteOwner();
    func_02074154();
    func_020745c4(*UNK_0200e0f0,0);
  }
  piVar1 = UNK_0200e0e4;
  iVar5 = param_1[0xb];
  if (iVar5 == 1) {
    if ((uint)(*(int *)(*(int *)(*UNK_0200e0e4 + 0x30bc) + 0x40) << 0xc) >> 0x1e != 2)
    goto code_r0x0200d2f0;
    GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4,1);
  }
  else if (iVar5 != 0x12 && iVar5 != 0x17) {
code_r0x0200d2f0:
    *UNK_0200e0f8 = 0;
    GamePhaseRuntime_SetPlacementMode(*piVar1,0,1);
    GamePhaseAreaScene_SetEnabled(*(undefined4 *)(*UNK_0200e0e4 + 0x2fb8),0);
    func_020745c4(*UNK_0200e0fc,0);
    GamePhaseCurrencyHud_SetVisible(*UNK_0200e0f4,0);
  }
  switch(param_1[0xb]) {
  case 0:
  default:
code_r0x0200d3bc:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e100);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e104);
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e108);
    iVar5 = func_02003e14(UNK_0200e10c,UNK_0200e110,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov013_021fce2c();
    }
    param_1[9] = iVar5;
    break;
  case 1:
    goto code_r0x0200d3bc;
  case 2:
    iVar5 = func_02003e14(0x88,UNK_0200e118,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_02068444();
    }
    param_1[9] = iVar5;
    break;
  case 3:
    func_02001944(*UNK_0200e11c,UNK_0200e120);
    func_0200199c(*UNK_0200e11c,0x388);
    iVar5 = func_02003e14(0x88,UNK_0200e118,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_02068444();
    }
    param_1[9] = iVar5;
    break;
  case 4:
    func_0200199c(*UNK_0200e11c,UNK_0200e120);
    func_02001944(*UNK_0200e11c,0x388);
    iVar5 = func_02003e14(0x88,UNK_0200e118,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_02068444();
    }
    param_1[9] = iVar5;
    break;
  case 5:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e124);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e128);
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e12c);
    iVar5 = func_02003e14(0x240,UNK_0200e130,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov044_0220be60();
    }
    param_1[9] = iVar5;
    break;
  case 6:
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e134);
    iVar5 = func_02003e14(0x2f8,UNK_0200e138,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov043_0220b76c();
    }
    param_1[9] = iVar5;
    break;
  case 7:
    goto code_r0x0200d3bc;
  case 8:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e13c);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e140);
    func_02008570(*UNK_0200e0e4,0,1);
    GamePhaseRuntime_SetPlacementMode(*UNK_0200e0e4,2,0);
    GamePhaseAreaScene_SetEnabled(*(undefined4 *)(*UNK_0200e0e4 + 0x2fb8),1);
    GamePhaseState_SetEnabled(*UNK_0200e0e4 + 0x24,1);
    iVar5 = func_02003e14(UNK_0200e144,UNK_0200e148,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov018_021fcf68(iVar5,param_1[0xc]);
    }
    param_1[9] = iVar5;
    break;
  case 9:
    goto code_r0x0200d3bc;
  case 10:
    goto code_r0x0200d5d8;
  case 0xb:
    if (param_1[0xc] == 7) {
      OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e100);
      OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e168);
      iVar5 = func_02003e14(0x394,UNK_0200e16c,4,UNK_0200e114);
      if (iVar5 != 0) {
        iVar5 = func_ov022_021fdd44();
      }
      param_1[9] = iVar5;
    }
    else {
      OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e158);
      OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e15c);
      iVar5 = func_02003e14(UNK_0200e160,UNK_0200e164,4,UNK_0200e114);
      if (iVar5 != 0) {
        iVar5 = func_ov021_021fd7e8(iVar5,param_1[0xc]);
      }
      param_1[9] = iVar5;
    }
    break;
  case 0xc:
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e170);
    iVar5 = func_02003e14(0x1e8,UNK_0200e174,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov020_021fd844();
    }
    param_1[9] = iVar5;
    break;
  case 0xd:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e180);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e100);
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e184);
    iVar5 = func_02003e14(0x2f8,UNK_0200e188,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov013_021fce2c();
    }
    param_1[9] = iVar5;
    break;
  case 0xe:
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e18c);
    iVar5 = func_02003e14(UNK_0200e190,UNK_0200e194,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov016_021fe77c(iVar5,2,(int)*(short *)(*UNK_0200e11c + 0x206));
    }
    param_1[9] = iVar5;
    break;
  case 0xf:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e158);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e198);
    iVar5 = func_02003e14(UNK_0200e19c,UNK_0200e1a0,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov018_021fd9f8();
    }
    param_1[9] = iVar5;
    break;
  case 0x10:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e1a4);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1a8);
    iVar5 = func_02003e14(UNK_0200e1ac,UNK_0200e1b0,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov025_021ff27c();
    }
    param_1[9] = iVar5;
    break;
  case 0x11:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1b8);
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e1bc);
    iVar5 = func_02003e14(100,UNK_0200e1c0,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov004_021fc944(iVar5,param_1[0xc]);
    }
    param_1[9] = iVar5;
    break;
  case 0x12:
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1c4);
    iVar5 = func_02003e14(0x29c,UNK_0200e1c8,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov028_021fdb00();
    }
    param_1[9] = iVar5;
    break;
  case 0x13:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e14c);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e158);
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e1cc);
    iVar5 = func_02003e14(0x104,UNK_0200e1d0,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov009_021fce74(iVar5,param_1[0xc]);
    }
    param_1[9] = iVar5;
    break;
  case 0x14:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1d4);
    iVar5 = func_02003e14(0x5e0,UNK_0200e1d8,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov027_021fda30();
    }
    param_1[9] = iVar5;
    break;
  case 0x15:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e14c);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e158);
    OverlaySlot_LoadOverlay(param_1 + 0x23,UNK_0200e1dc);
    iVar5 = func_02003e14(0x398,UNK_0200e1e0,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov017_021fda3c();
    }
    param_1[9] = iVar5;
    break;
  case 0x16:
    iVar5 = param_1[0xc];
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
            OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e1b4);
            OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1ec);
            iVar5 = func_02003e14(0x4c0,UNK_0200e1f0,4,UNK_0200e114);
            if (iVar5 != 0) {
              iVar5 = func_ov036_022045d4(iVar5,param_1[0xc]);
            }
            param_1[9] = iVar5;
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
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1f4);
    iVar5 = func_02003e14(0x4c0,UNK_0200e1f0,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov035_02202378(iVar5,param_1[0xc]);
    }
    param_1[9] = iVar5;
    break;
  case 0x17:
code_r0x0200d5d8:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e14c);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e150);
    iVar5 = func_02003e14(100,UNK_0200e154,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov019_021fce28(iVar5,param_1[0xc]);
    }
    param_1[9] = iVar5;
    break;
  case 0x18:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e1b4);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e1f8);
    iVar5 = func_02003e14(UNK_0200e1fc,UNK_0200e200,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov037_021fe4fc(iVar5,param_1[0xc]);
    }
    param_1[9] = iVar5;
    break;
  case 0x19:
    OverlaySlot_LoadOverlay(param_1 + 0x1d,UNK_0200e100);
    OverlaySlot_LoadOverlay(param_1 + 0x20,UNK_0200e178);
    iVar5 = func_02003e14(0x368,UNK_0200e17c,4,UNK_0200e114);
    if (iVar5 != 0) {
      iVar5 = func_ov013_021fce2c();
    }
    param_1[9] = iVar5;
  }
  param_1[0xe] = 1;
  GX_VBlankIntr(uVar3);
  param_1[10] = param_1[10] + 1;
LAB_0200e3bc:
  return 0;
}
