#include "tingle/types.h"

typedef struct Graphics3dPresentation Graphics3dPresentation;

/*
 * Recovered overlay 69 scripted multi-object scene and effect subsystem.
 *
 * The overlay owns two fixed-capacity presentation collections and a
 * ninety-entry particle field. It coordinates randomized fixed-point motion,
 * overlay-39/49 actor queries, rendering, collision collection, sound, and a
 * scripted scene controller. Unnamed members remain offset-based.
 */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))

extern u8 data_ov069_02212536[], data_ov069_0221253e[];
extern u8 data_ov069_02212546[], data_ov069_02212550[];
extern u8 data_ov069_0221255c[], data_ov069_02212590[];
extern u8 data_ov069_022125ac[];
extern u8 data_ov069_0221278c[], data_ov069_0221279c[];
extern u8 data_ov069_022127d0[], data_020f3058[];
extern const s16 data_020c9670[];
extern void *gGamePhaseRuntime, *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void __construct_array(...), VecFx32Object_Init(...);
extern void VecFx32Object_InitCopy(...), VecFx32Object_InitComponents(...);
extern void VecFx32Object_Assign(...), VecFx32Object_Add(...);
extern void VecFx32Object_Destroy(...), Heap_Free(...);
extern u32 genrand_int32(...);
extern s32 SignedAbsoluteValueVariant(...), func_020befec(...);
extern s32 func_020bf1f8(...), func_020adc40(...), func_020adc90(...);
extern s32 func_020ae024(...);
extern Graphics3dPresentation *
RuntimePresentationManager_GetGraphics3dPresentation(...);
extern void func_0209b58c(...), func_0209b7ec(...), func_0209b880(...);
extern void func_0209c430(...), func_020adff0(...);
extern u32 Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds(
    Graphics3dPresentation *, s32, s32, s32, s32, s32, s32);
extern void *func_0209a208(...);
extern u32 Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(
    Graphics3dPresentation *, s32, s32, s32, s32, s32, s32);
extern void Graphics3dPresentation_RemoveSpriteEffect(
    Graphics3dPresentation *, u32);
extern void Graphics3dPresentation_SetSpriteEffectVertexDepth(
    Graphics3dPresentation *, u32, s16);
extern void Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(
    Graphics3dPresentation *, s32, s32, s32, s32);
extern u32 Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(
    Graphics3dPresentation *, s32, s32, s32);
extern void func_0209a2ac(...), func_02099fb0(...);
extern s32 func_0209e330(...);
extern void func_0209e328(...), GraphicsSpriteState_SetAnimationIndex(...);
extern void Sound_Play(...);
extern void func_ov039_022014e0(...), func_ov039_0220391c(...);
extern void func_ov039_02203940(...);
extern s32 func_ov039_02203964(...), func_ov039_0220397c(...);
extern void func_ov039_02203990(...);
extern s32 func_ov039_022039a4(...);
extern s32 func_ov049_0220c2dc(...), func_ov049_0220c3d8(...);
#ifdef __cplusplus
}
#endif

void func_ov069_0220fd3c(void);
void func_ov069_0220fe28(void);
void func_ov069_0220fd20(void *);
void func_ov069_0220fe0c(void *);
void func_ov069_02210a24(void *);
void func_ov069_0221123c(void *, const void *, const void *);
s32 func_ov069_022115c0(void *, const void *);
s32 func_ov069_02211778(void *, const void *);
void func_ov069_022124f0(void *, const void *);

static s32 fx_mul(s32 left, s32 right) {
  return (s32)(((s64)left * right + 0x800) >> 12);
}

/* Initializes a compact transform descriptor; mutates the record only. */
void func_ov069_0220fd20(void *record) {
  F(void *, record, 0) = data_ov069_0221279c;
  F(s32, record, 4) = 0;
  F(s32, record, 8) = 0;
}

/* Empty ABI callback; it has no observable effects. */
void func_ov069_0220fd3c(void) {}

/* Constructs both 39-entry embedded collections and seeds their angle fields. */
void *func_ov069_0220fd40(void *owner) {
  s32 i;
  __construct_array((u8 *)owner + 4, 0x27, 0xc, func_ov069_0220fd20,
                    func_ov069_0220fd3c);
  __construct_array((u8 *)owner + 0x1d8, 0x27, 8, func_ov069_0220fe0c,
                    func_ov069_0220fe28);
  VecFx32Object_Init((u8 *)owner + 0x310);
  VecFx32Object_Init((u8 *)owner + 0x320);
  for (i = 12; i >= 0; --i) {
    F(u16, owner, 0x1e4 + i * 0x18) = (u16)genrand_int32();
    F(u16, owner, 0x1ec + i * 0x18) = (u16)genrand_int32();
    F(u16, owner, 0x1e6 + i * 0x18) = (u16)genrand_int32();
    F(u16, owner, 0x1ee + i * 0x18) = (u16)genrand_int32();
  }
  F(s32, owner, 0x330) = 0;
  F(s32, owner, 0x338) = 0;
  return owner;
}

/* Initializes the compact paired descriptor; mutates the record only. */
void func_ov069_0220fe0c(void *record) {
  F(void *, record, 0) = data_ov069_0221278c;
  F(u16, record, 4) = 0;
  F(u16, record, 6) = 0;
}

/* Empty ABI callback; it has no observable effects. */
void func_ov069_0220fe28(void) {}

