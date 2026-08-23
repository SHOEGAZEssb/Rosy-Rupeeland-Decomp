#include "tingle/types.h"

/* Overlay 59 owns the dungeon-map floor selector: its tiled floor previews,
 * touch regions, scroll transition, actor-backed map display, and scene state.
 */
#define F(t, b, o) (*(t *)((u8 *)(b) + (o)))
typedef void (*Overlay59Callback)(void *, s32);
typedef void (*Overlay59SceneCallback)(void *);
typedef void (*Overlay59RuntimeCallback)(void *, s32, s32, void *, s32);

extern u8 data_ov059_02211ac0[], data_ov059_02211ac8[];
extern u8 data_ov059_02211af8[], data_ov059_02211b08[];
extern u8 data_ov059_02211b5c[], data_ov059_02211b7c[];
extern char data_ov059_02211ba8[], data_ov059_02211bb0[];
extern void *gHeapContext, *gDebugFont, *gSceneManager, *gLupyContext;
extern void *data_020f4e18, *data_021052fc, *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(...), *func_02003e20(...);
extern void Heap_Free(...), Scene_Init(...), Scene_Destroy(...);
extern void Scene_SetFlags03(...), Scene_ClearFlags03(...);
extern void *Scene_GetEmbedded10(...);
extern void SceneManager_SetUpdateEnabled(...);
extern void *OverlayManager_GetGlobal(...);
extern void OverlayManager_UnloadOverlay(...);
extern void DisplayBrightness_StartMainTransition(...);
extern void DisplayBrightness_StartSubTransition(...);
extern s32 DisplayBrightness_IsSubTransitionIncreasing(...);
extern s32 DisplayBrightness_IsSubTransitionDecreasing(...);
extern void TouchRegion_Init(...), func_02004b54(...);
extern void TouchRegion_BeginPress(...), TouchRegion_EndPress(...);
extern void TouchRegion_Tick(...), TouchRegionManager_Allocate(...);
extern void TouchRegionManager_Add(...), TouchRegionManager_Tick(...);
extern void TouchRegionManager_SetEnabled(...),
    TouchRegionManager_NotifyAll(...);
extern void VecFx32Object_InitComponents(...), VecFx32Object_InitCopy(...);
extern void VecFx32Object_Destroy(...);
extern void DebugSpriteText_Init(...), DebugSpriteText_Destroy(...);
extern void DebugSpriteText_SetTextResource(...),
    DebugSpriteText_DrawCentered(...);
extern void SplineMover_Init(...), SplineMover_Destroy(...);
extern void SplineMover_InitTransition(...), SplineMover_Assign(...);
extern s32 SplineMover_Update(...);
extern void SplineMover_Evaluate2D(...);
extern void GamePhaseRuntime_PrepareActorCollections(...);
extern void *GamePhaseRuntime_GetActorCollection(...);
extern void GamePhaseRuntime_CreateSecondaryActorSubsystem(...);
extern void GamePhaseRuntime_DestroySecondaryActorSubsystem(...);
extern void GamePhaseRuntime_ApplyScreenMode(...);
extern void GamePhaseRuntime_UpdateActorPresentationState(...);
extern void func_02008f2c(...), GamePhaseState_UpdateRenderHelpers(...);
extern void GamePhaseCurrencyHud_SetVisible(...);
extern void GamePhaseRegionTable_Init(...), GamePhaseRegionTable_Destroy(...);
extern void GamePhaseRegionTable_Load(...);
extern s32 GamePhaseRegionTable_GetRegionCount(...);
extern void *GamePhaseRegionTable_GetRegion(...);
extern s32 GamePhaseRegionTable_IsRegionRevealed(...);
extern void GamePhaseRegionTable_SetRevealFlagBase(void *, s32);
extern void *GamePhaseAreaScene_GetConfig(...);
extern void GamePhaseAreaScene_ApplyRevealedRegions(...);
extern void *GamePhaseMetadata_GetByIndex(...);
extern s32 GamePhaseMetadata_GetTextResourceId(...);
extern void *GamePhaseVariantMetadata_GetForPhase(...);
extern void ActorCollection_SetEnabled(...);
extern void *ActorCollection_GetSpriteGroup(...);
extern void ActorCollection_SetActorScale(...);
extern void *Actor_RebuildPrimaryAttachment(...);
extern void Sound_Play(...), func_020706c4(...), func_02070bc4(...);
extern void func_02070eac(...), func_02070f34(...);
extern void AnimationResourceState_InitEmbedded(...);
extern void AnimationResourceState_Destroy(...);
extern void AnimationResourceState_ReleaseResources(...);
extern void GraphicsResourceSet_Init(...), GraphicsResourceSet_Destroy(...);
extern void GraphicsResourceSet_Load(...), func_02071ee0(...);
extern void GraphicsSpriteState_SetAnimationIndex(...);
extern void *GraphicsSpriteGroup_CreateState(...);
extern void GraphicsSpriteGroup_Clear(...);
extern void GraphicsSpriteGroup_AdvanceAnimations(...);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(...);
extern void *GraphicsSpriteGroupOwner_CreateGroup(...);
extern void GraphicsSpriteGroupOwner_DestroyGroup(...);
extern void GraphicsSpriteRenderer_ClearTextBuffer(...);
extern void *func_020adc90(...), *func_020af9e0(...), *func_020afaec(...);
extern void *func_020afbf8(...);
extern void func_020b44e8(...), func_020b57d4(...);
extern s32 func_020befec(...);
extern void *func_020c09cc(...), *__construct_array(...);
extern void __destroy_arr(...), func_020c0c24(...);
#ifdef __cplusplus
}
#endif

