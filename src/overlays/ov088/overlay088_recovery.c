#include "tingle/types.h"

/*
 * Recovered overlay 88 controllable moving-actor and attachment subsystem.
 *
 * Two construction entry points share one ActorDerivedRuntime layout. The actor
 * owns animation resources, layered sprite states, movement/collision state,
 * looping audio, and a temporary attachment to the scene's type-7 actor. Class
 * members whose names remain unknown are intentionally accessed by ABI offset.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*M0)(void *);
typedef void (*V0)(void *);
typedef void (*V1)(void *, void *);
typedef void (*VS)(void *, s32);
typedef void (*V2)(void *, void *, s32);

extern "C" void *gGamePhaseRuntime, *data_021056f0;
extern "C" u8 data_020ed470[];
extern "C" void *gSceneManager;
extern "C" void *SceneManager_GetCurrent(void *);
extern "C" s32 Type7Actor_GetStateCode(void *);
extern "C" void *gActorRuntimeCollection;
extern "C" s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *);
extern "C" void *gTouchPanelManager;
extern "C" void Actor_SnapshotTransientState(void *);
extern "C" void *ActorMotionAreaFollower_GetPosition(void *);
extern "C" void TrackedResourceActor_SpawnFromKey(s32, void *, void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_LoadOverlay(void *, s32, s32);
extern "C" void Type7Actor_EnterFlag40000State(void *);
extern "C" void Type7Actor_ResetMotionAndCooldown(void *);
extern "C" void *func_ov062_02210674(void *, void *, void *, s32, s32, s32,
                                     void *);
extern "C" void *func_ov062_0220fe78(void *, void *, s32, s32, s32, void *,
                                     s32);
extern "C" void *gGameWork;
extern "C" void GameWork_ClearFlag(void *, s32);
extern "C" void Actor_ReplaceAttachmentSlotResource(void *, s32, s32, s32, s32);
extern "C" void GameWork_SetFlag(void *, s32);
extern "C" void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern "C" s32 ActorContactState_AddContact(void *, void *, s32);
extern "C" s32 func_020adc90(s32, s32);
extern "C" void Sound_PlayEffectWithParameters(void *, s32, s32, ...);
extern "C" u8 gSystemState[];
extern "C" const s16 data_020c9670[];
extern "C" u8 data_ov088_0221b780[], data_ov088_0221b84c[],
    data_ov088_0221b928[];
extern "C" u8 data_ov088_0221b9fc[];
extern "C" void *data_020f4e18;
extern "C" const s32 data_ov088_0221b6ac[], data_ov088_0221b6b0[],
    data_ov088_0221b6ec[], data_ov088_0221b6f0[];
extern "C" void *ActorDerivedRuntime_Init(void *, const void *);
extern "C" void *ActorDerivedRuntime_DestroyAlternate(void *);
extern "C" void ActorDerivedRuntime_UpdateFrame(void *);
extern "C" void ActorDerivedRuntime_ForwardTouchPoint(void *, ...);
extern "C" void *Actor_GetOwningCollection(void *);
extern "C" void *Actor_GetCollisionBounds(void *);
extern "C" void ActorCollection_QueueActorForRemoval(void *, void *);
extern "C" void GraphicsSpriteState_ReleaseFromGroup(void *);
extern "C" void *ActorCollection_GetSpriteGroup(void *);
extern "C" void *GraphicsSpriteGroup_CreateState(void *, s32, s32, s32, s32);
extern "C" void *AnimationResource_Init(void *, s32, s32, s32);
extern "C" void func_02071ee0(void *, void *, s32, s32, s32);
extern "C" void
GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(void *, ...);
extern "C" void GraphicsSpriteState_SetScreenPositionCulled(void *, s32, s32,
                                                            s32);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void *, void *, s32,
                                                          s32, s32);
extern "C" void Actor_AdjustPositionForTerrainHeight(void *);
extern "C" void Heap_Free(void *);
extern "C" s32 func_020befec(s32, s32);
extern "C" void Actor_ReleaseSecondaryRenderAttachment(void *);
extern "C" void *Heap_Alloc(s32, void *, s32, void *);
extern "C" void *gHeapContext, *gSoundContext;
extern "C" u8 data_ov088_0221ba04[];
extern "C" void *AuxiliaryTimedSpritePresentation_Init(void *, void *, void *,
                                                       s32, s32, s32, s32, s32,
                                                       s32, s32);
extern "C" void Actor_PlayRadialSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern "C" void Sound_StopEffect(void *, s32, s32);
extern "C" void Sound_PlayOwnedEffect(void *, s32, s32, ...);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void Actor_TurnTowardVector(void *, s32, s32, s32);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" s32 Actor_GetCachedTerrainHeight(void *);
extern "C" s32 VecFx32Object_GetMagnitude(void *);
extern "C" s32 ActorDerivedType1_IsIdleEligible(void *);
extern "C" void Actor_SetInteractionFlag2000(void *, s32);
extern "C" void func_020adfbc(const void *, const void *, void *);
extern "C" s32 Fx32Vector2_Magnitude(s32, s32);
extern "C" s32 Actor_IsTerrainCellEligibleAtHeight(void *, s32, s32, s32);
extern "C" s32 func_020adae4(s32, s32);
extern "C" void Actor_ApplyMotionImpulse(void *, s32, s32);
extern "C" s32 ActorDerivedRuntime_HandlePairActive(void *, void *, s32);
extern "C" void Actor_RefreshCachedTerrainHeight(void *);
extern "C" void Actor_SetDirectionFromVector(void *, s32, s32);
extern "C" void Actor_SynchronizeStatePresentation(void *);
extern "C" void Actor_UpdateGroundContactProbe(void *);
extern "C" void VecFx32Object_Add(void *, const void *);
extern "C" s32 func_020ae024(s32, s32);
extern "C" void Fx32Vector2_LimitMagnitude(s32 *, s32 *, s32);

extern "C" void func_ov088_022179e0(void *, s32, s32, s32, s32);
extern "C" void func_ov088_022179f4(void *, const void *);
extern "C" void func_ov088_02217a18(void *, const void *);
extern "C" void func_ov088_02217c3c(void *, s32, s32, s32, s32);
extern "C" void func_ov088_02218280(void *, s32, s32, s32);
extern "C" void func_ov088_02218290(void *);
extern "C" void func_ov088_02219960(void *, s32);
extern "C" void func_ov088_0221ad9c(void *, s32);
extern "C" void func_ov088_02219154(void *, s32);
extern "C" void func_ov088_02219168(void *, const void *, s32);
extern "C" void func_ov088_02219d64(void *, const void *, const void *);
extern "C" void func_ov088_0221a9c0(void *, void *);
extern "C" void func_ov088_0221a98c(void *, void *);
extern "C" s32 func_ov088_02219d9c(void *);
extern "C" void *func_ov088_022177e0(void *, const void *);
extern "C" void *func_ov088_02217e44(void *);
extern "C" s32 func_ov088_0221ad6c(const void *);
extern "C" s32 func_ov088_0221ad84(const void *);
extern "C" s32 func_ov088_0221b2e0(void *, s32, s32, s32);
extern "C" void func_ov088_0221af2c(void *, s32);
extern "C" void func_ov088_0221b098(void *);
extern "C" void func_ov088_0221a7c8(void *);
extern "C" void func_ov088_0221a930(void *);
extern "C" s32 func_ov088_0221add8(void *, s32, s32, s32);

static void *vm(void *a, u32 o) {
    return F(void *, F(void *, a, 0), o);
}
static void clear_motion(void *a) {
    func_ov088_02218280((u8 *)a + 0x38, 0, 0, 0);
    func_ov088_02218280((u8 *)a + 0x88, 0, 0, 0);
    func_ov088_02218280((u8 *)a + 0x98, 0, 0, 0);
}

static void initialize_actor_members(void *a, const void *c) {
    F(s32, a, 0x208) = 0;
    F(u16, a, 0x214) = F(u16, a, 0x216) = 0;
    F(u16, a, 0x218) = 15;
    F(u16, a, 0x21a) = F(u16, a, 0x21e) = 0;
    F(void *, a, 0x220) = F(void *, a, 0x224) = F(void *, a, 0x228) =
        F(void *, a, 0x22c) = 0;
    F(u16, a, 0x230) = 0;
    F(u16, a, 0x232) = 12;
    F(u16, a, 0x234) = F(u16, a, 0x236) = F(u16, a, 0x240) = F(u16, a, 0x242) =
        0;
    F(void *, a, 0x24c) = F(void *, a, 0x250) = F(void *, a, 0x254) =
        F(void *, a, 0x258) = 0;
    func_ov088_022179e0((u8 *)a + 0x25c, 0, 0, 0, 0x1800);
    F(u16, a, 0x26c) = F(u16, a, 0x26e) = F(u16, a, 0x270) = 0;
    F(void *, a, 0x238) = data_020ed470 + F(u16, c, 2) * 0x30;
    F(s32, a, 0x210) = func_020befec(F(u8, F(void *, a, 0x238), 2) << 12, 100);
    F(s32, a, 0x20c) = func_020befec(F(u8, F(void *, a, 0x238), 3) << 12, 100);
    F(s16, a, 0x21c) = F(s16, F(void *, a, 0x238), 0x16) * 60;
    F(s16, a, 0xda) = 0;
    F(u32, a, 0x5c) = (F(u32, a, 0x5c) & 0xffff0000) | 0x20;
    if (F(u32, a, 0x14) & 0x400)
        F(u32, a, 0xd0) |= 4;
    if (F(void *, c, 0x2c))
        ((V1)vm(a, 0x74))(a, F(void *, c, 0x2c));
    F(s32, a, 0x23c) = F(s32, a, 0x24);
    func_ov088_022179f4((u8 *)a + 0x244, (u8 *)a + 0x60);
    u8 x[4], y[4];
    func_ov088_02217c3c(x, -20, -10, 20, 5);
    func_ov088_02217a18((u8 *)a + 8, x);
    func_ov088_02217c3c(y, -16, -10, 16, 5);
    func_ov088_02217a18(Actor_GetCollisionBounds(a), y);
    F(u16, a, 0x21a) |= 0x20;
    if (!data_021056f0)
        data_021056f0 = a;
    else
        ActorCollection_QueueActorForRemoval(Actor_GetOwningCollection(a), a);
}

/* Construct the primary moving actor and initialize collision/presentation
 * state. */