/* Copies the owner's terminal vector into a supplied vector object. */
void func_ov069_0220fe2c(void *owner, void *destination) {
  VecFx32Object_Assign(destination, (u8 *)owner + 0x310);
}

/* Derives a trigonometric offset from two positions and stores it on the owner. */
void func_ov069_0220fe3c(void *owner, const void *first, const void *second,
                         void *unused) {
  s32 a[4], b[4];
  s32 angle;
  (void)unused;
  VecFx32Object_InitCopy(a, first);
  VecFx32Object_InitCopy(b, second);
  b[2] += 0x2f000;
  a[1] = (a[1] - a[2]) - 0x28000;
  angle = func_020ae024(a[1] - b[2], a[2] - b[1]);
  F(s32, owner, 0x324) = fx_mul(data_020c9670[(angle >> 4) * 2 + 1], 0x5000);
  F(s32, owner, 0x328) = fx_mul(data_020c9670[(angle >> 4) * 2], 0x5000);
  VecFx32Object_Destroy(a);
  VecFx32Object_Destroy(b);
}

/* Selects whether the controller ramps its blend value up, down, or stays idle. */
void func_ov069_0220ff20(void *owner, s32 direction) {
  F(s32, owner, 0x338) = direction;
  F(s32, owner, 0x330) = direction < 1 ? 0x1000 : 0;
}

/* Advances thirteen triple-point trails and submits interpolated transforms. */
void func_ov069_0220ff38(void *owner, const void *origin, s32 mode,
                         s32 frame_delta) {
  s32 i, j;
  s32 blend = F(s32, owner, 0x330);
  void *renderer;
  if (F(s32, owner, 0x338) == 1) {
    blend += 0x148;
    if (blend > 0x1000) blend = 0x1000;
  } else if (F(s32, owner, 0x338) == -1) {
    blend -= 0x7b;
    if (blend < 0) blend = 0;
  }
  F(s32, owner, 0x330) = blend;
  renderer = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)gGamePhaseRuntime + 0x2f7c);
  for (i = 12; i >= 0; --i) {
    s32 *trail = (s32 *)((u8 *)owner + i * 0x24);
    s16 *angles = (s16 *)((u8 *)owner + 0x1e4 + i * 0x18);
    s32 a[3], b[3], c[3];
    for (j = 0; j < 3; ++j) {
      trail[2 + j * 3] = F(const s32, origin, 4);
      trail[3 + j * 3] = F(const s32, origin, 8) + 0x2a000;
    }
    if (F(s32, owner, 0x338) == -1) {
      trail[2] += (i - 6) * 0x1800;
      trail[5] += (i - 6) * 0x2800;
      trail[8] += (i - 6) * 0x14cd;
      trail[3] += SignedAbsoluteValueVariant(i - 6) * 0xbb8 - 0x2a000;
      trail[6] += trail[3] + 0xe000;
      trail[9] += trail[3] + 0x1e000;
      trail[5] += fx_mul(data_020c9670[((u16)angles[0] >> 4) * 2], 0x6000);
      trail[8] += fx_mul(data_020c9670[((u16)angles[4] >> 4) * 2], 0x4000);
    } else if (mode == 0) {
      trail[2] += (i - 6) * 0x4000;
      trail[5] += (i - 6) * 0x6000;
      trail[8] += (i - 6) * 0x5000;
      trail[3] += SignedAbsoluteValueVariant(i - 6) * 0xbb8;
      trail[6] += trail[3] + 0xe000;
      trail[9] += trail[3] + 0x1e000;
      trail[5] += fx_mul(data_020c9670[((u16)angles[0] >> 4) * 2], 0x6000);
      trail[6] += fx_mul(data_020c9670[((u16)angles[1] >> 4) * 2], 0x3000);
      trail[8] += fx_mul(data_020c9670[((u16)angles[4] >> 4) * 2], 0x4000);
      trail[9] += fx_mul(data_020c9670[((u16)angles[5] >> 4) * 2], 0x5000);
    } else {
      s32 remaining = 0x1000 - blend * F(s32, owner, 0x338);
      if (remaining < 0) remaining = 0;
      trail[2] += (i - 6) * 0x4000;
      trail[5] += (i - 6) * 0x4000 + fx_mul((i - 6) * 0x4000, remaining);
      trail[8] += (i - 6) * 0x4000 + fx_mul((i - 6) * 0xa000, remaining);
      trail[6] += blend * F(s32, owner, 0x338) * 0x78 +
                  SignedAbsoluteValueVariant(i - 6) * 0xbb8 + 0xf000;
      trail[9] += blend * F(s32, owner, 0x338) * 0x78 +
                  SignedAbsoluteValueVariant(i - 6) * 0xbb8 + 0x20000;
      trail[5] += fx_mul(fx_mul(data_020c9670[((u16)angles[0] >> 4) * 2], 0x2000), remaining);
      trail[6] += fx_mul(data_020c9670[((u16)angles[1] >> 4) * 2], 0x2000);
      trail[8] += fx_mul(fx_mul(data_020c9670[((u16)angles[4] >> 4) * 2], 0x3000), remaining);
      trail[9] += fx_mul(data_020c9670[((u16)angles[5] >> 4) * 2], 0x3000);
      angles[0] += 9000; angles[1] += 9000; angles[4] += 9000; angles[5] += 9000;
    }
    angles[0] += (s16)func_020bf1f8(frame_delta * ((genrand_int32() & 0xfff) + 0x898), 10);
    angles[4] += (s16)func_020bf1f8(frame_delta * ((genrand_int32() & 0xfff) + 0x960), 10);
    angles[1] += (s16)func_020bf1f8(frame_delta * ((genrand_int32() & 0xfff) + 0x1068), 10);
    angles[5] += (s16)func_020bf1f8(frame_delta * ((genrand_int32() & 0xfff) + 0x1130), 10);
    func_ov069_0220fd20(a); func_ov069_0220fd20(b); func_ov069_0220fd20(c);
    b[1] = trail[5]; b[2] = trail[6];
    c[1] = F(s32, owner, 0x338) == 0 ? F(s32, owner, 0x314) : trail[2];
    c[2] = F(s32, owner, 0x338) == 0 ? F(s32, owner, 0x318) : trail[3];
    func_0209b58c(renderer, b, c, F(s32, owner, 0x338) == 0 ? blend / 2 : blend, a);
    trail[5] = a[1]; trail[6] = a[2];
    b[1] = trail[8]; b[2] = trail[9];
    func_0209b58c(renderer, b, c, blend, a);
    trail[8] = a[1]; trail[9] = a[2];
  }
}

