#include "tingle/types.h"

/* Overlay 70 owns a multi-sprite action scene used with overlay 41's terrain
 * and actor services. It constructs the scene's presentation set, advances
 * either the normal physics controller or the alternate scripted controller,
 * emits transient effects, and submits the resulting sprites each frame. */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))
#define VIRTUAL(p, o) F(void *, F(void *, (p), 0), (o))
typedef void (*SceneSpriteSetup)(void *, void *, s32, s32, s32, s32);

extern u8 data_020f3058[];
extern void *gSoundContext;
#define data_02105860 gSoundContext
extern u8 data_ov070_022129ac[], data_ov070_022129bc[];
extern u8 data_ov070_022129dc[], data_ov070_022129f0[];
extern u8 data_ov070_02212a08[], data_ov070_02212a28[];
extern u8 data_ov070_02212a70[], data_ov070_02212a94[];
extern u8 data_ov070_02212ac0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(...), func_02005030(...), func_02005058(...);
extern void func_020050a4(...), func_02099fb0(...), func_02002e6c(...);
extern s32 func_02003e2c(...), func_020befec(...), func_020bf1f8(...);
extern void *func_0209a208(...);
extern void func_0209a2ac(...), Graphics3dPresentation_BeginFrame(...);
extern void func_0209b7ec(...);
extern void func_0209b880(...), func_02072b68(...), func_02059394(...);
extern void func_02059278(...);
extern s32 func_020adc40(...);
extern u32 genrand_int32(...);
extern s32 func_ov041_021feb54(...), func_ov041_021fff80(...);
extern void func_020c0a88(...), func_020c0bc8(...);
#ifdef __cplusplus
}
#endif

static s32 Ov70_Word(const u8 *data) { return *(const s32 *)data; }
static s32 Ov70_MulFx(s32 left, s32 right) {
  return (s32)(((s64)left * right + 0x800) >> 12);
}
static void Ov70_SetHidden(void *sprite, s32 hidden) {
  if (sprite != 0)
    F(u16, sprite, 0x42) = hidden ? (u16)(F(u16, sprite, 0x42) | 4)
                                  : (u16)(F(u16, sprite, 0x42) & ~4);
}
static void Ov70_SetAnimation(void *sprite, s32 animation, s32 restart) {
  void *presentation = F(void *, sprite, 0xc);
  func_02072b68(presentation, animation);
  if (restart)
    F(u16, presentation, 0x24) |= 2;
}

/* Construct the 0x48-byte resource owner and its two embedded vector-like
 * helpers. The returned storage remains owned by the enclosing scene. */
void *func_ov070_0220fd20(void *owner) {
  F(void *, owner, 0) = data_020f3058;
  func_02004fe0((u8 *)owner + 0x1c);
  func_02004fe0((u8 *)owner + 0x2c);
  F(s32, owner, 4) = 0;
  F(s32, owner, 8) = 0;
  F(s32, owner, 0xc) = 0;
  F(s32, owner, 0x44) = 0;
  return owner;
}

/* Initialize a three-word position record with the overlay's record vtable. */
void func_ov070_02210218(void *record) {
  F(void *, record, 0) = data_ov070_02212ac0;
  F(s32, record, 4) = 0;
  F(s32, record, 8) = 0;
}

/* Empty array-element destructor; records own no resources themselves. */
void func_ov070_02210234(void) {}

/* Configure a sprite's animation, fixed-point position, scale, and angle. */
void func_ov070_0221028c(void *scene, void *sprite, s32 x, s32 y, s32 z,
                         s32 animation) {
  (void)scene;
  Ov70_SetAnimation(sprite, animation, 1);
  F(s32, sprite, 0x30) = x;
  F(s32, sprite, 0x34) = y;
  F(s32, sprite, 0x38) = z;
  F(u16, sprite, 0x3c) = 0x100;
  F(u16, sprite, 0x3e) = 0x100;
  F(u16, sprite, 0x40) = 0;
}

/* Construct the complete scene and all persistent sprite slots. Resource IDs
 * come from initialized overlay tables and remain owned by the scene. */
