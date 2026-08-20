#include "tingle/types.h"

/*
 * Recovered overlay 71 scripted presentation and transition subsystem.
 *
 * The overlay owns presentation arrays and coordinates scene phases with
 * overlays 23, 31, 36, and 42 plus shared graphics and effect services.
 * Unconfirmed object members retain offset-based descriptions.
 */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))

extern u8 data_ov071_02212258[], data_ov071_02212394[];
extern const s32 data_ov071_0221223c[];
extern const s32 data_ov071_02212280[];
extern const s32 data_ov071_02212224[];
extern const s32 data_ov071_022122b4[];
extern const s32 data_ov071_022122f4[];
extern u8 data_ov071_022123c0[], data_ov071_022123c8[];
extern u8 data_ov071_02212340[];
extern u8 data_ov071_022123e0[];
extern u8 data_020c9770[];
extern u8 data_020cd470[];
extern u8 gSystemState[];
extern const s16 data_020c9670[];
extern void *data_020f3058, *gGameWork;
extern void *gSoundContext;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(...), VecFx32Object_Destroy(...);
extern void VecFx32Object_InitComponents(...);
extern void VecFx32Object_Assign(...), func_020a1794(...);
extern void GraphicsSpriteState_SetAnimationIndex(...);
extern void func_02099fb0(...), Heap_Free(...), func_02071ee0(...);
extern void *Heap_Alloc(...);
extern void func_0209a07c(...), func_0209a0d8(...);
extern s32 GameWork_TestFlag(...);
extern s32 func_020adc90(...);
extern s32 func_020adc40(...);
extern s32 func_020befec(...);
extern s32 func_020ae024(...);
extern u32 genrand_int32(...);
extern void func_020ad2d8(...), func_020ad2f4(...);
extern void func_0209a2ac(...), func_0209b7a0(...), func_0209d640(...);
extern void *func_0209a208(...);
extern void func_0209b494(...);
extern void func_020b0808(...), func_020b0880(...);
extern void func_ov071_02211e98(void *);
extern void func_ov071_0221083c(void *);
extern void func_020595b0(...), func_ov036_02200b38(...);
extern void func_ov023_021fdf70(...), func_ov031_021fdc88(...);
extern void func_ov042_021fdbc8(...), func_ov042_021fd924(...);
extern void func_ov042_0220a93c(...);
extern void Sound_Play(...);
#ifdef __cplusplus
}
#endif

static s32 ov071_multiply_fx(s32 a, s32 b) {
  return (s32)(((s64)a * b + 0x800) >> 12);
}

void func_ov071_022120a4(void *, const s32 *, s32, const s32 *,
                         const s32 *, u16);
void func_ov071_02210184(void *);
void func_ov071_02210230(void *, void *, s32, s32, s32, u8);
void func_ov071_02210354(void *, void *);
void func_ov071_02211158(void *, const void *);
void func_ov071_02211178(void *, const void *);
void func_ov071_022119bc(void *, const void *, const void *);
void func_ov071_02211190(void *, const void *);
void func_ov071_022115bc(void *);
void func_ov071_02211ca4(void *);
s32 func_ov071_022113fc(void *, s32, const void *);
void *func_ov071_02211514(void *, void *);

/* Initializes a small resource owner and embedded helper, clears runtime fields, and returns the owner after shared construction. */
void *func_ov071_0220fd20(void *owner) {
  F(void *, owner, 0) = data_020f3058;
  VecFx32Object_Init((u8 *)owner + 0x1c);
  VecFx32Object_Init((u8 *)owner + 0x2c);
  F(s32, owner, 4) = 0;
  F(s32, owner, 8) = 0;
  F(s32, owner, 0xc) = 0;
  F(s32, owner, 0x44) = 0;
  return owner;
}