extern "C" void *func_ov088_022177e0(void *a, const void *c) {
    ActorDerivedRuntime_Init(a, c);
    F(void *, a, 0) = data_ov088_0221b928;
    initialize_actor_members(a, c);
    return a;
}
/* Initialize a four-component fixed-point record. */ extern "C" void
func_ov088_022179e0(void *o, s32 x, s32 y, s32 z, s32 w) {
    F(s32, o, 0) = x;
    F(s32, o, 4) = y;
    F(s32, o, 8) = z;
    F(s32, o, 12) = w;
}
/* Copy four packed 16-bit presentation coordinates. */ extern "C" void
func_ov088_022179f4(void *o, const void *i) {
    F(u16, o, 0) = F(u16, i, 0);
    F(u16, o, 2) = F(u16, i, 2);
    F(u16, o, 4) = F(u16, i, 4);
    F(u16, o, 6) = F(u16, i, 6);
}
/* Copy four packed collision-bound bytes. */ extern "C" void
func_ov088_02217a18(void *o, const void *i) {
    F(u8, o, 0) = F(u8, i, 0);
    F(u8, o, 1) = F(u8, i, 1);
    F(u8, o, 2) = F(u8, i, 2);
    F(u8, o, 3) = F(u8, i, 3);
}
/* Construct the alternate entry-point variant with the shared layout. */
extern "C" void *func_ov088_02217a3c(void *a, const void *c) {
    ActorDerivedRuntime_Init(a, c);
    F(void *, a, 0) = data_ov088_0221b928;
    initialize_actor_members(a, c);
    return a;
}
/* Store four signed collision-bound bytes. */ extern "C" void
func_ov088_02217c3c(void *o, s32 l, s32 t, s32 r, s32 b) {
    F(s8, o, 0) = (s8)l;
    F(s8, o, 1) = (s8)t;
    F(s8, o, 2) = (s8)r;
    F(s8, o, 3) = (s8)b;
}

static void release_owned_presentation(void *a) {
    F(void *, a, 0) = data_ov088_0221b928;
    if (data_021056f0 == a)
        data_021056f0 = 0;
    func_ov088_02218290(a);
    ((V0)vm(a, 0xbc))(a);
    Actor_ReleaseSecondaryRenderAttachment(a);
    const u32 sprites[] = {0x224, 0x228, 0x22c, 0x258};
    for (u32 i = 0; i < 4; i++)
        if (F(void *, a, sprites[i]))
            GraphicsSpriteState_ReleaseFromGroup(F(void *, a, sprites[i]));
    const u32 objects[] = {0x220, 0x254};
    for (u32 i = 0; i < 2; i++)
        if (F(void *, a, objects[i]))
            ((V0)vm(F(void *, a, objects[i]), 4))(F(void *, a, objects[i]));
    if (F(void *, a, 0x250))
        GraphicsSpriteState_ReleaseFromGroup(F(void *, a, 0x250));
    if (F(void *, a, 0x24c))
        ((V0)vm(F(void *, a, 0x24c), 4))(F(void *, a, 0x24c));
    ActorDerivedRuntime_DestroyAlternate(a);
}
/* Release owned presentation objects while retaining allocation. */
extern "C" void *func_ov088_02217c54(void *a) {
    release_owned_presentation(a);
    return a;
}
/* Release owned presentation objects and free the actor. */ extern "C" void *
func_ov088_02217d48(void *a) {
    release_owned_presentation(a);
    Heap_Free(a);
    return a;
}
/* Release the alternate variant's identical owned presentation set. */
extern "C" void *func_ov088_02217e44(void *a) {
    release_owned_presentation(a);
    return a;
}

/* Load animation resources and create every layered sprite state owned by the
 * actor. */
extern "C" void func_ov088_02217f38(void *a, const void *config) {
    void *d = F(void *, a, 0x238);
    func_02071ee0((u8 *)a + 0x1f0, data_020f4e18, F(u16, d, 0xa),
                  F(u16, d, 0xc), F(u16, d, 0xe));
    void *owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(a));
    F(void *, a, 0x54) = GraphicsSpriteGroup_CreateState(
        owner, F(s32, a, 0x1f0), F(s32, a, 0x1f4), F(s32, a, 0x1f8), 2);
    void *resource = Heap_Alloc(0x10, data_ov088_0221b9fc, 4, gHeapContext);
    if (resource)
        AnimationResource_Init(resource, F(u16, d, 4), F(u16, d, 6),
                               F(u16, d, 8));
    F(void *, a, 0x220) = resource;
    const u32 slots[] = {0x224, 0x228, 0x22c};
    for (u32 i = 0; i < 3; i++) {
        owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(a));
        void *s = GraphicsSpriteGroup_CreateState(owner, F(s32, resource, 4),
                                                  F(s32, resource, 8),
                                                  F(s32, resource, 12), 2);
        F(void *, a, slots[i]) = s;
        F(u16, s, 0x24) |= 8;
    }
    resource = Heap_Alloc(0x10, data_ov088_0221b9fc, 4, gHeapContext);
    if (resource)
        AnimationResource_Init(resource, 0x32fa, 0x32fb, 0x32fc);
    F(void *, a, 0x254) = resource;
    owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(a));
    void *s = GraphicsSpriteGroup_CreateState(owner, F(s32, resource, 4),
                                              F(s32, resource, 8),
                                              F(s32, resource, 12), 2);
    F(void *, a, 0x258) = s;
    F(u16, s, 0x2c) = 0xf0;
    F(u16, s, 0x2e) = 0x18;
    F(u8, s, 0x3a) = 0;
    F(u16, s, 0x28) = 0x1000;
    func_ov088_0221ad9c(a, 0);
    ((V0)vm(a, 0x14))(a);
    if ((F(u32, a, 0x14) & 0x80) && config)
        F(u8, F(void *, a, 0x54), 0x3a) = F(s16, config, 0x3c);
    func_ov088_02219960(a, 0);
}