void *func_ov059_0220fd20(void *);
void *func_ov059_0220fd64(void *);
void func_ov059_0220fd80(void *, void *, s32, s32, s32, s32);
void func_ov059_02210114(void *);
void func_ov059_02210178(void *, s32);
void func_ov059_022101b0(void *, void *);
s32 func_ov059_0221026c(const void *);
void func_ov059_02210284(void *);
void func_ov059_022102ac(void *, s32, s32, s32, s32);
void func_ov059_02210308(void *);
void func_ov059_022104f0(void *, s32, s32);
void func_ov059_02210508(void *, s32, s32);
void *func_ov059_02210554(void *, s32, const void *);
void func_ov059_022105a8(void *, void *, s32, s32);
s32 func_ov059_02210600(const void *), func_ov059_02210620(const void *);
void func_ov059_0221067c(void *, s16, s16);
void *func_ov059_022106fc(void *, void *, s32, s32);
void func_ov059_02210950(void *, s16, s16, s16, s16);
void *func_ov059_02210968(void *);
s32 func_ov059_022109bc(const void *, s32);
void *func_ov059_022109f0(void *, void *);
void *func_ov059_02210a2c(void *, s32);
void func_ov059_02210ab0(void *), func_ov059_02210b24(void *, s32);
void func_ov059_02210cf8(void *, s32), func_ov059_02210cb8(void *, s32);
s32 func_ov059_02210d90(void *, s32);
void func_ov059_02210db0(void *, s32, s32);
void func_ov059_02210dfc(void *, s32), func_ov059_02210f34(void *, s32);
void func_ov059_02210c24(void *, s32), func_ov059_02210c60(void *, s32);
void func_ov059_02211854(s32), func_ov059_02211920(void *, s32);
s32 func_ov059_022119e4(void *, s32);
void func_ov059_02211a14(void *, s32, s32);

/* Initialize and destroy one 0x70-byte floor-preview record. */
void *func_ov059_0220fd20(void *p) {
  s32 i;
  F(void *, p, 0) = 0;
  AnimationResourceState_InitEmbedded((u8 *)p + 0x44);
  for (i = 0; i < 8; i++)
    F(s32, p, 0x50 + i * 4) = 0;
  return p;
}
void *func_ov059_0220fd64(void *p) {
  func_ov059_02210114(p);
  AnimationResourceState_Destroy((u8 *)p + 0x44);
  return p;
}

/* Set the sub-engine extended-map base for BG0, BG1, or BG2. */
void func_ov059_022100c0(u16 v) {
  volatile u16 *r = (volatile u16 *)0x0400100a;
  *r = (*r & 0xfffc) | v;
}
void func_ov059_022100dc(u16 v) {
  volatile u16 *r = (volatile u16 *)0x0400100c;
  *r = (*r & 0xfffc) | v;
}
void func_ov059_022100f8(u16 v) {
  volatile u16 *r = (volatile u16 *)0x0400100e;
  *r = (*r & 0xfffc) | v;
}

/* Release a preview's sprite group and resource state. */
void func_ov059_02210114(void *p) {
  if (F(void *, p, 0)) {
    GraphicsSpriteGroup_Clear(F(void *, p, 0));
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, F(void *, p, 0));
    F(void *, p, 0) = 0;
  }
  AnimationResourceState_ReleaseResources((u8 *)p + 0x44);
  F(s32, p, 0x50) = F(s32, p, 0x54) = F(s32, p, 0x58) = F(s32, p, 0x5c) = 0;
  F(s32, p, 0x60) = F(s32, p, 0x64) = F(s32, p, 0x68) = F(s32, p, 0x6c) = 0;
}

/* Toggle every sprite in a preview group. */
void func_ov059_02210178(void *p, s32 visible) {
  F(s32, p, 0x5c) = visible;
  if (!F(void *, p, 0))
    return;
  if (!visible)
    GraphicsSpriteGroup_ReleaseIndexedEntries(F(void *, p, 0));
  else
    F(s32, F(void *, p, 0), 0x20) = 1;
  GraphicsSpriteGroup_AdvanceAnimations(F(void *, p, 0));
}

/* Return a region rectangle's vertical extent. */
s32 func_ov059_0221026c(const void *r) {
  return (s32)F(s16, r, 6) - F(s16, r, 2);
}

/* Hide the preview's complete four-by-four sprite grid. */
void func_ov059_02210284(void *p) {
  s32 i;
  for (i = 0; i < 16; i++)
    F(u16, F(void *, p, 4 + i * 4), 0x24) |= 4;
}

/* Hide a rectangle within the four-by-four sprite grid. */
void func_ov059_022102ac(void *p, s32 x, s32 y, s32 w, s32 h) {
  s32 i, j;
  for (j = 0; j < h; j++)
    for (i = 0; i < w; i++)
      F(u16, F(void *, p, 4 + x * 4 + (y + j) * 16 + i * 4), 0x24) |= 4;
}