/* Submits thirteen trail descriptors using one of three randomized palettes. */
void func_ov069_0221070c(void *owner, s32 random_value) {
  static const s32 transforms[36] = {
    0,0x3f000,0x10000,0x3f000,0,0x1f000,0x10000,0x1f000,0,0,0x10000,0,
    0,0x3f000,0x10000,0x3f000,0,0x1f000,0x10000,0x1f000,0,0,0x10000,0,
    0,0x3f000,0x10000,0x3f000,0,0x1f000,0x10000,0x1f000,0,0,0x10000,0
  };
  s32 base[3];
  const u16 *palette;
  void *renderer;
  s32 i;
  base[0] = F(s32, data_ov069_02212550, 0);
  base[1] = F(s32, data_ov069_02212550, 4);
  base[2] = F(s32, data_ov069_02212550, 8);
  random_value = func_020befec(random_value, 10);
  palette = random_value < 2 ? (const u16 *)data_ov069_02212546 :
            random_value == 2 ? (const u16 *)data_ov069_0221253e :
                                (const u16 *)data_ov069_02212536;
  renderer = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)gGamePhaseRuntime + 0x2f7c);
  func_0209b7ec(renderer, 0);
  for (i = 12; i >= 0; --i) {
    s32 transform_index = i % 3;
    func_0209b880(renderer, (u8 *)owner + 4 + i * 0x24, base,
                  transforms + transform_index * 12, 3, palette[i % 4],
                  (s16)((i % 2) - 0x1000));
  }
}

/* Copies one indexed position from the first embedded collection. */
void func_ov069_02210928(void *owner, s32 index, void *destination) {
  F(s32, destination, 4) = F(s32, owner, 0x474 + index * 0x3c);
  F(s32, destination, 8) = F(s32, owner, 0x478 + index * 0x3c);
  F(s32, destination, 0xc) = 0;
}

/* Copies one indexed position from the second embedded collection. */
void func_ov069_0221094c(void *owner, s32 index, void *destination) {
  F(s32, destination, 4) = F(s32, owner, 0x1590 + index * 0x10);
  F(s32, destination, 8) = F(s32, owner, 0x1598 + index * 0x10);
  F(s32, destination, 0xc) = 0;
}

/* Forwards a proximity query for the first embedded collection to overlay 49. */
s32 func_ov069_02210970(void *owner, void *position) {
  return func_ov049_0220c2dc((u8 *)owner + 0x454, position, 1);
}

/* Forwards a selection query for the first embedded collection to overlay 49. */
s32 func_ov069_02210988(void *owner) {
  return func_ov049_0220c3d8((u8 *)owner + 0x454);
}

/* Runs the collision/collection callback on the ninety-entry field. */
s32 func_ov069_0221099c(void *owner, const void *position) {
  return func_ov069_022115c0((u8 *)owner + 0xafc, position);
}

/* Finds the nearest active entry in the ninety-entry field. */
s32 func_ov069_022109b0(void *owner, const void *position) {
  return func_ov069_02211778((u8 *)owner + 0xafc, position);
}

/* Constructs both ninety-entry vector arrays and clears their active slots. */
void *func_ov069_022109c4(void *owner) {
  __construct_array((u8 *)owner + 4, 0x5a, 0x10, VecFx32Object_Init,
                    VecFx32Object_Destroy);
  __construct_array((u8 *)owner + 0xa90, 0x5a, 0x10, VecFx32Object_Init,
                    VecFx32Object_Destroy);
  func_ov069_02210a24(owner);
  return owner;
}

/* Clears all ninety active-slot counters. */
void func_ov069_02210a24(void *owner) {
  s32 i;
  for (i = 89; i >= 0; --i)
    F(s32, owner, 0x7c0 + i * 4) = 0;
}