/* Write vector components after the VecFx32Object ABI header. */
extern "C" void func_ov088_02218280(void *v, s32 x, s32 y, s32 z) {
    F(s32, v, 4) = x;
    F(s32, v, 8) = y;
    F(s32, v, 12) = z;
}
/* Reset the actor at a map coordinate and spawn its arrival presentation. */
extern "C" void func_ov088_02218130(void *a, s32 x, s32 y) {
    func_ov088_02218280((u8 *)a + 0x18, x << 12, y << 12, 0);
    Actor_RefreshCachedTerrainHeight(a);
    func_ov088_02219960(a, 1);
    F(s16, a, 0x21c) = F(s16, F(void *, a, 0x238), 0x16) * 60;
    F(s16, a, 0xda) = 0;
    F(s32, a, 0x208) = 0;
    F(u16, a, 0x214) = F(u16, a, 0x216) = 0;
    F(u16, a, 0x21a) = 0;
    F(u16, a, 0x21e) = F(u16, a, 0x230) = F(u16, a, 0x234) = F(u16, a, 0x236) =
        F(u16, a, 0x240) = F(u16, a, 0x242) = 0;
    F(s32, a, 0x23c) = 0x8000;
    Actor_SetDirectionFromVector(a, 0, 0x1000);
    ((V0)vm(a, 0x5c))(a);
    F(u32, a, 0x14) &= ~6u;
    func_ov088_0221ad9c(a, 0);
    u8 p[16];
    VecFx32Object_InitCopy(p, (u8 *)a + 0x18);
    F(s32, p, 8) -= 0x8000;
    void *e = Heap_Alloc(0x14, data_ov088_0221ba04, 4, gHeapContext);
    if (e)
        AuxiliaryTimedSpritePresentation_Init(
            e, p, F(void *, F(void *, a, 0x54), 0), 0x221f, 0x221d, 0x2220, 0,
            -40, -1, 1);
    VecFx32Object_Destroy(p);
}
/* Stop presentation and all actor-owned looping sounds, returning to hidden
 * idle. */
extern "C" void func_ov088_02218290(void *a) {
    func_ov088_02219960(a, 0);
    F(u32, a, 0x14) |= 6;
    u16 sound = F(u16, F(void *, a, 0x238), 0x26);
    if (sound)
        Sound_StopEffect(gSoundContext, sound >> 7, sound & 0x7f);
    Sound_StopEffect(gSoundContext, 0x1fb, 4);
    Sound_StopEffect(gSoundContext, 0x1fc, 4);
    F(u16, a, 0x21a) &= ~0x2000u;
    F(u16, a, 0x26c) = 0;
    F(u16, a, 0x21a) |= 0x20;
}

/* Advance input, movement, attachment, timers, presentation height, and scene
 * ownership for one frame. */
extern "C" void func_ov088_02218328(void *a) {
    if (F(u16, a, 0x21a) & 0x20) {
        func_ov088_02219960(a, 0);
        return;
    }
    if (F(u32, a, 0x10) & 0x1000000) {
        ActorDerivedRuntime_UpdateFrame(a);
        return;
    }
    ++F(u16, a, 0x26e);
    if (F(u16, a, 0x21a) & 0x80) {
        if (F(s32, SceneManager_GetCurrent(gSceneManager), 4) == 14)
            return;
        F(u16, a, 0x21a) &= ~0x80u;
        void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
        VecFx32Object_Assign((u8 *)player + 0x24, (u8 *)player + 0x34);
        F(u16, player, 0xd6) = 2;
        Actor_ReplaceAttachmentSlotResource(player, 0, 0x1088, 0x1001, 0x1089);
        Actor_ReplaceAttachmentSlotResource(player, 1, 0x108a, 0x1001, 0x108b);
        func_ov088_02219154((u8 *)a + 0x25c, -0x666);
        Actor_PlayRadialSpatialSound(a, 0xfd87, 0);
    }
    if (F(u16, a, 0x21a) & 0x2000) {
        F(s16, a, 0x21c) += 12;
        s32 limit = F(s16, F(void *, a, 0x238), 0x16) * 60;
        if (F(s16, a, 0x21c) >= limit) {
            F(s16, a, 0x21c) = limit;
            func_ov088_0221a930(a);
        }
    } else if (F(s16, a, 0x21c) != -1 && F(s16, a, 0x230) == 1 &&
               !(F(u16, a, 0x21a) & 8) && F(s16, a, 0x21c) > 0)
        --F(s16, a, 0x21c);
    if (F(s16, a, 0x21c) == 0 &&
        F(s32, SceneManager_GetCurrent(gSceneManager), 4) == 1) {
        if (!F(void *, a, 0x24c)) {
            u8 p[16];
            func_ov088_0221a9c0(p, a);
            ((V1)vm(a, 0xc8))(a, p);
            VecFx32Object_Destroy(p);
            func_ov088_0221a7c8(a);
            func_ov088_02218290(a);
            return;
        }
        if (F(s16, a, 0x230) == 1)
            func_ov088_0221b098(a);
    }
    if (func_ov088_0221add8(a, 0, 0, 0))
        return;
    ((V0)vm(a, 0x18))(a);
    ((V0)vm(a, 0xd0))(a);
    if (F(s16, a, 0x230) == 1 && !(F(u16, a, 0x21a) & 0x2001)) {
        s32 speed = (s32)(((s64)F(s32, a, 0x208) * (F(s16, a, 0x232) * 0x155) +
                           0x800) >>
                          12);
        s32 magnitude = Fx32Vector2_Magnitude(F(s32, a, 0x3c), F(s32, a, 0x40));
        if (magnitude > 0x19a) {
            s32 desired = func_020ae024(F(s32, a, 0x40), F(s32, a, 0x3c));
            u32 delta = (F(u32, a, 0xc8) - (desired - 0x4000)) & 0xffff;
            if (delta > 0x8000)
                delta = (s32)(delta << 16) >> 16;
            if (delta > 0x3000) {
                F(s32, a, 0x3c) =
                    (s32)(((s64)F(s32, a, 0x3c) * 0xf85 + 0x800) >> 12);
                F(s32, a, 0x40) =
                    (s32)(((s64)F(s32, a, 0x40) * 0xf85 + 0x800) >> 12);
                F(s32, a, 0x44) =
                    (s32)(((s64)F(s32, a, 0x44) * 0xf85 + 0x800) >> 12);
            }
        }
        s32 phase = (F(u32, a, 0xc8) >> 4) * 2;
        u8 impulse[16];
        VecFx32Object_InitComponents(
            impulse,
            -(s32)(((s64)data_020c9670[phase] * F(s32, a, 0x208) + 0x800) >>
                   12),
            (s32)(((s64)data_020c9670[phase + 1] * speed + 0x800) >> 12), 0);
        VecFx32Object_Add((u8 *)a + 0x38, impulse);
        Fx32Vector2_LimitMagnitude((s32 *)((u8 *)a + 0x3c), (s32 *)((u8 *)a + 0x40), 0x6000);
        VecFx32Object_Destroy(impulse);
    }
    if (F(s16, a, 0x232) < 0)
        F(u16, a, 0x232) = 0;
    else if (F(s16, a, 0x232) < 12)
        ++F(u16, a, 0x232);
    if (F(s16, a, 0x236) > 0)
        --F(u16, a, 0x236);
    if (F(s16, a, 0x234) > 0)
        --F(u16, a, 0x234);
    u8 scaled[16];
    func_ov088_02219168(scaled, (u8 *)a + 0x38, F(s32, a, 0x210));
    VecFx32Object_Add((u8 *)a + 0x38, scaled);
    VecFx32Object_Destroy(scaled);
    F(u16, a, 0x214) = 0;
    ActorDerivedRuntime_UpdateFrame(a);
    ((V0)vm(a, 0xa4))(a);
    s32 target = 0;
    if (!(F(u16, a, 0x21a) & 0x2001) &&
        (F(s16, a, 0xda) == 1 || F(s16, a, 0xda) == 3))
        target = (F(s16, F(void *, a, 0x238), 0x2e) / 2) << 12;
    F(s32, a, 0x25c) += (s32)(((s64)F(s32, a, 0x260) * 0xccd + 0x800) >> 12);
    F(s32, a, 0x260) += (s32)(((s64)F(s32, a, 0x264) * 0xccd + 0x800) >> 12);
    s32 spring =
        (s32)(((s64)F(s32, a, 0x260) * (0xccd - 0x1000) + 0x800) >> 12) +
        (s32)(((s64)F(s32, a, 0x25c) * (0xc00 - 0xccd) + 0x800) >> 12);
    F(s32, a, 0x264) = func_020adc90(spring, F(s32, a, 0x268));
    target += F(s32, a, 0x25c) * 12;
    if (F(s16, a, 0x230) == 1 && F(s32, a, 0x208) > 0)
        target -= Fx32Vector2_Magnitude(F(s32, a, 0x3c), F(s32, a, 0x40)) * 2;
    if (target < 0)
        target = 0;
    else {
        s32 cap = (F(s16, F(void *, a, 0x238), 0x2e) / 2) * 0x1000 + 0x8000;
        if (target > cap)
            target = cap;
    }
    F(s32, a, 0x23c) = func_020adae4(F(s32, a, 0x23c) * 93 + target * 7, 100);
    func_ov088_022179f4((u8 *)a + 0x244, (u8 *)a + 0x60);
    F(s16, a, 0x62) -= (s16)(F(s32, a, 0x23c) >> 12);
    if (F(s16, a, 0x230) == 1 &&
        F(s32, SceneManager_GetCurrent(gSceneManager), 4) != 14) {
        void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
        VecFx32Object_Assign((u8 *)player + 0x18, (u8 *)a + 0x18);
        F(u32, player, 0x14) |= 2;
    }
    Actor_SynchronizeStatePresentation(a);
    ((V0)vm(a, 0x20))(a);
}
/* Initialize a three-scalar presentation control record. */ extern "C" void
func_ov088_02219154(void *r, s32 m) {
    F(s32, r, 0) = 0;
    F(s32, r, 4) = m;
    F(s32, r, 8) = 0;
}
/* Construct a fixed-point scaled vector. */ extern "C" void
func_ov088_02219168(void *o, const void *i, s32 k) {
    VecFx32Object_Init(o);
    F(s32, o, 4) = (s32)(((s64)F(s32, i, 4) * k + 0x800) >> 12);
    F(s32, o, 8) = (s32)(((s64)F(s32, i, 8) * k + 0x800) >> 12);
    F(s32, o, 12) = (s32)(((s64)F(s32, i, 12) * k + 0x800) >> 12);
}

