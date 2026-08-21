#include "tingle/types.h"

/* Recovered overlay 91 scripted actor encounter and presentation runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*Method0)(void *);

extern "C" void *gSceneManager;
extern "C" void *gGameWork;
extern "C" void *gHeapContext;
extern "C" void *gLupyContext;
extern "C" void *gSoundContext;
extern "C" u8 *data_021052fc;
extern "C" u8 gActorCategory1DescriptorTable[];
extern "C" u8 data_ov091_02218cd0[];
extern "C" u8 data_ov091_02218dc0[];
extern "C" u8 data_ov091_02218dc8[];
extern "C" u8 data_ov091_02218dd0[];
extern "C" void *func_0204d520(void *, const void *);
extern "C" void *func_0204d570(void *);
extern "C" void func_0204d3d8(void);
extern "C" void func_0204d308(void *);
extern "C" void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern "C" void *Actor_GetCollection(void *);
extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void ActorCollection_SpawnDescriptorsBySelector(void *, void *, s32);
extern "C" void Actor_SetActive(void *, s32);
extern "C" void ActorMotionAreaFollower_BindActor(void *, void *);
extern "C" void ActorMotion_BindActor(void *, void *);
extern "C" void ActorMotion_SetTarget(void *, const void *);
extern "C" const void *ActorMotionAreaFollower_GetPosition(void *);
extern "C" void ActorMotionJitter_EnsureMinimum(void *, s32, s32);
extern "C" void GamePhaseRuntime_SynchronizeActorPlacement(void *, s32);
extern "C" void GamePhaseRuntime_FinalizeActorCollections(void *, s32, s32);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void *AnimationResource_Init(void *, s32, s32, s32);
extern "C" void *GraphicsSpriteState_Create(void *, void *, s32, s32, s32, s32,
                                            s32);
extern "C" void GraphicsSpriteState_ReleaseFromGroup(void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void VecFx32Triple_Set(void *, const void *, const void *,
                                  const void *);
extern "C" void VecFx32Triple_Destroy(void *);
extern "C" void VecFx32Bezier_Evaluate3D(void *, const void *, s32);
extern "C" void func_020adff0(const void *, const void *, void *);
extern "C" s32 func_020adcac(const void *, const void *);
extern "C" s32 func_020befec(s32, s32);
extern "C" void *SceneManager_GetCurrent(void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_LoadOverlay(void *, s32, const void *);
extern "C" void GameWork_SetFlag(void *, s32);
extern "C" void GameWork_ClearFlag(void *, s32);
extern "C" void *func_0201e0ec(void *);
extern "C" void Sound_PlayDirectSequence(void *, s32, s32);
extern "C" void Sound_StopDirectSequence(void *, s32, s32);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" void func_020a27a0(void *, ...);
extern "C" void func_020a2844(void *, ...);
extern "C" s32 GamePhaseCurrencyHud_GetCurrency(void *);
extern "C" void GamePhaseCurrencyHud_AddCurrency(void *, s32, s32);
extern "C" void *func_02022cb0(void *, ...);
extern "C" void PresentationList_AppendObject(void *, void *);
extern "C" void Type1Actor_TryEnterFailureState(void *);
extern "C" void func_ov060_0220fd54(void *, void *, s32);
extern "C" void func_ov076_02213740(void *);
extern "C" void func_ov076_02213780(void *);
extern "C" void func_ov076_02214034(void *, s32);
extern "C" void func_02031758(void *, void *, void *);

extern "C" void func_ov091_02218838(void *, s32, s32, s32);
extern "C" void *func_ov091_02218848(void *, const void *, const void *,
                                     const void *);
extern "C" void func_ov091_0221888c(void *, const void *, s32);
extern "C" void func_ov091_022188f8(void *, const void *, const void *);

static void *vmethod(void *actor, u32 offset) {
    return F(void *, F(void *, actor, 0), offset);
}

static s32 clamp_blend(void *actor, s32 increment) {
    s32 value = F(s32, actor, 0x220) + increment;
    if (value > 0x1000)
        value = 0x1000;
    F(s32, actor, 0x220) = value;
    return value;
}

/* Construct the encounter actor and discover its linked supporting actors. */
extern "C" void *func_ov091_022177e0(void *actor, const void *descriptor) {
    func_0204d520(actor, descriptor);
    F(void *, actor, 0) = data_ov091_02218cd0;
    F(u8, actor, 0x1ec) = 0;
    F(u8, actor, 0x1ed) = 0;
    F(u16, actor, 0x1ee) = 0;
    F(void *, actor, 0x1f0) = 0;
    F(void *, actor, 0x1f4) = 0;
    VecFx32Object_InitComponents((u8 *)actor + 0x210, 0, 0, 0);
    F(s32, actor, 0x220) = 0;
    VecFx32Object_Init((u8 *)actor + 0x224);
    u8 *collection =
        (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    s32 support_index = 0;
    for (s32 index = 0; index < F(s32, collection, 0x2e74); ++index) {
        void *candidate = F(void *, collection, index * 4);
        if (!candidate)
            continue;
        if (F(u8, candidate, 0x4d) == 2) {
            if (F(s8, candidate, 0x27e) == 0x16)
                F(void *, actor, 0x1f0) = candidate;
            else if (F(s8, candidate, 0x27e) == 0x17)
                F(void *, actor, 0x1f4) = candidate;
        } else if (F(u8, candidate, 0x4d) == 3 &&
                   F(u16, candidate, 0x4e) == 0x12) {
            F(void *, actor, 0x1f8 + support_index * 4) = candidate;
            ++support_index;
        }
    }
    return actor;
}

/* Allocate the encounter animation resource and its HUD sprite. */
extern "C" void func_ov091_02217910(void *actor) {
    func_0204d3d8();
    void *resource = Heap_Alloc(0x10, data_ov091_02218dc0, 4, gHeapContext);
    if (resource)
        resource = AnimationResource_Init(resource, 0x137b, 0x137c, 0x137d);
    F(void *, actor, 0x234) = resource;
    void *owner = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
    void *sprite = GraphicsSpriteState_Create(owner, resource, 0, 0, 0, 6, 0);
    F(void *, actor, 0x238) = sprite;
    F(u16, sprite, 0x2c) = 0x7d;
    F(u16, sprite, 0x2e) = 0x9a;
}

static void destroy_encounter(void *actor, bool release_allocation) {
    void *primary = F(void *, data_021052fc, 0x2ea4);
    if (primary) {
        F(u32, primary, 0x230) |= 4;
        F(u32, primary, 0xd0) &= ~0x40000u;
        GameWork_SetFlag(gGameWork, 0x3ec);
        ActorMotionAreaFollower_BindActor(data_021052fc + 0x2fbc, primary);
        ActorMotion_BindActor(data_021052fc + 0x3044, primary);
        GraphicsSpriteState_ReleaseFromGroup(F(void *, actor, 0x238));
        void *resource = F(void *, actor, 0x234);
        if (resource)
            ((Method0)vmethod(resource, 4))(resource);
        if (((Method0)vmethod(actor, 0xd0))(actor) == 4) {
            void *partner = F(void *, actor, 0x1f4);
            F(u16, F(void *, partner, 0x54), 0x24) |= 0x10;
            F(u32, partner, 0x14) |= 6;
            ActorCollection_SpawnDescriptorsBySelector(
                Actor_GetCollection(actor), gActorCategory1DescriptorTable, -1);
        }
        Actor_SetActive(primary, 0);
    }
    void *secondary = F(void *, data_021052fc, 0x2ea8);
    if (secondary)
        Actor_SetActive(secondary, 0);
    Actor_SetActive(F(void *, actor, 0x1f4), 0);
    Actor_SetActive(F(void *, actor, 0x1f0), 0);
    for (s32 index = 0; index < 6; ++index)
        Actor_SetActive(F(void *, actor, 0x1f8 + index * 4), 0);
    VecFx32Object_Destroy((u8 *)actor + 0x224);
    VecFx32Object_Destroy((u8 *)actor + 0x210);
    func_0204d570(actor);
    if (release_allocation)
        Heap_Free(actor);
}

/* Destroy encounter-owned actors and presentation state in place. */
extern "C" void *func_ov091_022179a0(void *actor) {
    F(void *, actor, 0) = data_ov091_02218cd0;
    destroy_encounter(actor, false);
    return actor;
}

/* Destroy the encounter and release its allocation. */
extern "C" void *func_ov091_02217b3c(void *actor) {
    F(void *, actor, 0) = data_ov091_02218cd0;
    destroy_encounter(actor, true);
    return actor;
}

static void clear_motion_vectors(void *actor) {
    func_ov091_02218838((u8 *)actor + 0x38, 0, 0, 0);
    func_ov091_02218838((u8 *)actor + 0x88, 0, 0, 0);
    func_ov091_02218838((u8 *)actor + 0x98, 0, 0, 0);
}

static void update_actor_blend(void *actor) {
    u8 current[16];
    u8 target[16];
    u8 result[16];
    s32 blend = F(s32, actor, 0x220);
    func_ov091_0221888c(current, (u8 *)actor + 0x18, 0x1000 - blend);
    func_ov091_0221888c(target, (u8 *)actor + 0x210, blend);
    func_ov091_022188f8(result, current, target);
    VecFx32Object_Assign((u8 *)actor + 0x18, result);
    VecFx32Object_Destroy(result);
    VecFx32Object_Destroy(target);
    VecFx32Object_Destroy(current);
}

static void update_motion_target(void *actor) {
    u8 target[16];
    VecFx32Object_InitComponents(target, -0x80000,
                                 -0x74000 - F(s32, actor, 0x24) / 2, 0);
    ActorMotion_SetTarget(data_021052fc + 0x2fbc, target);
    VecFx32Object_Destroy(target);
}

static void update_bezier_phase(void *actor, const void *start,
                                const void *control, const void *end,
                                s32 duration) {
    u8 path[48];
    u8 sample[16];
    func_ov091_02218848(path, start, control, end);
    s32 progress = func_020befec(F(u16, actor, 0x1ee) << 12, duration);
    VecFx32Bezier_Evaluate3D(sample, path, progress);
    void *source = F(void *, actor, 0x1f0);
    VecFx32Object_Assign((u8 *)source + 0x18, sample);
    VecFx32Object_Destroy(sample);
    F(s32, source, 0x2ac) = F(s32, source, 0x1c);
    F(s32, source, 0x2b0) = F(s32, source, 0x20);
    VecFx32Triple_Destroy(path);
}

/* Advance the complete scripted capture, flight, and return sequence. */
extern "C" void func_ov091_02217ce0(void *actor) {
    u8 *scene = (u8 *)SceneManager_GetCurrent(gSceneManager);
    if (F(s32, scene, 4) == 2 || F(s32, gGameWork, 0x3cc) == 0)
        return;
    ActorMotionAreaFollower_BindActor(data_021052fc + 0x2fbc, actor);
    ActorMotion_BindActor(data_021052fc + 0x3044, actor);
    func_0204d308(actor);
    void *primary = F(void *, data_021052fc, 0x2ea4);
    scene = (u8 *)SceneManager_GetCurrent(gSceneManager);
    void *effects = func_0201e0ec(data_021052fc + 0x2f7c);

    switch (F(u8, actor, 0x1ec)) {
    case 0: {
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2,
                                   data_ov091_02218dc8);
        void *item = Heap_Alloc(0x58, data_ov091_02218dc8, 4, gHeapContext);
        if (item)
            func_ov060_0220fd54(item, actor, 0);
        VecFx32Object_Assign((u8 *)actor + 0x18, (u8 *)primary + 0x18);
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)actor + 0x18);
        F(u32, primary, 0x230) |= 0x20;
        F(u32, primary, 0xd0) |= 0x40000;
        Actor_SetActive(primary, 1);
        void *secondary = F(void *, data_021052fc, 0x2ea8);
        if (secondary)
            Actor_SetActive(secondary, 1);
        Actor_SetActive(F(void *, actor, 0x1f4), 1);
        Actor_SetActive(F(void *, actor, 0x1f0), 1);
        for (s32 index = 0; index < 6; ++index)
            Actor_SetActive(F(void *, actor, 0x1f8 + index * 4), 1);
        F(u8, actor, 0x1ec) = 1;
        break;
    }
    case 1:
        Sound_PlayDirectSequence(gSoundContext, 0x57, 0x7f);
        F(u16, actor, 0x1ee) = 0;
        F(u8, actor, 0x1ec) = 2;
        F(u32, primary, 0x230) |= 4;
        GameWork_SetFlag(gGameWork, 0x3ec);
        break;
    case 2:
        clamp_blend(actor, 0x29);
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)primary + 0x18);
        if (!GamePhaseCurrencyHud_GetCurrency(gLupyContext)) {
            F(u32, primary, 0x230) &= ~4u;
            GameWork_ClearFlag(gGameWork, 0x3ec);
            F(s32, actor, 0x220) = 0;
            F(u8, actor, 0x1ec) = 13;
        } else if (F(s16, F(void *, actor, 0x1f4), 0xda) > 0) {
            F(s32, actor, 0x220) = 0;
            F(u32, primary, 0x230) &= ~4u;
            GameWork_ClearFlag(gGameWork, 0x3ec);
            clear_motion_vectors(primary);
            F(u8, scene, 0x54) |= 2;
            F(u8, actor, 0x1ec) = 3;
        }
        break;
    case 3:
        F(u8, actor, 0x1ec) = 4;
        /* fall through */
    case 4: {
        clamp_blend(actor, 0x52);
        void *partner = F(void *, actor, 0x1f0);
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)partner + 0x18);
        s32 state = F(s16, F(void *, actor, 0x1f4), 0xda);
        clear_motion_vectors(primary);
        if (!GamePhaseCurrencyHud_GetCurrency(gLupyContext)) {
            F(u32, primary, 0x230) &= ~4u;
            GameWork_ClearFlag(gGameWork, 0x3ec);
            F(s32, actor, 0x220) = 0;
            F(u8, actor, 0x1ec) = 13;
        } else if (state == 0) {
            F(u8, scene, 0x54) &= (u8)~2;
            F(u8, actor, 0x1ec) = 2;
            F(u32, primary, 0x230) |= 4;
            GameWork_SetFlag(gGameWork, 0x3ec);
            F(s32, actor, 0x220) = 0;
            F(u16, F(void *, actor, 0x238), 0x24) |= 4;
        } else if (state < 5) {
            void *sprite = F(void *, actor, 0x238);
            if ((u8)(state - 1) != F(u8, sprite, 0x38))
                GraphicsSpriteState_SetAnimationIndex(sprite, state - 1);
            F(u16, sprite, 0x24) &= (u16)~4;
        } else {
            F(u8, scene, 0x54) &= (u8)~2;
            F(u32, primary, 0x230) &= ~4u;
            GameWork_ClearFlag(gGameWork, 0x3ec);
            clear_motion_vectors(primary);
            F(u8, actor, 0x1ec) = 5;
            ((Method0)vmethod(partner, 0x1d8))(partner);
            F(u8, partner, 0x2d2) = 1;
            F(u16, actor, 0x1ee) = 0;
            VecFx32Object_Assign((u8 *)actor + 0x224, (u8 *)partner + 0x18);
            Sound_StopDirectSequence(gSoundContext, 0x57, 0);
            Sound_Play(gSoundContext, 0x1c4, 1);
            Sound_Play(gSoundContext, 0x1c4, 2);
            GraphicsSpriteState_SetAnimationIndex(F(void *, actor, 0x238),
                                                  state - 1);
            F(s32, gGameWork, 0x3cc) = 2;
        }
        break;
    }
    case 5: {
        s32 state = F(s16, F(void *, actor, 0x1f4), 0xda);
        void *sprite = F(void *, actor, 0x238);
        if ((u8)(state - 1) != F(u8, sprite, 0x38))
            GraphicsSpriteState_SetAnimationIndex(sprite, state - 1);
        u8 control[16];
        u8 end[16];
        VecFx32Object_InitComponents(control, F(s32, actor, 0x228),
                                     F(s32, actor, 0x22c), 0x4a000);
        VecFx32Object_InitComponents(end, F(s32, actor, 0x228),
                                     F(s32, actor, 0x22c), 0x78000);
        update_bezier_phase(actor, (u8 *)actor + 0x224, control, end, 0x28);
        void *source = F(void *, actor, 0x1f0);
        if (F(s32, source, 0x2b4) < F(s32, source, 0x24))
            F(s32, source, 0x2b4) = F(s32, source, 0x24);
        if ((F(u16, actor, 0x1ee) % 3) == 0)
            func_020a27a0(effects, 1, F(s32, source, 0x1c) >> 12,
                          (F(s32, source, 0x20) >> 12) -
                              (F(s32, source, 0x24) >> 12));
        clamp_blend(actor, 0x52);
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)source + 0x18);
        if (F(u16, actor, 0x1ee) > 0x27) {
            F(u16, actor, 0x1ee) = 0;
            F(u8, actor, 0x1ec) = 6;
            VecFx32Object_Assign((u8 *)actor + 0x224, (u8 *)source + 0x18);
            func_020a2844(effects, 0, F(s32, actor, 0x228) >> 12,
                          (F(s32, actor, 0x22c) >> 12) -
                              (F(s32, actor, 0x230) >> 12) + 0x14,
                          10);
            func_ov076_02214034(source, 0x14);
            func_ov076_02213740(F(void *, actor, 0x1f4));
            F(u32, source, 0x14) |= 6;
            F(u16, sprite, 0x24) |= 4;
        }
        VecFx32Object_Destroy(end);
        VecFx32Object_Destroy(control);
        break;
    }
    case 6: {
        u8 control[16];
        u8 end[16];
        VecFx32Object_InitComponents(control, 0xc8000, 0x54000, 0x20000);
        VecFx32Object_InitComponents(end, 0xc8000, 0x78000, 0xaa000);
        update_bezier_phase(actor, (u8 *)actor + 0x224, control, end, 0x96);
        void *source = F(void *, actor, 0x1f0);
        F(s32, source, 0x2b4) = F(s32, source, 0x24) + 0x20000;
        if ((F(u16, actor, 0x1ee) % 3) == 0)
            func_020a27a0(effects, 1, F(s32, source, 0x1c) >> 12,
                          (F(s32, source, 0x20) >> 12) -
                              (F(s32, source, 0x24) >> 12));
        clamp_blend(actor, 0x52);
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)source + 0x18);
        if (F(u16, actor, 0x1ee) > 0x95) {
            F(u16, actor, 0x1ee) = 0;
            F(u8, actor, 0x1ec) = 7;
            clear_motion_vectors(source);
            F(s32, source, 0x44) = 0x2800;
            F(u8, source, 0x2d2) = 2;
            Sound_Play(gSoundContext, 0, 0x28);
            ActorMotionJitter_EnsureMinimum(data_021052fc + 0x2fbc, 0x14, 1);
            F(s32, actor, 0x220) = 0;
        }
        VecFx32Object_Destroy(end);
        VecFx32Object_Destroy(control);
        break;
    }
    case 7:
        if (F(u16, actor, 0x1ee) > 0x77) {
            F(u16, actor, 0x1ee) = 0;
            F(u8, actor, 0x1ec) = 8;
            F(s32, actor, 0x220) = 0;
        }
        break;
    case 8:
        clamp_blend(actor, 4);
        VecFx32Object_Assign((u8 *)actor + 0x210,
                             (u8 *)F(void *, actor, 0x1f4) + 0x18);
        if (F(u16, actor, 0x1ee) > 0x77) {
            F(u16, F(void *, F(void *, actor, 0x1f4), 0x54), 0x36) = 0x100;
            F(u16, actor, 0x1ee) = 0;
            F(u8, actor, 0x1ec) = 9;
        }
        break;
    case 9:
    case 10: {
        clamp_blend(actor, 4);
        void *partner = F(void *, actor, 0x1f4);
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)partner + 0x18);
        if (F(u16, F(void *, partner, 0x54), 0x24) & 1) {
            if (F(u8, actor, 0x1ec) == 9) {
                func_ov076_02213780(partner);
                F(u8, actor, 0x1ec) = 10;
            } else {
                F(u8, actor, 0x1ec) = 11;
                F(s32, actor, 0x220) = 0;
            }
            F(u16, actor, 0x1ee) = 0;
        }
        break;
    }
    case 11: {
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)primary + 0x18);
        clamp_blend(actor, 0x10);
        if (func_020adcac((u8 *)primary + 0x1c, (u8 *)actor + 0x1c) < 0x1000)
            F(u8, actor, 0x1ec) = 12;
        break;
    }
    case 12:
        break;
    case 13:
        VecFx32Object_Assign((u8 *)actor + 0x210, (u8 *)primary + 0x18);
        F(s32, actor, 0x220) += 0x7b;
        if (F(s32, actor, 0x220) > 0x1000) {
            F(s32, actor, 0x220) = 0x1000;
            F(u8, actor, 0x1ec) = 14;
        }
        break;
    case 14:
        break;
    }
    ++F(u16, actor, 0x1ee);
    update_actor_blend(actor);
    update_motion_target(actor);
}