/* Spawns up to twenty particles into free slots using the selected pattern. */
void func_ov069_02210a44(void *owner, s32 pattern, s32 x, s32 y,
                         s32 avoid_x, s32 avoid_y) {
  const s32 *durations = (const s32 *)(data_ov069_022125ac + pattern * 0x28);
  s32 spawn;
  for (spawn = 19; spawn >= 0; --spawn) {
    s32 slot;
    for (slot = 89; slot >= 0; --slot)
      if (F(s32, owner, 0x7c0 + slot * 4) == 0)
        break;
    if (slot < 0)
      return;
    {
      u8 *entry = (u8 *)owner + slot * 0x10;
      s32 target_x, target_y;
      s32 retry = 1;
      s32 speed;
      F(s32, entry, 0xa94) = x << 12;
      F(s32, entry, 0xa98) = 0;
      F(s32, entry, 0xa9c) = y << 12;
      do {
        if (pattern == 2 || pattern == 5 || pattern > 7) {
          target_x = fx_mul((s32)(genrand_int32() & 0xfff), 0x17c000) + 0x142000;
          target_y = fx_mul((s32)(genrand_int32() & 0xfff), 0x17c000) + 0xbe000;
          F(s32, entry, 0xc) = (s32)(genrand_int32() & 0x1fff) - 0x5000;
        } else {
          target_x = F(s32, entry, 0xa94) - 0x46000 +
                     fx_mul((s32)(genrand_int32() & 0xfff), 0x8c000);
          target_y = F(s32, entry, 0xa9c) - 0x32000 +
                     fx_mul((s32)(genrand_int32() & 0xfff), 0x64000);
          F(s32, entry, 0xc) = (s32)(genrand_int32() & 0xfff) - 0x4000;
        }
      } while (target_x - avoid_x > -0x10000 && target_x - avoid_x < 0x10000 &&
               target_y - avoid_y > -0x10000 && target_y - avoid_y < 0x10000 &&
               retry-- > 0);
      F(s32, entry, 8) = F(s32, entry, 0xa94) - target_x;
      F(s32, entry, 0x10) = F(s32, entry, 0xa9c) - target_y;
      speed = fx_mul(func_020adc90(F(s32, entry, 0xc), 0x333), 0x2000);
      F(s32, entry, 8) = func_020adc90(F(s32, entry, 8), speed);
      F(s32, entry, 0x10) = func_020adc90(F(s32, entry, 0x10), speed);
      F(u16, owner, 0x5a4 + slot * 2) = 0;
      F(s32, owner, 0x658 + slot * 4) = (s32)(genrand_int32() & 0x1ff) - 0x100;
      if ((pattern >= 0 && pattern <= 2) || (pattern >= 6 && pattern <= 10)) {
        F(s32, owner, 0x7c0 + slot * 4) =
            spawn < 10 ? durations[spawn] : (s32)(genrand_int32() & 3) + 7;
      } else {
        F(s32, owner, 0x7c0 + slot * 4) = (s32)(genrand_int32() & 3) + 7;
      }
      F(s32, owner, 0x1030 + slot * 4) = 0;
      F(u32, owner, 0x928 + slot * 4) = 0xff;
    }
  }
}

/* Initializes thirty-nine radial particles around a supplied fixed-point position. */
void func_ov069_02210dc0(void *owner, const void *origin) {
  s32 i;
  for (i = 38; i >= 0; --i) {
    s32 quotient = i / 13;
    s32 remainder = i % 13;
    s32 angle = ((remainder * 0x13b1) & 0xffff) >> 4;
    s32 radius = quotient * 0x28 + 100;
    u8 *entry = (u8 *)owner + i * 0x10;
    s32 dx, dy, distance;
    F(s32, owner, 0x7c0 + i * 4) = (s32)(genrand_int32() & 3) + 7;
    F(s32, entry, 0xa94) = radius * data_020c9670[angle * 2] + F(const s32, origin, 4);
    F(s32, entry, 0xa98) = 0;
    F(s32, entry, 0xa9c) = radius * data_020c9670[angle * 2 + 1] + F(const s32, origin, 8);
    F(s32, entry, 0xa94) += fx_mul((s32)(genrand_int32() & 0xfff), 0x3c000) - 0x1e000;
    F(s32, entry, 0xa9c) += fx_mul((s32)(genrand_int32() & 0xfff), 0x3c000) - 0x1e000;
    dx = F(const s32, origin, 4) - F(s32, entry, 0xa94);
    dy = F(const s32, origin, 8) - F(s32, entry, 0xa9c);
    distance = func_020adc40(fx_mul(dx, dx) + fx_mul(dy, dy));
    F(s32, entry, 8) = fx_mul(func_020adc90(dx, distance), 0x3000);
    F(s32, entry, 0x10) = fx_mul(func_020adc90(dy, distance), 0x3000);
    F(s32, owner, 0x1030 + i * 4) = 0;
    F(u16, owner, 0x5a4 + i * 2) = (u16)genrand_int32();
  }
}