/* Hide preview cover cells over rectangles that have already been revealed. */
void func_ov059_022101b0(void *p, void *regions) {
  s32 i, n = GamePhaseRegionTable_GetRegionCount(regions);
  for (i = 0; i < n; i++) {
    const void *r = GamePhaseRegionTable_GetRegion(regions, i);
    s32 x = F(s16, r, 0) / 0x100, y = func_020befec(F(s16, r, 2), 0xc0);
    s32 w = ((s32)F(s16, r, 4) - F(s16, r, 0)) / 0x100;
    s32 h = func_020befec(func_ov059_0221026c(r), 0xc0);
    if (GamePhaseRegionTable_IsRegionRevealed(regions, i))
      func_ov059_022102ac(p, x, y, w, h);
  }
}

/* Build the sprite grid and mapped-background resources for one floor. */
void func_ov059_0220fd80(void *p, void *cfg, s32 bg, s32 priority,
                         s32 screenBase, s32 regionId) {
  u8 resources[16], regions[16];
  s32 row, col;
  volatile u32 *disp = (volatile u32 *)0x04001000;
  GraphicsResourceSet_Init(resources);
  F(s32, p, 0x54) = bg;
  GraphicsResourceSet_Load(resources, data_020f4e18, F(u16, cfg, 0x0c),
                           F(u16, cfg, 0x0e), F(u16, cfg, 0x10));
  F(s32, p, 0x58) = 2;
  if (bg >= 1 && bg <= 3) {
    u32 bit = 1u << bg;
    u16 *cnt = (u16 *)(0x04001008 + bg * 2);
    void *vram = bg == 1   ? func_020afbf8()
                 : bg == 2 ? func_020afaec()
                           : func_020af9e0();
    *disp = (*disp & ~0x1f00u) | (((*disp >> 8) & 0x1f & ~bit) << 8);
    *cnt = (*cnt & 0x43) | 0x8000 | (screenBase << 8) | (priority << 2);
    if (bg == 1)
      func_ov059_022100c0(2);
    else if (bg == 2)
      func_ov059_022100dc(2);
    else
      func_ov059_022100f8(2);
    *(volatile u32 *)(0x04001010 + bg * 4) = 0x01d301e8;
    func_020b57d4(0, vram, 0x1000);
  }
  func_02070f34(F(void *, resources, 8), regionId);
  func_020b44e8();
  func_020706c4(F(void *, resources, 0), bg, 0);
  func_02070eac(F(void *, resources, 8), bg, 0);
  func_02070bc4(F(void *, resources, 4), regionId << 5);
  func_02071ee0((u8 *)p + 0x44, data_020f4e18, 0x30c0, 0x30c1, 0x30c2);
  F(void *, p, 0) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
  for (row = 0; row < 4; row++)
    for (col = 0; col < 4; col++) {
      void *s = GraphicsSpriteGroup_CreateState(
          F(void *, p, 0), F(void *, p, 0x44), F(void *, p, 0x48),
          F(void *, p, 0x4c), 2);
      F(void *, p, 4 + (row * 4 + col) * 4) = s;
      F(s16, s, 0x2c) = (s16)(col * 40);
      F(s16, s, 0x2e) = (s16)(row * 30);
      F(u8, s, 0x3a) = 2;
    }
  F(s32, F(void *, p, 0), 0x18) = 0x2c;
  F(s32, F(void *, p, 0), 0x1c) = 0x3c;
  func_ov059_02210178(p, 0);
  GamePhaseRegionTable_Init(regions);
  GamePhaseRegionTable_Load(regions, F(void *, cfg, 4));
  GamePhaseRegionTable_SetRevealFlagBase(regions, F(s32, cfg, 0x48));
  func_ov059_022101b0(p, regions);
  if (GamePhaseRegionTable_GetRegionCount(regions) < 1)
    func_ov059_02210284(p);
  GamePhaseRegionTable_Destroy(regions);
  GraphicsResourceSet_Destroy(resources);
}

/* Publish a preview's BG visibility, scroll, and map-base state. */
void func_ov059_02210308(void *p) {
  s32 bg = F(s32, p, 0x54), visible = F(s32, p, 0x5c);
  volatile u32 *disp = (volatile u32 *)0x04001000;
  u32 bit;
  if (bg < 1 || bg > 3)
    return;
  bit = 1u << bg;
  *disp =
      (*disp & ~0x1f00u) |
      (((((*disp >> 8) & 0x1f) & (visible ? ~0u : ~bit)) | (visible ? bit : 0))
       << 8);
  *(volatile u32 *)(0x04001010 + bg * 4) =
      ((u32)(-F(s32, p, 0x68) - 0x18) & 0x1ff) |
      (((u32)(-F(s32, p, 0x6c) - 0x2d) & 0x1ff) << 16);
  if (bg == 1)
    func_ov059_022100c0((u16)F(s32, p, 0x58));
  else if (bg == 2)
    func_ov059_022100dc((u16)F(s32, p, 0x58));
  else
    func_ov059_022100f8((u16)F(s32, p, 0x58));
}

