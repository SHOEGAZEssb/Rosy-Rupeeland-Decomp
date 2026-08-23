#include "tingle/types.h"

/* Overlay 87 defines a mobile ActorDerivedRuntime subclass. It owns an
 * auxiliary animation resource, selects presentation states from movement and
 * contact flags, applies fixed-point orbit motion, emits positional sound, and
 * can hand control to overlay 62's actor-transition presentation. */
#define F(t, p, o) (*(t *)((u8 *)(p) + (o)))
#define METHOD(p, o) F(void *, F(void *, (p), 0), (o))
typedef void (*Method)(void *);
typedef void (*Method2)(void *, s32);

extern u8 data_ov087_022189e0[], data_ov087_02218aa4[];
extern const s16 data_020c9670[];
extern void *data_020f4e18, *data_021052fc, *gGameWork, *gHeapContext;
extern void *gSceneManager, *gSoundContext, *gSystemState;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedRuntime_Init(...), ActorDerivedRuntime_DestroyAlternate(...);
extern void ActorDerivedRuntime_UpdateFrame(...), ActorDerivedRuntime_HandlePairActive(...);
extern void Actor_UpdateAnimationState(...), Actor_SnapshotTransientState(...);
extern void ActorContactState_AddContact(...), Actor_SetDirectionFromVector(...);
extern void ActorDerivedType1_ResetToBaseState(...);
extern void *Actor_GetCollection(...), *GraphicsSpriteGroup_CreateState(...);
extern void GraphicsSpriteGroup_ReplaceStateResources(...);
extern void GraphicsSpriteState_SetAnimationIndex(...);
extern void func_02071ee0(...);
extern void *AnimationResource_Init(...), *Heap_Alloc(...);
extern void Heap_Free(...), *OverlayManager_GetGlobal(...);
extern void OverlayManager_LoadOverlay(...);
extern void GameWork_SetFlag(...), GameWork_ClearFlag(...);
extern void Sound_Play(...), Sound_PlayEffectWithParameters(...), Sound_StopEffect(...), Sound_SetEffectParameters(...);
extern void VecFx32Object_Init(...), VecFx32Object_InitCopy(...);
extern void VecFx32Object_InitComponents(...), VecFx32Object_Assign(...);
extern void VecFx32Object_Add(...), VecFx32Object_Subtract(...), VecFx32Object_Destroy(...);
extern s32 Fx32Vector2_Magnitude(...), func_020adc90(...), func_020befec(...);
extern void *ActorMotionAreaFollower_GetPosition(...), *SceneManager_GetCurrent(...);
extern void func_ov062_0220fe78(...), func_02033b38(...);
#ifdef __cplusplus
}
#endif

void func_ov087_022183fc(void *actor);
void func_ov087_02218454(void *actor);
void func_ov087_02218264(void *actor, s32 horizontal, s32 vertical);
void func_ov087_02217ed8(void *out, const void *value, s32 scale);
void func_ov087_02218678(void *out, const void *actor);
void func_ov087_02218698(void *record, s32 x, s32 y, s32 z);

static s32 multiply_fx(s32 a, s32 b) {
  return (s32)(((s64)a * b + 0x800) >> 12);
}

/* Construct the derived actor, initialize its private fields, and invoke the
 * optional descriptor action through virtual slot 0x74. */
void *func_ov087_022177e0(void *actor, const void *descriptor) {
  ActorDerivedRuntime_Init(actor, descriptor);
  F(void *, actor, 0) = data_ov087_022189e0;
  F(s32, actor, 0x208) = 0;
  F(s32, actor, 0x20c) = 0x4cd;
  F(s32, actor, 0x210) = 0x19a;
  F(s16, actor, 0x214) = 0;
  F(s16, actor, 0x216) = 0;
  F(s16, actor, 0x218) = 0xf;
  F(s16, actor, 0x21a) = 0;
  F(s16, actor, 0x21c) = 0;
  F(s16, actor, 0x21e) = 0;
  F(void *, actor, 0x220) = 0;
  F(s16, actor, 0x224) = 0;
  F(s16, actor, 0x226) = 0xc;
  F(s32, actor, 0x228) = 0;
  F(s32, actor, 0x22c) = 0;
  if ((F(u32, actor, 0x14) & 0x400) != 0)
    F(u32, actor, 0xd0) |= 4;
  if (F(s32, descriptor, 0x2c) != 0)
    ((Method2)METHOD(actor, 0x74))(actor, F(s32, descriptor, 0x2c));
  return actor;
}

