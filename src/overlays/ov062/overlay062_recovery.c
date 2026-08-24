#include "tingle/types.h"

/* Overlay 62 owns three related actor-transition scenes. They share fixed-
 * point vector helpers and animate an actor plus attached sprites before
 * returning control through the global scene runtime. */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))
#define METHOD(p, o) F(void *, F(void *, (p), 0), (o))
typedef void (*Method0)(void *);
typedef void (*Method1)(void *, s32);
typedef s32 (*MethodResult)(void *);

extern u8 data_ov062_02211b00[], data_ov062_02211b08[];
extern u8 data_ov062_02211b10[], data_ov062_02211b1c[];
extern u8 data_ov062_02211b34[], data_ov062_02211b60[];
extern u8 data_ov062_02211b68[], data_ov062_02211b70[];
extern u8 data_ov062_02211b80[], data_ov062_02211b8c[];
extern u8 data_ov062_02211ba4[], data_ov062_02211bd0[];
extern u8 data_ov062_02211bd8[], data_ov062_02211be8[];
extern u8 data_ov062_02211bf4[], data_ov062_02211c14[];
extern u8 data_ov062_02211c40[];
extern void *gHeapContext, *gSceneManager, *gGamePhaseRuntime;
extern void *gSoundContext, *gFx32CosSinTable;
#define data_020f4db0 gHeapContext
#define data_020f4e00 gSceneManager
#define data_02105860 gSoundContext

#ifdef __cplusplus
extern "C" {
#endif
extern void Scene_Init(...), Scene_Destroy(...), Heap_Free(...);
extern void *SceneManager_GetCurrent(...), *Heap_Alloc(...);
extern void Scene_SetFlags03(...), Scene_ClearFlags03(...);
extern void VecFx32Object_InitComponents(...), VecFx32Object_Destroy(...);
extern void func_020064b8(...), func_020050a4(...);
#define VecFx32Object_Lerp func_020064b8
extern void func_0200634c(...), func_0200637c(...);
extern s32 func_020befec(...), func_020adcac(...), func_020ae024(...);
extern void *func_02005580(...), *func_02005c3c(...);
extern void func_02005afc(...), func_020059ac(...), func_0201f864(...);
extern void func_02072b68(...), GraphicsSpriteState_ReleaseFromGroup(...), GraphicsSpriteGroup_ReplaceStateResources(...);
extern void func_02032d64(...), Actor_RefreshCachedTerrainHeight(...), func_02034b60(...);
extern void func_02038aac(...), func_02008e10(...), func_020099c0(...);
extern s32 func_02009d78(...), func_0202baec(...);
extern void func_0204b5d8(...), func_0204b680(...);
extern void func_02059394(...), Sound_PlayEffectWithParameters(...), func_0205974c(...);
extern void func_020597fc(...);
extern void *func_020022dc(...);
extern void func_02002290(...), func_020030c4(...), func_02003030(...);
#ifdef __cplusplus
}
#endif

static s32 Ov62_DataWord(const u8 *symbol) { return *(const s32 *)symbol; }
static void Ov62_Call(void *object, s32 offset) {
  if (object != 0)
    ((Method0)METHOD(object, offset))(object);
}

/* Store x/y/z in the payload of a nullable vector wrapper. */
void func_ov062_0220fd20(void *vector, s32 x, s32 y, s32 z) {
  u8 *payload = vector == 0 ? 0 : (u8 *)vector + 4;
  F(s32, payload, 0) = x;
  F(s32, payload, 4) = y;
  F(s32, payload, 8) = z;
}

/* Toggle bit 2 in the sprite reached through descriptor offset 4. */
void func_ov062_0220fd30(void *descriptor, s32 hidden) {
  u16 *flags = &F(u16, F(void *, descriptor, 4), 0x24);
  *flags = hidden == 0 ? (u16)(*flags | 4) : (u16)(*flags & ~4);
}