/* Position and depth-order every body, attachment, and scene-coupled sprite
 * layer. */
extern "C" void func_ov088_022191d4(void *context, void *a, void *transform,
                                    s32 extra) {
    ActorDerivedRuntime_ForwardTouchPoint(context, a, transform, extra);
    u8 p[16];
    VecFx32Object_InitCopy(p, (u8 *)a + 0x18);
    void *main = F(void *, a, 0x54);
    s16 depth = F(s16, main, 0x28) - 24;
    u8 palette = F(u8, main, 0x3a);
    F(s32, p, 12) += F(s32, a, 0x23c);
    bool low = F(s32, a, 0x23c) < 0x1000;
    if ((F(u16, a, 0x21a) & 0x10) || low)
        F(u16, main, 0x24) |= 0x10;
    else
        F(u16, main, 0x24) &= ~0x10u;
    void *front = F(void *, a, 0x224);
    if (front) {
        GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
            front, transform, (u8 *)a + 0x68, F(s32, p, 4), F(s32, p, 8),
            F(s32, p, 12), 8);
        F(u8, front, 0x3a) = palette;
        F(s16, front, 0x28) = depth - 2;
    }
    s32 side = (F(u8, a, 0xd4) <= 2 || F(u8, a, 0xd4) >= 6) ? 2 : -3;
    void *back = F(void *, a, 0x228);
    if (back) {
        F(s16, back, 0x2c) = F(s16, front, 0x2c);
        F(s16, back, 0x2e) = F(s16, front, 0x2e);
        F(u8, back, 0x3a) = palette;
        F(s16, back, 0x28) = depth + 3 + (low ? 24 : 0);
        F(u16, back, 0x24) = F(u16, front, 0x24);
    }
    void *middle = F(void *, a, 0x22c);
    if (middle) {
        F(u8, middle, 0x3a) = palette;
        F(s16, middle, 0x28) = depth + 1;
        F(s16, middle, 0x2c) = F(s16, front, 0x2c);
        F(s16, middle, 0x2e) = F(s16, front, 0x2e);
        F(u16, middle, 0x24) = F(u16, front, 0x24);
    }
    if (F(s16, a, 0x230) == 1 &&
        F(s32, SceneManager_GetCurrent(gSceneManager), 4) != 14) {
        void *player = F(void *, gGamePhaseRuntime, 0x2ea4),
             *ps = F(void *, player, 0x54);
        s32 dir = F(u8, a, 0xd4), ox = data_ov088_0221b6ac[dir * 2] >> 12,
            oy = (data_ov088_0221b6b0[dir * 2] >> 12) -
                 F(s16, F(void *, a, 0x238), 0x18) - (F(s32, a, 0x23c) >> 12);
        GraphicsSpriteState_SetScreenPositionCulled(ps, F(s16, ps, 0x2c) + ox,
                                                    F(s16, ps, 0x2e) + oy, 8);
        F(u8, ps, 0x3a) = palette;
        F(s16, ps, 0x28) = depth - 1;
    }
    void *attachment = F(void *, a, 0x250);
    if (attachment) {
        s32 dir = F(u8, a, 0xd4), ox = data_ov088_0221b6ec[dir * 2] >> 12,
            oy = data_ov088_0221b6f0[dir * 2] >> 12;
        if (front)
            GraphicsSpriteState_SetScreenPositionCulled(
                attachment, F(s16, front, 0x2c) + ox, F(s16, front, 0x2e) + oy,
                8);
        else
            GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
                attachment, transform, (u8 *)a + 0x68,
                F(s32, p, 4) + ox * 0x1000, F(s32, p, 8),
                F(s32, p, 12) + oy * 0x1000, 8);
        F(u8, attachment, 0x3a) = palette;
        F(s16, attachment, 0x28) = depth + side;
        if (F(u8, attachment, 0x38) != dir)
            GraphicsSpriteState_SetAnimationIndex(attachment, dir);
    }
    void *overlay = F(void *, a, 0x258);
    if (!(F(u16, a, 0x21a) & 0x2000)) {
        s32 index;
        if (F(s16, a, 0x26c) > 0) {
            --F(s16, a, 0x26c);
            index = 8;
        } else
            index = 7 - func_020adae4((F(s16, a, 0x21c) + 59) * 7,
                                      F(s16, F(void *, a, 0x238), 0x16) * 60);
        if (F(u8, overlay, 0x38) != index)
            GraphicsSpriteState_SetAnimationIndex(overlay, index);
    }
    if (F(s16, a, 0x230) == 1 && !(F(u16, a, 0x21a) & 0x1000))
        F(u16, overlay, 0x24) &= ~0x10u;
    else
        F(u16, overlay, 0x24) |= 0x10;
    VecFx32Object_Destroy(p);
}

static void set_hidden(void *s, bool h) {
    if (s) {
        if (h)
            F(u16, s, 0x24) |= 4;
        else
            F(u16, s, 0x24) &= ~4u;
    }
}
/* Toggle auxiliary sprite layers without changing animation state. */
extern "C" void func_ov088_022198ac(void *a, s32 visible) {
    set_hidden(F(void *, a, 0x22c), !visible);
    set_hidden(F(void *, a, 0x224), !visible);
    set_hidden(F(void *, a, 0x228), !visible);
    set_hidden(F(void *, a, 0x258), !visible);
}
/* Toggle all auxiliary layers and the stronger suppression bit. */
extern "C" void func_ov088_02219960(void *a, s32 visible) {
    if (visible)
        F(u16, a, 0x21a) &= ~0x10u;
    else
        F(u16, a, 0x21a) |= 0x10;
    const u32 s[] = {0x22c, 0x224, 0x228, 0x258};
    for (u32 i = 0; i < 4; i++)
        if (F(void *, a, s[i])) {
            if (visible)
                F(u16, F(void *, a, s[i]), 0x24) &= ~0x14u;
            else
                F(u16, F(void *, a, s[i]), 0x24) |= 0x14;
        }
}
/* Select synchronized body-layer animations for the current locomotion state.
 */