/* Destroy the optional animation resource and inherited actor state while
 * retaining caller-owned actor storage. */
void *func_ov087_0221788c(void *actor) {
  void *resource;
  F(void *, actor, 0) = data_ov087_022189e0;
  ((Method)METHOD(actor, 0xbc))(actor);
  ActorDerivedRuntime_DestroyAlternate(actor);
  resource = F(void *, actor, 0x220);
  if (resource != 0)
    ((Method)F(void *, F(void *, resource, 0), 4))(resource);
  Actor_UpdateAnimationState(actor);
  return actor;
}

/* Destroy the actor and release its heap allocation. */
void *func_ov087_022178dc(void *actor) {
  func_ov087_0221788c(actor);
  Heap_Free(actor);
  return actor;
}

/* Load three descriptor resources, create the sprite owner, and copy the
 * optional palette selector for flagged actors. */
void func_ov087_02217934(void *actor, const void *descriptor) {
  void *collection;
  func_02071ee0((u8 *)actor + 0x1f0, data_020f4e18,
                F(s32, descriptor, 4), F(s32, descriptor, 8),
                F(s32, descriptor, 0xc));
  collection = Actor_GetCollection(actor);
  F(void *, actor, 0x54) = GraphicsSpriteGroup_CreateState(
      collection, F(void *, actor, 0x1f0), F(void *, actor, 0x1f4),
      F(void *, actor, 0x1f8), F(u8, descriptor, 0x10));
  ((Method)METHOD(actor, 0x14))(actor);
  if ((F(u32, actor, 0x14) & 0x80) != 0)
    F(u8, F(void *, actor, 0x54), 0x3a) = (u8)F(u16, descriptor, 0x3c);
}

/* Advance orbit physics, collision response, positional sound, presentation,
 * and inherited frame processing unless the actor is suspended. */