/* Update the preview group's display-relative offset. */
void func_ov059_02210508(void *p, s32 x, s32 y) {
  F(s32, p, 0x68) = F(s32, p, 0x60) - x;
  F(s32, p, 0x6c) = F(s32, p, 0x64) - y;
  if (F(void *, p, 0)) {
    F(s32, F(void *, p, 0), 0x18) = F(s32, p, 0x68) + 0x2c;
    F(s32, F(void *, p, 0), 0x1c) = F(s32, p, 0x6c) + 0x3c;
    GraphicsSpriteGroup_AdvanceAnimations(F(void *, p, 0));
  }
}

/* Set a preview's world offset and immediately apply it. */
void func_ov059_022104f0(void *p, s32 x, s32 y) {
  F(s32, p, 0x60) = x;
  F(s32, p, 0x64) = y;
  func_ov059_02210508(p, x, y);
}

/* Construct and destroy the rectangular touch region used by floor buttons. */
void *func_ov059_02210554(void *r, s32 id, const void *bounds) {
  TouchRegion_Init(r, id, bounds, 1);
  F(const void *, r, 0) = data_ov059_02211b5c;
  return r;
}
void *func_ov059_02210578(void *r) {
  func_02004b54(r);
  return r;
}
void *func_ov059_0221058c(void *r) {
  func_02004b54(r);
  Heap_Free(r);
  return r;
}

/* Center-coordinate helpers for a touch rectangle. */
s32 func_ov059_02210600(const void *r) {
  return F(s16, r, 0) + ((s32)F(s16, r, 4) - F(s16, r, 0)) / 2;
}
s32 func_ov059_02210620(const void *r) {
  return F(s16, r, 2) + func_ov059_0221026c(r) / 2;
}

/* Bind a touch rectangle to a sprite and its normal/pressed animations. */
void func_ov059_022105a8(void *r, void *sprite, s32 normal, s32 pressed) {
  F(void *, r, 0x1c) = sprite;
  F(s32, r, 0x20) = normal;
  F(s32, r, 0x24) = pressed;
  GraphicsSpriteState_SetAnimationIndex(sprite, normal);
  F(s16, sprite, 0x2c) = (s16)func_ov059_02210600((u8 *)r + 0x14);
  F(s16, sprite, 0x2e) = (s16)func_ov059_02210620((u8 *)r + 0x14);
  F(u16, sprite, 0x24) |= 2;
}
void func_ov059_0221063c(void *r) {
  TouchRegion_BeginPress(r);
  GraphicsSpriteState_SetAnimationIndex(F(void *, r, 0x1c), F(u8, r, 0x24));
}
void func_ov059_0221065c(void *r) {
  TouchRegion_EndPress(r);
  GraphicsSpriteState_SetAnimationIndex(F(void *, r, 0x1c), F(u8, r, 0x20));
}

/* Move a touch rectangle and bound sprite while preserving its size. */
void func_ov059_0221067c(void *r, s16 x, s16 y) {
  s16 ox = F(s16, r, 0x14), oy = F(s16, r, 0x16);
  F(s16, r, 0x14) = x;
  F(s16, r, 0x18) += x - ox;
  F(s16, r, 0x16) = y;
  F(s16, r, 0x1a) += y - oy;
  F(s16, F(void *, r, 0x1c), 0x2c) = (s16)func_ov059_02210600((u8 *)r + 0x14);
  F(s16, F(void *, r, 0x1c), 0x2e) = (s16)func_ov059_02210620((u8 *)r + 0x14);
}
void func_ov059_022106f0(void *r) { TouchRegion_Tick(r); }

/* Store a four-edge touch rectangle. */
void func_ov059_02210950(void *r, s16 l, s16 t, s16 rr, s16 b) {
  F(s16, r, 0) = l;
  F(s16, r, 2) = t;
  F(s16, r, 4) = rr;
  F(s16, r, 6) = b;
}

/* Construct the three-button touch/sprite controller. */
void *func_ov059_022106fc(void *c, void *scene, s32 x, s32 y) {
  u8 bounds[8];
  s32 i;
  static const s32 ids[3] = {100, 101, 102};
  static const s32 anim[3][2] = {{10, 11}, {12, 13}, {58, 58}};
  static const s32 dy[3] = {-0x30, 0x10, 0x30};
  __construct_array((u8 *)c + 4, 2, 0x0c, AnimationResourceState_InitEmbedded,
                    AnimationResourceState_Destroy);
  func_02071ee0((u8 *)c + 4, data_020f4e18, 3, 1, 4);
  F(void *, c, 0) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
  TouchRegionManager_Allocate(Scene_GetEmbedded10(scene), 3);
  for (i = 0; i < 3; i++) {
    void *r, *s;
    func_ov059_02210950(bounds, 0, 0, 0x30, 0x10);
    r = Heap_Alloc(0x28, data_ov059_02211ba8, 4, gHeapContext);
    if (r)
      func_ov059_02210554(r, ids[i], bounds);
    TouchRegionManager_Add(Scene_GetEmbedded10(scene), r);
    s = GraphicsSpriteGroup_CreateState(
        F(void *, c, 0), F(void *, c, i < 2 ? 4 : 0x10),
        F(void *, c, i < 2 ? 8 : 0x14), F(void *, c, i < 2 ? 0x0c : 0x18), 1);
    F(u16, s, 0x24) &= 0xfff7;
    func_ov059_022105a8(r, s, anim[i][0], anim[i][1]);
    func_ov059_0221067c(r, (s16)(x - 0x18), (s16)(y + dy[i]));
  }
  return c;
}