/* Store three fixed-point components after the vector object's header. */
extern "C" void func_ov091_02218838(void *value, s32 x, s32 y, s32 z) {
    F(s32, value, 4) = x;
    F(s32, value, 8) = y;
    F(s32, value, 12) = z;
}

/* Build a three-point Bezier path from the supplied vectors. */
extern "C" void *func_ov091_02218848(void *path, const void *first,
                                     const void *second, const void *third) {
    VecFx32Object_Init(path);
    VecFx32Object_Init((u8 *)path + 0x10);
    VecFx32Object_Init((u8 *)path + 0x20);
    VecFx32Triple_Set(path, first, second, third);
    return path;
}

/* Multiply a fixed-point vector by a scalar. */
extern "C" void func_ov091_0221888c(void *result, const void *value,
                                    s32 scale) {
    VecFx32Object_Init(result);
    for (s32 offset = 4; offset <= 12; offset += 4) {
        s64 product = (s64)F(s32, value, offset) * scale + 0x800;
        F(s32, result, offset) = (s32)(product >> 12);
    }
}

/* Add two fixed-point vectors into a newly initialized result. */
extern "C" void func_ov091_022188f8(void *result, const void *left,
                                    const void *right) {
    VecFx32Object_Init(result);
    func_020adff0((const u8 *)left + 4, (const u8 *)right + 4,
                  (u8 *)result + 4);
}