/* Constructs the main scene object, its collection allocation and presentation resources, initializes transforms and counters, and returns the scene; allocation failure leaves the optional collection null. */
void *func_ov071_0220fd60(void *scene, void *owner, void *resource,
                          void *unused) {
  void *collection;
  void *presentation;
  s32 index;
  (void)unused;
  func_ov071_0220fd20(scene);
  F(void *, scene, 0) = data_ov071_02212394;
  VecFx32Object_Init((u8 *)scene + 0x4c);
  VecFx32Object_Init((u8 *)scene + 0x5c);
  func_ov071_02210184((u8 *)scene + 0x94);
  func_ov071_02210184((u8 *)scene + 0xa0);
  func_ov071_02210184((u8 *)scene + 0xac);
  func_ov071_02210184((u8 *)scene + 0xdc);
  F(void *, scene, 0x48) = owner;
  collection = Heap_Alloc(0xc38, data_ov071_022123c8, 4, gHeapContext);
  if (collection != 0)
    collection = func_ov071_02211514(collection, owner);
  F(void *, scene, 0xe8) = collection;

  if (GameWork_TestFlag(gGameWork, 0x306) != 0)
    presentation = func_0209a208(scene, 0x10ab, 0x10ae, 0x10ad,
                                 resource, 2);
  else
    presentation = func_0209a208(scene, 0x10ab, 0x10ac, 0x10ad,
                                 resource, 2);
  F(void *, scene, 0xec) = presentation;
  func_ov071_02210230(scene, presentation, 0x40000, 0x64000, 0, 0);
  F(u16, presentation, 0x42) &= (u16)~4;
  GraphicsSpriteState_SetAnimationIndex(F(void *, presentation, 0xc), 4);

  presentation = func_0209a208(scene, 0x10d0, 0x10d1, 0x10d2,
                               resource, 2);
  F(void *, scene, 0xf0) = presentation;
  func_ov071_02210230(scene, presentation, 0x40000, 0x64000, 0, 0);
  F(u16, presentation, 0x42) |= 4;
  GraphicsSpriteState_SetAnimationIndex(F(void *, presentation, 0xc), 0);
  F(u16, F(void *, presentation, 0xc), 0x24) &= (u16)~2;
  F(s32, presentation, 0x44) = -0x80;

  presentation = func_0209a208(scene, 0x1685, 0x1686, 0x1687,
                               resource, 2);
  F(void *, scene, 0xf4) = presentation;
  func_ov071_02210230(scene, presentation, 0x80000, 0x88000, 0, 0);
  F(u16, presentation, 0x42) |= 4;
  F(u16, F(void *, presentation, 0xc), 0x24) &= (u16)~2;

  for (index = 9; index >= 0; --index) {
    presentation = func_0209a208(scene, 0x23ab, 0x23ac, 0x23ad,
                                 resource, 2);
    F(void *, scene, 0x6c + index * 4) = presentation;
    func_ov071_02210230(
        scene, presentation,
        (F(const s32, data_ov071_02212258, index * 4) + 0x80) * 0x1000,
        0xf1000, 0, 0);
    F(u16, presentation, 0x42) &= (u16)~4;
    F(s32, presentation, 0x44) = -0x80;
  }
  F(s32, F(void *, scene, 0x88), 0x34) = 0xf4000;
  GraphicsSpriteState_SetAnimationIndex(
      F(void *, F(void *, scene, 0x88), 0xc), 10);
  F(s32, F(void *, scene, 0x8c), 0x34) = 0xf4000;
  GraphicsSpriteState_SetAnimationIndex(
      F(void *, F(void *, scene, 0x8c), 0xc), 10);
  GraphicsSpriteState_SetAnimationIndex(
      F(void *, F(void *, scene, 0x90), 0xc), 0xb);
  F(s32, F(void *, scene, 0x90), 0x44) = 0x78;

  F(s32, scene, 0x30) = 0x80000;
  F(s32, scene, 0x34) = 0xa000;
  F(s32, scene, 0x38) = 0;
  F(s16, scene, 0x3c) = 0x100;
  F(s16, scene, 0x3e) = 0x100;
  F(s16, scene, 0x40) = 0;
  *(volatile u32 *)0x04000014 = 0;
  *(volatile u32 *)0x0400001c = 0;
  F(s32, scene, 0x98) = 0;
  F(s32, scene, 0x9c) = 0xf0000;
  F(s32, scene, 0xa4) = 0;
  F(s32, scene, 0xa8) = 0;
  F(s32, scene, 0xb0) = 0;
  F(s32, scene, 0xb4) = 0;
  F(u16, scene, 0xb8) = 0x8000;
  F(s32, scene, 0xbc) = 0;
  F(s32, scene, 0xc0) = 0;
  F(s32, scene, 0xc4) = 0;
  F(s32, scene, 0xc8) = 0;
  F(s32, scene, 0xd0) = 0;
  F(s32, scene, 0xd4) = 0;
  F(s16, scene, 0xf8) = 0;
  F(s32, scene, 0xfc) = 0;
  F(s32, scene, 0xd8) = 0x7a120;
  if (F(s16, gGameWork, 0x246) != 0)
    F(s32, scene, 0xd8) =
        F(s32, gGameWork, 0x40) + F(s32, gGameWork, 0x7f8);
  if (GameWork_TestFlag(gGameWork, 0x306) != 0)
    F(s32, scene, 0xd8) <<= 1;
  return scene;
}

/* Initializes a three-word record with its overlay descriptor and zero payload; no SDK service is called. */
void func_ov071_02210184(void *record) {
  F(void *, record, 0) = data_ov071_022123c0;
  F(s32, record, 4) = 0;
  F(s32, record, 8) = 0;
}

/* Empty array-element destructor: changes no state and returns no meaningful value. */
void func_ov071_022101a0(void) {}

/* Destroys arrays and embedded resources and invokes shared base teardown; returns the released object. */
void *func_ov071_022101a4(void *scene) {
  void *allocation = F(void *, scene, 0xe8);
  F(void *, scene, 0) = data_ov071_02212394;
  if (allocation != 0) {
    /* Three twelve-element arrays occupy offsets 4, 0x2d4, and 0x5a4. Their
     * element destructor is intentionally empty, so releasing the allocation
     * is observably equivalent on the portable host. */
    Heap_Free(allocation);
  }
  VecFx32Object_Destroy((u8 *)scene + 0x5c);
  VecFx32Object_Destroy((u8 *)scene + 0x4c);
  func_02099fb0(scene);
  return scene;
}

/* Configures a presentation record from coordinates, enables rendering, and submits it through a shared helper. */
void func_ov071_02210230(void *unused, void *record, s32 x, s32 y, s32 z,
                         u8 animation) {
  (void)unused;
  GraphicsSpriteState_SetAnimationIndex(F(void *, record, 0xc), animation);
  F(u16, F(void *, record, 0xc), 0x24) |= 2;
  F(s32, record, 0x30) = x;
  F(s32, record, 0x34) = y;
  F(s32, record, 0x38) = z;
  F(s16, record, 0x3c) = 0x100;
  F(s16, record, 0x3e) = 0x100;
  F(s16, record, 0x40) = 0;
}

/* Stores fixed-point coordinates and clears progress fields; no direct SDK or hardware call occurs. */
void func_ov071_02210284(void *scene) {
  F(s32, scene, 0x60) = 0x80000;
  F(s32, scene, 0x64) = 0;
  F(s32, scene, 0xd4) = 0;
  F(s32, scene, 0xcc) = 0;
  F(s32, scene, 0xd0) = 0;
  F(s16, scene, 0xf8) = 0;
  F(s32, scene, 0xfc) = 0;
}

/* Updates presentation parameters and resources using shared graphics helpers; returns update status. */
void func_ov071_022102ac(void *scene) {
  s32 enabled;
  void *presentation = F(void *, scene, 0xec);
  func_0209a07c(presentation);
  enabled = GameWork_TestFlag(gGameWork, 0x306);
  func_0209a0d8(presentation, 0x10b1,
                enabled != 0 ? 0x10ae : 0x10ac, 0x10b2,
                F(void *, F(void *, scene, 0x48), 0), 2);
  GraphicsSpriteState_SetAnimationIndex(F(void *, presentation, 0xc), 4);
  F(u16, F(void *, presentation, 0xc), 0x24) |= 2;
}

/* Applies transform data through shared graphics services; mutates the object and returns helper status. */
void func_ov071_02210354(void *scene, void *out) {
  u8 matrix[36];
  s32 vector[3];
  vector[0] = (F(s32, scene, 0xe0) - 0x80000) & ~0xfff;
  vector[1] = (F(s32, scene, 0xe4) + 0x60000) & ~0xfff;
  vector[2] = 0x80000;
  func_020ad2d8(matrix, F(s16, data_020c9770, 0x8c),
                F(s16, data_020c9770, 0x8e));
  func_020ad2f4(vector, matrix, vector);
  vector[0] = func_020adc90(vector[0], vector[2]);
  vector[1] = func_020adc90(vector[1], vector[2]);
  F(s32, out, 4) = ov071_multiply_fx(vector[0], 0x51) << 7;
  F(s32, out, 8) = ov071_multiply_fx(vector[1], 0x51) << 7;
}