/* Destroy the button controller and animation resource records. */
void *func_ov059_02210968(void *c) {
  GraphicsSpriteGroup_Clear(F(void *, c, 0));
  GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, F(void *, c, 0));
  AnimationResourceState_ReleaseResources((u8 *)c + 4);
  AnimationResourceState_ReleaseResources((u8 *)c + 0x10);
  __destroy_arr((u8 *)c + 4, 2, 0x0c, AnimationResourceState_Destroy);
  return c;
}

/* Find a phase ID in the variant metadata's floor list. */
s32 func_ov059_022109bc(const void *m, s32 id) {
  s32 i;
  for (i = 0; i < F(s16, m, 0); i++)
    if (F(s16, m, 8 + i * 2) == id)
      return i;
  return -1;
}

/* Allocate, resize, and destroy arrays of floor-preview records. */
void *func_ov059_02210a2c(void *a, s32 n) {
  void *p = 0;
  if (n) {
    p = func_02003e20(n * 0x70 + 8, data_ov059_02211ac0, 4, gHeapContext);
    if (p)
      p = func_020c09cc(p, n, 0x70, 8, func_ov059_0220fd20,
                        func_ov059_0220fd64);
  }
  F(void *, a, 0) = p;
  F(s32, a, 4) = n;
  return a;
}
void func_ov059_02210ab0(void *a) {
  s32 i;
  void *p = F(void *, a, 0);
  if (p) {
    for (i = 0; i < F(s32, a, 4); i++)
      func_ov059_0220fd64((u8 *)p + i * 0x70);
    func_020c0c24(p, 0x70, 8, func_ov059_0220fd64);
  }
  F(void *, a, 0) = 0;
  F(s32, a, 4) = 0;
}
void func_ov059_02210b24(void *a, s32 n) {
  void *p;
  if (F(void *, a, 0))
    func_ov059_02210ab0(a);
  p = func_02003e20(n * 0x70 + 8, data_ov059_02211ac8, 4, gHeapContext);
  if (p)
    p = func_020c09cc(p, n, 0x70, 8, func_ov059_0220fd20, func_ov059_0220fd64);
  F(void *, a, 0) = p;
  F(s32, a, 4) = n;
}
void *func_ov059_02210ba4(void *a) {
  if (F(void *, a, 0))
    func_ov059_02210ab0(a);
  return a;
}

/* Construct the floor collection around variant metadata. */
void *func_ov059_022109f0(void *c, void *meta) {
  func_ov059_02210a2c(c, 0);
  F(void *, c, 8) = meta;
  F(s32, c, 0x0c) = F(s32, c, 0x10) = 0;
  func_ov059_02210b24(c, F(s16, meta, 0));
  return c;
}

/* Apply all floor backgrounds and the shared sub-screen scroll. */
void func_ov059_02210bc4(void *c) {
  s32 i;
  for (i = 0; i < F(s32, c, 4); i++)
    func_ov059_02210308((u8 *)F(void *, c, 0) + i * 0x70);
  *(volatile u32 *)0x0400101c =
      (F(u32, c, 0x0c) & 0x1ff) | ((F(u32, c, 0x10) & 0x1ff) << 16);
}

/* Set visibility for every preview and unload one leaving the working set. */
void func_ov059_02210c24(void *c, s32 visible) {
  s32 i;
  for (i = 0; i < F(s32, c, 4); i++)
    func_ov059_02210178((u8 *)F(void *, c, 0) + i * 0x70, visible);
}
void func_ov059_02210cb8(void *c, s32 i) {
  if (i >= 0 && i < F(s16, F(void *, c, 8), 0) &&
      F(void *, (u8 *)F(void *, c, 0) + i * 0x70, 0))
    func_ov059_02210114((u8 *)F(void *, c, 0) + i * 0x70);
}

/* Select one of three rotating sub backgrounds for a floor index. */
s32 func_ov059_02210d90(void *c, s32 i) {
  s32 r = i % 3;
  (void)c;
  if (r < 0)
    r += 3;
  return r + 1;
}

/* Lazily load one floor preview from phase metadata. */
void func_ov059_02210cf8(void *c, s32 i) {
  void *meta, *p;
  s32 layer;
  if (i < 0 || i >= F(s16, F(void *, c, 8), 0))
    return;
  meta = GamePhaseMetadata_GetByIndex(F(s16, F(void *, c, 8), 8 + i * 2) - 1);
  layer = func_ov059_02210d90(c, i);
  p = (u8 *)F(void *, c, 0) + i * 0x70;
  func_ov059_0220fd80(p, meta, layer, ((s32 *)data_ov059_02211af8)[layer],
                      ((s32 *)data_ov059_02211b08)[layer], layer);
  func_ov059_022104f0(p, 0, i << 7);
}

/* Shift every preview against the current scene scroll. */
void func_ov059_02210db0(void *c, s32 x, s32 y) {
  s32 i;
  F(s32, c, 0x0c) = x;
  F(s32, c, 0x10) = y;
  for (i = 0; i < F(s32, c, 4); i++)
    func_ov059_02210508((u8 *)F(void *, c, 0) + i * 0x70, x, y);
}