extern "C" void func_ov088_0221963c(void *a, s32, s32, s32) {
    if (F(u16, a, 0x21a) & 2) {
        F(u16, a, 0x21a) &= ~2u;
        F(u16, a, 0xd6) = 2;
        F(u16, a, 0x240) = 180;
        F(u16, a, 0xda) = 1;
        F(u16, a, 0x270) = 0;
        u16 sound = F(u16, F(void *, a, 0x238), 0x26);
        if (sound)
            Sound_PlayOwnedEffect(gSoundContext, sound >> 7, sound & 0x7f, a, 0, 0x100);
    }
    s32 primary = -1, secondary = -1, state = F(u16, a, 0xd6),
        direction = F(u8, a, 0xd4);
    switch (state) {
    case 1:
        primary = direction + 8;
        secondary = ((F(u16, a, 0x21a) & 0x2000) && F(s16, a, 0xda) == 0)
                        ? direction + 24
                        : primary;
        break;
    case 2:
        primary = secondary = direction;
        break;
    case 3:
        primary = secondary = direction + 8;
        break;
    case 4:
        if ((F(u16, a, 0x21a) & 0x2000) && F(s16, a, 0xda) == 0) {
            primary = direction + 8;
            secondary = direction + 24;
        } else
            primary = secondary = direction;
        break;
    case 5:
        primary = direction + 8;
        secondary = direction + 32;
        break;
    }
    void *main = F(void *, a, 0x54);
    if (primary != -1 && F(u8, main, 0x38) != primary)
        GraphicsSpriteState_SetAnimationIndex(main, primary);
    F(u16, main, 0x24) = (F(u16, main, 0x24) & ~1u) | 2;
    void *layer = F(void *, a, 0x224);
    if (layer && secondary != -1 && F(u8, layer, 0x38) != secondary) {
        GraphicsSpriteState_SetAnimationIndex(layer, secondary);
        if (F(void *, a, 0x228))
            GraphicsSpriteState_SetAnimationIndex(F(void *, a, 0x228),
                                                  direction + 40);
    }
    const u32 slots[] = {0x224, 0x228};
    for (u32 i = 0; i < 2; i++)
        if (F(void *, a, slots[i]))
            F(u16, F(void *, a, slots[i]), 0x24) =
                (F(u16, F(void *, a, slots[i]), 0x24) & ~1u) | 2;
    if (F(void *, a, 0x22c)) {
        GraphicsSpriteState_SetAnimationIndex(F(void *, a, 0x22c),
                                              direction + 16);
        F(u16, F(void *, a, 0x22c), 0x24) =
            (F(u16, F(void *, a, 0x22c), 0x24) & ~1u) | 2;
    }
}
/* Resolve actor-to-actor contact, including the reciprocal separation impulse.
 */
extern "C" void func_ov088_02219a2c(void *a, void *other, s32 contact, s32) {
    if ((F(u32, a, 0x10) & 0x1000000) ||
        ActorRuntimeCollection_GetPendingAttachmentFlag(
            gActorRuntimeCollection)) {
        ActorDerivedRuntime_HandlePairActive(a, other, contact);
        return;
    }
    if (F(s16, a, 0x230) == 1 && contact == 0 &&
        F(s32, other, 0x24) - F(s32, a, 0x24) >= 0) {
        u16 sound = F(u16, F(void *, a, 0x238), 0x28);
        if (sound)
            Sound_PlayEffectWithParameters(gSoundContext, sound >> 7, sound & 0x7f,
                          F(s16, a, 0x236) > 0 ? 0x20 : 0x7f, 0, 0);
        F(u16, a, 0x236) = 10;
        s32 dx = F(s32, a, 0x1c) - F(s32, other, 0x1c),
            dy = F(s32, a, 0x20) - F(s32, other, 0x20),
            d = Fx32Vector2_Magnitude(dx, dy);
        if (d > 0x1000) {
            u8 v[16];
            VecFx32Object_InitComponents(v, func_020adc90(dx, d),
                                         func_020adc90(dy, d), 0);
            ((V2)vm(a, 0xb8))(a, v, 0);
            if (F(u8, other, 0x4d) == 7 || F(u8, other, 0x4d) == 2) {
                F(s32, v, 4) = -F(s32, v, 4);
                F(s32, v, 8) = -F(s32, v, 8);
                ((V2)vm(other, 0xb8))(other, v, 1);
            }
            VecFx32Object_Destroy(v);
        }
    }
    if (F(s16, a, 0x21e) == 0 && F(s16, a, 0x21c) > 0)
        F(u16, a, 0x21e) = 15;
    ActorContactState_AddContact(a, other, contact);
}
/* Forward the base runtime touch-point callback. */ extern "C" void
func_ov088_02219c00(void *a, void *p) {
    ActorDerivedRuntime_ForwardTouchPoint(a, p);
}
/* Update proximity interaction and the active actor's safe adjacent target
 * point. */
extern "C" void func_ov088_02219c0c(void *a, s32 interaction, s32, s32) {
    if (!(F(u32, a, 0x10) & 0x1000000) &&
        F(s32, SceneManager_GetCurrent(gSceneManager), 4) == 1 &&
        !(F(u16, a, 0x21a) & 0x2000)) {
        if (F(s16, a, 0x230) != 0 || F(s16, a, 0xda) != 0) {
            if (!(F(u16, a, 0x21a) & 4)) {
                u8 p[16];
                func_ov088_0221a9c0(p, a);
                ((V1)vm(a, 0xc8))(a, p);
                VecFx32Object_Destroy(p);
            }
        } else {
            void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
            if (ActorDerivedType1_IsIdleEligible(player) &&
                Actor_GetCachedTerrainHeight(a) ==
                    Actor_GetCachedTerrainHeight(player)) {
                u8 d[16];
                func_ov088_02219d64(d, (u8 *)player + 0x18, (u8 *)a + 0x18);
                F(s32, d, 12) = 0;
                if (VecFx32Object_GetMagnitude(d) < 0x3c000) {
                    ((VS)vm(a, 0xc4))(a, 15);
                    void *t = F(void *, gGamePhaseRuntime, 0x2ea8);
                    if (t)
                        F(u16, t, 0x2a6) = 15;
                }
                VecFx32Object_Destroy(d);
            }
        }
    }
    Actor_SetInteractionFlag2000(a, interaction);
}
/* Construct lhs minus rhs as a VecFx32Object. */ extern "C" void
func_ov088_02219d64(void *o, const void *l, const void *r) {
    VecFx32Object_Init(o);
    func_020adfbc(l ? (const u8 *)l + 4 : 0, r ? (const u8 *)r + 4 : 0,
                  (u8 *)o + 4);
}
/* Decode directional input and update the actor's requested movement vector. */
extern "C" s32 func_ov088_02219d9c(void *a) {
    u16 flags = F(u16, a, 0x21a), keys = F(u16, gSystemState, 0x1a);
    if (flags & 1) {
        F(u16, a, 0xd6) = 5;
        F(u16, a, 0xda) = 0;
        F(s32, a, 0x3c) = F(s32, a, 0x40) = 0;
        return 0;
    }
    if (flags & 0x2000) {
        F(u16, a, 0xd6) = 1;
        F(u16, a, 0xda) = 3;
        clear_motion(a);
        return 0;
    }
    if (F(s16, a, 0x230) == 0) {
        F(u16, a, 0xd6) = 1;
        if (F(s16, a, 0xda) == 2)
            F(u16, a, 0xda) = 3;
        return 0;
    }
    if (F(s16, a, 0xda) == 1 || F(s16, a, 0xda) == 3) {
        F(s32, a, 0x208) = 0;
        F(u16, a, 0xd6) = 3;
        return 0;
    }
    if (!(keys & 0xf0)) {
        if (F(s16, a, 0xda) == 2 && F(s16, a, 0x240) > 0)
            --F(s16, a, 0x240);
        F(s32, a, 0x208) = 0;
        F(u16, a, 0xd6) = 3;
    } else {
        F(u16, a, 0x240) = 180;
        if (F(s16, a, 0xda) == 0) {
            F(u16, a, 0xda) = 1;
            F(s32, a, 0x208) = 0;
            F(u16, a, 0xd6) = 3;
            return 0;
        }
        s32 d;
        if (keys & 0x20)
            d = (keys & 0x40) ? 3 : ((keys & 0x80) ? 1 : 2);
        else if (keys & 0x10)
            d = (keys & 0x40) ? 5 : ((keys & 0x80) ? 7 : 6);
        else
            d = (keys & 0x40) ? 4 : 0;
        u8 old[16];
        VecFx32Object_InitCopy(old, (u8 *)a + 0x38);
        Actor_TurnTowardVector(a, -data_020c9670[d * 1024], data_020c9670[d * 1024 + 1],
                      0x800);
        VecFx32Object_Assign((u8 *)a + 0x38, old);
        F(s32, a, 0x208) = F(s32, a, 0x20c);
        F(u16, a, 0xd6) = 4;
        VecFx32Object_Destroy(old);
    }
    if ((keys & 0x300) == 0x300)
        Actor_PlayRadialSpatialSound(a, 0xfd88, 0);
    return 1;
}

/* Complete actor activation, transfer control to the scene actor, and notify
 * dependents. */