/* Copies or derives an offset-based transform field; mutates only the destination with no SDK call. */
s32 func_ov071_02210440(void *scene, const void *point, s32 extent,
                         s32 normalize_counter) {
  s32 dx = F(const s32, point, 4) - F(s32, scene, 0x98);
  s32 dy = F(const s32, point, 8) - F(s32, scene, 0x9c);
  s32 inside = dx > -extent && dx < extent && dy > -extent && dy < extent;
  if (inside) {
    F(s32, scene, 0xa4) -= ov071_multiply_fx(dx, 0x51);
    F(s32, scene, 0xa8) -= ov071_multiply_fx(dy, 0x51);
  }
  F(s32, scene, 0xd4) += inside * 4;
  if (normalize_counter != 0 && F(s32, scene, 0xd4) != 0)
    F(s32, scene, 0xd4) = 1;
  return inside;
}

/* Configures one presentation record and submits its resource; returns the shared operation status. */
void func_ov071_02210514(void *scene, s32 state, void *unused1,
                         void *unused2) {
  (void)unused1;
  (void)unused2;
  F(s16, scene, 0xf8) = (s16)state;
  F(s32, scene, 0xfc) = 0;
  if (state == 4)
    GraphicsSpriteState_SetAnimationIndex(F(void *, F(void *,scene,0xec),0xc),
                                          0x1a);
}

/* Returns or stores a small offset-based controller value without SDK or hardware effects. */
void func_ov071_02210540(void *scene) {
  F(s16, scene, 0xf8) = 8;
  F(s32, scene, 0xfc) = 0;
}

/* Returns or stores a second offset-based controller value without SDK or hardware effects. */
void func_ov071_02210554(void *scene) { func_ov071_0221083c(scene); }

/* Performs scene setup and resource updates through shared presentation/effect calls; returns setup status. */
void func_ov071_02210560(void *scene) {
  s16 state = F(s16, scene, 0xf8);
  if (state == 2) {
    F(u16, F(void *, scene, 0xec), 0x42) &= (u16)~4;
    F(s32, scene, 0x98) = 0;
    F(s32, scene, 0x9c) = 0x118000;
    F(s16, scene, 0xf8) = 3;
    GraphicsSpriteState_SetAnimationIndex(
        F(void *, F(void *, scene, 0x90), 0xc), 0xb);
  } else if (state == 3) {
    F(s32, scene, 0xa8) = -0x1000;
    F(s32, scene, 0x9c) -= 0x1000;
    if (F(s32, scene, 0x9c) < 0xf2000)
      F(s16, scene, 0xf8) = 0;
  } else if (state == 4) {
    if (F(s32, scene, 0x9c) < 0x14001) {
      ++F(s32, scene, 0xfc);
      F(s32, scene, 0xa8) -= func_020befec(F(s32, scene, 0xa8), 12);
    } else {
      F(s32, scene, 0xa8) -= 0x7b;
      if (F(s32, scene, 0xa8) < -0x4000)
        F(s32, scene, 0xa8) = -0x4000;
    }
    if (F(s32, scene, 0xfc) == 0x50) {
      F(s32, scene, 0xfc) = 0;
      ++F(s16, scene, 0xf8);
    }
    F(s32, scene, 0x9c) += F(s32, scene, 0xa8);
  } else if (state == 5) {
    if (F(s32, scene, 0x9c) < 0xd2000) {
      F(s32, scene, 0xa8) += 0x7b;
      if (F(s32, scene, 0xa8) > 0x1000)
        F(s32, scene, 0xa8) = 0x1000;
    } else {
      ++F(s32, scene, 0xfc);
      F(s32, scene, 0xa8) -= func_020befec(F(s32, scene, 0xa8), 12);
    }
    if (F(s32, scene, 0xfc) == 0x1e) {
      F(s32, scene, 0xfc) = 0;
      ++F(s16, scene, 0xf8);
    }
    F(s32, scene, 0x9c) += F(s32, scene, 0xa8);
  } else if (state == 7) {
    s32 scale = 0x100 - ++F(s32, scene, 0xfc);
    F(s16, F(void *, scene, 0xec), 0x3c) = (s16)scale;
    F(s16, F(void *, scene, 0xec), 0x3e) = (s16)scale;
    if (scale < 0x80) {
      func_ov071_022102ac(scene);
      F(s16, F(void *, scene, 0xec), 0x3c) = 0x100;
      F(s16, F(void *, scene, 0xec), 0x3e) = 0x100;
      F(s32, scene, 0xfc) = 0;
      F(s16, scene, 0xf8) = 0;
    }
  } else if (state == 8) {
    s32 frame = ++F(s32, scene, 0xfc);
    if (frame == 1) {
      GraphicsSpriteState_SetAnimationIndex(
          F(void *, F(void *, scene, 0xec), 0xc), 0x1a);
      F(s16, F(void *, scene, 0xec), 0x3c) = 0x80;
      F(s16, F(void *, scene, 0xec), 0x3e) = 0x80;
    } else {
      s32 angle = frame * 0x17c;
      s32 scale;
      if (angle > 0x4000)
        angle = 0x4000;
      scale = (((0x1000 - data_020c9670[(angle >> 4) * 2 + 1]) *
                0x180) >> 12) + 0x80;
      F(s16, F(void *, scene, 0xec), 0x3c) = (s16)scale;
      F(s16, F(void *, scene, 0xec), 0x3e) = (s16)scale;
    }
  }
  func_020a1794(F(void *, scene, 0x48), (u8 *)scene + 0x94,
                (u8 *)F(void *, scene, 0xec) + 0x2c, 0);
  VecFx32Object_Assign((u8 *)F(void *, scene, 0xf0) + 0x2c,
                       (u8 *)F(void *, scene, 0xec) + 0x2c);
  if ((F(u16, F(void *, scene, 0xf0), 0x42) & 4) == 0 &&
      (F(u16, F(void *, F(void *, scene, 0xf0), 0xc), 0x24) & 1) != 0) {
    F(u16, F(void *, scene, 0xf0), 0x42) |= 4;
    F(s32, scene, 0xcc) = 0;
  }
}