/* Enable current/adjacent previews and label the current floor. */
void func_ov059_02210c60(void *c, s32 floor) {
  s32 i;
  for (i = floor - 1; i <= floor + 1; i++)
    if (i >= 0)
      func_ov059_02210cf8(c, i);
  func_ov059_02210dfc(c, floor);
  func_ov059_02210f34(c, 1);
}

/* Toggle the actor collection that renders the selected dungeon floor. */
void func_ov059_02210f34(void *c, s32 enabled) {
  s32 i;
  void *collection = GamePhaseRuntime_GetActorCollection(data_021052fc, 2);
  (void)c;
  ActorCollection_SetEnabled(collection, enabled);
  for (i = 0; i < F(s32, collection, 0x2e74); i++) {
    void *actor = F(void **, collection, 0)[i];
    if (actor) {
      Overlay59Callback set = F(Overlay59Callback, F(void *, actor, 0), 0x54);
      if (F(u32, actor, 0x14) & 0x80000) {
        F(u32, actor, 0x10) |= 0x04000000;
        set(actor, enabled);
      } else
        set(actor, 0);
    }
  }
  F(u32, F(void *, F(void *, data_021052fc, 0x2fb8), 0x2ebc), 0x10) &=
      ~0x04000000u;
}

/* Rebuild the actor-backed map for a selected floor. */
void func_ov059_02210dfc(void *c, s32 floor) {
  void *runtime = data_021052fc, *meta, *collection, *actor;
  s32 phase, current;
  GamePhaseRuntime_DestroySecondaryActorSubsystem(runtime);
  phase = F(s16, F(void *, c, 8), 8 + floor * 2);
  meta = GamePhaseMetadata_GetByIndex(phase - 1);
  GamePhaseRuntime_CreateSecondaryActorSubsystem(runtime, meta, 0);
  collection = GamePhaseRuntime_GetActorCollection(runtime, 2);
  ActorCollection_SetActorScale(collection,
                                func_020adc90(0x1000, data_ov059_02211ac0));
  F(s32, ActorCollection_GetSpriteGroup(collection), 0x18) = 8;
  F(s32, ActorCollection_GetSpriteGroup(collection), 0x1c) = 0;
  func_ov059_02210f34(c, 0);
  current = F(s32, F(void *, runtime, 0x30bc), 0);
  actor = Actor_RebuildPrimaryAttachment(
      F(void *, F(void *, runtime, 0x2fb8), 0x2ebc),
      phase == current ? 0x138a : 0x30d3, phase == current ? 0x1078 : 0x30d4,
      phase == current ? 0x138b : 0x30d5, 2);
  GraphicsSpriteState_SetAnimationIndex(actor, phase == current ? 0x1d : 0);
  F(u16, actor, 0x24) |= 2;
}

/* Initialize scene-owned menu state and floor/button controllers. */
void *func_ov059_02210fec(void *s, void *phase) {
  void *meta;
  s32 selected;
  Scene_Init(s);
  F(const void *, s, 0) = data_ov059_02211b7c;
  F(s32, s, 0x24) = 0;
  F(s32, s, 0x28) = F(s32, s, 0x2c) = 0;
  F(s32, s, 0x34) = F(s32, s, 0x38) = 0;
  DebugSpriteText_Init((u8 *)s + 0x40);
  F(s32, s, 0x48) = 0;
  F(s32, s, 0x4c) = -1;
  F(s32, s, 0x50) = 0;
  SplineMover_Init((u8 *)s + 0x54);
  meta = GamePhaseVariantMetadata_GetForPhase(phase);
  F(void *, s, 0x30) = meta;
  selected = func_ov059_022109bc(meta, F(s32, phase, 0));
  F(s32, s, 0x28) = selected;
  F(s32, s, 0x50) = selected << 7;
  F(s32, s, 0x2c) = F(s16, meta, 0);
  F(void *, s, 0x3c) = Heap_Alloc(0x14, data_ov059_02211bb0, 4, gHeapContext);
  if (F(void *, s, 0x3c))
    func_ov059_022109f0(F(void *, s, 0x3c), meta);
  F(void *, s, 0x48) = Heap_Alloc(0x1c, data_ov059_02211ba8, 4, gHeapContext);
  if (F(void *, s, 0x48))
    func_ov059_022106fc(F(void *, s, 0x48), s, 0xe4, 0x60);
  TouchRegionManager_SetEnabled(Scene_GetEmbedded10(s), 0);
  TouchRegionManager_NotifyAll(Scene_GetEmbedded10(s), 0);
  TouchRegionManager_Tick(Scene_GetEmbedded10(s));
  GamePhaseCurrencyHud_SetVisible(gLupyContext, 0);
  SceneManager_SetUpdateEnabled(gSceneManager, 1);
  return s;
}