extern "C" void func_ov088_02219ff4(void *a, s32 effect_duration) {
    if (F(s16, a, 0x230) == 0) {
        F(u16, a, 0x21a) |= 2;
        Actor_PlayRadialSpatialSound(a, 0xfd86, 0);
        void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
        if (effect_duration > 0) {
            OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
            void *e = Heap_Alloc(0x48, data_ov088_0221b9fc, 4, gHeapContext);
            if (e) {
                u8 p[16];
                func_ov088_0221a98c(p, a);
                func_ov062_0220fe78(e, p, 0x20, effect_duration, 0, player, 1);
                VecFx32Object_Destroy(p);
            }
            F(u16, a, 0x21a) |= 0x80;
        }
        F(u32, player, 0x230) &= ~4u;
        clear_motion(player);
        F(u32, player, 0x14) |= 2;
        F(u32, a, 0xd0) |= 0x100000;
        F(u32, player, 0x230) |= 0x20100;
        F(u32, player, 0x14) &= ~0x100000u;
        GameWork_SetFlag(gGameWork, 0x402);
        F(u16, a, 0x21a) &= ~0x1000u;
        if (F(u16, F(void *, a, 0x238), 0x2e) & 1) {
            void *collection =
                GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
            s32 count = F(s32, collection, 0x2e74);
            for (s32 i = 0; i < count; i++) {
                void *actor = F(void *, collection, i * 4);
                if (actor && F(u8, actor, 0x4d) == 3 &&
                    F(u16, actor, 0x4e) == 6)
                    ((V2)vm(actor, 0xd0))(actor, a, -1);
            }
        }
    }
    F(u16, a, 0x230) = 1;
    F(u16, a, 0x232) = 12;
}
/* Copy the actor position and add its visual-height offset. */ extern "C" void
func_ov088_0221a98c(void *o, void *a) {
    VecFx32Object_InitCopy(o, (u8 *)a + 0x18);
    F(s32, o, 12) +=
        F(s32, a, 0x23c) + F(s16, F(void *, a, 0x238), 0x18) * 0x1000;
}
/* Select the first free adjacent map position, falling back to the current
 * position. */
extern "C" void func_ov088_0221a9c0(void *out, void *a) {
    s32 x = F(s32, a, 0x1c) >> 12, y = F(s32, a, 0x20) >> 12,
        layer = Actor_GetCachedTerrainHeight(a) >> 16;
    if (func_ov088_0221b2e0(a, x, y + 40, layer)) {
        x <<= 12;
        y = (y + 40) << 12;
    } else if (func_ov088_0221b2e0(a, x, y - 40, layer)) {
        x <<= 12;
        y = (y - 40) << 12;
    } else if (func_ov088_0221b2e0(a, x + 40, y, layer)) {
        x = (x + 40) << 12;
        y <<= 12;
    } else if (func_ov088_0221b2e0(a, x - 40, y, layer)) {
        x = (x - 40) << 12;
        y <<= 12;
    } else {
        x = F(s32, a, 0x1c);
        y = F(s32, a, 0x20);
    }
    VecFx32Object_InitComponents(out, x, y, Actor_GetCachedTerrainHeight(a));
}
/* Resolve terrain overlap and refresh the live attachment resource after scene
 * changes. */
extern "C" void func_ov088_0221aaac(void *a) {
    F(u32, a, 0x10) &= ~0x1000000u;
    Actor_AdjustPositionForTerrainHeight(a);
    clear_motion(a);
    s32 px = F(s32, a, 0x1c), py = F(s32, a, 0x20), x = px >> 12, y = py >> 12;
    s32 hw = func_ov088_0221ad6c((u8 *)a + 4) / 2 + 2,
        hh = func_ov088_0221ad84((u8 *)a + 4) / 2 + 2,
        layer = Actor_GetCachedTerrainHeight(a) >> 16;
    if (!Actor_IsTerrainCellEligibleAtHeight(a, (x + hw) >> 4, y >> 4, layer))
        F(s32, a, 0x8c) -= 0x2000;
    if (!Actor_IsTerrainCellEligibleAtHeight(a, (x - hw) >> 4, y >> 4, layer))
        F(s32, a, 0x8c) += 0x2000;
    if (!Actor_IsTerrainCellEligibleAtHeight(a, x >> 4, (y + hh) >> 4, layer))
        F(s32, a, 0x90) -= 0x2000;
    if (!Actor_IsTerrainCellEligibleAtHeight(a, x >> 4, (y - hh) >> 4, layer))
        F(s32, a, 0x90) += 0x2000;
    void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
    clear_motion(player);
    F(u32, player, 0x14) |= 2;
    VecFx32Object_Assign((u8 *)player + 0x18, (u8 *)a + 0x18);
    void *target = F(void *, gGamePhaseRuntime, 0x2ea8);
    if (target && F(void *, a, 0x24c)) {
        F(u16, F(void *, target, 0x54), 0x24) |= 4;
        void *resource = Heap_Alloc(0x10, data_ov088_0221b9fc, 4, gHeapContext);
        void *d = F(void *, target, 0x29c);
        if (resource)
            AnimationResource_Init(resource, F(u16, d, 0x14), F(u16, d, 0x16),
                                   F(u16, d, 0x18));
        void *s = F(void *, a, 0x250);
        u8 index = F(u8, s, 0x38);
        u16 flags = F(u16, s, 0x24);
        GraphicsSpriteGroup_ReplaceStateResources(
            F(void *, s, 0), s, F(s32, resource, 4), F(s32, resource, 8),
            F(s32, resource, 12));
        if (F(void *, a, 0x24c))
            ((V0)vm(F(void *, a, 0x24c), 4))(F(void *, a, 0x24c));
        GraphicsSpriteState_SetAnimationIndex(s, index);
        F(u16, s, 0x24) = flags;
        F(void *, a, 0x24c) = resource;
    }
}
/* Mark the actor destroyed, stop motion, and spawn its terminal presentation.
 */
extern "C" void func_ov088_0221a7c8(void *a) {
    F(u16, a, 0x21a) |= 1;
    clear_motion(a);
    Actor_PlayRadialSpatialSound(a, 0xfd89, 0);
    u8 p[16];
    VecFx32Object_InitCopy(p, (u8 *)a + 0x18);
    F(s32, p, 12) += F(s32, a, 0x23c);
    void *e = Heap_Alloc(0x14, data_ov088_0221ba04, 4, gHeapContext);
    if (e)
        AuxiliaryTimedSpritePresentation_Init(
            e, p, F(void *, F(void *, a, 0x54), 0), 0x221f, 0x221d, 0x2220, 1,
            -40, -1, 1);
    VecFx32Object_Destroy(p);
}
/* Enter temporary immobilization and clear accumulated motion. */
extern "C" void func_ov088_0221a8c4(void *a) {
    F(u16, a, 0x21a) |= 0x2000;
    clear_motion(a);
    Actor_PlayRadialSpatialSound(a, 0xfe04, 0);
}
/* Leave immobilization, stop its loop, and begin the presentation cooldown. */
extern "C" void func_ov088_0221a930(void *a) {
    F(u16, a, 0x21a) &= ~0x2000u;
    Sound_StopEffect(gSoundContext, 0x1fc, 4);
    Actor_PlayRadialSpatialSound(a, 0xfe05, 0);
    F(s16, a, 0xda) = 1;
    F(s16, a, 0x26c) = 60;
}

static void leave_active_control(void *a) {
    if (F(s16, a, 0x230) == 1) {
        F(s32, a, 0x208) = 0;
        F(u16, a, 0x214) = 0;
        if (!(F(u16, a, 0x21a) & 1)) {
            func_ov088_0221a930(a);
            F(u16, a, 0xd6) = 1;
            ((V0)vm(a, 0x5c))(a);
        }
        u16 s = F(u16, F(void *, a, 0x238), 0x26);
        if (s)
            Sound_StopEffect(gSoundContext, s >> 7, s & 0x7f);
        Sound_StopEffect(gSoundContext, 0x1fb, 4);
        Actor_PlayRadialSpatialSound(a, 0xfd86, 0);
    }
    clear_motion(a);
    F(u16, a, 0x230) = 0;
}