/* Advances the main scripted controller: samples DS input, integrates bounded fixed-point motion, drives sprite phases, spawns collection effects, and completes the overlay-36 sequence with sound. */
void func_ov071_0221083c(void *scene) {
  s32 input_index = 0;
  s32 owner_mode;
  s32 speed;
  s32 acceleration;
  s32 maximum;
  s32 magnitude;
  u16 keys;
  void *owner = F(void *, scene, 0x48);
  if (F(void *, owner, 0x1c0) != 0) {
    s32 source[3];
    func_ov071_02211158(source, owner);
    func_ov071_02211178((u8 *)scene + 0xdc, source);
  }
  if (F(s32, scene, 0xc8) > 0) {
    s32 previous = F(s32, scene, 0xc8);
    s32 frame = previous + 1;
    s32 scale = frame * 12 + 0x100;
    if (scale > 0x1d0)
      scale = 0x1d0;
    F(s32, scene, 0xc8) = frame;
    if (frame > 0x11)
      scale += (data_020c9670[(((previous - 0x10) * 0x6d6 & 0xffff) >>
                               4) *
                              2] *
                0x30) >>
               12;
    F(s16, F(void *, scene, 0xec), 0x3c) = (s16)scale;
    F(s16, F(void *, scene, 0xec), 0x3e) = (s16)scale;
    if (frame == 0x14)
      F(s32, owner, 0x1c8) = 0xb;
    func_ov071_02211ca4(F(void *, scene, 0xe8));
    F(u32, data_ov071_022123e0, 8) =
        (F(s32, data_ov071_022123e0, 8) +
         F(s32, data_ov071_02212340, 0x1c)) &
        0xffff;
    return;
  }
  if (F(s16, scene, 0xf8) != 0) {
    func_ov071_02210560(scene);
    func_ov071_02211ca4(F(void *, scene, 0xe8));
    F(u32, data_ov071_022123e0, 8) =
        (F(s32, data_ov071_022123e0, 8) +
         F(s32, data_ov071_02212340, 0x1c)) &
        0xffff;
    return;
  }

  keys = F(u16, gSystemState, 0x1a);
  F(s32, F(void *, owner, 0x10), 0x52c) = 0;
  if (F(void *, owner, 0x1ec) != 0 || F(s32, scene, 0xcc) != 0)
    keys = 0;
  if ((keys & 0x40) != 0)
    input_index = 2;
  if ((keys & 0x80) != 0)
    input_index |= 1;
  if ((keys & 0x20) != 0) {
    F(s32, F(void *, owner, 0x10), 0x52c) = 0x640;
    input_index |= 8;
  }
  if ((keys & 0x10) != 0) {
    F(s32, F(void *, owner, 0x10), 0x52c) = -0x640;
    input_index |= 4;
  }

  if (F(void *, owner, 0x1ec) != 0) {
    if (F(s32, scene, 0x98) > 0x4000)
      F(s32, scene, 0xa4) -= 0x28f;
    else if (F(s32, scene, 0x98) < -0x4000)
      F(s32, scene, 0xa4) += 0x28f;
    else
      F(s32, scene, 0xa4) -=
          ov071_multiply_fx(F(s32, scene, 0xa4), 0x19a);
    if (F(s32, owner, 0x1ec) == 1) {
      if (F(s32, scene, 0x9c) < 0xe6000)
        F(s32, scene, 0xa8) += 0x28f;
    } else if (F(s32, scene, 0x9c) > 0xb4000) {
      F(s32, scene, 0xa8) -= 0x28f;
    } else if (F(s32, scene, 0x9c) < 0xaa000) {
      F(s32, scene, 0xa8) += 0x28f;
    } else {
      F(s32, scene, 0xa8) -=
          ov071_multiply_fx(F(s32, scene, 0xa8), 0x19a);
    }
    if (F(u16, scene, 0xb8) <= 0x8000)
      F(u16, scene, 0xb8) += 0x400;
    else
      F(u16, scene, 0xb8) -= 0x400;
    if ((((F(u16, scene, 0xb8) + 0x1000) >> 13) & 7) !=
        F(u8, F(void *, F(void *, scene, 0xec), 0xc), 0x38))
      GraphicsSpriteState_SetAnimationIndex(
          F(void *, F(void *, scene, 0xec), 0xc),
          ((F(u16, scene, 0xb8) + 0x1000) >> 13) & 7);
  }

  owner_mode = F(s32, F(void *, owner, 0xc), 0x1b4) == 2 ? 1 : 0;
  speed = data_ov071_02212224[owner_mode];
  acceleration = data_ov071_02212224[2 + owner_mode];
  maximum = data_ov071_02212224[4 + owner_mode];
  F(s32, scene, 0xa4) -= ov071_multiply_fx(F(s32, scene, 0xa4), speed);
  F(s32, scene, 0xa8) -= ov071_multiply_fx(F(s32, scene, 0xa8), speed);
  F(s32, scene, 0xa4) +=
      ov071_multiply_fx(data_ov071_022122b4[input_index], acceleration);
  F(s32, scene, 0xa8) +=
      ov071_multiply_fx(data_ov071_022122f4[input_index], acceleration);
  magnitude = func_020adc40(
      ov071_multiply_fx(F(s32, scene, 0xa4), F(s32, scene, 0xa4)) +
      ov071_multiply_fx(F(s32, scene, 0xa8), F(s32, scene, 0xa8)));
  if (magnitude > maximum) {
    F(s32, scene, 0xa4) = ov071_multiply_fx(
        func_020adc90(F(s32, scene, 0xa4), magnitude), maximum);
    F(s32, scene, 0xa8) = ov071_multiply_fx(
        func_020adc90(F(s32, scene, 0xa8), magnitude), maximum);
  }

  if (F(s32, scene, 0xd4) != 0) {
    if (func_ov071_022113fc(scene,
                            F(s32, scene, 0xd4) * 0x9c4, 0) != 0) {
      s32 phase = F(s32, F(void *, owner, 0xc), 0x1b4);
      Sound_Play(gSoundContext,
                 phase == 0 ? 0x169 : phase == 1 ? 0x16b : 0x16a,
                 phase == 0 ? 3 : phase == 1 ? 1 : 8);
    }
    F(s32, scene, 0xcc) = 0;
  }
  if (F(s32, scene, 0xd0) != 0) {
    if (--F(s32, scene, 0xd0) == 0)
      GraphicsSpriteState_SetAnimationIndex(
          F(void *, F(void *, scene, 0x90), 0xc), 0xb);
    F(s32, scene, 0xb0) = 0;
    F(s32, scene, 0xb4) = 0;
    if (F(s32, scene, 0xcc) == 0) {
      s32 animation = (((F(u16, scene, 0xb8) + 0x1000) >> 13) & 7) + 0x10;
      if (animation != F(u8, F(void *, F(void *, scene, 0xec), 0xc), 0x38))
        GraphicsSpriteState_SetAnimationIndex(
            F(void *, F(void *, scene, 0xec), 0xc), animation);
    } else {
      GraphicsSpriteState_SetAnimationIndex(
          F(void *, F(void *, scene, 0xec), 0xc), 4);
      F(u16, F(void *, scene, 0xec), 0x42) |= 4;
      GraphicsSpriteState_SetAnimationIndex(
          F(void *, F(void *, scene, 0xf0), 0xc), 0);
      F(u16, F(void *, scene, 0xf0), 0x42) &= (u16)~4;
      F(s32, scene, 0xa4) = 0;
      F(s32, scene, 0xa8) = 0;
      F(s32, scene, 0xd0) = 0;
      F(s16, scene, 0xf8) = 1;
    }
  }

  if (F(s32, F(void *, owner, 0xc), 0x1bc) < 1 &&
      F(void *, owner, 0x1c0) != 0 && F(void *, owner, 0x1ec) == 0 &&
      F(s32, scene, 0xcc) == 0) {
    ++F(s32, scene, 0xc4);
    if (F(s32, scene, 0xc4) % F(s32, data_ov071_02212340, 0x24) == 0) {
      func_ov071_022115bc(F(void *, scene, 0xe8));
      if (GameWork_TestFlag(gGameWork, 0x306) != 0)
        --F(s32, scene, 0xd8);
      --F(s32, scene, 0xd8);
      F(u32, data_ov071_022123e0, 0xc) ^= 1;
      Sound_Play(gSoundContext, 0x1d7,
                 F(u32, data_ov071_022123e0, 0xc) == 0 ? 10 : 0);
    }
    if ((F(u32, scene, 0xc0) & 2) == 0) {
      F(s32, scene, 0xb0) = 0;
      F(s32, scene, 0xb4) = 0;
    }
    if (F(s32, scene, 0xd0) == 0) {
      s32 animation = (((F(u16, scene, 0xb8) + 0x1000) >> 13) & 7) + 8;
      if (animation != F(u8, F(void *, F(void *, scene, 0xec), 0xc), 0x38))
        GraphicsSpriteState_SetAnimationIndex(
            F(void *, F(void *, scene, 0xec), 0xc), animation);
    }
  } else {
    F(s32, scene, 0xb0) = 0;
    F(s32, scene, 0xb4) = 0;
    if (F(s32, scene, 0xd0) == 0 &&
        F(u8, F(void *, F(void *, scene, 0xec), 0xc), 0x38) > 7)
      GraphicsSpriteState_SetAnimationIndex(
          F(void *, F(void *, scene, 0xec), 0xc),
          ((F(u16, scene, 0xb8) + 0x1000) >> 13) & 7);
  }

  func_ov071_02211190((u8 *)scene + 0x94, (u8 *)scene + 0xa0);
  if (F(s32, scene, 0x98) < -0x78000) {
    F(s32, scene, 0x98) = -0x78000;
    F(s32, scene, 0xa4) = 0;
  } else if (F(s32, scene, 0x98) > 0x78000) {
    F(s32, scene, 0x98) = 0x78000;
    F(s32, scene, 0xa4) = 0;
  }
  if (F(s32, scene, 0x9c) < 0x9a000) {
    F(s32, scene, 0x9c) = 0x9a000;
    F(s32, scene, 0xa8) = 0;
  } else if (F(s32, scene, 0x9c) > 0xf2000) {
    F(s32, scene, 0x9c) = 0xf2000;
    F(s32, scene, 0xa8) = 0;
  }
  if (F(s32, scene, 0xa4) > -0x7b && F(s32, scene, 0xa4) < 0x7b)
    F(s32, scene, 0xa4) = 0;
  if (F(s32, scene, 0xa8) > -0x7b && F(s32, scene, 0xa8) < 0x7b)
    F(s32, scene, 0xa8) = 0;
  func_020a1794(owner, (u8 *)scene + 0x94,
                (u8 *)F(void *, scene, 0xec) + 0x2c, 0);
  VecFx32Object_Assign((u8 *)F(void *, scene, 0xf0) + 0x2c,
                       (u8 *)F(void *, scene, 0xec) + 0x2c);
  if (GameWork_TestFlag(gGameWork, 0x306) != 0 && F(s32, scene, 0xd8) == 1)
    F(s32, scene, 0xd8) = 0;
  if (F(s32, scene, 0xd8) < 1) {
    F(s32, scene, 0xd8) = 0;
    F(s32, scene, 0xc8) = 1;
    F(s32, scene, 0xb0) = 0;
    F(s32, scene, 0xb4) = 0;
    F(s32, scene, 0xa4) = 0;
    F(s32, scene, 0xa8) = 0;
    GraphicsSpriteState_SetAnimationIndex(
        F(void *, F(void *, scene, 0xec), 0xc), 0x18);
    func_ov036_02200b38(F(void *, owner, 0xc));
    Sound_Play(gSoundContext, 0, 0x2d);
    func_020595b0(gSoundContext, 0, 0x3c);
  }
  F(s32, F(void *, scene, 0xec), 0x30) += F(s32, scene, 0xb0);
  F(s32, F(void *, scene, 0xec), 0x34) += F(s32, scene, 0xb4);
  func_ov071_02211ca4(F(void *, scene, 0xe8));
  F(u32, data_ov071_022123e0, 8) =
      (F(s32, data_ov071_022123e0, 8) +
       F(s32, data_ov071_02212340, 0x1c)) &
      0xffff;
}