/* Initialize a vector and scale its payload by a 20.12 factor. */
void func_ov062_0220fd50(void *out, const void *source, s32 scale) {
  s32 i;
  VecFx32Object_InitComponents(out);
  for (i = 0; i < 3; i++)
    F(s32, out, 4 + i * 4) =
        (s32)(((s64)F(const s32, source, 4 + i * 4) * scale + 0x800) >> 12);
}

/* Initialize out and derive its displacement from two nullable vectors. */
void func_ov062_0220fdbc(void *out, const void *from, const void *to) {
  s32 i;
  VecFx32Object_InitComponents(out);
  for (i = 0; i < 3; i++)
    F(s32, out, 4 + i * 4) = (to == 0 ? 0 : F(const s32, to, 4 + i * 4)) -
                             (from == 0 ? 0 : F(const s32, from, 4 + i * 4));
}

/* Construct the 0x30-byte three-vector interpolation resource. */
void *func_ov062_0220fdf4(void *resource, const void *from, const void *to,
                          const void *delta) {
  VecFx32Object_InitComponents((u8 *)resource + 0x00);
  VecFx32Object_InitComponents((u8 *)resource + 0x10);
  VecFx32Object_InitComponents((u8 *)resource + 0x20);
  func_0200634c(resource, from, to, delta, delta);
  return resource;
}

/* Return the angle derived from the x/z displacement between two vectors. */
s32 func_ov062_0220fe38(const void *from, const void *to) {
  return func_020ae024(F(const s32, to, 8) - F(const s32, from, 8),
                       F(const s32, to, 4) - F(const s32, from, 4),
                       F(const s32, to, 4), F(const s32, from, 8));
}

/* Report whether the actor is unlocked and retains its attachment pointer. */
s32 func_ov062_0220fe58(const void *actor) {
  return (F(const u32, actor, 0xd0) & 0x10) == 0 &&
         F(const void *, actor, 0x24) == F(const void *, actor, 0x1dc);
}

static void *Ov62_CreateMotion(void *actor, const void *target, const u8 *a,
                               const u8 *b, const u8 *tag) {
  u8 from[16], to[16], delta[16];
  void *motion;
  func_ov062_0220fd50(from, (u8 *)actor + 0x18, Ov62_DataWord(a));
  func_ov062_0220fd50(to, target, Ov62_DataWord(b));
  func_ov062_0220fdbc(delta, from, to);
  motion = Heap_Alloc(0x30, tag, 4, data_020f4db0);
  if (motion != 0)
    motion = func_ov062_0220fdf4(motion, (u8 *)actor + 0x18, target, delta);
  VecFx32Object_Destroy(delta);
  VecFx32Object_Destroy(to);
  VecFx32Object_Destroy(from);
  return motion;
}

/* Construct variant one, detaching the global actor and creating its motion,
 * sprite, optional marker, and scene routing state. */