/* Destroy a scene's preview, button, spline, text, and base resources. */
void *func_ov059_02211134(void *s) {
  F(const void *, s, 0) = data_ov059_02211b7c;
  GamePhaseCurrencyHud_SetVisible(gLupyContext, 1);
  if (F(void *, s, 0x3c)) {
    func_ov059_02210ba4(F(void *, s, 0x3c));
    Heap_Free(F(void *, s, 0x3c));
  }
  if (F(void *, s, 0x48)) {
    func_ov059_02210968(F(void *, s, 0x48));
    Heap_Free(F(void *, s, 0x48));
  }
  OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
  SceneManager_SetUpdateEnabled(gSceneManager, 0);
  SplineMover_Destroy((u8 *)s + 0x54);
  DebugSpriteText_Destroy((u8 *)s + 0x40);
  Scene_Destroy(s);
  return s;
}
void *func_ov059_022111d4(void *s) {
  func_ov059_02211134(s);
  Heap_Free(s);
  return s;
}

/* Forward the scene's terminal virtual callback. */
void func_ov059_0221127c(void) {
  Overlay59SceneCallback cb =
      F(Overlay59SceneCallback, F(void *, data_021052fc, 0), 0x10);
  cb(data_021052fc);
}

/* Commit one frame of preview backgrounds and actor presentation. */
s32 func_ov059_0221129c(void *s) {
  if (F(s32, s, 0x38)) {
    volatile u32 *disp = (volatile u32 *)0x04001000;
    F(s32, s, 0x38) = 0;
    *disp = (*disp & ~0x1f00u) |
            (((((*disp >> 8) & 0x1f) & ~1u) | (F(s32, s, 0x34) ? 1 : 0)) << 8);
  }
  func_ov059_02210bc4(F(void *, s, 0x3c));
  GamePhaseState_UpdateRenderHelpers((u8 *)data_021052fc + 0x24);
  return 0;
}

/* Toggle the sub-engine BG0 extended palette. */
void func_ov059_02211854(s32 on) {
  volatile u16 *r = (volatile u16 *)0x04001008;
  *r = (*r & 0x7fff) | (on << 15);
}

/* Configure the sub BG0 map behind the floor previews. */
void func_ov059_02211870(void) {
  u8 resources[16];
  volatile u16 *cnt = (volatile u16 *)0x04001008;
  GraphicsResourceSet_Init(resources);
  GraphicsResourceSet_Load(resources, data_020f4e18, 0x16, 0x17, 0x18);
  *cnt = (((*cnt & 0x43) | 0x1804) & 0xfffc) | 3;
  func_02070f34(F(void *, resources, 8), 0x0f);
  func_020b44e8();
  func_020706c4(F(void *, resources, 0), 0, 0);
  func_02070eac(F(void *, resources, 8), 0, 0);
  func_02070bc4(F(void *, resources, 4), 0x1e0);
  GraphicsResourceSet_Destroy(resources);
}

/* Enter the interactive map presentation at the selected floor. */
void func_ov059_02211920(void *s, s32 floor) {
  volatile u32 *disp = (volatile u32 *)0x04001000;
  void *runtimeObject = F(void *, data_021052fc, 0x30e8);
  Overlay59RuntimeCallback prepare =
      F(Overlay59RuntimeCallback, F(void *, runtimeObject, 0), 0x0c);
  *disp = (*disp & ~0x1f00u) | 0x1000;
  prepare(runtimeObject, 0, 0x1f, (void *)prepare, 0);
  F(u32, data_021052fc, 0x30b8) |= 0x30;
  func_ov059_02211870();
  func_ov059_02210c60(F(void *, s, 0x3c), floor);
  F(s32, s, 0x34) = 1;
  func_ov059_02210c24(F(void *, s, 0x3c), 1);
  DebugSpriteText_SetTextResource(
      (u8 *)s + 0x40,
      GamePhaseMetadata_GetTextResourceId(F(void *, data_021052fc, 0x30bc)));
  F(s32, s, 0x38) = 1;
}

/* Store the latest touch command and test the visible floor band. */
s32 func_ov059_022119d8(void *s, s32 command) {
  F(s32, s, 0x4c) = command;
  return 0;
}
s32 func_ov059_022119e4(void *s, s32 floor) {
  s32 top = F(s32, s, 0x50) - 0x2d, y = floor << 7;
  return top <= y && y + 0x80 < F(s32, s, 0x50) + 0x93;
}

/* Configure the 30-frame spline used to move between floor rows. */
void func_ov059_02211a14(void *s, s32 from, s32 to) {
  u8 mover[60], start[16], end[16], tangent[16];
  VecFx32Object_InitComponents(end, 0, to << 12, 0);
  VecFx32Object_InitComponents(start, 0, from << 12, 0);
  VecFx32Object_InitCopy(tangent, end);
  SplineMover_InitTransition(mover, end, start, tangent, 0x1e);
  SplineMover_Assign((u8 *)s + 0x54, mover);
  SplineMover_Destroy(mover);
  VecFx32Object_Destroy(tangent);
  VecFx32Object_Destroy(start);
  VecFx32Object_Destroy(end);
}