/* Copies an offset-based runtime value between records; changes only destination state with no SDK call. */
void func_ov071_02211158(void *record, const void *scene) {
  F(void *, record, 0) = data_ov071_022123c0;
  F(s32, record, 4) = F(const s32, scene, 0x1b8);
  F(s32, record, 8) = F(const s32, scene, 0x1bc);
}

/* Copies another offset-based runtime value between records; changes only destination state with no SDK call. */
void func_ov071_02211178(void *destination, const void *source) {
  if (destination != source) {
    F(s32, destination, 4) = F(const s32, source, 4);
    F(s32, destination, 8) = F(const s32, source, 8);
  }
}

/* Copies or initializes a compact presentation payload; mutates destination state without direct SDK interaction. */
void func_ov071_02211190(void *destination, const void *delta) {
  F(s32, destination, 4) += F(const s32, delta, 4);
  F(s32, destination, 8) += F(const s32, delta, 8);
}

/* Initializes the presentation collection and shared resource handles; mutates the scene and returns setup status. */
void func_ov071_022111b4(void *scene, s32 mode, s32 parameter) {
  s32 remaining, started = 0, i;
  u8 origin[16];
  func_0209a2ac(scene, 0, 1);
  ++F(s32, scene, 0xc0);
  func_0209a2ac(F(void *, scene, 0xec), mode, 1);
  func_0209a2ac(F(void *, scene, 0xf0), mode, 1);
  if (F(void *, F(void *, scene, 0x48), 0x1f4) != 0)
    func_0209a2ac(F(void *, scene, 0xf4), mode, 1);
  remaining = F(s32, scene, 0xd8);
  if (GameWork_TestFlag(gGameWork, 0x306) != 0)
    remaining /= 2;
  for (i = 0; i < 7; ++i) {
    s32 digit = func_020befec(remaining, data_ov071_0221223c[i]);
    void *presentation = F(void *, scene, 0x6c + i * 4);
    if (digit != 0 || i == 6)
      started = 1;
    if (started) {
      remaining -= digit * data_ov071_0221223c[i];
      GraphicsSpriteState_SetAnimationIndex(F(void *, presentation, 0xc),
                                            digit & 0xff);
      F(u16, presentation, 0x42) &= (u16)~4;
    } else {
      F(u16, presentation, 0x42) |= 4;
    }
  }
  F(u16, F(void *, scene, 0x88), 0x42) =
      F(u16, F(void *, scene, 0x6c), 0x42);
  F(u16, F(void *, scene, 0x8c), 0x42) =
      F(u16, F(void *, scene, 0x78), 0x42);
  for (i = 0; i < 10; ++i)
    func_0209a2ac(F(void *, scene, 0x6c + i * 4), mode, 1);
  func_0209b7a0(F(void *, F(void *, scene, 0x48), 0x20), mode);
  VecFx32Object_InitComponents(origin, 0, 0, 0);
  func_0209d640(F(void *, F(void *, scene, 0x48), 0x20), 0, parameter,
                origin);
  func_020b0880(F(s16, data_020cd470, 0x70),
                F(s16, data_020cd470, 0x72));
  func_ov071_02211e98(F(void *, scene, 0xe8));
  VecFx32Object_Destroy(origin);
}