/* Blend toward the source actor, update motion, and finalize placement. */
extern "C" void func_ov091_02218930(void *actor) {
    clamp_blend(actor, 0x52);
    VecFx32Object_Assign((u8 *)actor + 0x210,
                         (u8 *)F(void *, actor, 0x1f0) + 0x18);
    update_actor_blend(actor);
    update_motion_target(actor);
    GamePhaseRuntime_SynchronizeActorPlacement(data_021052fc, 0);
    GamePhaseRuntime_SynchronizeActorPlacement(data_021052fc, 1);
    GamePhaseRuntime_FinalizeActorCollections(data_021052fc, 2, 3);
}

/* Invoke virtual slot 0x1c for encounter finalization. */
extern "C" void func_ov091_02218a48(void *actor) {
    ((Method0)vmethod(actor, 0x1c))(actor);
}

/* Forward the inherited runtime actor render callback. */
extern "C" void func_ov091_02218a5c(void *context, void *actor,
                                    void *argument) {
    func_02031758(context, actor, argument);
}

/* Empty encounter callback with no observable effect. */
extern "C" void func_ov091_02218a68(void) {
}

/* Classify the encounter's terminal and completed states. */
extern "C" s32 func_ov091_02218a6c(void *actor) {
    if (F(u8, actor, 0x1ec) == 14)
        return 2;
    return F(u8, actor, 0x1ec) == 12 ? 4 : 0;
}