void *func_ov062_0220fe78(void *scene, const void *target, s32 duration,
                          s32 amplitude, s32 actorScale, void *callbackOwner,
                          s32 preserveGlobalFlag) {
  void *actor;
  s32 angle;
  Scene_Init(scene);
  F(void *, scene, 0) = data_ov062_02211b34;
  F(s32, scene, 0x34) = 0;
  F(s32, scene, 0x38) = duration;
  F(s32, scene, 0x3c) = actorScale;
  F(s32, scene, 0x40) = amplitude;
  F(void *, scene, 0x44) = callbackOwner;
  F(s32, scene, 4) = 14;
  actor = F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ea4);
  F(void *, scene, 0x24) = actor;
  F(u32, actor, 0x230) = (F(u32, actor, 0x230) & ~4u) | 0x100;
  F(u32, actor, 0x14) |= 2;
  func_ov062_0220fd20((u8 *)actor + 0x38, 0, 0, 0);
  func_ov062_0220fd20((u8 *)actor + 0x88, 0, 0, 0);
  func_ov062_0220fd20((u8 *)actor + 0x98, 0, 0, 0);
  func_ov062_0220fd30((u8 *)actor + 0x2a8, 0);
  F(void *, scene, 0x30) =
      Ov62_CreateMotion(actor, target, data_ov062_02211b00, data_ov062_02211b08,
                        data_ov062_02211b60);
  angle = func_ov062_0220fe38(target, (u8 *)actor + 0x18);
  F(void *, scene, 0x2c) = func_02005580(
      Heap_Alloc(0x10, data_ov062_02211b68, 4, data_020f4db0), 0, 0, 0);
  F(void *, scene, 0x28) = func_02005c3c(F(void *, F(void *, actor, 0x54), 0),
                                         F(void *, scene, 0x2c), 0, 0, 0, 2, 0);
  func_02072b68(F(void *, scene, 0x28), ((angle + 0x5000) >> 13) + 0x1c);
  if (func_ov062_0220fe58(actor))
    func_0201f864(Heap_Alloc(0x14, data_ov062_02211b70, 4, data_020f4db0),
                  (u8 *)actor + 0x18, F(void *, F(void *, actor, 0x54), 0), 0,
                  1, 2, 0, 0x40, -1, 1);
  func_02059394(data_02105860, 0, 0x61);
  if (preserveGlobalFlag == 0)
    F(u32, F(void *, gGamePhaseRuntime, 0), 0x2fec) |= 8;
  Scene_SetFlags03(scene);
  return scene;
}

static void *Ov62_DestroyOne(void *scene, s32 freeSelf) {
  void *actor = F(void *, scene, 0x24);
  F(void *, scene, 0) = data_ov062_02211b34;
  Scene_ClearFlags03(scene);
  GraphicsSpriteState_ReleaseFromGroup(F(void *, scene, 0x28));
  Ov62_Call(F(void *, scene, 0x2c), 4);
  if (F(s32, scene, 0x3c) == 0) {
    F(u32, actor, 0x14) &= ~2u;
    F(u32, actor, 0x230) = (F(u32, actor, 0x230) | 4) & ~0x100u;
    func_ov062_0220fd30((u8 *)actor + 0x2a8, 1);
    func_020050a4((u8 *)actor + 0x18, (u8 *)F(void *, scene, 0x30) + 0x10);
    func_020050a4((u8 *)actor + 0x28, (u8 *)actor + 0x18);
    func_02038aac(actor);
  }
  if (F(void *, scene, 0x30) != 0) {
    func_0200637c(F(void *, scene, 0x30));
    Heap_Free(F(void *, scene, 0x30));
  }
  Ov62_Call(F(void *, scene, 0x44), 0x5c);
  F(u32, F(void *, gGamePhaseRuntime, 0), 0x2fec) &= ~8u;
  func_02002290(func_020022dc(), 2);
  Scene_Destroy(scene);
  if (freeSelf)
    Heap_Free(scene);
  return scene;
}

/* Destroy variant one without freeing its scene allocation. */
void *func_ov062_02210180(void *scene) { return Ov62_DestroyOne(scene, 0); }
/* Destroy variant one and honor its ABI deletion flag. */
void *func_ov062_02210324(void *scene, s32 deleting) {
  return Ov62_DestroyOne(scene, deleting != 0);
}