/* Packs a fixed-point texture coordinate pair into the geometry FIFO texture-coordinate register. */
void func_ov071_02211398(s32 first, s32 second) {
  *(volatile u32 *)0x04000488 =
      (u32)(((second << 8) >> 16) << 16) | ((first << 8) >> 16) & 0xffff;
}

/* Submits a packed vertex pair and final coordinate to the geometry FIFO vertex register. */
void func_ov071_022113cc(u32 first, s32 second, u32 final) {
  *(volatile u32 *)0x0400048c = (u32)(second << 16) | (first & 0xffff);
  *(volatile u32 *)0x0400048c = final & 0xffff;
}

/* Updates a presentation record's enabled state and coordinates through a graphics helper; returns its result. */
s32 func_ov071_022113fc(void *scene, s32 decrement, const void *point) {
  s32 first = F(s32, scene, 0xd0) == 0;
  void *sprite;
  F(s32, scene, 0xd8) -= decrement;
  if (first)
    F(s32, scene, 0xd0) = 0x10;
  F(s32, scene, 0xd4) = 0;
  sprite = F(void *, F(void *, scene, 0x90), 0xc);
  if (F(u8, sprite, 0x38) != 0xc)
    GraphicsSpriteState_SetAnimationIndex(sprite, 0xc);
  if (point != 0) {
    F(s32, scene, 0xa4) -= ov071_multiply_fx(
        F(const s32, point, 4) - F(s32, scene, 0x98), 0x333);
    F(s32, scene, 0xa8) -= ov071_multiply_fx(
        F(const s32, point, 8) - F(s32, scene, 0x9c), 0x333);
    F(s32, scene, 0xcc) = 1;
    Sound_Play(gSoundContext, 0x16a, 7);
    Sound_Play(gSoundContext, 0x16a, 8);
  }
  return first;
}

/* Initializes an offset-based scene subrecord from supplied parameters; returns the initialized record or status. */
void *func_ov071_02211514(void *allocation, void *owner) {
  s32 group, element, index;
  for (group = 0; group < 3; ++group)
    for (element = 0; element < 12; ++element)
      func_ov071_02210184((u8 *)allocation + 4 + group * 0x2d0 +
                          element * 0x3c);
  F(void *, allocation, 0) = owner;
  for (index = 59; index >= 0; --index) {
    F(s32, allocation, 0x964 + index * 4) = -1;
    F(s32, allocation, 0xb44 + index * 4) = index + 1;
  }
  F(s32, allocation, 0xc30) = -1;
  F(s32, allocation, 0xc34) = 0;
  return allocation;
}