/* Simulates or submits all active field particles, including bounce expiry. */
void func_ov069_0221100c(void *owner, s32 submit_only) {
  s32 i;
  for (i = 89; i >= 0; --i) {
    s32 active = F(s32, owner, 0x7c0 + i * 4);
    s32 *age = (s32 *)((u8 *)owner + 0x1030 + i * 4);
    u8 *velocity = (u8 *)owner + i * 0x10;
    if (submit_only) {
      if (active > 0 && *age > 0)
        VecFx32Object_Add((u8 *)owner + 0xa90 + i * 0x10,
                          (u8 *)owner + 4 + i * 0x10);
      continue;
    }
    if (active > 0 && *age >= 0) {
      s32 position[4];
      F(s32, velocity, 0xc) += 0x333;
      if (*age != 0 && ++*age > 30)
        F(s32, owner, 0x7c0 + i * 4) = 0;
      if (F(s32, velocity, 0xa98) + F(s32, velocity, 0xc) > 0) {
        F(s32, velocity, 0xc) = -(F(s32, velocity, 0xc) >> 1);
        if (active < 7) {
          *age = -1;
          if (active == 1)
            F(u32, owner, 0x928 + i * 4) =
                Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds(RuntimePresentationManager_GetGraphics3dPresentation((u8 *)gGamePhaseRuntime + 0x2f7c), 0,
                              (F(s32, velocity, 0xa94) >> 12) - 20,
                              (F(s32, velocity, 0xa9c) >> 12) - 20,
                              40, 40, 0x46);
        } else {
          ++*age;
        }
      }
      func_ov069_0221123c(position, (u8 *)owner + 0xa90 + i * 0x10,
                          (u8 *)owner + 4 + i * 0x10);
      if (position[1] < 0x144000 || position[1] > 0x2bc000)
        F(s32, velocity, 8) = -F(s32, velocity, 8);
      if (position[3] < 0x84000 || position[3] > 0x21c000)
        F(s32, velocity, 0x10) = -F(s32, velocity, 0x10);
      F(s32, velocity, 0xa94) += F(s32, velocity, 8);
      F(s32, velocity, 0xa98) += F(s32, velocity, 0xc);
      F(s32, velocity, 0xa9c) += F(s32, velocity, 0x10);
      F(u16, owner, 0x5a4 + i * 2) += (s16)F(s32, owner, 0x658 + i * 4);
      VecFx32Object_Destroy(position);
    }
  }
}

/* Initializes a vector and stores the sum of two optional vector payloads. */
void func_ov069_0221123c(void *destination, const void *left,
                         const void *right) {
  VecFx32Object_Init(destination);
  func_020adff0(left != 0 ? (const u8 *)left + 4 : 0,
                right != 0 ? (const u8 *)right + 4 : 0,
                (u8 *)destination + 4);
}

/* Submits every active particle using per-type geometry and texture records. */
void func_ov069_02211274(void *owner) {
  static const s32 descriptors[88] = {
    0,0,0x10000,0x10000, 0x58000,0,0x80000,0x28000,
    0x30000,0x10000,0x48000,0x28000, 0x48000,0x10000,0x58000,0x20000,
    0x30000,0x28000,0x40000,0x38000, 0x60000,0x28000,0x70000,0x38000,
    0x70000,0x28000,0x80000,0x38000, 0x40000,0x28000,0x60000,0x40000,
    0x30000,0x40000,0x48000,0x58000, 0x48000,0x40000,0x60000,0x58000,
    0x60000,0x40000,0x80000,0x58000,
    -8,-8,8,8, -20,-20,20,20, -12,-12,12,12, -8,-8,8,8,
    -8,-8,8,8, -8,-8,8,8, -8,-8,8,8, -16,-12,16,12,
    -12,-12,12,12, -12,-12,12,12, -16,-16,16,16
  };
  s32 scale[4], position[4];
  void *renderer = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)gGamePhaseRuntime + 0x2f7c);
  s32 i;
  VecFx32Object_InitComponents(scale, 0x1000, 0x1000, 0x1000);
  for (i = 89; i >= 0; --i) {
    s32 type = F(s32, owner, 0x7c0 + i * 4);
    if (type > 0) {
      u8 *entry = (u8 *)owner + i * 0x10;
      VecFx32Object_InitComponents(position, F(s32, entry, 0xa94),
          F(s32, entry, 0xa98) + F(s32, entry, 0xa9c),
          -(F(s32, entry, 0xa9c) >> 12));
      func_0209c430(renderer, position, scale, F(u16, owner, 0x5a4 + i * 2),
                    descriptors + 44 + type * 4, 0,
                    descriptors + type * 4, data_ov069_02212590, 0x14);
      VecFx32Object_Destroy(position);
    }
  }
  VecFx32Object_Destroy(scale);
}

/* Counts the active slots in the ninety-entry field. */
s32 func_ov069_02211594(void *owner) {
  s32 i, count = 0;
  for (i = 89; i >= 0; --i)
    if (F(s32, owner, 0x7c0 + i * 4) != 0)
      ++count;
  return count;
}