/* Leave active control through the effect-producing scene transition. */
extern "C" void func_ov088_0221a298(void *a, void *effect_position) {
    if (F(s16, a, 0x230) == 1) {
        void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
        u16 s = F(u16, F(void *, a, 0x238), 0x24);
        if (s)
            Sound_PlayOwnedEffect(gSoundContext, s >> 7, s & 0x7f, a, 0, 0x100);
        u8 p[16];
        func_ov088_0221a98c(p, a);
        VecFx32Object_Assign((u8 *)player + 0x18, p);
        VecFx32Object_Destroy(p);
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
        void *e = Heap_Alloc(0x48, data_ov088_0221b9fc, 4, gHeapContext);
        if (e)
            func_ov062_0220fe78(e, effect_position, 0x20, 20, 0, 0, 0);
        GameWork_ClearFlag(gGameWork, 0x402);
        Actor_ReplaceAttachmentSlotResource(player, 0, 0x1000, 0x1001, 0x1002);
        Actor_ReplaceAttachmentSlotResource(player, 1, 0x1015, 0x1001, 0x1016);
        F(u32, player, 0x230) &= ~0x20000u;
        F(u32, player, 0x14) = (F(u32, player, 0x14) & ~2u) | 0x100000;
        func_ov088_0221ad9c(a, 0);
    }
    leave_active_control(a);
}

/* Leave active control through the direct no-effect scene transition. */
extern "C" void func_ov088_0221a58c(void *a, void *, s32, s32) {
    if (F(s16, a, 0x230) == 1) {
        void *player = F(void *, gGamePhaseRuntime, 0x2ea4);
        VecFx32Object_Assign((u8 *)player + 0x18, (u8 *)a + 0x18);
        GameWork_ClearFlag(gGameWork, 0x402);
        Actor_ReplaceAttachmentSlotResource(player, 0, 0x1000, 0x1001, 0x1002);
        Actor_ReplaceAttachmentSlotResource(player, 1, 0x1015, 0x1001, 0x1016);
        F(u32, player, 0x230) &= ~0x20000u;
        F(u32, player, 0x14) = (F(u32, player, 0x14) & ~2u) | 0x100000;
    }
    leave_active_control(a);
}
/* Return packed collision width. */ extern "C" s32
func_ov088_0221ad6c(const void *b) {
    return F(s8, b, 2) - F(s8, b, 0);
}
/* Return packed collision height. */ extern "C" s32
func_ov088_0221ad84(const void *b) {
    return F(s8, b, 3) - F(s8, b, 1);
}
/* Hide or expose the attachment overlay layer. */ extern "C" void
func_ov088_0221ad9c(void *a, s32 visible) {
    if (visible)
        F(u16, a, 0x21a) &= ~0x1000u;
    else {
        F(u16, a, 0x21a) |= 0x1000;
        if (F(void *, a, 0x258))
            F(u16, F(void *, a, 0x258), 0x24) |= 0x10;
    }
}

/* Acquire or release the nearby type-7 attachment and maintain its cooldown. */
extern "C" s32 func_ov088_0221add8(void *a, s32, s32, s32) {
    if (F(s32, SceneManager_GetCurrent(gSceneManager), 4) != 1)
        return 0;
    void *target = F(void *, gGamePhaseRuntime, 0x2ea8);
    if (target) {
        if (!F(void *, a, 0x24c)) {
            if (F(s16, a, 0x230) == 1 && Type7Actor_GetStateCode(target) == 0 &&
                Fx32Vector2_Magnitude(F(s32, a, 0x3c), F(s32, a, 0x40)) <= 0x1000 &&
                Fx32Vector2_Magnitude(F(s32, a, 0x1c) - F(s32, target, 0x1c),
                              F(s32, a, 0x20) - F(s32, target, 0x20)) <
                    0x30000) {
                func_ov088_0221af2c(a, 30);
                return 1;
            }
        } else if (F(s16, a, 0x230) != 1) {
            func_ov088_0221b098(a);
            return 1;
        }
    }
    if (F(u16, a, 0x21a) & 0x40) {
        F(u16, a, 0x21a) &= ~0x40u;
        func_ov088_02219154((u8 *)a + 0x25c, -0x666);
        Actor_PlayRadialSpatialSound(a, 0xfd87, 0);
        if (target)
            F(u32, target, 0x14) |= 0x10000000;
    }
    if (F(void *, a, 0x250))
        F(u16, F(void *, a, 0x250), 0x24) &= ~4u;
    return 0;
}

/* Acquire the type-7 actor's presentation resource and enter attached motion.
 */
extern "C" void func_ov088_0221af2c(void *a, s32 duration) {
    void *target = F(void *, gGamePhaseRuntime, 0x2ea8);
    void *resource = Heap_Alloc(0x10, data_ov088_0221b9fc, 4, gHeapContext);
    void *d = F(void *, target, 0x29c);
    if (resource)
        AnimationResource_Init(resource, F(u16, d, 0x14), F(u16, d, 0x16),
                               F(u16, d, 0x18));
    F(void *, a, 0x24c) = resource;
    void *owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(a));
    void *s = GraphicsSpriteGroup_CreateState(owner, F(s32, resource, 4),
                                              F(s32, resource, 8),
                                              F(s32, resource, 12), 2);
    F(void *, a, 0x250) = s;
    F(u16, s, 0x24) |= 6;
    if (duration > 0) {
        Actor_PlayRadialSpatialSound(a, 0xfd86, 0);
        u8 p[16];
        func_ov088_0221a98c(p, a);
        s32 dir = F(u8, a, 0xd4);
        F(s32, p, 4) += data_ov088_0221b6ec[dir * 2];
        F(s32, p, 8) += data_ov088_0221b6f0[dir * 2];
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
        void *effect = Heap_Alloc(0x40, data_ov088_0221b9fc, 4, gHeapContext);
        if (effect)
            func_ov062_02210674(effect, target, p, 0x20, duration, 1, 0);
        VecFx32Object_Destroy(p);
    }
    F(u16, a, 0x21a) |= 0x40;
    Type7Actor_EnterFlag40000State(target);
}

/* Release the type-7 attachment, restore its position, and spawn its return
 * motion. */
extern "C" void func_ov088_0221b098(void *a) {
    void *target = F(void *, gGamePhaseRuntime, 0x2ea8);
    GraphicsSpriteState_ReleaseFromGroup(F(void *, a, 0x250));
    F(void *, a, 0x250) = 0;
    if (F(void *, a, 0x24c))
        ((V0)vm(F(void *, a, 0x24c), 4))(F(void *, a, 0x24c));
    F(void *, a, 0x24c) = 0;
    Actor_PlayRadialSpatialSound(a, 0xfd86, 0);
    u8 p[16];
    func_ov088_0221a98c(p, a);
    s32 dir = F(u8, a, 0xd4);
    F(s32, p, 4) += data_ov088_0221b6ec[dir * 2];
    F(s32, p, 8) += data_ov088_0221b6f0[dir * 2];
    VecFx32Object_Assign((u8 *)target + 0x28, p);
    VecFx32Object_Assign((u8 *)target + 0x18, (u8 *)target + 0x28);
    F(u16, F(void *, target, 0x54), 0x24) &= ~4u;
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
    void *effect = Heap_Alloc(0x40, data_ov088_0221b9fc, 4, gHeapContext);
    if (effect) {
        u8 q[16];
        func_ov088_0221a9c0(q, a);
        func_ov062_02210674(effect, target, q, 0x20, 30, 0, target);
        VecFx32Object_Destroy(q);
    }
    F(u32, target, 0x14) &= ~0x10000000u;
    F(u32, target, 0x268) &= ~0x40000u;
    Type7Actor_ResetMotionAndCooldown(target);
    VecFx32Object_Destroy(p);
}

/* The remaining audited state, rendering, attachment, and vtable paths follow.
 */

/* Classify the actor's current attachment and motion state for callers. */
extern "C" s32 func_ov088_0221b218(void *a) {
    if (F(u16, a, 0x21a) & 0x4000)
        return 6;
    if (F(s16, a, 0x230) != 1)
        return 5;
    if (F(u16, a, 0x21a) & 0x2000)
        return 4;
    return Fx32Vector2_Magnitude(F(s32, a, 0x3c), F(s32, a, 0x40)) < 0x1000 ? 0 : 3;
}

/* Refresh scene collision state, then query one map cell. */
extern "C" s32 func_ov088_0221b278(void *a, s32 x, s32 y, s32 layer) {
    void *scene = F(void *, gGamePhaseRuntime, 0x2ed4);
    ((V0)vm(scene, 0x2c))(scene);
    return Actor_IsTerrainCellEligibleAtHeight(a, x, y, layer);
}