void *func_ov070_0220fd60(void *scene, void *runtime, s32 heapId) {
  s32 i;
  func_ov070_0220fd20(scene);
  F(void *, scene, 0) = data_ov070_02212a94;
  func_02004fe0((u8 *)scene + 0x4c);
  func_02004fe0((u8 *)scene + 0x5c);
  func_020c0a88((u8 *)scene + 0xd0, 2, 12, func_ov070_02210218,
                func_ov070_02210234);
  func_ov070_02210218((u8 *)scene + 0xe8);
  func_ov070_02210218((u8 *)scene + 0x104);
  func_020c0a88((u8 *)scene + 0x148, 16, 12, func_ov070_02210218,
                func_ov070_02210234);
  F(void *, scene, 0x48) = runtime;

  F(void *, scene, 0x6c) = func_0209a208(scene, 0, 1, 2, heapId, 2);
  ((SceneSpriteSetup)VIRTUAL(scene, 0))(scene, F(void *, scene, 0x6c), 0x40000,
                                        0x64000, 0, 0);
  Ov70_SetAnimation(F(void *, scene, 0x6c), 1, 0);
  for (i = 0; i < 5; ++i) {
    void *sprite = func_0209a208(scene, 0, 1, 2, heapId, 2);
    F(void *, scene, 0x74 + i * 4) = sprite;
    ((SceneSpriteSetup)VIRTUAL(scene, 0))(
        scene, sprite, (0x1f + (i - 1) * 12) << 12, -0xb0000, 0, 0);
    Ov70_SetAnimation(sprite, i == 0 ? 20 : 0, 0);
    Ov70_SetHidden(sprite, i != 1);
    F(s32, sprite, 0x44) = -128;
  }
  for (i = 0; i < 2; ++i) {
    void *sprite = func_0209a208(scene, 0, 1, 2, heapId, 2);
    F(void *, scene, 0xc8 + i * 4) = sprite;
    ((SceneSpriteSetup)VIRTUAL(scene, 0))(scene, sprite, 0, 0, 0, 0);
    Ov70_SetAnimation(sprite, 0, 1);
    Ov70_SetHidden(sprite, 1);
  }
  for (i = 0; i < 16; ++i) {
    void *sprite = func_0209a208(scene, 0, 1, 2, heapId, 2);
    F(void *, scene, 0x88 + i * 4) = sprite;
    ((SceneSpriteSetup)VIRTUAL(scene, 0))(
        scene, sprite, (0x1f + (i - 1) * 12) << 12, -0xb0000, 0, 0);
    Ov70_SetAnimation(sprite, 17, 1);
    Ov70_SetHidden(sprite, 1);
    F(s32, sprite, 0x44) = -128;
  }
  F(s32, scene, 0x30) = 0x80000;
  F(s32, scene, 0x34) = 0xa000;
  F(u16, scene, 0x3c) = 0x100;
  F(u16, scene, 0x3e) = 0x100;
  F(s32, scene, 0xd4) = 0x80000;
  F(s32, scene, 0xd8) = 0x2a000;
  F(s32, scene, 0x118) = 0;
  F(s32, scene, 0x11c) = 0;
  F(s32, scene, 0x120) = -1;
  F(s32, scene, 0x134) = 0;
  F(s32, scene, 0x138) = 0;
  F(s32, scene, 0x13c) = 0;
  F(u16, scene, 0x140) = 0;
  F(s32, scene, 0x144) = 0;
  F(s32, scene, 0xec) = 0;
  F(s32, scene, 0xf0) = 0;
  F(s32, scene, 0xf4) = 0x5000;
  F(s32, scene, 0xf8) = 0x1000;
  return scene;
}

/* Destroy record arrays and embedded resources, then release the base scene. */
void *func_ov070_02210238(void *scene) {
  func_020c0bc8((u8 *)scene + 0x148, 16, 12, func_ov070_02210234);
  func_020c0bc8((u8 *)scene + 0xd0, 2, 12, func_ov070_02210234);
  func_02005058((u8 *)scene + 0x5c);
  func_02005058((u8 *)scene + 0x4c);
  func_02099fb0(scene);
  return scene;
}