void func_ov087_022179b0(void *actor, void *unused1, void *unused2,
                         void *context) {
  u8 delta[16], scaled[16];
  s32 speed, angle, pan;
  s16 *flags = (s16 *)((u8 *)actor + 0x21a);
  (void)unused1;
  (void)unused2;
  if ((F(u32, actor, 0x10) & 0x1000000) != 0) {
    ActorDerivedRuntime_UpdateFrame(actor, context);
    return;
  }
  if ((*flags & 0x80) != 0) {
    void *scene = SceneManager_GetCurrent(gSceneManager);
    if (F(s32, scene, 4) == 0xe)
      return;
    *flags &= (s16)~0x80;
  }
  ActorDerivedRuntime_HandlePairActive(actor);
  if ((*flags & 4) == 0)
    func_ov087_022183fc(actor);
  else
    func_ov087_02218454(actor);
  if (F(s16, actor, 0x21e) > 0)
    --F(s16, actor, 0x21e);
  if (F(s16, actor, 0x216) > 0)
    --F(s16, actor, 0x216);
  else if (F(s16, actor, 0x214) != 0) {
    angle = F(s32, actor, 0xc8) +
            (F(s16, actor, 0x214) < 0 ? -0x2000 : 0x2000);
    F(s32, actor, 0xc8) = angle & 0xffff;
    F(s16, actor, 0x216) = F(s16, actor, 0x218);
  }
  F(u8, actor, 0xd4) =
      (u8)(((F(s32, actor, 0xc8) + 0x1000) & 0xffff) >> 13);
  if (F(s16, actor, 0x224) == 1) {
    u8 collision;
    s32 bounced = 0;
    speed = multiply_fx(F(s32, actor, 0x208),
                        func_020befec(F(s16, actor, 0x226) << 12, 12));
    angle = (F(s32, actor, 0xc8) >> 4) * 2;
    VecFx32Object_InitComponents(
        delta, -multiply_fx(data_020c9670[angle], speed),
        multiply_fx(data_020c9670[angle + 1], speed), 0);
    VecFx32Object_Add((u8 *)actor + 0x38, delta);
    if (speed > 0x19a) {
      if ((*flags & 0x200) == 0) {
        Sound_StopEffect(gSoundContext, 0x67, 2);
        Sound_Play(gSoundContext, 0x67, 1);
      }
      *flags = (*flags & (s16)~0x400) | 0x200;
    } else if (speed < 0x19a - 0x334) {
      if ((*flags & 0x400) == 0) {
        Sound_StopEffect(gSoundContext, 0x67, 1);
        Sound_Play(gSoundContext, 0x67, 2);
      }
      *flags = (*flags & (s16)~0x200) | 0x400;
    } else {
      Sound_StopEffect(gSoundContext, 0x67, 1);
      Sound_StopEffect(gSoundContext, 0x67, 2);
      *flags &= (s16)~0x600;
    }
    collision = F(u8, actor, 0x4b);
    if ((collision & 0xc) != 0 && (collision & 0xc) != 0xc) {
      if (((collision & 4) != 0 && F(s32, actor, 0x40) > 0) ||
          ((collision & 8) != 0 && F(s32, actor, 0x40) < 0)) {
        bounced = 1;
      } else
        F(s32, actor, 0x40) = -F(s32, actor, 0x40);
      F(s16, actor, 0x226) -= 10;
    }
    if ((collision & 3) != 0 && (collision & 3) != 3) {
      if (((collision & 1) != 0 && F(s32, actor, 0x3c) < 0) ||
          ((collision & 2) != 0 && F(s32, actor, 0x3c) > 0)) {
        F(s32, actor, 0x3c) = -F(s32, actor, 0x3c);
        bounced = 1;
      }
      F(s16, actor, 0x226) -= 10;
    }
    if (bounced) {
      Sound_PlayEffectWithParameters(gSoundContext, 0x67, 0,
                    F(s32, actor, 0x22c) > 0 ? 0x20 : 0x7f, 0, 0);
      F(s32, actor, 0x22c) = 10;
    }
    pan = (F(s32, actor, 0x1c) -
           F(s32, ActorMotionAreaFollower_GetPosition(
                      (u8 *)data_021052fc + 0x2fbc),
             4) +
           0x80000) >>
          12;
    if (pan < -0x80)
      pan = -0x80;
    else if (pan > 0x7f)
      pan = 0x7f;
    Sound_SetEffectParameters(gSoundContext, 0x67, 4, 0x50, pan,
                  F(s32, actor, 0x228));
    VecFx32Object_Destroy(delta);
  }
  if (F(s16, actor, 0x226) < 0)
    F(s16, actor, 0x226) = 0;
  else if (F(s16, actor, 0x226) < 0xc)
    F(s16, actor, 0x226) = 0xc;
  if (F(s32, actor, 0x22c) > 0)
    --F(s32, actor, 0x22c);
  func_ov087_02217ed8(scaled, (u8 *)actor + 0x38, F(s32, actor, 0x210));
  VecFx32Object_Subtract((u8 *)actor + 0x38, scaled);
  VecFx32Object_Destroy(scaled);
  F(s16, actor, 0x214) = 0;
  ((Method)METHOD(actor, 0xa4))(actor);
  if (F(s16, actor, 0x224) == 1) {
    void *follower = F(void *, data_021052fc, 0x2ea4);
    VecFx32Object_Assign((u8 *)follower + 0x18, (u8 *)actor + 0x18);
    F(s32, follower, 0x24) += 0xa000;
  }
  Actor_SnapshotTransientState(actor);
  ((Method)METHOD(actor, 0x20))(actor);
}

/* Initialize a vector and scale each component by a 20.12 factor. */
void func_ov087_02217ed8(void *out, const void *value, s32 scale) {
  VecFx32Object_Init(out);
  F(s32, out, 4) = multiply_fx(F(const s32, value, 4), scale);
  F(s32, out, 8) = multiply_fx(F(const s32, value, 8), scale);
  F(s32, out, 0xc) = multiply_fx(F(const s32, value, 0xc), scale);
}