/* Report whether the encounter is outside the partner-approach state. */
extern "C" s32 func_ov091_02218a8c(void *actor) {
    return F(u8, actor, 0x1ec) != 4;
}

/* Transfer a signed interaction amount into currency and feedback state. */
extern "C" void func_ov091_02218aa0(void *actor, void *interaction) {
    if ((u8)(F(u8, actor, 0x1ec) - 2) > 2)
        return;
    s32 amount = -F(s16, F(void *, interaction, 0x1fc), 0xc);
    if (!amount)
        return;
    void *primary = F(void *, data_021052fc, 0x2ea4);
    GamePhaseCurrencyHud_AddCurrency(gLupyContext, amount, 0);
    void *effect = Heap_Alloc(0x44, data_ov091_02218dd0, 4, gHeapContext);
    if (effect) {
        const void *position =
            ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
        effect =
            func_02022cb0(effect, position, primary, amount, 0x2000, -0xc0);
    }
    PresentationList_AppendObject(data_021052fc + 0x2f7c, effect);
    Type1Actor_TryEnterFailureState(primary);
}

/* Return the encounter actor's fixed capability mask. */
extern "C" s32 func_ov091_02218b80(void) {
    return 0x40000;
}
/* Return the encounter actor's zero-valued capability. */
extern "C" s32 func_ov091_02218b88(void) {
    return 0;
}
/* Copy the other actor's position into the supplied vector object. */
extern "C" void func_ov091_02218b90(void *actor, void *other) {
    VecFx32Object_InitCopy(actor, (u8 *)other + 0x18);
}
/* Return runtime flag 0x80. */
extern "C" u32 func_ov091_02218ba0(void *actor) {
    return F(u32, actor, 0xd0) & 0x80;
}
/* Report whether runtime flag 0x40 is set. */
extern "C" s32 func_ov091_02218bac(void *actor) {
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}
/* Return zero for the unused runtime capability. */
extern "C" s32 func_ov091_02218bc0(void) {
    return 0;
}
/* Empty virtual callback with no observable effect. */
extern "C" void func_ov091_02218bc8(void) {
}
/* Empty virtual callback with no observable effect. */
extern "C" void func_ov091_02218bcc(void) {
}
/* Empty virtual callback with no observable effect. */
extern "C" void func_ov091_02218bd0(void) {
}
/* Set runtime flag 0x80. */
extern "C" void func_ov091_02218bd4(void *actor) {
    F(u32, actor, 0xd0) |= 0x80;
}
/* Return zero for an unused interaction capability. */
extern "C" s32 func_ov091_02218be4(void) {
    return 0;
}
/* Return zero for an unused interaction capability. */
extern "C" s32 func_ov091_02218bec(void) {
    return 0;
}
/* Return zero for an unused interaction capability. */
extern "C" s32 func_ov091_02218bf4(void) {
    return 0;
}
/* Return zero for an unused interaction capability. */
extern "C" s32 func_ov091_02218bfc(void) {
    return 0;
}
/* Empty inherited-state callback with no observable effect. */
extern "C" void func_ov091_02218c04(void) {
}
/* Empty inherited-state callback with no observable effect. */
extern "C" void func_ov091_02218c08(void) {
}
/* Return zero for the unused state predicate. */
extern "C" s32 func_ov091_02218c0c(void) {
    return 0;
}
/* Return zero for the unused state predicate. */
extern "C" s32 func_ov091_02218c14(void) {
    return 0;
}
/* Return the fixed encounter descriptor value. */
extern "C" s32 func_ov091_02218c1c(void) {
    return 0x309;
}
/* Return zero for the unused state predicate. */
extern "C" s32 func_ov091_02218c28(void) {
    return 0;
}
/* Empty final virtual callback with no observable effect. */
extern "C" void func_ov091_02218c30(void) {
}
/* Return the encounter presentation allocation size. */
extern "C" s32 func_ov091_02218c34(void) {
    return 0x58;
}