/* Reset the normal controller's player and target coordinates. */
void func_ov070_022102e0(void *scene, s32 targetY, s32 cameraY) {
  F(s32, scene, 0xd4) = 0x80000;
  F(s32, scene, 0xd8) = targetY << 12;
  F(s32, scene, 0xe0) = 0x80000;
  F(s32, scene, 0xe4) = F(s32, scene, 0xd8) + 0x20000;
  F(s32, scene, 0x60) = 0x80000;
  F(s32, scene, 0x64) = cameraY << 12;
  F(u16, scene, 0x140) = 0;
  F(s32, scene, 0x144) = 0;
}

/* Push the controller-relative camera target into the runtime transform. */
void func_ov070_02210320(void *scene) {
  u8 vector[16];
  s32 vertical =
      F(s32, scene, 0xd8) - ((s32 *)data_ov070_02212a70)[F(s32, scene, 0x11c)];
  func_02004fe0(vector);
  F(s32, vector, 4) = F(s32, scene, 0xd4) - 0x80000;
  if (F(s32, scene, 0x11c) != 0) {
    s32 lead = Ov70_MulFx(F(s32, scene, 0xf0), 0x46000);
    if (lead > 0x46000)
      lead = 0x3c000;
    if (lead < -0x46000)
      lead = -0x3c000;
    vertical += lead;
  }
  F(s32, vector, 8) = vertical;
  func_020050a4((u8 *)F(void *, scene, 0x48) + 0x19c, vector);
  func_02005058(vector);
}

/* Copy the runtime's tracked position record into an initialized destination.
 */
void func_ov070_0221187c(void *destination, const void *source) {
  F(void *, destination, 0) = data_ov070_02212ac0;
  F(s32, destination, 4) = F(const s32, source, 4);
  F(s32, destination, 8) = F(const s32, source, 8);
}

/* Copy only the payload of a position record, preserving its vtable. */
void func_ov070_0221189c(void *destination, const void *source) {
  if (destination != source) {
    F(s32, destination, 4) = F(const s32, source, 4);
    F(s32, destination, 8) = F(const s32, source, 8);
  }
}

/* Copy the runtime-owned position record at offset 0x1b8. */
void func_ov070_0221186c(void *destination, const void *runtime) {
  func_ov070_0221187c(destination, (const u8 *)runtime + 0x1b8);
}

/* Enter the scene's terminal state after the player falls or completes the
 * normal route. Any active chase record is restored before control changes. */
void func_ov070_022126b8(void *scene) {
  void *runtime = F(void *, scene, 0x48);
  if (F(s32, runtime, 0x1f4) == 2) {
    F(s32, scene, 0x134) = 31;
  } else {
    F(s32, scene, 0xec) = 0;
    F(s32, scene, 0xf0) = 0;
    Ov70_SetAnimation(F(void *, scene, 0x6c), 7, 1);
    F(s32, scene, 0x13c) = 0;
  }
  if (F(s32, scene, 0x118) != 0)
    func_ov070_0221189c((u8 *)scene + 0xd0, (u8 *)scene + 0xdc);
  ++F(s32, scene, 0x134);
  F(s32, scene, 0x120) = -1;
  F(s32, scene, 0x11c) = 0;
  F(s32, scene, 0x118) = 0;
  F(s32, runtime, 0x1cc) = 6;
}

/* Begin a bounce/failure transition, preserving position while converting the
 * vertical speed into the fixed twenty-frame upward impulse. */
void func_ov070_02212764(void *scene) {
  void *runtime = F(void *, scene, 0x48);
  F(s32, scene, 0x138) = 1;
  F(s32, scene, 0x11c) = 1;
  F(s32, scene, 0xd4) += F(s32, scene, 0xec);
  F(s32, scene, 0xd8) += F(s32, scene, 0xf0);
  F(s32, scene, 0xec) = 0;
  F(s32, scene, 0xf0) = F(s32, scene, 0xf4) * -20;
  Ov70_SetAnimation(F(void *, scene, 0x6c), 6, 1);
  func_02059394(data_02105860,
                F(s32, runtime, 0xc) == 0 ? Ov70_Word(data_ov070_022129f0)
                                          : 0x1e0,
                F(s32, runtime, 0xc) == 0 ? 14 : 0);
  F(s32, scene, 0x13c) = 0;
}

/* Activate one free transient sprite with a randomized animation and impulse.
 */