/* Select and configure the sprite resource/animation for state 1..5. */
void func_ov087_02217f44(void *actor, void *unused1, void *unused2,
                         void *context) {
  void *sprite = F(void *, actor, 0x54);
  s16 state;
  (void)unused1;
  (void)unused2;
  if ((F(u16, actor, 0x21a) & 2) != 0) {
    F(u16, actor, 0x21a) &= (u16)~2;
    F(s16, actor, 0xd6) = 2;
    Sound_Play(gSoundContext, 0x67, 6);
  }
  state = F(s16, actor, 0xd6);
  if (state == 0)
    return;
  if (state == 1 || state == 5) {
    GraphicsSpriteGroup_ReplaceStateResources(
        F(void *, sprite, 0), sprite, F(void *, actor, 0x1f0),
        F(void *, actor, 0x1f4), F(void *, actor, 0x1f8), context);
    GraphicsSpriteState_SetAnimationIndex(
        sprite, state == 5 ? 0x13 : F(u8, actor, 0xd4));
  } else {
    void *resource = F(void *, actor, 0x220);
    GraphicsSpriteGroup_ReplaceStateResources(
        F(void *, sprite, 0), sprite, F(void *, resource, 4),
        F(void *, resource, 8), F(void *, resource, 0xc), context);
    GraphicsSpriteState_SetAnimationIndex(
        sprite, F(u8, actor, 0xd4) +
                    (state == 3 ? 0x10 : state == 4 ? 8 : 0));
  }
  if (state == 2)
    F(u16, sprite, 0x24) &= (u16)~3;
  else {
    F(u16, sprite, 0x24) &= (u16)~1;
    F(u16, sprite, 0x24) |= 2;
  }
}

/* Resolve contact overlap, arm feedback timers, and pass the pair to the
 * inherited contact accumulator. */
void func_ov087_02218110(void *actor, void *other, void *contact) {
  if ((F(u32, actor, 0x10) & 0x1000000) != 0) {
    ActorDerivedRuntime_HandlePairActive(actor, other, contact);
    return;
  }
  if (F(u8, other, 0x4d) == 2 || F(u8, other, 0x4d) == 3) {
    s32 dx = F(s32, other, 0x1c) - F(s32, actor, 0x1c);
    s32 dy = F(s32, other, 0x20) - F(s32, actor, 0x20);
    s32 distance = Fx32Vector2_Magnitude(dx, dy);
    if (distance > 0x1000) {
      dx = func_020adc90(dx, distance);
      dy = func_020adc90(dy, distance);
      if ((F(u32, actor, 0xd0) & 0x10) != 0) {
        dx /= 2;
        dy /= 2;
      }
      F(s32, actor, 0x9c) -= dx / 2;
      F(s32, actor, 0xa0) -= dy / 2;
      F(s32, other, 0x8c) += dx;
      F(s32, other, 0x90) += dy;
    }
    if (F(s16, actor, 0x224) == 1) {
      Sound_PlayEffectWithParameters(gSoundContext, 0x67);
      F(s32, actor, 0x22c) = 10;
    }
    if (F(s16, actor, 0x21e) == 0 && F(s16, actor, 0x21c) > 0)
      F(s16, actor, 0x21e) = 0xf;
  }
  ActorContactState_AddContact(actor, other, contact);
}

/* Convert directional input into sprite state and one-shot sound feedback. */
void func_ov087_02218264(void *actor, s32 horizontal, s32 vertical) {
  u16 *flags = (u16 *)((u8 *)actor + 0x21a);
  if ((*flags & 1) != 0) {
    F(s16, actor, 0xd6) = 5;
    F(s32, actor, 0x3c) = 0;
    F(s32, actor, 0x40) = 0;
    return;
  }
  if (F(s16, actor, 0x224) == 0) {
    F(s16, actor, 0xd6) = 1;
    return;
  }
  if (F(s16, actor, 0xd6) == 2) {
    s32 pan;
    if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) == 0)
      return;
    pan = (F(s32, actor, 0x1c) -
           F(s32, ActorMotionAreaFollower_GetPosition(
                      (u8 *)data_021052fc + 0x2fbc),
             4) +
           0x80000) >>
          12;
    if (pan < -0x80)
      pan = -0x80;
    else if (pan > 0x7f)
      pan = 0x7f;
    Sound_PlayEffectWithParameters(gSoundContext, 0x67, 4, 0x50, pan,
                  F(s32, actor, 0x228));
  }
  F(s16, actor, 0x214) = vertical < 0 ? -1 : vertical > 0 ? 1 : 0;
  if (horizontal < 0) {
    F(s32, actor, 0x208) = -(F(s32, actor, 0x20c) / 2);
    F(s16, actor, 0xd6) = 4;
  } else if (horizontal > 0) {
    F(s32, actor, 0x208) = F(s32, actor, 0x20c);
    F(s16, actor, 0xd6) = 4;
  } else {
    F(s32, actor, 0x208) = 0;
    F(s16, actor, 0xd6) = 3;
  }
  if ((*flags & 0x100) != 0) {
    *flags &= (u16)~0x100;
    Sound_PlayEffectWithParameters(gSoundContext, 0x67, 3, 0x40, 0, 0);
  }
}