static s32 Ov62_UpdateMotion(void *scene, s32 actorOffset, s32 frameOffset,
                             s32 durationOffset, s32 motionOffset,
                             s32 amplitudeOffset, s32 spriteOffset) {
  s32 frame, duration, phase;
  s32 position[4];
  void *actor;
  if (SceneManager_GetCurrent(data_020f4e00) != scene)
    return 0;
  actor = F(void *, scene, actorOffset);
  func_02008e10(gGamePhaseRuntime, 2);
  frame = ++F(s32, scene, frameOffset);
  duration = F(s32, scene, durationOffset);
  if (frame > duration)
    frame = F(s32, scene, frameOffset) = duration;
  VecFx32Object_Lerp(position, F(void *, scene, motionOffset),
                     func_020befec(frame << 12, duration));
  phase = func_020befec(frame << 15, duration);
  position[3] += F(s32, scene, amplitudeOffset) *
                 F(const s16, gFx32CosSinTable, ((phase & 0xffff) >> 4) * 4);
  func_020050a4((u8 *)actor + 0x18, position);
  if (spriteOffset != 0)
    func_02005afc(F(void *, scene, spriteOffset), position[1], position[2],
                  position[3], 4);
  Actor_RefreshCachedTerrainHeight(actor);
  ((void (*)(void *, void *, s32))METHOD(actor, 0x58))(
      position, actor, func_02009d78((u8 *)gGamePhaseRuntime + 0x2fbc));
  if (frame != duration)
    return 0;
  Ov62_Call(scene, 4);
  return 1;
}

/* Advance variant one's interpolated and sinusoidal actor motion. */
s32 func_ov062_022104d0(void *scene) {
  return Ov62_UpdateMotion(scene, 0x24, 0x34, 0x38, 0x30, 0x40, 0x28);
}
/* Route variant one through the global runtime callback. */
s32 func_ov062_02210650(void) {
  Ov62_Call(F(void *, gGamePhaseRuntime, 0), 0x0c);
  return 0;
}

/* Construct variant two around a supplied actor and target vector. */
void *func_ov062_02210674(void *scene, void *actor, const void *target,
                          s32 duration, s32 amplitude, s32 restoreSprite,
                          void *callbackOwner) {
  Scene_Init(scene);
  F(void *, scene, 0) = data_ov062_02211ba4;
  F(void *, scene, 0x24) = actor;
  F(s32, scene, 0x2c) = 0;
  F(s32, scene, 0x30) = duration;
  F(s32, scene, 0x34) = amplitude;
  F(s32, scene, 0x38) = restoreSprite;
  F(void *, scene, 0x3c) = callbackOwner;
  F(s32, scene, 4) = 15;
  func_ov062_0220fd20((u8 *)actor + 0x38, 0, 0, 0);
  func_ov062_0220fd20((u8 *)actor + 0x88, 0, 0, 0);
  func_ov062_0220fd20((u8 *)actor + 0x98, 0, 0, 0);
  F(void *, scene, 0x28) =
      Ov62_CreateMotion(actor, target, data_ov062_02211b80, data_ov062_02211b8c,
                        data_ov062_02211bd0);
  if (F(u8, actor, 0xe6) == 1 || F(u8, actor, 0x4d) == 7)
    func_02032d64(actor, F(const s32, target, 4) - F(s32, actor, 0x1c),
                  F(const s32, target, 8) - F(s32, actor, 0x20));
  func_0201f864(Heap_Alloc(0x14, data_ov062_02211bd8, 4, data_020f4db0),
                (u8 *)actor + 0x18, F(void *, F(void *, actor, 0x54), 0), 0, 1,
                2, 0, 4, -1, 1);
  Scene_SetFlags03(scene);
  return scene;
}

static void *Ov62_DestroyTwo(void *scene, s32 freeSelf) {
  void *actor = F(void *, scene, 0x24);
  F(void *, scene, 0) = data_ov062_02211ba4;
  Scene_ClearFlags03(scene);
  func_020050a4((u8 *)actor + 0x18, (u8 *)F(void *, scene, 0x28) + 0x10);
  func_020050a4((u8 *)actor + 0x28, (u8 *)actor + 0x18);
  Ov62_Call(actor, 0x5c);
  if (F(s32, scene, 0x38) != 0)
    func_ov062_0220fd30((u8 *)actor + 0x50, 0);
  Ov62_Call(F(void *, scene, 0x3c), 0x5c);
  if (F(void *, scene, 0x28) != 0) {
    func_0200637c(F(void *, scene, 0x28));
    Heap_Free(F(void *, scene, 0x28));
  }
  func_02002290(func_020022dc(), 2);
  Scene_Destroy(scene);
  if (freeSelf)
    Heap_Free(scene);
  return scene;
}