void func_ov070_0221282c(void *scene, s32 group, s32 x, s32 y) {
  s32 i;
  for (i = 15; i >= 0; --i) {
    void *sprite = F(void *, scene, 0x88 + i * 4);
    if ((F(u16, sprite, 0x42) & 4) != 0) {
      s32 speed = (func_020bf1f8(genrand_int32(), 5) + 1) * 0x4b0;
      Ov70_SetHidden(sprite, 0);
      Ov70_SetAnimation(sprite, 17 + group * 4 + (genrand_int32() & 3), 0);
      F(s32, sprite, 0x30) = x;
      F(s32, sprite, 0x34) = y;
      F(s32, scene, 0x14c + i * 12) =
          ((genrand_int32() & 1) != 0 ? speed : -speed);
      F(s32, scene, 0x150 + i * 12) = -(s32)((genrand_int32() & 3) + 4) * 0x800;
      return;
    }
  }
}

/* Activate one of the two impact sprites at runtime-relative coordinates. */
void func_ov070_02212908(void *scene, s32 alternate, s32 x, s32 y) {
  s32 i;
  void *runtime = F(void *, scene, 0x48);
  for (i = 1; i >= 0; --i) {
    void *sprite = F(void *, scene, 0xc8 + i * 4);
    if ((F(u16, sprite, 0x42) & 4) != 0) {
      Ov70_SetHidden(sprite, 0);
      Ov70_SetAnimation(sprite, alternate == 0 ? 10 : 16, 0);
      F(s32, sprite, 0x30) = x - F(s32, runtime, 0x190);
      F(s32, sprite, 0x34) = y - F(s32, runtime, 0x194);
      return;
    }
  }
}

/* Advance the alternate five-stage scripted controller. */
void func_ov070_022118b4(void *scene) {
  void *runtime = F(void *, scene, 0x48);
  s32 state = F(u16, scene, 0x140);
  s32 timer = F(s32, scene, 0x144);
  if (state == 0) {
    if (timer == 0) {
      Ov70_SetAnimation(F(void *, scene, 0x6c), 8, 1);
      F(s32, scene, 0x100) = 0;
      F(s32, scene, 0x11c) = 0;
    }
    F(s32, scene, 0x64) -= func_020befec(F(s32, scene, 0x64) - 0xc0000, 40);
    F(s32, scene, 0xd8) = func_020befec(F(s32, scene, 0x64) * 0xc0,
                                        Ov70_Word(data_ov070_022129dc)) -
                          0x46000;
    if (++F(s32, scene, 0x144) > 540) {
      F(s32, scene, 0x144) = 0;
      ++F(u16, scene, 0x140);
      Ov70_SetAnimation(F(void *, scene, 0x6c), 9, 0);
      F(s32, scene, 0xf0) = 0;
    }
  } else if (state == 1 || state == 2) {
    if (++F(s32, scene, 0x144) > (state == 1 ? 150 : 10)) {
      F(s32, scene, 0x144) = 0;
      ++F(u16, scene, 0x140);
      Ov70_SetAnimation(F(void *, scene, 0x6c), state == 1 ? 10 : 11, 0);
      if (state == 1)
        func_02059278(data_02105860, 0x17, 0x7f);
    }
    if (state == 2)
      F(s32, scene, 0x100) += 0x19a;
  } else if (state == 3) {
    F(s32, scene, 0xf0) -= 0x7b;
    F(s32, scene, 0xec) =
        Ov70_MulFx(F(s32, scene, 0xec), Ov70_Word(data_ov070_02212a08));
    F(s32, scene, 0xf0) =
        Ov70_MulFx(F(s32, scene, 0xf0), Ov70_Word(data_ov070_02212a08));
    F(s32, scene, 0xd4) += F(s32, scene, 0xec);
    F(s32, scene, 0xd8) += F(s32, scene, 0xf0);
    if (F(s32, scene, 0xd4) < 0)
      F(s32, scene, 0xd4) = 0;
    if (F(s32, scene, 0xd4) > 0x100000)
      F(s32, scene, 0xd4) = 0x100000;
    if (F(s32, scene, 0xd8) < -0xb6000)
      F(s32, scene, 0xd8) = -0xb6000;
    if (F(s32, scene, 0xd8) > -0x14000)
      F(s32, scene, 0xd8) = -0x14000;
    F(s32, scene, 0x100) += 0x19a;
    F(s32, scene, 0x64) += F(s32, scene, 0x100);
    if (func_ov041_021fff80(F(void *, runtime, 0x10)) == 1) {
      ++F(u16, scene, 0x140);
      Ov70_SetAnimation(F(void *, scene, 0x6c), 11, 0);
    }
  } else if (state == 4) {
    F(s32, scene, 0xec) =
        Ov70_MulFx(F(s32, scene, 0xec), Ov70_Word(data_ov070_02212a08));
    F(s32, scene, 0xf0) += 0x11f;
    if (F(s32, scene, 0xf0) > 0x8000)
      F(s32, scene, 0xf0) = 0x8000;
    F(s32, scene, 0x100) -= 0x19a;
    if (F(s32, scene, 0x100) < 0)
      F(s32, scene, 0x100) = 0;
    F(s32, scene, 0x64) += F(s32, scene, 0x100);
    if (F(s32, runtime, 0x1cc) < 3)
      F(s32, runtime, 0x1cc) = 3;
  }
  F(s32, scene, 0xd4) += F(s32, scene, 0xec);
  F(s32, scene, 0xd8) += F(s32, scene, 0xf0);
  F(s32, runtime, 0x1ac) = Ov70_Word(data_ov070_02212a28);
  F(s32, F(void *, scene, 0x6c), 0x30) = F(s32, scene, 0xd4);
  F(s32, F(void *, scene, 0x6c), 0x34) = F(s32, scene, 0xd8) + 0x12000;
  Ov70_SetHidden(F(void *, scene, 0x6c), 0);
  func_ov070_02210320(scene);
}