/* Collects the first eligible nearby particle, updates score/effects, and returns whether one was collected. */
s32 func_ov069_022115c0(void *owner, const void *position) {
  const s32 *thresholds = (const s32 *)data_ov069_0221255c;
  const s32 *rewards = (const s32 *)data_ov069_02212590;
  s32 i;
  for (i = 89; i >= 0; --i) {
    s32 type = F(s32, owner, 0x7c0 + i * 4);
    if (type != 0 && F(s32, owner, 0x1030 + i * 4) <= -1) {
      s32 dx = F(s32, owner, 0xa94 + i * 0x10) - F(const s32, position, 4);
      s32 dy = F(s32, owner, 0xa9c + i * 0x10) -
               (F(const s32, position, 8) - 0xa000);
      s32 distance = func_020adc40(fx_mul(dx, dx) + fx_mul(dy, dy));
      if (distance < thresholds[type - 1]) {
        Graphics3dPresentation *renderer;
        u32 effect;
        F(s32, F(void *, owner, 0), 0x90) += rewards[type];
        F(s32, owner, 0x7c0 + i * 4) = 0;
        renderer = (Graphics3dPresentation *)
            RuntimePresentationManager_GetGraphics3dPresentation(
                (u8 *)gGamePhaseRuntime + 0x2f7c);
        if (F(u32, owner, 0x928 + i * 4) != 0xff)
          Graphics3dPresentation_RemoveSpriteEffect(renderer, F(u32, owner, 0x928 + i * 4));
        effect = Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(renderer, 0,
            (F(s32, owner, 0xa94 + i * 0x10) >> 12) - 14,
            (F(s32, owner, 0xa9c + i * 0x10) >> 12) - 19,
            28, 28, 4);
        Graphics3dPresentation_SetSpriteEffectVertexDepth(renderer, effect, -20);
        Sound_Play(gSoundContext, 0, 0xf);
        return 1;
      }
    }
  }
  return 0;
}

/* Finds the closest eligible particle to a fixed-point position, or minus one. */
s32 func_ov069_02211778(void *owner, const void *position) {
  s32 best_index = -1;
  s32 best_distance = 0x3e8000;
  s32 i;
  for (i = 89; i >= 0; --i) {
    if (F(s32, owner, 0x7c0 + i * 4) != 0 &&
        F(s32, owner, 0x1030 + i * 4) <= -1) {
      s32 dx = F(s32, owner, 0xa94 + i * 0x10) - F(const s32, position, 4);
      s32 dy = F(s32, owner, 0xa9c + i * 0x10) - F(const s32, position, 8);
      s32 distance = func_020adc40(fx_mul(dx, dx) + fx_mul(dy, dy));
      if (distance < best_distance) {
        best_distance = distance;
        best_index = i;
      }
    }
  }
  return best_index;
}

/* Releases a heap-backed base presentation object and returns the stale ABI pointer. */
void *func_ov069_0221182c(void *allocation) {
  Heap_Free(allocation);
  return allocation;
}

/* Releases a heap-backed derived presentation object and returns the stale ABI pointer. */
void *func_ov069_02211840(void *allocation) {
  Heap_Free(allocation);
  return allocation;
}

/* Initializes the base presentation controller and its embedded vectors. */
void *func_ov069_02211854(void *object) {
  F(void *, object, 0) = data_020f3058;
  VecFx32Object_Init((u8 *)object + 0x1c);
  VecFx32Object_Init((u8 *)object + 0x2c);
  F(s32, object, 4) = 0;
  F(s32, object, 8) = 0;
  F(s32, object, 0xc) = 0;
  F(s32, object, 0x44) = 0;
  return object;
}

/* Constructs the scene presentation, creates its sprite state, and resets scripted state. */
void *func_ov069_02211894(void *object, void *context, s32 variant) {
  typedef void (*ConfigureFn)(void *, void *, s32, s32, s32, s32);
  void *sprite;
  func_ov069_02211854(object);
  F(void *, object, 0) = data_ov069_022127d0;
  VecFx32Object_Init((u8 *)object + 0x50);
  F(void *, object, 0x4c) = context;
  sprite = func_0209a208(object, 0x1132, 0x112b, 0x1133, variant, 2);
  F(void *, object, 0x48) = sprite;
  F(ConfigureFn, F(void *, object, 0), 0)(object, sprite, 0x1d6000,
                                          0x280000, 0, 0);
  F(s32, sprite, 0x44) = 10;
  F(s32, object, 0x60) = 0;
  F(s32, object, 0x64) = 0;
  return object;
}

/* Destroys the scripted presentation's motion vector and shared base resources. */
void *func_ov069_0221193c(void *object) {
  VecFx32Object_Destroy((u8 *)object + 0x50);
  func_02099fb0(object);
  return object;
}

/* Configures sprite animation, position, scale, orientation, and visibility. */
void func_ov069_0221195c(void *unused, void *record, s32 x, s32 y,
                         s32 z, u8 animation) {
  void *sprite = F(void *, record, 0xc);
  (void)unused;
  GraphicsSpriteState_SetAnimationIndex(sprite, animation);
  F(u16, sprite, 0x24) |= 2;
  F(s32, record, 0x30) = x;
  F(s32, record, 0x34) = y;
  F(s32, record, 0x38) = z;
  F(u16, record, 0x3c) = 0x100;
  F(u16, record, 0x3e) = 0x100;
  F(u16, record, 0x40) = 0;
  F(u8, sprite, 0x3a) = 1;
}

/* Resets the scripted phase and makes the owned sprite visible. */
void func_ov069_022119bc(void *object) {
  F(s32, object, 0x60) = 0;
  F(s32, object, 0x64) = 0;
  F(u8, F(void *, F(void *, object, 0x48), 0xc), 0x3a) = 1;
}

/* Returns whether the scripted controller reached its terminal idle state. */
s32 func_ov069_022119dc(void *object) {
  return F(s32, object, 0x60) == 5 && F(s32, object, 0x64) == 0;
}

/* Resolves the current actor position through either overlay 39 or the paired owner. */
static void func_ov069_get_context_position(void *context, s32 *position) {
  void *paired = F(void *, context, 0x14);
  if (paired == 0) {
    func_ov039_022014e0(position, F(void *, context, 0x18));
  } else {
    VecFx32Object_InitCopy(position, (u8 *)F(void *, paired, 0x98) + 0x1c);
  }
}