/* Destroy variant two without freeing the scene. */
void *func_ov062_0221085c(void *scene) { return Ov62_DestroyTwo(scene, 0); }
/* Destroy variant two and honor its deletion flag. */
void *func_ov062_02210914(void *scene, s32 deleting) {
  return Ov62_DestroyTwo(scene, deleting != 0);
}
/* Advance variant two's interpolated and sinusoidal actor motion. */
s32 func_ov062_022109d4(void *scene) {
  return Ov62_UpdateMotion(scene, 0x24, 0x2c, 0x30, 0x28, 0x34, 0);
}
/* Route variant two through the global runtime callback. */
s32 func_ov062_02210b14(void) {
  Ov62_Call(F(void *, gGamePhaseRuntime, 0), 0x0c);
  return 0;
}

/* Construct variant three, deriving its approach direction from the actor's
 * map tile and creating primary and auxiliary sprites. */
void *func_ov062_02210b38(void *scene) {
  void *actor, *map;
  s32 tileClass, x, y, z, direction, animation;
  Scene_Init(scene);
  F(void *, scene, 0) = data_ov062_02211be8;
  VecFx32Object_InitComponents((u8 *)scene + 0x24);
  VecFx32Object_InitComponents((u8 *)scene + 0x34);
  VecFx32Object_InitComponents((u8 *)scene + 0x44);
  F(s32, scene, 0x70) = F(s32, scene, 0x74) = 0;
  F(s32, scene, 0x78) = 1;
  F(s32, scene, 4) = 12;
  F(s32, scene, 8) = 0;
  actor = F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ea4);
  F(void *, scene, 0x58) = actor;
  F(u32, actor, 0x230) = (F(u32, actor, 0x230) & ~4u) | 0x100;
  F(u32, actor, 0x14) |= 2;
  func_ov062_0220fd20((u8 *)actor + 0x38, 0, 0, 0);
  func_ov062_0220fd20((u8 *)actor + 0x88, 0, 0, 0);
  func_ov062_0220fd20((u8 *)actor + 0x98, 0, 0, 0);
  x = F(s32, actor, 0x1c);
  y = F(s32, actor, 0x20);
  z = F(s32, actor, 0x24);
  map = F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ed4);
  tileClass =
      ((s32(*)(void *, s32, s32))METHOD(map, 0x2c))(map, x >> 16, y >> 16);
  direction = ((tileClass >> 11) & 0x1f) - 2;
  if ((u32)direction > 3) {
    Ov62_Call(scene, 4);
    return scene;
  }
  F(s16, scene, 0x54) = (s16)direction;
  func_ov062_0220fd20((u8 *)scene + 0x24, x, y, z - 0x3000);
  func_ov062_0220fd20((u8 *)scene + 0x34, x, y, z - 0x18000);
  func_ov062_0220fd20((u8 *)scene + 0x44, x, y, z);
  animation = direction == 0   ? 0x10
              : direction == 1 ? 0x0c
              : direction == 2 ? 0x12
                               : 0x0e;
  func_02034b60(actor,
                direction == 2   ? 0x1000
                : direction == 3 ? -0x1000
                                 : 0,
                direction == 0   ? -0x1000
                : direction == 1 ? 0x1000
                                 : 0);
  F(void *, scene, 0x5c) = func_02005580(
      Heap_Alloc(0x10, data_ov062_02211bf4, 4, data_020f4db0), 0, 0, 0);
  F(void *, scene, 0x60) = func_02005580(
      Heap_Alloc(0x10, data_ov062_02211bf4, 4, data_020f4db0), 0, 0, 0);
  F(void *, scene, 0x64) = func_02005c3c(F(void *, F(void *, actor, 0x54), 0),
                                         F(void *, scene, 0x5c), 0, 0, 0, 2, 0);
  func_02072b68(F(void *, scene, 0x64), animation);
  func_02005afc(F(void *, scene, 0x64), x, y, z, 4);
  F(void *, scene, 0x68) = func_02005580(
      Heap_Alloc(0x10, data_ov062_02211c14, 4, data_020f4db0), 0, 0, 0);
  F(void *, scene, 0x6c) = func_02005c3c(F(void *, F(void *, actor, 0x54), 0),
                                         F(void *, scene, 0x68), 0, 0, 0, 4, 2);
  func_0205974c(data_02105860, 0x1b8);
  Sound_PlayEffectWithParameters(data_02105860, 0, 0x28, 0x50, 0, -0x100);
  if (F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ea8) != 0)
    func_0204b5d8();
  Scene_SetFlags03(scene);
  return scene;
}