/* Advance the normal controller: gravity, horizontal steering, collision,
 * chase acquisition, terminal transitions, and player sprite placement. */
void func_ov070_02210860(void *scene, void *a, void *b, void *c) {
  void *runtime = F(void *, scene, 0x48);
  s32 tile;
  (void)a;
  (void)b;
  (void)c;
  if (F(s32, scene, 0x134) != 0) {
    if (++F(s32, scene, 0x134) == 30) {
      F(s32, scene, 0xf0) = -0x6000;
      F(s32, runtime, 0x1ac) = 0;
    }
    F(s32, scene, 0xf0) += 0x333;
    F(s32, scene, 0xd8) += F(s32, scene, 0xf0);
  } else if (F(s32, scene, 0x138) != 0) {
    F(s32, scene, 0xf0) += F(s32, scene, 0xf4) * 2;
    F(s32, scene, 0xd8) += F(s32, scene, 0xf0);
    if (++F(s32, scene, 0x138) > 50)
      F(s32, scene, 0x138) = 0;
  } else if (F(s32, scene, 0x11c) != 0) {
    F(s32, scene, 0xf0) += F(s32, scene, 0xf4);
    F(s32, scene, 0xd4) += F(s32, scene, 0xec);
    F(s32, scene, 0xd8) += F(s32, scene, 0xf0);
    tile = func_ov041_021feb54(runtime, (F(s32, scene, 0xd4) + 0x80000) >> 12,
                               F(s32, scene, 0xd8) >> 12);
    if (tile > 0x1f)
      func_ov070_02212764(scene);
  } else {
    s32 dx = F(s32, scene, 0xe0) - F(s32, scene, 0xd4);
    s32 dy = F(s32, scene, 0xe4) - F(s32, scene, 0xd8);
    s32 distance = func_020adc40(Ov70_MulFx(dx, dx) + Ov70_MulFx(dy, dy));
    if (F(s32, scene, 0x118) != 0 && distance >= 0x22000) {
      F(s32, scene, 0x11c) = 1;
      F(s32, scene, 0xec) = -Ov70_MulFx(dx, 0xa4);
      F(s32, scene, 0xf0) = -Ov70_MulFx(dy, 0xa4);
      Ov70_SetAnimation(F(void *, scene, 0x6c), 0, 1);
    }
  }
  F(s32, scene, 0xe0) = F(s32, scene, 0xd4);
  F(s32, scene, 0xe4) = F(s32, scene, 0xd8);
  if (F(s32, scene, 0x11c) == 0 && F(s32, scene, 0x118) != 0 &&
      F(s32, scene, 0x134) == 0) {
    Ov70_SetHidden(F(void *, scene, 0x6c), 1);
  } else {
    F(s32, F(void *, scene, 0x6c), 0x30) = F(s32, scene, 0xd4);
    F(s32, F(void *, scene, 0x6c), 0x34) =
        F(s32, scene, 0xd8) + (F(s32, scene, 0x11c) ? 0x12000 : 0x1c000);
    Ov70_SetHidden(F(void *, scene, 0x6c), 0);
  }
  func_ov070_02210320(scene);
}