/* Apply an external motion impulse only while the actor is active. */
extern "C" void func_ov088_0221b2c4(void *a, s32 x, s32 y) {
    if (F(s16, a, 0x230) == 1)
        Actor_ApplyMotionImpulse(a, x, y);
}

/* Test the actor's nine collision sample points against the scene map. */
extern "C" s32 func_ov088_0221b2e0(void *a, s32 x, s32 y, s32 layer) {
    s32 width = func_ov088_0221ad6c(Actor_GetCollisionBounds(a));
    s32 hw = (width + ((u32)width >> 31)) >> 1;
    s32 height = func_ov088_0221ad84(Actor_GetCollisionBounds(a));
    s32 hh = (height + ((u32)height >> 31)) >> 1;
    for (s32 ix = -1; ix <= 1; ix++)
        for (s32 iy = -1; iy <= 1; iy++)
            if (!func_ov088_0221b278(a, (x + ix * hw) >> 4, (y + iy * hh) >> 4,
                                     layer))
                return 0;
    return 1;
}

/* Return the actor's finite activity duration in frames. */ extern "C" s32
func_ov088_0221b380(void *a) {
    return F(s16, F(void *, a, 0x238), 0x16) * 60;
}
/* Construct the specialized primary actor vtable variant. */ extern "C" void *
func_ov088_0221b394(void *a, const void *c) {
    func_ov088_022177e0(a, c);
    F(void *, a, 0) = data_ov088_0221b84c;
    return a;
}
/* Destroy the specialized actor without freeing it. */ extern "C" void *
func_ov088_0221b3b4(void *a) {
    func_ov088_02217e44(a);
    return a;
}
/* Destroy and free the specialized actor. */ extern "C" void *
func_ov088_0221b3c8(void *a) {
    func_ov088_02217e44(a);
    Heap_Free(a);
    return a;
}
/* Run input processing and expose its deferred presentation flag. */
extern "C" s32 func_ov088_0221b3e4(void *a) {
    if (!func_ov088_02219d9c(a))
        return 0;
    if (F(s32, F(void *, gGamePhaseRuntime, 0x2ed4), 4) == 1)
        F(u16, a, 0x21a) |= 0x800;
    return 1;
}
/* Consume the deferred touch notification and spawn its tracked resource actor.
 */
extern "C" void Overlay088Actor_SnapshotTransientStateAndProcessDeferredTouch(void *a) {
    Actor_SnapshotTransientState(a);
    if (!(F(u16, a, 0x21a) & 0x800))
        return;
    F(u16, a, 0x21a) &= ~0x800u;
    if (F(s16, a, 0x230) != 1)
        return;
    u8 target[16], origin[16];
    VecFx32Object_Init(target);
    void *p = ActorMotionAreaFollower_GetPosition((u8 *)gGamePhaseRuntime + 0x2fbc);
    F(s32, target, 4) =
        F(s32, p, 4) + F(u16, gTouchPanelManager, 0x40) * 0x1000;
    F(s32, target, 8) =
        F(s32, p, 8) + F(u16, gTouchPanelManager, 0x42) * 0x1000;
    F(s32, target, 12) += 0x10000;
    func_ov088_0221a98c(origin, a);
    TrackedResourceActor_SpawnFromKey(F(s16, F(void *, a, 0x238), 0x2c), origin,
                                      target);
    VecFx32Object_Destroy(origin);
    VecFx32Object_Destroy(target);
}

/* Construct the small base-runtime helper variant. */ extern "C" void *
func_ov088_0221b508(void *a, const void *c) {
    ActorDerivedRuntime_Init(a, c);
    F(void *, a, 0) = data_ov088_0221b780;
    return a;
}
/* Destroy the helper variant without freeing it. */ extern "C" void *
func_ov088_0221b528(void *a) {
    ActorDerivedRuntime_DestroyAlternate(a);
    return a;
}
/* Destroy and free the helper variant. */ extern "C" void *
func_ov088_0221b53c(void *a) {
    ActorDerivedRuntime_DestroyAlternate(a);
    Heap_Free(a);
    return a;
}
/* Mirror the scene attachment flag before the inherited update. */
extern "C" void func_ov088_0221b558(void *a) {
    void *s = F(void *, gGamePhaseRuntime, 0x2ea4);
    if (s && (F(u32, s, 0x230) & 0x20000))
        F(u32, a, 0x10) &= ~0x10000u;
    else
        F(u32, a, 0x10) |= 0x10000;
    ActorDerivedRuntime_UpdateFrame(a);
}
/* Return the fixed interaction radius. */ extern "C" s32
func_ov088_0221b5b0(void) {
    return 0x40000;
}
/* Return the default false capability. */ extern "C" s32
func_ov088_0221b5b8(void) {
    return 0;
}
/* Forward another actor position through the inherited callback. */
extern "C" void func_ov088_0221b5c0(void *a, void *other) {
    ActorDerivedRuntime_ForwardTouchPoint(a, (u8 *)other + 0x18);
}
/* Return runtime flag 0x80. */ extern "C" u32 func_ov088_0221b5d0(void *a) {
    return F(u32, a, 0xd0) & 0x80;
}
/* Return whether runtime flag 0x40 is set. */ extern "C" bool
func_ov088_0221b5dc(void *a) {
    return (F(u32, a, 0xd0) & 0x40) != 0;
}
/* Return the default false predicate. */ extern "C" s32
func_ov088_0221b5f0(void) {
    return 0;
}
/* No-op vtable callback. */ extern "C" void func_ov088_0221b5f8(void) {
}
/* No-op vtable callback. */ extern "C" void func_ov088_0221b5fc(void) {
}
/* No-op vtable callback. */ extern "C" void func_ov088_0221b600(void) {
}
/* Mark runtime flag 0x80. */ extern "C" void func_ov088_0221b604(void *a) {
    F(u32, a, 0xd0) |= 0x80;
}
/* Return the default false query. */ extern "C" s32 func_ov088_0221b614(void) {
    return 0;
}
/* Return the default false query. */ extern "C" s32 func_ov088_0221b61c(void) {
    return 0;
}
/* Return the default false query. */ extern "C" s32 func_ov088_0221b624(void) {
    return 0;
}
/* Return the default false query. */ extern "C" s32 func_ov088_0221b62c(void) {
    return 0;
}
/* No-op vtable callback. */ extern "C" void func_ov088_0221b634(void) {
}
/* No-op vtable callback. */ extern "C" void func_ov088_0221b638(void) {
}
/* Forward inherited vmethod 0xe8. */ extern "C" void
func_ov088_0221b63c(void *a) {
    ((V0)vm(a, 0xe8))(a);
}
/* Forward inherited vmethod 0x60. */ extern "C" void
func_ov088_0221b648(void *a) {
    ((V0)vm(a, 0x60))(a);
}
/* Return the fixed secondary interaction radius. */ extern "C" s32
func_ov088_0221b654(void) {
    return 0x10000;
}

/* Audited declarations retained until their definitions below are completed. */
extern "C" void func_ov088_02217f38(void *, const void *);
extern "C" void func_ov088_02218130(void *, s32, s32);
extern "C" void func_ov088_02218290(void *);
extern "C" void func_ov088_02218328(void *);
extern "C" void func_ov088_022191d4(void *, void *, void *, s32);
extern "C" void func_ov088_0221963c(void *, s32, s32, s32);
extern "C" void func_ov088_02219a2c(void *, void *, s32, s32);
extern "C" void func_ov088_02219c0c(void *, s32, s32, s32);
extern "C" void func_ov088_02219ff4(void *, s32);
extern "C" void func_ov088_0221a298(void *, void *);
extern "C" void func_ov088_0221a58c(void *, void *, s32, s32);
extern "C" void func_ov088_0221a7c8(void *);
extern "C" void func_ov088_0221a8c4(void *);
extern "C" void func_ov088_0221a930(void *);
extern "C" void func_ov088_0221a9c0(void *, void *);
extern "C" void func_ov088_0221aaac(void *);
extern "C" s32 func_ov088_0221add8(void *, s32, s32, s32);
extern "C" void func_ov088_0221af2c(void *, s32);
extern "C" void func_ov088_0221b098(void *);
extern "C" s32 func_ov088_0221b218(void *);
extern "C" s32 func_ov088_0221b278(void *, s32, s32, s32);
extern "C" void func_ov088_0221b2c4(void *, s32, s32);
extern "C" s32 func_ov088_0221b2e0(void *, s32, s32, s32);
extern "C" void Overlay088Actor_SnapshotTransientStateAndProcessDeferredTouch(void *);