static void *Ov62_DestroyThree(void *scene, s32 freeSelf) {
  void *actor = F(void *, scene, 0x58);
  F(void *, scene, 0) = data_ov062_02211be8;
  Scene_ClearFlags03(scene);
  func_020597fc(data_02105860, 0x1b8);
  GraphicsSpriteState_ReleaseFromGroup(F(void *, scene, 0x64));
  GraphicsSpriteState_ReleaseFromGroup(F(void *, scene, 0x6c));
  Ov62_Call(F(void *, scene, 0x5c), 4);
  Ov62_Call(F(void *, scene, 0x60), 4);
  Ov62_Call(F(void *, scene, 0x68), 4);
  F(u32, actor, 0x14) &= ~2u;
  F(u32, actor, 0x230) = (F(u32, actor, 0x230) | 4) & ~0x100u;
  func_020050a4((u8 *)actor + 0x18, (u8 *)scene + 0x24);
  func_020050a4((u8 *)actor + 0x28, (u8 *)scene + 0x24);
  ((Method1)METHOD(actor, 0x54))(actor, 1);
  func_02038aac(actor);
  if (F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ea8) != 0)
    func_0204b680();
  if (F(s32, scene, 0x78) != 0)
    func_02002290(func_020022dc(), 2);
  VecFx32Object_Destroy((u8 *)scene + 0x44);
  VecFx32Object_Destroy((u8 *)scene + 0x34);
  VecFx32Object_Destroy((u8 *)scene + 0x24);
  Scene_Destroy(scene);
  if (freeSelf)
    Heap_Free(scene);
  return scene;
}

/* Destroy variant three without freeing the scene. */
void *func_ov062_02211050(void *scene) { return Ov62_DestroyThree(scene, 0); }
/* Destroy variant three and honor its deletion flag. */
void *func_ov062_022111e8(void *scene, s32 deleting) {
  return Ov62_DestroyThree(scene, deleting != 0);
}

/* Run variant three's approach, directional input, fall, and terminal wait
 * state machine while keeping both attached sprites synchronized. */