/* Select the controller for the runtime mode, update counters and transient
 * sprites, and synchronize the scene's presentation with overlay 41. */
void func_ov070_022103d8(void *scene) {
  s32 i;
  void *runtime = F(void *, scene, 0x48);
  func_02002e6c();
  if (F(s32, runtime, 0x1f4) == 0 || F(s32, runtime, 0x1f4) == 2)
    func_ov070_02210860(scene, 0, 0, 0);
  else
    func_ov070_022118b4(scene);

  if (F(s32, runtime, 0x1f4) == 0) {
    for (i = 15; i >= 0; --i) {
      void *sprite = F(void *, scene, 0x88 + i * 4);
      if ((F(u16, sprite, 0x42) & 4) == 0) {
        F(s32, scene, 0x150 + i * 12) += 0x11f;
        F(s32, sprite, 0x30) += F(s32, scene, 0x14c + i * 12);
        F(s32, sprite, 0x34) += F(s32, scene, 0x150 + i * 12);
        if (F(s32, sprite, 0x34) > F(s32, F(void *, runtime, 0x14), 0x15c))
          Ov70_SetHidden(sprite, 1);
      }
    }
  } else {
    for (i = 0; i < 5; ++i)
      Ov70_SetHidden(F(void *, scene, 0x74 + i * 4), 1);
  }
  for (i = 1; i >= 0; --i) {
    void *sprite = F(void *, scene, 0xc8 + i * 4);
    if ((F(u16, sprite, 0x42) & 4) == 0 &&
        (F(u16, F(void *, sprite, 0xc), 0x24) & 1) != 0)
      Ov70_SetHidden(sprite, 1);
  }
}

/* Submit the persistent presentation set and, while chasing, draw the
 * direction-aligned trail pieces derived from the two position records. */
void func_ov070_02211dcc(void *scene, const void *transform, void *unused,
                         void *context) {
  s32 i;
  u8 neutral[16];
  void *runtime = F(void *, scene, 0x48);
  (void)unused;
  (void)context;
  func_0209a2ac(scene, 0, 1);
  func_02005030(neutral, transform);
  func_0209a2ac(F(void *, scene, 0x6c), neutral, 1);
  for (i = 0; i < 5; ++i)
    func_0209a2ac(F(void *, scene, 0x74 + i * 4), neutral, 1);
  for (i = 0; i < 2; ++i)
    func_0209a2ac(F(void *, scene, 0xc8 + i * 4), neutral, 1);
  for (i = 0; i < 16; ++i)
    func_0209a2ac(F(void *, scene, 0x88 + i * 4), neutral, 1);
  ++F(s32, scene, 0x12c);
  Graphics3dPresentation_BeginFrame(F(void *, runtime, 0x18), transform);
  if ((F(u16, F(void *, scene, 0x6c), 0x42) & 4) != 0 &&
      F(s32, scene, 0x118) != 0) {
    u8 from[12], to[12];
    func_ov070_0221187c(from, (u8 *)scene + 0xd0);
    func_ov070_0221187c(to, (u8 *)scene + 0xdc);
    func_0209b7ec(F(void *, runtime, 0x18), 0x1b);
    func_0209b880(F(void *, runtime, 0x18), from, data_ov070_022129ac,
                  data_ov070_02212a08, 2, 0, -22);
    func_0209b880(F(void *, runtime, 0x18), to, data_ov070_022129bc,
                  data_ov070_02212a28, 2, 0, -21);
  }
  func_02005058(neutral);
}

/* Static initializer registered by the overlay's initialized callback table. */
void *func_ov070_02212998(void *cookie) {
  func_02003e2c();
  return cookie;
}