/* Advances the main actor-relative movement and seven-phase capture sequence. */
void func_ov069_022119f8(void *object) {
  void *sprite_record = F(void *, object, 0x48);
  void *context = F(void *, object, 0x4c);
  void *paired = F(void *, context, 0x14);
  s32 kind = F(s32, context, 0x74);
  s32 target[4];
  s32 current[4];
  s32 delta[4];
  s32 speed = 0x1000;
  s32 stop_distance = 0x5000;
  s32 special_gate = 0;

  VecFx32Object_Init(target);
  target[1] = 0;
  target[2] = 0;
  target[3] = 0;
  if (kind == 0x17 || kind == 0x18) {
    speed = 0x2000;
    stop_distance = 0x119a;
    func_ov069_get_context_position(context, target);
    target[2] += 0x64000;
    if (paired != 0) {
      target[1] += 0x1d000;
      target[2] += 0xd000;
    }
    special_gate = 1;
  } else if (kind == 0x19 || kind == 0x1a) {
    s32 index = paired == 0
      ? func_ov039_022039a4(F(void *, context, 0x18), (u8 *)sprite_record + 0x2c)
      : func_ov069_022109b0(paired, (u8 *)sprite_record + 0x2c);
    if (index < 0) {
      target[1] = 0x200000;
      target[2] = 0x190000;
    } else if (paired == 0) {
      func_ov039_02203940(F(void *, context, 0x18), index, target);
      func_ov039_02203990(F(void *, context, 0x18), (u8 *)sprite_record + 0x2c);
    } else {
      func_ov069_0221094c(paired, index, target);
      func_ov069_0221099c(paired, (u8 *)sprite_record + 0x2c);
    }
  } else {
    s32 index = paired == 0
      ? func_ov039_0220397c(F(void *, context, 0x18), (u8 *)sprite_record + 0x2c, 0xa0000)
      : func_ov069_02210988(paired);
    if (index < 0) {
      if (kind == 0) {
        func_ov069_get_context_position(context, target);
        target[1] += F(s32, F(void *, F(void *, context, 8), 0x48), 0x30) / 2;
        target[2] = (target[2] + 0x528000 +
                    F(s32, F(void *, F(void *, context, 8), 0x48), 0x34)) / 4;
      } else {
        target[1] = 0x1da000;
        target[2] = 0x1eb000;
      }
    } else {
      if (paired == 0)
        func_ov039_0220391c(F(void *, context, 0x18), index, target);
      else
        func_ov069_02210928(paired, index, target);
      if ((paired == 0
           ? func_ov039_02203964(F(void *, context, 0x18), (u8 *)sprite_record + 0x2c)
           : func_ov069_02210970(paired, (u8 *)sprite_record + 0x2c)) != 0) {
        Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(RuntimePresentationManager_GetGraphics3dPresentation((u8 *)gGamePhaseRuntime + 0x2f7c), 4,
                       F(s32, sprite_record, 0x30) >> 12,
                       F(s32, sprite_record, 0x34) >> 12, 8);
      }
    }
    func_ov069_get_context_position(context, current);
    {
      s32 dx = F(s32, sprite_record, 0x30) - current[1];
      s32 dy = F(s32, sprite_record, 0x34) - (current[2] + 0xa000);
      if (dx > -0x69000 && dx < 0x69000 && dy > -0x50000 && dy < 0x50000) {
        s32 ax = dx < 0 ? -dx : dx;
        s32 ay = dy < 0 ? -dy : dy;
        if (func_020adc90(ay, 0x50000) < func_020adc90(ax, 0x69000))
          dy = 0;
        else
          dx = 0;
        F(s32, sprite_record, 0x30) += (dx < 0 ? -1 : dx > 0 ? 1 : 0) * (0x69000 - ax);
        F(s32, sprite_record, 0x34) += (dy < 0 ? -1 : dy > 0 ? 1 : 0) * (0x50000 - ay);
      }
    }
    VecFx32Object_Destroy(current);
  }

  switch (F(s32, object, 0x60)) {
  case 1:
    if (++F(s32, object, 0x64) > 14) {
      ++F(s32, object, 0x60);
      F(s32, object, 0x64) = 0;
    }
    break;
  case 2: {
    s32 phase;
    ++F(s32, object, 0x64);
    VecFx32Object_Add((u8 *)sprite_record + 0x2c, (u8 *)object + 0x50);
    phase = func_020befec(F(s32, object, 0x64) << 14, 50);
    F(s32, sprite_record, 0x38) = data_020c9670[(phase >> 4) * 2] * 0x3c;
    F(u16, sprite_record, 0x3c) =
      F(u16, sprite_record, 0x3e) = (u16)(func_020befec(
          F(s32, sprite_record, 0x38) * 0xff >> 12, 0x3c) + 0x100);
    func_0209e328(context, F(s32, object, 0x64) * -0x119a);
    if (F(s32, object, 0x64) > 49) {
      GraphicsSpriteState_SetAnimationIndex(F(void *, sprite_record, 0xc), 0x14);
      F(s32, object, 0x64) = 0;
      ++F(s32, object, 0x60);
    }
    break;
  }
  case 3:
    if (++F(s32, object, 0x64) > 29)
      ++F(s32, object, 0x60);
    break;
  case 4:
    F(s32, sprite_record, 0x38) -= 0x8000;
    if (F(s32, sprite_record, 0x38) < 0) {
      F(s32, sprite_record, 0x38) = 0;
      ++F(s32, object, 0x60);
      F(s32, object, 0x64) = 0;
      Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(RuntimePresentationManager_GetGraphics3dPresentation((u8 *)gGamePhaseRuntime + 0x2f7c), 0,
                     F(s32, sprite_record, 0x30) >> 12,
                     (F(s32, sprite_record, 0x34) >> 12) + 8);
      F(s32, context, 0x44) = 0x19;
      F(s32, context, 0x48) = 3;
      Sound_Play(gSoundContext, 99, 0x11);
    }
    F(u16, sprite_record, 0x3c) =
      F(u16, sprite_record, 0x3e) = (u16)(func_020befec(F(s32, sprite_record, 0x38) * 0xff >> 12, 0x3c) + 0x100);
    break;
  case 5:
    if (++F(s32, object, 0x64) > 24) {
      func_ov069_get_context_position(context, target);
      target[1] -= 0x1a000;
      target[2] += 0x5a000;
      func_ov069_022124f0(object, target);
      ++F(s32, object, 0x60);
      F(s32, object, 0x64) = 0;
    }
    break;
  case 6: {
    s32 phase;
    ++F(s32, object, 0x64);
    VecFx32Object_Add((u8 *)sprite_record + 0x2c, (u8 *)object + 0x50);
    phase = func_020befec(F(s32, object, 0x64) << 15, 50);
    F(s32, sprite_record, 0x38) = data_020c9670[(phase >> 4) * 2] * 0x3c;
    F(u16, sprite_record, 0x3c) =
      F(u16, sprite_record, 0x3e) = (u16)(func_020befec(
          F(s32, sprite_record, 0x38) * 0x14 >> 12, 0x3c) + 0x100);
    func_0209e328(context, func_0209e330(context) + 0x800);
    if (F(s32, object, 0x64) > 49) {
      GraphicsSpriteState_SetAnimationIndex(F(void *, sprite_record, 0xc), 8);
      F(s32, object, 0x64) = 0;
      ++F(s32, object, 0x60);
    }
    break;
  }
  case 7:
    break;
  default:
    VecFx32Object_InitComponents(delta, 0, 0, 0);
    delta[1] = target[1] - F(s32, sprite_record, 0x30);
    delta[2] = target[2] - F(s32, sprite_record, 0x34);
    {
      s32 distance = func_020adc40(fx_mul(delta[1], delta[1]) + fx_mul(delta[2], delta[2]));
      if (distance > stop_distance) {
        s32 angle = func_020ae024(delta[1], delta[2]);
        s32 direction = ((u32)(-angle) + 0x1000) >> 13 & 7;
        delta[1] = fx_mul(func_020adc90(delta[1], distance),
                          distance - stop_distance < speed ? distance - stop_distance : speed);
        delta[2] = fx_mul(func_020adc90(delta[2], distance),
                          distance - stop_distance < speed ? distance - stop_distance : speed);
        VecFx32Object_Assign((u8 *)object + 0x50, delta);
        VecFx32Object_Add((u8 *)sprite_record + 0x2c, (u8 *)object + 0x50);
        if (direction != F(u8, F(void *, sprite_record, 0xc), 0x38)) {
          F(u16, sprite_record, 0x40) = (u16)direction;
          GraphicsSpriteState_SetAnimationIndex(F(void *, sprite_record, 0xc), direction);
        }
      } else {
        if ((F(u16, sprite_record, 0x40) | 8) != F(u8, F(void *, sprite_record, 0xc), 0x38)) {
          F(u16, sprite_record, 0x40) = (F(u16, sprite_record, 0x40) & 0xff) | 8;
          GraphicsSpriteState_SetAnimationIndex(F(void *, sprite_record, 0xc), F(u16, sprite_record, 0x40));
        }
        if (special_gate && F(u16, paired == 0 ? F(void *, context, 0x18) : paired,
                              paired == 0 ? 0x1caa : 0x1cae) > 0x78 &&
            F(s32, object, 0x60) == 0) {
          F(s32, object, 0x60) = 1;
          F(s32, object, 0x64) = 0;
          F(u8, F(void *, sprite_record, 0xc), 0x3a) = 0;
          GraphicsSpriteState_SetAnimationIndex(F(void *, sprite_record, 0xc), 0x13);
          func_ov069_get_context_position(context, target);
          func_ov069_022124f0(object, target);
        }
      }
    }
    VecFx32Object_Destroy(delta);
    break;
  }
  VecFx32Object_Destroy(target);
}

/* Applies the shared state update to both the controller and owned sprite record. */
void func_ov069_022124c4(void *object, s32 value) {
  func_0209a2ac(object, 0, 1);
  func_0209a2ac(F(void *, object, 0x48), value, 1);
}

/* Computes a fifty-frame velocity from the sprite position to a target vector. */
void func_ov069_022124f0(void *object, const void *target) {
  void *sprite_record = F(void *, object, 0x48);
  F(s32, object, 0x54) = func_020befec(
      F(const s32, target, 4) - F(s32, sprite_record, 0x30), 50);
  F(s32, object, 0x58) = func_020befec(
      F(const s32, target, 8) - F(s32, sprite_record, 0x34), 50);
}