s32 func_ov062_02211388(void *scene) {
  static const u16 toward[4] = {0x80, 0x40, 0x20, 0x10};
  static const u16 away[4] = {0x40, 0x80, 0x10, 0x20};
  void *actor = F(void *, scene, 0x58);
  s32 state, distance, direction, step;
  if (SceneManager_GetCurrent(data_020f4e00) != scene)
    return 0;
  if (F(s16, scene, 0x56) < 0x4000)
    F(s16, scene, 0x56)++;
  state = F(s32, scene, 8);
  distance = func_020adcac((u8 *)actor + 0x1c, (u8 *)scene + 0x28);
  if (state == 0 && distance <= 0x2000) {
    F(s32, scene, 8) = 1;
    F(s16, scene, 0x56) = 0;
  } else if ((state == 2 || state == 3) && distance <= 0x1000) {
    if (state == 2) {
      Ov62_Call(scene, 4);
      return 1;
    }
    F(s32, scene, 8) = 4;
    F(s32, scene, 0x30) = F(s32, scene, 0x40) =
        func_0202baec(F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ed4),
                      F(s32, scene, 0x38) >> 16, F(s32, scene, 0x3c) >> 16)
        << 16;
  }
  if (F(s32, scene, 8) == 1 && F(s16, scene, 0x56) > 5) {
    u16 keys = F(const u16, data_ov062_02211c40, 0x1a);
    direction = F(s16, scene, 0x54);
    if ((keys & 0xf0) == 0)
      F(s32, scene, 0x74) = 0;
    else if (keys & toward[direction])
      F(s32, scene, 0x74)--;
    else if (keys & away[direction])
      F(s32, scene, 0x74)++;
    if (F(s32, scene, 0x74) < -5) {
      F(s32, scene, 8) = 2;
      func_020050a4((u8 *)scene + 0x24, (u8 *)scene + 0x44);
    } else if (F(s32, scene, 0x74) > 5) {
      F(s32, scene, 8) = 3;
      func_020050a4((u8 *)scene + 0x24, (u8 *)scene + 0x34);
      GraphicsSpriteGroup_ReplaceStateResources(F(void *, scene, 0x64), F(void *, scene, 0x64),
                    F(s32, F(void *, scene, 0x60), 4),
                    F(s32, F(void *, scene, 0x60), 8),
                    F(s32, F(void *, scene, 0x60), 12));
      func_02059394(data_02105860, 0x1b8, 0);
    }
  }
  state = F(s32, scene, 8);
  if (state < 3) {
    u8 from[16], to[16], delta[16];
    func_ov062_0220fd50(from, (u8 *)actor + 0x18,
                        Ov62_DataWord(data_ov062_02211b10));
    func_ov062_0220fd50(to, (u8 *)scene + 0x24,
                        Ov62_DataWord(data_ov062_02211b1c));
    func_ov062_0220fdbc(delta, from, to);
    func_020050a4((u8 *)actor + 0x18, delta);
    VecFx32Object_Destroy(delta);
    VecFx32Object_Destroy(to);
    VecFx32Object_Destroy(from);
  } else {
    step = ((MethodResult)METHOD(actor, 0xb0))(actor);
    F(s32, scene, 0x70) -= state == 3 ? step / 4 : step;
    if (state != 3) {
      F(s32, actor, 0x24) += F(s32, scene, 0x70);
      if (F(s32, actor, 0x24) < F(s32, scene, 0x40)) {
        F(s32, actor, 0x24) = F(s32, scene, 0x40);
        if (state == 5) {
          F(s32, scene, 8) = 6;
          F(s16, scene, 0x56) = 0;
        }
      }
    }
  }
  if (F(s32, scene, 8) == 4 && F(s32, actor, 0x24) <= F(s32, scene, 0x30)) {
    func_ov062_0220fd30(F(void *, scene, 0x6c), 1);
    func_02072b68(F(void *, scene, 0x6c), 0);
    F(s32, scene, 8) = 5;
    F(s16, scene, 0x56) = 0;
    F(s32, scene, 0x70) = 0x2000;
    func_020099c0((u8 *)gGamePhaseRuntime + 0x2fbc, 10, 2);
    func_02059394(data_02105860, 0x1b8, 1);
  }
  func_02008e10(gGamePhaseRuntime, 2);
  func_02005afc(F(void *, scene, 0x64), F(s32, actor, 0x1c),
                F(s32, actor, 0x20), F(s32, actor, 0x24), 4);
  if (F(s32, scene, 8) > 4 && (F(u16, F(void *, scene, 0x6c), 0x24) & 1) == 0) {
    func_020059ac(F(void *, scene, 0x6c), F(s32, actor, 0x1c),
                  F(s32, actor, 0x20), F(s32, scene, 0x30), 4);
  }
  if (F(s32, scene, 8) == 6 && F(s16, scene, 0x56) > 0x1d) {
    Ov62_Call(scene, 4);
    return 1;
  }
  return 0;
}

/* Route variant three through the global runtime callback. */
s32 func_ov062_02211acc(void) {
  Ov62_Call(F(void *, gGamePhaseRuntime, 0), 0x0c);
  return 0;
}