/* Decode current system key bits into horizontal and vertical intent. */
void func_ov087_022183fc(void *actor) {
  u16 keys = F(u16, gSystemState, 4);
  s32 horizontal = (keys & 2) != 0;
  s32 vertical = (keys & 0x20) ? -1 : (keys & 0x10) ? 1 : 0;
  if ((F(u16, gSystemState, 6) & 0x800) != 0)
    F(u16, actor, 0x21a) |= 0x100;
  func_ov087_02218264(actor, horizontal, vertical);
}

/* Decode latched actor direction flags and clear them after use. */
void func_ov087_02218454(void *actor) {
  u16 flags = F(u16, actor, 0x21a);
  s32 vertical = (flags & 8) ? -1 : (flags & 0x10) ? 1 : 0;
  s32 horizontal = (flags & 0x20) ? 1 : (flags & 0x40) ? -1 : 0;
  func_ov087_02218264(actor, horizontal, vertical);
  F(u16, actor, 0x21a) &= (u16)~0x78;
}

/* Activate the actor and either enter direct shared-actor mode or load overlay
 * 62 for the transition variant. */
void func_ov087_022184b0(void *actor, s32 transition) {
  if (F(s16, actor, 0x224) == 0) {
    void *resource = Heap_Alloc(0x10, data_ov087_02218aa4, 4, gHeapContext);
    if (resource != 0)
      resource = AnimationResource_Init(resource, 0x1000, 0x1001, 0x1002);
    F(void *, actor, 0x220) = resource;
    F(u16, actor, 0x21a) |= 2;
    if (transition <= 0) {
      void *shared = F(void *, data_021052fc, 0x2ea4);
      F(u32, shared, 0x230) &= ~4u;
      func_ov087_02218698((u8 *)shared + 0x38, 0, 0, 0);
      func_ov087_02218698((u8 *)shared + 0x88, 0, 0, 0);
      func_ov087_02218698((u8 *)shared + 0x98, 0, 0, 0);
      F(u32, shared, 0x230) |= 0x100;
      F(u32, shared, 0x14) |= 2;
      ((Method2)METHOD(shared, 0x54))(shared, 0);
      GameWork_SetFlag(gGameWork, 0x44b);
    } else {
      void *manager = OverlayManager_GetGlobal();
      OverlayManager_LoadOverlay(manager, 2, 62);
      resource = Heap_Alloc(0x48, data_ov087_02218aa4, 4, gHeapContext);
      if (resource != 0) {
        u8 position[16];
        func_ov087_02218678(position, actor);
        func_ov062_0220fe78(resource, position, 0x18, transition, 1, actor, 1);
        VecFx32Object_Destroy(position);
      }
      F(u16, actor, 0x21a) |= 0x80;
      Sound_Play(gSoundContext, 0x67, 5);
    }
  }
  F(s16, actor, 0x224) = 1;
  F(s16, actor, 0x226) = 0xc;
}

/* Copy actor position into a temporary vector and raise it by ten pixels. */
void func_ov087_02218678(void *out, const void *actor) {
  VecFx32Object_InitCopy(out, (const u8 *)actor + 0x18);
  F(s32, out, 0xc) += 0xa000;
}

/* Assign three components after the optional four-byte record header. */
void func_ov087_02218698(void *record, s32 x, s32 y, s32 z) {
  s32 *components = (s32 *)record;
  if (components != 0)
    ++components;
  components[0] = x;
  components[1] = y;
  components[2] = z;
}

/* Deactivate the actor, transfer/reset the shared actor, stop sound, and
 * destroy the owned animation resource. */