/* Spawns the configured number of collection elements from the scene transform, deriving their angular position and velocity from the overlay's emission mode and shared random source. */
void func_ov071_022115bc(void *collection) {
  s32 count = 1;
  s32 source[3];
  if ((u32)(F(s32, data_ov071_02212340, 0x10) - 2) < 2)
    count = F(s32, data_ov071_02212340, 0x14);
  func_ov071_02211158(source, F(void *, collection, 0));
  func_ov071_02211178(
      (u8 *)F(void *, F(void *, collection, 0), 8) + 0xdc, source);
  while (--count >= 0) {
    s32 slot = F(s32, collection, 0xc34);
    s32 transformed[3];
    s32 delta[3];
    s32 radial_offset;
    s32 radial_scale = 0;
    s32 direction;
    s32 sine;
    s32 cosine;
    s32 element_offset;
    if (slot < 0)
      continue;
    func_ov071_02210184(transformed);
    func_ov071_02210354(F(void *, F(void *, collection, 0), 8),
                        transformed);
    func_ov071_022119bc(
        delta, transformed,
        (u8 *)F(void *, F(void *, collection, 0), 8) + 0x94);
    func_ov071_02211178(transformed, delta);
    if (F(s32, data_ov071_02212340, 0x10) == 0) {
      s32 spread = F(s32, data_ov071_02212340, 4);
      radial_offset = (s32)(genrand_int32() % (u32)spread) - spread / 2;
    } else if (F(s32, data_ov071_02212340, 0x10) == 1) {
      s32 phase = F(u16, data_ov071_022123e0, 8) >> 4;
      radial_offset = ((F(s32, data_ov071_02212340, 4) >> 1) *
                       data_020c9670[phase * 2]) >> 12;
    } else {
      s32 spread = F(s32, data_ov071_02212340, 4);
      radial_scale = func_020befec(spread * count * 0x1000,
                                   spread *
                                       (F(s32, data_ov071_02212340, 0x14) - 1));
      if (F(s32, data_ov071_022123e0, 0x10) == 1)
        radial_scale -= 0x800;
      radial_offset = (((radial_scale * spread) >> 12) *
                       data_020c9670[(F(u16, data_ov071_022123e0, 8) >> 4) *
                                    2]) >>
                      12;
    }
    direction = func_020ae024(transformed[1], transformed[2]);
    sine = data_020c9670[(direction >> 4) * 2];
    cosine = data_020c9670[(direction >> 4) * 2 + 1];
    F(s16, collection, 0x874 + slot * 2) = (s16)-direction;
    F(s16, collection, 0x8ec + slot * 2) =
        F(s16, data_ov071_022123e0, 8);
    element_offset = slot * 12;
    func_ov071_02211178((u8 *)collection + 4 + element_offset,
                        (u8 *)F(void *, F(void *, collection, 0), 8) + 0x94);
    if (F(s32, data_ov071_02212340, 0x10) == 0) {
      F(s32, collection, 8 + element_offset) -= cosine * radial_offset;
      F(s32, collection, 0xc + element_offset) += sine * radial_offset;
    } else if ((u32)(F(s32, data_ov071_02212340, 0x10) - 1) < 2) {
      F(s32, collection, 8 + element_offset) -= cosine * radial_offset;
      F(s32, collection, 0xc + element_offset) += sine * radial_offset;
      F(s32, collection, 0x5a8 + element_offset) =
          -cosine * F(s32, data_ov071_022123e0, 0);
      F(s32, collection, 0x5ac + element_offset) =
          sine * F(s32, data_ov071_022123e0, 0);
    } else if (F(s32, data_ov071_02212340, 0x10) == 3) {
      F(s32, collection, 8 + element_offset) -= cosine * radial_offset;
      F(s32, collection, 0xc + element_offset) += sine * radial_offset;
      F(s32, collection, 0x5a8 + element_offset) =
          -((radial_scale * cosine * F(s32, data_ov071_022123e0, 0)) >> 12);
      F(s32, collection, 0x5ac + element_offset) =
          (radial_scale * sine * F(s32, data_ov071_022123e0, 0)) >> 12;
    }
    F(s32, collection, 8 + element_offset) += sine * 12;
    F(s32, collection, 0xc + element_offset) += cosine * 12;
    F(s32, collection, 0x2d8 + element_offset) =
        sine * F(s32, data_ov071_02212340, 8);
    F(s32, collection, 0x2dc + element_offset) =
        cosine * F(s32, data_ov071_02212340, 8);
    F(s32, collection, 0x964 + slot * 4) = 0;
    F(s32, collection, 0xa54 + slot * 4) = 0;
    F(s32, collection, 0xc34) = F(s32, collection, 0xb44 + slot * 4);
    F(s32, F(void *, F(void *, collection, 0), 8), 0xb0) = -sine * 4;
    F(s32, F(void *, F(void *, collection, 0), 8), 0xb4) = -cosine * 4;
    F(s16, F(void *, F(void *, collection, 0), 8), 0xb8) =
        (s16)-direction;
  }
}

/* Initializes or copies a runtime record through the local initializer; returns its result. */
void func_ov071_022119bc(void *out, const void *left, const void *right) {
  func_ov071_02210184(out);
  F(s32, out, 4) = F(const s32, left, 4) - F(const s32, right, 4);
  F(s32, out, 8) = F(const s32, left, 8) - F(const s32, right, 8);
}

/* Copies an offset-based payload when source and destination differ; returns no meaningful value. */
void func_ov071_022119f4(void *scene, s32 index) {
  F(s32, scene, 0x964 + index * 4) = -1;
  F(s32, scene, 0xb44 + index * 4) = F(s32, scene, 0xc34);
  F(s32, scene, 0xc34) = index;
}

/* Removes active collection elements inside a point-centered rectangle, dispatches the mode-specific overlay effect, reports horizontal direction when requested, and returns the removal count. */
s32 func_ov071_02211a10(void *collection, const void *point,
                         s32 horizontal_extent, s32 mode,
                         s32 *direction_out) {
  s32 vertical_extent;
  s32 count = 0;
  s32 index;
  if (F(s32, F(void *, F(void *, collection, 0), 8), 0xc8) > 0)
    return 0;
  vertical_extent = mode == 6 ? horizontal_extent : 0x14000;
  for (index = 59; index >= 0; --index) {
    s32 element_offset;
    s32 dx;
    s32 dy;
    void *element;
    if (F(s32, collection, 0x964 + index * 4) < 0)
      continue;
    element_offset = index * 12;
    element = (u8 *)collection + 4 + element_offset;
    dx = F(const s32, point, 4) - F(s32, collection, 8 + element_offset);
    dy = F(const s32, point, 8) - F(s32, collection, 0xc + element_offset);
    if (dx <= -horizontal_extent || dx >= horizontal_extent ||
        dy <= -vertical_extent || dy >= vertical_extent)
      continue;
    ++count;
    func_ov071_022119f4(collection, index);
    if (mode == 3) {
      func_ov023_021fdf70(F(void *, F(void *, collection, 0), 0x14),
                          element);
    } else {
      func_ov042_021fd924(F(void *, F(void *, collection, 0), 0x14), 0,
                          element);
      func_ov042_0220a93c(F(void *, F(void *, collection, 0), 0x18),
                          element, mode == 4 ? 0x80 : 0x100);
    }
    if (direction_out != 0)
      *direction_out = dx > 0 ? 1 : 2;
  }
  if (count != 0) {
    s32 variant = -1;
    F(u32, data_ov071_022123e0, 4) ^= 1;
    if (mode == 0 || mode == 5)
      variant = F(u32, data_ov071_022123e0, 4) != 0 ? 1 : 0xb;
    else if (mode == 1 || mode == 3)
      variant = 2;
    else if (mode == 2 || mode == 6)
      variant = 9;
    else if (mode == 4 || mode == 7)
      variant = 0x10;
    if (variant >= 0)
      Sound_Play(gSoundContext, 0x1d7, variant);
  }
  return count;
}