/* Run the floor-selector scene state machine. */
s32 func_ov059_02211330(void *s) {
  s32 state, next, finished;
  u8 pos[16];
  GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
  func_02008f2c();
  state = F(s32, s, 0x24);
  if (state == 0)
    F(s32, s, 0x24) = 1;
  else if (state == 1) {
    func_ov059_02211854(1);
    func_ov059_02211920(s, F(s32, s, 0x28));
    TouchRegionManager_SetEnabled(Scene_GetEmbedded10(s), 1);
    TouchRegionManager_NotifyAll(Scene_GetEmbedded10(s), 1);
    Scene_SetFlags03(s);
    DisplayBrightness_StartSubTransition(1, 0x10);
    DisplayBrightness_StartMainTransition(1, 0x10);
    F(s32, s, 0x24) = 2;
  }
  if (F(s32, s, 0x24) == 2) {
    func_ov059_02210db0(F(void *, s, 0x3c), 0, F(s32, s, 0x50));
    if (!DisplayBrightness_IsSubTransitionIncreasing())
      F(s32, s, 0x24) = 10;
  } else if (F(s32, s, 0x24) == 10) {
    func_ov059_02210db0(F(void *, s, 0x3c), 0, F(s32, s, 0x50));
    next = F(s32, s, 0x28);
    if (F(s32, s, 0x4c) == 0x66) {
      Sound_Play(gSoundContext, 0, 3);
      DisplayBrightness_StartSubTransition(2, 0x10);
      DisplayBrightness_StartMainTransition(2, 0x10);
      F(s32, s, 0x24) = 300;
    } else {
      if (F(s32, s, 0x4c) == 100) {
        Sound_Play(gSoundContext, 0, 0);
        F(s32, s, 0x4c) = -1;
        next--;
      } else if (F(s32, s, 0x4c) == 101) {
        Sound_Play(gSoundContext, 0, 0);
        F(s32, s, 0x4c) = -1;
        next++;
      }
      if (next < 0)
        next = 0;
      else if (next >= F(s32, s, 0x2c))
        next = F(s32, s, 0x2c) - 1;
      if (next > F(s32, s, 0x28)) {
        func_ov059_02211a14(s, F(s32, s, 0x50), F(s32, s, 0x50) + 0x80);
        func_ov059_02210dfc(F(void *, s, 0x3c), F(s32, s, 0x28) + 1);
        F(s32, s, 0x24) = 100;
      } else if (next < F(s32, s, 0x28)) {
        func_ov059_02211a14(s, F(s32, s, 0x50), F(s32, s, 0x50) - 0x80);
        func_ov059_02210dfc(F(void *, s, 0x3c), F(s32, s, 0x28) - 1);
        F(s32, s, 0x24) = 200;
      } else
        DebugSpriteText_DrawCentered((u8 *)s + 0x40, 0x68, 0xab);
    }
  } else if (F(s32, s, 0x24) == 100 || F(s32, s, 0x24) == 200) {
    s32 dir = F(s32, s, 0x24) == 100 ? 1 : -1;
    if (func_ov059_022119e4(s, F(s32, s, 0x28) + dir)) {
      func_ov059_02210cb8(F(void *, s, 0x3c), F(s32, s, 0x28) - dir);
      F(s32, s, 0x28) += dir;
      func_ov059_02210cf8(F(void *, s, 0x3c), F(s32, s, 0x28) + dir);
      func_ov059_02210c24(F(void *, s, 0x3c), 1);
    }
    finished = SplineMover_Update((u8 *)s + 0x54);
    SplineMover_Evaluate2D(pos, (u8 *)s + 0x54);
    F(s32, s, 0x50) = F(s32, pos, 4) >> 12;
    VecFx32Object_Destroy(pos);
    func_ov059_02210db0(F(void *, s, 0x3c), 0, F(s32, s, 0x50));
    if (!finished) {
      GamePhaseAreaScene_GetConfig(F(void *, data_021052fc, 0x2fb8));
      DebugSpriteText_SetTextResource((u8 *)s + 0x40,
                                      GamePhaseMetadata_GetTextResourceId(
                                          F(void *, data_021052fc, 0x30bc)));
      func_ov059_02210f34(F(void *, s, 0x3c), 1);
      F(s32, s, 0x24) = 10;
    }
  } else if (F(s32, s, 0x24) == 300) {
    if (!DisplayBrightness_IsSubTransitionDecreasing())
      F(s32, s, 0x24) = 301;
  } else if (F(s32, s, 0x24) == 301) {
    Scene_ClearFlags03(s);
    func_ov059_02211854(0);
    GamePhaseRuntime_DestroySecondaryActorSubsystem(data_021052fc);
    GamePhaseRuntime_CreateSecondaryActorSubsystem(
        data_021052fc, F(void *, data_021052fc, 0x30bc), 1);
    GamePhaseAreaScene_ApplyRevealedRegions(F(void *, data_021052fc, 0x2fb8),
                                              (u8 *)data_021052fc + 0x2fa4);
    GamePhaseRuntime_ApplyScreenMode(data_021052fc, 1, 1);
    DisplayBrightness_StartSubTransition(1, 0x10);
    DisplayBrightness_StartMainTransition(1, 0x10);
    func_ov059_0221127c();
    return 1;
  }
  if (F(void *, s, 0x48)) {
    GraphicsSpriteGroup_AdvanceAnimations(F(void *, F(void *, s, 0x48), 0));
    TouchRegionManager_Tick(Scene_GetEmbedded10(s));
  }
  GamePhaseRuntime_PrepareActorCollections(data_021052fc, F(s32, s, 4), 2);
  GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 2);
  return 0;
}