void func_ov087_022186a8(void *actor, const void *position, s32 transition) {
  if (F(s16, actor, 0x224) == 1) {
    void *shared;
    F(s32, actor, 0x208) = 0;
    F(s16, actor, 0x214) = 0;
    F(s16, actor, 0xd6) = 1;
    ((Method)METHOD(actor, 0x5c))(actor);
    shared = F(void *, data_021052fc, 0x2ea4);
    if (transition <= 0) {
      F(u32, shared, 0x14) &= ~2u;
      F(u32, shared, 0x230) |= 4;
      ((Method2)METHOD(shared, 0x54))(shared, 1);
      F(u32, shared, 0x230) &= ~0x100u;
      VecFx32Object_Assign((u8 *)shared + 0x18, position);
      VecFx32Object_Assign((u8 *)shared + 0x28, (u8 *)shared + 0x18);
      func_ov087_02218698((u8 *)shared + 0x38, 0, 0, 0);
      func_ov087_02218698((u8 *)shared + 0x88, 0, 0, 0);
      func_ov087_02218698((u8 *)shared + 0x98, 0, 0, 0);
      Actor_SetDirectionFromVector(shared, 0, 0x1000);
      ActorDerivedType1_ResetToBaseState(shared);
    } else {
      void *manager;
      void *transition_actor;
      VecFx32Object_Assign((u8 *)shared + 0x18, (u8 *)actor + 0x18);
      F(s32, shared, 0x24) += 0xa000;
      manager = OverlayManager_GetGlobal();
      OverlayManager_LoadOverlay(manager, 2, 62);
      transition_actor =
          Heap_Alloc(0x48, data_ov087_02218aa4, 4, gHeapContext);
      if (transition_actor != 0)
        func_ov062_0220fe78(transition_actor, position, 0x18, transition, 0,
                            0, 1);
      F(u16, actor, 0x21a) |= 0x80;
      Sound_Play(gSoundContext, 0x67, 5);
    }
    Sound_StopEffect(gSoundContext, 0x67, 4);
    Sound_StopEffect(gSoundContext, 0x67, 1);
    Sound_StopEffect(gSoundContext, 0x67, 2);
    GameWork_ClearFlag(gGameWork, 0x44b);
  }
  if (F(void *, actor, 0x220) != 0) {
    void *resource = F(void *, actor, 0x220);
    ((Method)F(void *, F(void *, resource, 0), 4))(resource);
    F(void *, actor, 0x220) = 0;
  }
  F(s16, actor, 0x224) = 0;
}

/* Return the fixed 20.12 extent of 64 pixels. */
s32 func_ov087_022188e4(void) { return 0x40000; }

/* Default virtual query: no alternate record is selected. */
s32 func_ov087_022188ec(void) { return 0; }

/* Copy the source actor's embedded position into the destination vector. */
void func_ov087_022188f4(void *out, const void *actor) {
  VecFx32Object_InitCopy(out, (const u8 *)actor + 0x18);
}

/* Return the raw actor-state bit 7 mask. */
u32 func_ov087_02218904(const void *actor) {
  return F(const u32, actor, 0xd0) & 0x80;
}

/* Return whether actor-state bit 6 is set. */
s32 func_ov087_02218910(const void *actor) {
  return (F(const u32, actor, 0xd0) & 0x40) != 0;
}

/* Default virtual predicate: no optional action is active. */
s32 func_ov087_02218924(void) { return 0; }

/* Intentional inherited virtual no-op. */
void func_ov087_0221892c(void) {}

/* Intentional paired inherited virtual no-op. */
void func_ov087_02218930(void) {}

/* Intentional third inherited virtual no-op. */
void func_ov087_02218934(void) {}

/* Mark actor-state bit 7. */
void func_ov087_02218938(void *actor) { F(u32, actor, 0xd0) |= 0x80; }

/* Default capability query used by the derived vtable. */
s32 func_ov087_02218948(void) { return 0; }

/* Default secondary capability query. */
s32 func_ov087_02218950(void) { return 0; }

/* Default tertiary capability query. */
s32 func_ov087_02218958(void) { return 0; }

/* Default quaternary capability query. */
s32 func_ov087_02218960(void) { return 0; }

/* Intentional presentation callback no-op. */
void func_ov087_02218968(void) {}

/* Forward the inherited actor callback implemented at func_02033b38. */
void func_ov087_0221896c(void) { func_02033b38(); }