/* Integrates all active collection elements, retires out-of-bounds entries, advances their phase, and periodically emits the configured overlay effect. */
void func_ov071_02211ca4(void *collection) {
  s32 index;
  for (index = 59; index >= 0; --index) {
    s32 element_offset;
    void *position;
    void *velocity;
    s32 x;
    s32 y;
    s32 phase;
    s32 point[3];
    s32 effect;
    if (F(s32, collection, 0x964 + index * 4) < 0)
      continue;
    element_offset = index * 12;
    position = (u8 *)collection + 4 + element_offset;
    velocity = (u8 *)collection + 0x2d4 + element_offset;
    func_ov071_02211190(position, velocity);
    if (F(s32, collection, 0xc + element_offset) < 0x64000)
      F(s32, collection, 0x2d8 + element_offset) = ov071_multiply_fx(
          F(s32, collection, 0x2d8 + element_offset),
          F(s32, data_ov071_02212340, 0x20));
    x = F(s32, collection, 8 + element_offset);
    y = F(s32, collection, 0xc + element_offset);
    if (x < -0xb4000 || x > 0xb4000 || y < -0x110000 || y > 0x104000) {
      func_ov071_022119f4(collection, index);
      continue;
    }
    ++F(s32, collection, 0xa54 + index * 4);
    F(u16, collection, 0x8ec + index * 2) +=
        (u16)F(s32, data_ov071_02212340, 0x18);
    if ((index + F(s32, collection, 0xa54 + index * 4)) %
            F(s32, data_ov071_02212340, 0) !=
        0)
      continue;
    func_ov071_02210184(point);
    phase = F(u16, collection, 0x8ec + index * 2) >> 4;
    point[1] = x + ov071_multiply_fx(
                       data_020c9670[phase * 2],
                       F(s32, collection, 0x5a8 + element_offset));
    point[2] = y + ov071_multiply_fx(
                       data_020c9670[phase * 2],
                       F(s32, collection, 0x5ac + element_offset));
    effect = F(s32, data_ov071_02212340, 0xc);
    if (effect < 2)
      func_ov042_021fdbc8(F(void *, F(void *, collection, 0), 0x14),
                          effect % 2, point);
    else
      func_ov031_021fdc88(F(void *, F(void *, collection, 0), 0x14),
                          effect % 2, point, index % 4);
  }
}

/* Configures a shared effect/resource sequence and dispatches local callbacks; returns operation status. */
void func_ov071_02211e98(void *collection) {
  static const s32 texture[3][4] = {
      {0x10000, 0x10000, 0, 0},
      {0x20000, 0x10000, 0x10000, 0},
      {0x30000, 0x10000, 0x20000, 0},
  };
  const s32 vertices[4] = {-7, -7, 7, 7};
  s32 i;
  for (i = 59; i >= 0; --i) {
    s32 position[2];
    s32 group;
    if (F(s32, collection, 0x964 + i * 4) < 0)
      continue;
    if (F(s32, data_ov071_02212340, 0x10) == 0) {
      position[0] = F(s32, collection, 8 + i * 12) >> 12;
      position[1] = F(s32, collection, 0xc + i * 12) >> 12;
    } else {
      s32 angle = F(u16, collection, 0x8ec + i * 2) >> 4;
      position[0] =
          (F(s32, collection, 8 + i * 12) +
           ov071_multiply_fx(data_020c9670[angle * 2],
                             F(s32, collection, 0x5a8 + i * 12))) >>
          12;
      position[1] =
          (F(s32, collection, 0xc + i * 12) +
           ov071_multiply_fx(data_020c9670[angle * 2],
                             F(s32, collection, 0x5ac + i * 12))) >>
          12;
    }
    func_0209b494(F(void *, F(void *, collection, 0), 0x20),
                  (i % 4) + 0x2f, 0);
    group = data_ov071_02212280[
        (F(s32, collection, 0xa54 + i * 4) >> 1) % 13];
    func_ov071_022120a4(collection, position,
                        F(u16, collection, 0x874 + i * 2), vertices,
                        texture[group], 0x7fff);
  }
}

/* Returns a fixed controller result or field without state changes or direct SDK effects. */
void func_ov071_02212090(void *destination, const void *source) {
  F(s32, destination, 0) = F(const s32, source, 0);
  F(s32, destination, 4) = F(const s32, source, 4);
}

/* Dispatches a resource operation through shared helpers and local callbacks; mutates state and returns its result. */
void func_ov071_022120a4(void *unused, const s32 *position, s32 angle,
                         const s32 *vertices, const s32 *texture,
                         u16 polygon_attribute) {
  volatile u32 *matrix = (volatile u32 *)0x04000444;
  volatile u32 *vertex = (volatile u32 *)0x04000494;
  (void)unused;
  *matrix = 0;
  matrix[11] = (u32)position[0];
  matrix[11] = (u32)position[1];
  matrix[11] = 0;
  func_020b0808(data_020c9670[(angle >> 4) * 2],
                data_020c9670[(angle >> 4) * 2 + 1]);
  *(volatile u32 *)0x04000500 = 1;
  *(volatile u32 *)0x04000480 = polygon_attribute;
  func_ov071_02211398(texture[0], texture[1]);
  func_ov071_022113cc((s16)vertices[0], (s16)vertices[1], 0xad);
  func_ov071_02211398(texture[2], texture[1]);
  *vertex = ((u32)(u16)(s16)vertices[1] << 16) | (u16)(s16)vertices[2];
  func_ov071_02211398(texture[2], texture[3]);
  *vertex = ((u32)(u16)(s16)vertices[3] << 16) | (u16)(s16)vertices[2];
  func_ov071_02211398(texture[0], texture[3]);
  *vertex = ((u32)(u16)(s16)vertices[3] << 16) | (u16)(s16)vertices[0];
  *(volatile u32 *)0x04000504 = 0;
  *(volatile u32 *)0x04000448 = 1;
}

/* Performs overlay static initialization and installs callback/data descriptors; returns no meaningful value. */
void *func_ov071_02212210(void *allocation) {
  Heap_Free(allocation);
  return allocation;
}
