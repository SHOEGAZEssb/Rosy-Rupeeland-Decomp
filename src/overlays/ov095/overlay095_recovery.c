#include "tingle/types.h"

/* Recovered overlay 95 actor, encounter, and presentation runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define P(base, offset) ((void *)((u8 *)(base) + (offset)))
typedef s32 (*Method)(...);

extern "C" void *gHeapContext;
extern "C" void *gSoundContext;
extern "C" u8 *data_021052fc;
extern "C" u8 gTrackedResourceActorRecordTable[];
extern "C" u8 data_ov095_0221cb8c[];
extern "C" u8 data_ov095_0221cba8[];
extern "C" u8 data_ov095_0221cbc8[];
extern "C" u8 data_ov095_0221cbd0[];
extern "C" u8 data_ov095_0221cbf8[];
extern "C" u8 data_ov095_0221cc00[];
extern "C" u8 data_ov095_0221cca0[];
extern "C" u8 data_ov095_0221ceb0[];
extern "C" u8 data_ov095_0221ceb8[];
extern "C" u8 data_ov095_0221cec0[];
extern "C" u8 data_ov095_0221ced0[];
extern "C" u8 data_ov095_0221cee8[];
extern "C" u8 data_ov095_0221cf4c[];
extern "C" u8 data_ov095_0221d1a4[];
extern "C" u8 data_ov095_0221d288[];
extern "C" u8 data_ov095_0221d2e8[];
extern "C" u8 data_ov095_0221d3cc[];
extern "C" u8 data_020c9670[];
extern "C" u8 data_020e6adc[];
extern "C" u8 data_020e6b74[];
extern "C" void *gActorRuntimeCollection;

#define EXT(name) extern "C" s32 name(...)
EXT(VecFx32Object_Init);
EXT(VecFx32Object_Destroy);
EXT(Heap_Alloc);
EXT(Heap_Free);
EXT(AnimationResource_Init);
EXT(ActorCollection_GetSpriteOwner);
EXT(Actor_GetCollection);
EXT(ActorExtendedType2_InitializePresentation);
EXT(ActorExtendedType2_UpdateFrame);
EXT(GraphicsSpriteGroup_ReplaceStateResources);
EXT(GraphicsSpriteState_SetAnimationIndex);
EXT(GamePhaseRuntime_GetActorCollection);
EXT(VecFx32Object_Assign);
EXT(VecFx32Object_InitCopy);
EXT(VecFx32Object_GetMagnitude);
EXT(VecFx32Object_InitComponents);
EXT(VecFx32Triple_Set);
EXT(VecFx32Triple_Destroy);
EXT(VecFx32Bezier_Evaluate3D);
EXT(genrand_int32);
EXT(OS_Halt);
EXT(Actor_ApplyMotionImpulse);
EXT(ActorExtendedType2_PrepareRelease);
EXT(ActorExtendedType2_InitializeReentryState);
EXT(ActorCollection_QueueActorForRemoval);
EXT(Actor_QueryTerrainHeight);
EXT(Actor_GetCachedTerrainHeight);
EXT(ActorExtendedType2_Init);
EXT(ActorExtendedType2_Destroy);
EXT(ActorExtendedType2_LaunchRandomMotion);
EXT(ActorExtendedType2_InitializeTransformAndMotion);
EXT(ActorExtendedType2_DispatchTransitionCallback);
EXT(ActorExtendedType2_GetDescriptorValue25);
EXT(ActorExtendedType2_TryCompleteAttachmentGate);
EXT(Actor_SetDirectionFromVector);
EXT(Actor_SnapshotTransientState);
EXT(ActorRuntimeCollection_GetPendingAttachmentFlag);
EXT(AuxiliaryTimedSpritePresentation_Init);
EXT(EffectManager_SubmitPointEffect);
EXT(TrackedResourceActorImpulse_InitBase);
EXT(TrackedResourceActorImpulse_Destroy);
EXT(TrackedResourceActorImpulse_QueueRemovalAndEmitEffects);
EXT(TrackedResourceActorImpulse_Update);
EXT(TrackedResourceActorImpulse_SetupFromRecord);
EXT(TrackedResourceActor_DispatchTargetInteraction);
EXT(TrackedResourceActor_EmitRecordEffects);
EXT(TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect);
EXT(TrackedResourceActor_SpawnFromKey);
EXT(ActorMotionJitter_EnsureMinimum);
EXT(Sound_FadeDirectSequence);
EXT(Type7Actor_ProcessGlobalInteractionTrigger);
EXT(TrackedResourceActor_PostUpdate);
EXT(Actor_UpdatePrimaryRenderAttachmentPriority);
EXT(Actor_TurnTowardVector);
EXT(Actor_PlayRadialSpatialSound);
EXT(func_0201e0ec);
EXT(Fx32Vector2_Magnitude);
EXT(func_0206e590);
EXT(func_020a2844);
EXT(func_020a25c8);
EXT(func_020a291c);
EXT(func_020a2960);
EXT(func_020a29ac);
EXT(func_020a2a4c);
EXT(func_020ada8c);
EXT(func_020adae4);
EXT(func_020adc90);
EXT(func_020bf1f8);
EXT(Actor_PlayHorizontalSpatialSound);
EXT(Actor_GetGravityAcceleration);
EXT(func_020befec);
EXT(func_020adfbc);
EXT(func_020adff0);
EXT(Sound_StopEffect);
EXT(Sound_IsEffectPlaying);
EXT(Sound_SetEffectPitch);
EXT(Sound_PlayOwnedEffect);
#undef EXT

extern "C" void *func_ov075_02212ae0(void *, void *, s32, s32);
extern "C" void func_ov076_02213a3c(void);
extern "C" void *func_ov078_02212ba0(void *);
extern "C" void func_ov078_02213574(void *, void *);
extern "C" void func_ov078_0221361c(void);
extern "C" void func_ov078_02213c3c(void *, void *);
extern "C" void func_ov095_02217980(void *, s32, s32, s32, s32);
extern "C" void func_ov095_02218404(void *, s32, s32, s32);
extern "C" void func_ov095_02218450(void *);
extern "C" void func_ov095_02218534(void *, s32);
extern "C" void func_ov095_0221a418(void *, void *);
extern "C" void func_ov095_0221a878(void *, void *);
extern "C" s32 func_ov095_0221ae14(void *);
extern "C" s32 func_ov095_0221b6d8(void *);
extern "C" void func_ov095_0221bed0(void *);
extern "C" s32 func_ov095_0221bf8c(void *);

/* Constructs the primary encounter actor and resolves its resource records. */
extern "C" void *func_ov095_022177e0(void *actor, void *descriptor,
                                      s32 arg2, s32 arg3)
{
    func_ov075_02212ae0(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov095_0221cca0;
    F(s16, actor, 0x2b8) = 0;
    F(s16, actor, 0x2ba) = 0;
    F(s16, actor, 0x2d4) = 0;
    F(s16, actor, 0x2d6) = 0;
    F(s16, actor, 0x2d8) = 0;
    F(s16, actor, 0x2da) = 0;
    F(s16, actor, 0x2dc) = 0;
    F(s16, actor, 0x2de) = 0;
    VecFx32Object_Init(P(actor, 0x2e0));
    VecFx32Object_Init(P(actor, 0x2f0));
    F(u32, actor, 0x314) =
        ((F(u32, actor, 0x314) & ~3u) | 1) & 0xffff0003u;
    F(u8, actor, 0x318) = 2;
    F(u8, actor, 0x319) = 0;
    F(s16, actor, 0x31a) = 0;
    F(s16, actor, 0x31c) = 0;
    F(s16, actor, 0x31e) = 0;
    F(void *, actor, 0x320) = 0;
    F(u32, actor, 0x260) &= ~0x1000u;
    func_ov095_02217980(P(actor, 8), -30, -20, 30, 8);
    F(void *, actor, 0x2a4) = F(void *, data_ov095_0221cba8, 0x18);
    F(void *, actor, 0x2a8) = F(void *, data_ov095_0221cba8, 0x1c);

    for (s32 slot = 0; slot < 6; ++slot)
    {
        s16 key = F(s16, data_ov095_0221cb8c, slot * 2);
        void *record = 0;
        for (s32 index = 0; index < 67; ++index)
        {
            void *candidate = P(gTrackedResourceActorRecordTable, index * 50);
            if (F(s16, candidate, 0) == key)
            {
                record = candidate;
            }
        }
        F(void *, actor, 0x2bc + slot * 4) = record;
    }
    F(void *, actor, 0x300) = 0;
    for (s32 index = 0; index < 4; ++index)
    {
        F(void *, actor, 0x304 + index * 4) = 0;
    }
    F(s16, actor, 0xda) = 20;
    F(s16, actor, 0x29e) = 25;
    return actor;
}

/* Writes four signed collision bounds into the supplied record. */
extern "C" void func_ov095_02217980(void *record, s32 left, s32 top,
                                      s32 right, s32 bottom)
{
    F(s8, record, 0) = (s8)left;
    F(s8, record, 1) = (s8)top;
    F(s8, record, 2) = (s8)right;
    F(s8, record, 3) = (s8)bottom;
}

/* Releases owned behavior state, vectors, and the recovered base actor. */
extern "C" void *func_ov095_02217998(void *actor)
{
    F(void *, actor, 0) = data_ov095_0221cca0;
    void *owned = F(void *, actor, 0x320);
    if (owned != 0)
    {
        ((Method)F(void *, F(void *, owned, 0), 4))(owned);
    }
    VecFx32Object_Destroy(P(actor, 0x2f0));
    VecFx32Object_Destroy(P(actor, 0x2e0));
    func_ov078_02212ba0(actor);
    return actor;
}

/* Releases the actor's owned state and heap allocation. */
extern "C" void *func_ov095_022179e4(void *actor)
{
    func_ov095_02217998(actor);
    Heap_Free(actor);
    return actor;
}

/* Allocates and binds the actor's presentation animation resource. */
extern "C" void func_ov095_02217a38(void *actor)
{
    ActorExtendedType2_InitializePresentation(actor);
    void *resource = (void *)Heap_Alloc(16, data_ov095_0221ceb0, 4,
                                        gHeapContext);
    if (resource != 0)
    {
        resource = (void *)AnimationResource_Init(resource, 0x1388, 0x1001,
                                                   0x1710);
    }
    F(void *, actor, 0x320) = resource;
    void *collection = (void *)Actor_GetCollection(actor);
    void *owner = (void *)ActorCollection_GetSpriteOwner(collection);
    GraphicsSpriteGroup_ReplaceStateResources(
        owner, F(void *, actor, 0xa8), F(void *, resource, 4),
        F(void *, resource, 8), F(void *, resource, 12));
}

/* Advances the actor and keeps its sound and collision height synchronized. */
extern "C" void func_ov095_02217aac(void *actor)
{
    if ((F(u32, actor, 0xd0) & 0x100) != 0 &&
        Sound_IsEffectPlaying(gSoundContext, 0x1ee, 5) != 0)
    {
        Sound_StopEffect(gSoundContext, 0x1ee, 5);
    }
    ActorExtendedType2_UpdateFrame(actor);
    F(s16, actor, 0x6a) = F(s8, actor, 0x24c) == 8 ? -72 : -90;
    F(u32, actor, 0x10) |= 0x100000;
}

static s32 HasCallbackPair(void *actor, const void *first, const void *second)
{
    void *active = F(void *, actor, 0x2a4);
    return active == first &&
           (F(void *, actor, 0x2a8) == second || active == 0);
}

/* Handles contact only when none of the actor's excluded callback pairs apply. */
extern "C" void func_ov095_02217b24(void *actor, void *other)
{
    if (HasCallbackPair(actor, F(void *, data_ov095_0221cba8, 0),
                        F(void *, data_ov095_0221cba8, 4)) ||
        HasCallbackPair(actor, F(void *, data_ov095_0221cba8, 0x20),
                        F(void *, data_ov095_0221cbc8, 4)) ||
        HasCallbackPair(actor, F(void *, data_ov095_0221cba8, 0x28),
                        F(void *, data_ov095_0221cbd0, 4)))
    {
        return;
    }
    F(u32, actor, 0x260) |= 0x10;
    if ((F(u32, other, 0xd0) & 0x100) == 0 && F(s16, other, 0x268) <= 0)
    {
        Actor_PlayHorizontalSpatialSound(actor, 0x3089, 0);
    }
}

/* Resolves nearby linked actors once, then runs the shared frame update. */
extern "C" void func_ov095_02217c40(void *actor, void *context)
{
    if ((F(u32, actor, 0x314) & 1) != 0)
    {
        void *collection = (void *)GamePhaseRuntime_GetActorCollection(
            F(void *, data_021052fc, 0), 1);
        s32 linkedCount = 0;
        for (s32 index = 0; index < F(s32, collection, 0x2e74); ++index)
        {
            void *candidate = F(void *, collection, index * 4);
            if (candidate == 0 || candidate == actor)
            {
                continue;
            }
            if (F(u8, candidate, 0x4d) == 3 &&
                F(s16, candidate, 0x4e) == 5)
            {
                if (F(void *, actor, 0x300) == 0)
                {
                    F(void *, actor, 0x300) = candidate;
                }
            }
            else if (F(u8, candidate, 0x4d) == 2 && linkedCount < 4)
            {
                u32 type = (u8)(F(u8, candidate, 0x27e) - 1);
                if (type < 32 && ((1u << type) & 0x90000007u) != 0)
                {
                    F(void *, actor, 0x304 + linkedCount * 4) = candidate;
                    ++linkedCount;
                }
            }
        }
        F(u32, actor, 0x314) &= ~1u;
    }
    func_ov078_02213574(actor, context);
}

/* Builds the direction vector between two optional vector objects. */
extern "C" void func_ov095_02217d58(void *result, void *first, void *second)
{
    VecFx32Object_Init(result);
    func_020adff0(first == 0 ? 0 : P(first, 4),
                  second == 0 ? 0 : P(second, 4), P(result, 4));
}

/* Returns the signed vertical span stored in a compact bounds record. */
extern "C" s32 func_ov095_02217d90(void *bounds)
{
    return (s16)(F(s16, bounds, 6) - F(s16, bounds, 2));
}

/* Return state-scaled signed FX32 gravity acceleration for this actor type. */
extern "C" s32 func_ov095_02217da8(void *actor)
{
    s32 baseGravityAccelerationFx32 = Actor_GetGravityAcceleration(actor);
    if (F(s16, actor, 0xda) == 7)
        return func_020befec(baseGravityAccelerationFx32 * 7, 5);
    if (F(s16, actor, 0xda) == 0 && F(s32, actor, 0x44) >= 0)
        return func_020befec(baseGravityAccelerationFx32 * 5, 7);
    return baseGravityAccelerationFx32;
}

static void ReplaceActorResource(void *actor)
{
    void *resource = F(void *, actor, 0x208);
    void *owner = (void *)ActorCollection_GetSpriteOwner(
        (void *)Actor_GetCollection(actor));
    GraphicsSpriteGroup_ReplaceStateResources(
        owner, F(void *, actor, 0x54), F(void *, resource, 4),
        F(void *, resource, 8), F(void *, resource, 12));
}

/* Selects the sprite animation and flags for the actor's current state. */
extern "C" void func_ov095_02217df4(void *actor)
{
    u32 animation = 0xffffffffu;
    u16 scale = 0x100;
    void *sprite = F(void *, actor, 0x54);
    if (F(s16, actor, 0xd6) == 0x1a)
    {
        ReplaceActorResource(actor);
        animation = F(u8, actor, 0xd4) + 0x10;
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & ~1u) | 2;
    }
    else if (F(s16, actor, 0xd6) == 0x1b)
    {
        ReplaceActorResource(actor);
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & ~1u) | 2;
        switch (F(s16, actor, 0xda))
        {
        case 0: animation = F(u8, actor, 0xd4) + 0x18; break;
        case 1: case 2: animation = 0x28; break;
        case 3: animation = F(u8, actor, 0xd4) + 0x20; break;
        case 4:
            animation = 0x28;
            F(u16, F(void *, actor, 0xa8), 0x24) |= 0x10;
            break;
        case 5: F(u16, sprite, 0x24) |= 0x10; break;
        case 6:
            scale = 0x2c0;
            animation = 0x28;
            F(u16, sprite, 0x24) &= (u16)~0x10;
            F(u16, F(void *, actor, 0xa8), 0x24) &= (u16)~0x10;
            break;
        case 7: animation = 0x39; break;
        case 8: animation = 0x30; break;
        case 9: animation = 0x3a; F(u16, sprite, 0x24) &= (u16)~2; break;
        case 10: animation = 0x3b; break;
        case 11: animation = 0x3c; F(u16, sprite, 0x24) &= (u16)~2; break;
        case 12: animation = 0x2a; break;
        case 13: animation = 0x2b; F(u16, sprite, 0x24) &= (u16)~2; break;
        case 14: animation = 0x2c; break;
        case 15: case 16:
            animation = 0x2d;
            F(u16, sprite, 0x24) &= (u16)~2;
            break;
        case 17: animation = 0x2c; break;
        case 18: scale = 0x300; animation = 0x28; break;
        case 19: animation = 0x2b; break;
        case 20: animation = 0x2a; break;
        case 21: animation = 0x2e; F(u16, sprite, 0x24) &= (u16)~2; break;
        case 22: case 24: animation = 0x2e; break;
        case 23: animation = 0x2f; F(u16, sprite, 0x24) &= (u16)~2; break;
        }
    }
    if ((F(u32, actor, 0xd0) & 0x1000) != 0 ||
        (animation != 0xffffffffu &&
         animation != F(u8, sprite, 0x38)))
    {
        GraphicsSpriteState_SetAnimationIndex(sprite, animation & 0xff);
    }
    F(u16, sprite, 0x36) = scale;
    F(u16, sprite, 0x30) = 0;
}

/* Clears the pair of encounter-state timers used by state transitions. */
extern "C" void func_ov095_022180dc(void *actor)
{
    F(s16, actor, 0x2d6) = 0;
    F(s16, actor, 0x2d8) = 0;
}

/* Enters the shared timed encounter state and resets its counters. */
extern "C" void func_ov095_022180f0(void *actor)
{
    func_ov076_02213a3c();
    F(s16, actor, 0x2d6) = 0;
    F(s16, actor, 0x2d8) = 0;
    F(s16, actor, 0x2da) = 120;
    F(s16, actor, 0x29c) = 0;
    F(s16, actor, 0x256) = 60;
}

/* Forwards the inherited state callback through overlay 78. */
extern "C" void func_ov095_02218124(void)
{
    func_ov078_0221361c();
}

/* Selects an encounter form and installs its resources and spatial state. */
extern "C" void func_ov095_02218130(void *actor, s16 form)
{
    genrand_int32();
    F(s16, actor, 0x2d4) = form;
    F(s16, actor, 0x298) = 0;
    void *sprite = F(void *, actor, 0x54);
    F(u16, sprite, 0x32) = 0x100;
    F(u16, sprite, 0x34) = 0x100;
    F(u32, actor, 0x14) &= ~0x40u;

    if (form == 0)
    {
        F(void *, actor, 0x2a4) = F(void *, data_ov095_0221cba8, 0x30);
        F(void *, actor, 0x2a8) = F(void *, data_ov095_0221cba8, 0x34);
        F(void *, actor, 0x228) = F(void *, data_021052fc, 0x2ea4);
        VecFx32Object_Assign(P(actor, 0x2f0), P(F(void *, actor, 0x228), 0x18));
        F(s32, actor, 0x2fc) += 0x20000;
    }
    else if (form == 1)
    {
        F(void *, actor, 0x2a4) = F(void *, data_ov095_0221cba8, 8);
        F(void *, actor, 0x2a8) = F(void *, data_ov095_0221cba8, 0xc);
        F(s16, actor, 0x2de) = 0;
        F(void *, actor, 0x228) = F(void *, data_021052fc, 0x2ea4);
    }
    else if (form == 2 || form == 3)
    {
        if (form == 3)
        {
            F(s16, actor, 0x2de) = 0;
        }
        F(void *, actor, 0x2a4) = F(void *, data_ov095_0221cba8, 0x38);
        F(void *, actor, 0x2a8) = F(void *, data_ov095_0221cba8, 0x3c);
        F(void *, actor, 0x228) = F(void *, data_021052fc, 0x2ea4);
    }
    else if (form == 4)
    {
        F(void *, actor, 0x2a4) = F(void *, data_ov095_0221cba8, 0x40);
        F(void *, actor, 0x2a8) = F(void *, data_ov095_0221cba8, 0x44);
    }
    else
    {
        OS_Halt();
        return;
    }

    F(u32, actor, 0x14) |= 0x40;
    func_ov095_02218404(P(actor, 0x38), 0, 0, 0);
    func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
    func_ov095_02218404(P(actor, 0x98), 0, 0, 0);
    F(u16, actor, 0x2a2) = (u16)genrand_int32() & 1;

    if (form == 0 || form == 4)
    {
        ++F(s16, actor, 0x2de);
    }
    if (form == 4)
    {
        Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 0xb, actor, 0, 0x200);
    }
}

/* Replaces the three components of a vector-like object after its header. */
extern "C" void func_ov095_02218404(void *record, s32 x, s32 y, s32 z)
{
    void *values = record != 0 ? P(record, 4) : record;
    F(s32, values, 0) = x;
    F(s32, values, 4) = y;
    F(s32, values, 8) = z;
}

/* Initializes a vector object from the payloads of two optional operands. */
extern "C" void func_ov095_02218414(void *result, void *left, void *right)
{
    VecFx32Object_Init(result);
    func_020adfbc(left != 0 ? P(left, 4) : left,
                  right != 0 ? P(right, 4) : right, P(result, 4));
}

/* Empty callback retained as part of the recovered actor interface. */
extern "C" void func_ov095_0221844c(void)
{
}

/* Enters the encounter's terminal presentation state and emits its sound. */
extern "C" void func_ov095_02218450(void *actor)
{
    F(void *, actor, 0x2a4) = F(void *, data_ov095_0221cba8, 0x48);
    F(void *, actor, 0x2a8) = F(void *, data_ov095_0221cba8, 0x4c);
    F(s16, actor, 0x298) = 0;
    F(s16, actor, 0x2dc) = 0;
    F(void *, actor, 0x2b4) = 0;
    F(void *, actor, 0x2b0) = 0;
    Sound_PlayOwnedEffect(gSoundContext, 0x61, 0, actor, 0, 0x100);
}

/* Advances terminal-state motion, shrinking its vector until the timeout. */
extern "C" void func_ov095_022184b4(void *actor)
{
    F(u32, actor, 0x260) =
        (F(u32, actor, 0x260) | 0x1021u) & 0xfffffbf5u;
    F(u8, actor, 0x24c) = 3;
    ++F(s16, actor, 0x298);
    if (F(s16, actor, 0x298) < 90)
    {
        Method updatePosition = F(Method, F(void *, actor, 0), 0xd0);
        updatePosition(actor, P(F(void *, actor, 0x228), 0x18));
        func_ov095_02218534(P(actor, 0x38), 0xe66);
    }
    else
    {
        func_ov095_02218450(actor);
    }
    F(s16, actor, 0xd6) = 0x1a;
}

/* Multiplies all three fixed-point vector components by a 20.12 scale. */
extern "C" void func_ov095_02218534(void *vector, s32 scale)
{
    F(s32, vector, 4) =
        (s32)(((s64)F(s32, vector, 4) * scale + 0x800) >> 12);
    F(s32, vector, 8) =
        (s32)(((s64)F(s32, vector, 8) * scale + 0x800) >> 12);
    F(s32, vector, 0xc) =
        (s32)(((s64)F(s32, vector, 0xc) * scale + 0x800) >> 12);
}

/* Produces a scaled copy of a three-component fixed-point vector object. */
extern "C" void func_ov095_0221a208(void *result, void *source, s32 scale)
{
    VecFx32Object_Init(result);
    F(s32, result, 4) = func_020adc90(F(s32, source, 4), scale);
    F(s32, result, 8) = func_020adc90(F(s32, source, 8), scale);
    F(s32, result, 0xc) = func_020adc90(F(s32, source, 0xc), scale);
}

/* Builds the three-vector interpolation record used by encounter movement. */
extern "C" void *func_ov095_0221a250(void *result, void *start,
                                      void *end, void *control)
{
    VecFx32Object_Init(result);
    VecFx32Object_Init(P(result, 0x10));
    VecFx32Object_Init(P(result, 0x20));
    VecFx32Triple_Set(result, start, end, control);
    return result;
}

/* Reports whether the actor has landed at its saved vertical coordinate. */
extern "C" s32 func_ov095_0221a294(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x10) == 0 &&
           F(s32, actor, 0x24) == F(s32, actor, 0x1dc);
}

/* Runs the short post-impact effect and returns through the actor state table. */
extern "C" void func_ov095_0221a2b4(void *actor)
{
    F(u32, actor, 0x260) |= 0x100b;
    s16 timer = F(s16, actor, 0x298);
    if (timer == 0)
    {
        Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 7, actor, 0, 0x200);
    }
    if (timer >= 60)
    {
        F(Method, F(void *, actor, 0), 0x200)(actor);
        return;
    }

    F(u32, actor, 0x260) |= 0x40a;
    if (timer < 45 && timer % 10 == 0)
    {
        u32 random = (u32)genrand_int32();
        void *effects = (void *)func_0201e0ec(P(data_021052fc, 0x2f7c));
        s32 width = func_ov095_02217d90(P(actor, 0x68));
        func_020a291c(effects, 1,
                      (F(s32, actor, 0x1c) >> 12) - 12 + random % 24,
                      ((F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12) -
                          (s32)((random >> 4) & 15) - width / 2);
    }
    F(s16, actor, 0x298) = timer + 1;
}

/* Dispatches the paired-actor phase selected by the persistent phase byte. */
extern "C" void func_ov095_0221a3f8(void *actor, void *context)
{
    if (F(u8, actor, 0x319) == 0)
    {
        func_ov095_0221a418(actor, context);
    }
    else
    {
        func_ov095_0221a878(actor, context);
    }
}

/* Applies a scaled external impulse unless this actor currently blocks it. */
extern "C" void func_ov095_0221abc8(void *actor, void *impulse, s32 mode)
{
    if ((F(u32, actor, 0x260) & 0x8000) == 0)
    {
        u8 scaled[16];
        s32 scale = ((F(u32, actor, 0x314) << 2) >> 24) == 0
                        ? 0x4000 : 0x1000;
        func_ov095_0221a208(scaled, impulse, scale);
        Actor_ApplyMotionImpulse(actor, scaled, mode);
        VecFx32Object_Destroy(scaled);
    }
}

/* Stops the encounter sound if active, then releases presentation resources. */
extern "C" void func_ov095_0221ac20(void *actor)
{
    if (Sound_IsEffectPlaying(gSoundContext, 0x1ee, 7) != 0)
    {
        Sound_StopEffect(gSoundContext, 0x1ee, 7);
    }
    ActorExtendedType2_PrepareRelease(actor);
}

/* Restores linked actors and effects when this encounter re-enters the field. */
extern "C" void func_ov095_0221ac6c(void *actor)
{
    ActorExtendedType2_InitializeReentryState(actor);
    if (F(s32, actor, 0x1fc) > 0)
    {
        F(Method, F(void *, actor, 0), 0x200)(actor);
        F(u32, actor, 0x314) =
            (F(u32, actor, 0x314) & 0x7fc0ffffu) | 0x80000000u;
        F(s16, actor, 0x2de) = 7;
        F(u32, actor, 0x314) =
            (F(u32, actor, 0x314) & 0xc03fffffu) | 0x0a000000u;
        F(u32, actor, 0x260) &= ~9u;
        return;
    }

    void *effects = (void *)func_0201e0ec(P(data_021052fc, 0x2f7c));
    func_020a2844(effects, 0, F(s32, actor, 0x1c) >> 12,
                  ((F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12) - 24,
                  8);
    void *primary = F(void *, data_021052fc, 0x2ea4);
    if (F(void *, primary, 0x26c) != 0)
    {
        func_0206e590(F(void *, primary, 0x26c), 1);
    }
    void *secondary = F(void *, data_021052fc, 0x2ea8);
    if (secondary != 0 && F(void *, secondary, 0x234) != 0)
    {
        func_0206e590(F(void *, secondary, 0x234), 1);
    }
    for (s32 index = 0; index < 4; ++index)
    {
        void *linked = F(void *, actor, 0x304 + index * 4);
        if (func_ov095_0221ae14(linked) == 0)
        {
            F(Method, F(void *, linked, 0), 0x100)(linked);
            func_020a2844(effects, 0, F(s32, linked, 0x1c) >> 12,
                          ((F(s32, linked, 0x20) - F(s32, linked, 0x24)) >> 12) - 24,
                          3);
        }
    }
    Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 10, actor, 0, 0x200);
}

/* Tests whether a linked actor still owns the expected recovered resource. */
extern "C" s32 func_ov095_0221ae14(void *actor)
{
    void *resource = F(void *, actor, 0x218);
    return resource == F(void *, data_ov095_0221cba8, 0x58) &&
           (F(void *, actor, 0x21c) == F(void *, data_ov095_0221cc00, 4) ||
            resource == 0);
}

/* Reports whether both actors in the second linked pair remain active. */
extern "C" s32 func_ov095_0221ae5c(void *actor)
{
    s32 active = 0;
    for (s32 index = 2; index < 4; ++index)
    {
        active += func_ov095_0221ae14(F(void *, actor, 0x304 + index * 4)) != 0;
    }
    return active == 2;
}

/* Reports whether both actors in the first linked pair remain active. */
extern "C" s32 func_ov095_0221ae9c(void *actor)
{
    s32 active = 0;
    for (s32 index = 0; index < 2; ++index)
    {
        active += func_ov095_0221ae14(F(void *, actor, 0x304 + index * 4)) != 0;
    }
    return active == 2;
}

/* Applies the encounter's cyclic vertical offset at a requested amplitude. */
extern "C" void func_ov095_0221aedc(void *actor, s32 base, s32 amplitude)
{
    u32 tableOffset = ((u16)F(s16, actor, 0x2dc) & 0x3f) << 8;
    F(s32, actor, 0x24) =
        base + amplitude * F(s16, data_020c9670, tableOffset);
}

/* Removes linked encounter objects found within the supplied world radius. */
extern "C" void func_ov095_0221af0c(void *actor, s32 x, s32 y, s32 radius)
{
    for (s32 index = 0; index < 4; ++index)
    {
        void *linked = F(void *, actor, 0x304 + index * 4);
        void *resource = F(void *, linked, 0x218);
        if ((F(u32, linked, 0xd0) & 0x100) == 0 &&
            resource == F(void *, data_ov095_0221cba8, 0x50) &&
            (F(void *, linked, 0x21c) == F(void *, data_ov095_0221cbf8, 4) ||
             resource == 0) &&
            Fx32Vector2_Magnitude(F(s32, linked, 0x1c) - x,
                          F(s32, linked, 0x20) - y) < (radius << 12))
        {
            F(Method, F(void *, linked, 0), 0x204)(linked);
        }
    }

    void *collection = (void *)GamePhaseRuntime_GetActorCollection(
        data_021052fc, 1);
    for (s32 index = 0; index < F(s32, collection, 0x2e74); ++index)
    {
        void *candidate = F(void *, collection, index * 4);
        if (candidate != 0 && F(u8, candidate, 0x4d) == 4 &&
            (F(u16, candidate, 0x4e) == 0x1d ||
             F(u16, candidate, 0x4e) == 0x15) &&
            Fx32Vector2_Magnitude(F(s32, candidate, 0x1c) - x,
                          F(s32, candidate, 0x20) - y) < (radius << 12))
        {
            ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor),
                                                 candidate);
        }
    }
}

/* Clamps a world-space vector to the encounter arena rectangle. */
extern "C" void func_ov095_0221b060(void *, void *position)
{
    if (F(s32, position, 4) < 0x150000)
        F(s32, position, 4) = 0x150000;
    else if (F(s32, position, 4) > 0x2b0000)
        F(s32, position, 4) = 0x2b0000;

    if (F(s32, position, 8) < 0x1c0000)
        F(s32, position, 8) = 0x1c0000;
    else if (F(s32, position, 8) > 0x260000)
        F(s32, position, 8) = 0x260000;
}

/* Reports the default zero result for an optional actor query. */
extern "C" s32 func_ov095_0221b0a4(void)
{
    return 0;
}

/* Initializes a vector from the position embedded in another actor. */
extern "C" void func_ov095_0221b0ac(void *result, void *actor)
{
    VecFx32Object_InitCopy(result, P(actor, 0x18));
}

/* Returns the actor's vertical-contact status bit. */
extern "C" u32 func_ov095_0221b0bc(void *actor)
{
    return F(u32, actor, 0xd0) & 0x80;
}

/* Reports whether the actor has its secondary contact bit set. */
extern "C" s32 func_ov095_0221b0c8(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Empty optional actor callback retained for its vtable slot. */
extern "C" void func_ov095_0221b0dc(void)
{
}

/* Empty optional actor callback retained for its vtable slot. */
extern "C" void func_ov095_0221b0e0(void)
{
}

/* Returns the embedded world-position object for this actor. */
extern "C" void *func_ov095_0221b0e4(void *actor)
{
    return P(actor, 0x18);
}

/* Reports the default zero result for a second optional actor query. */
extern "C" s32 func_ov095_0221b0ec(void)
{
    return 0;
}

/* Reports a completed gated state once the inherited predicate clears. */
extern "C" s32 func_ov095_0221b0f4(void *actor)
{
    u32 flags = F(u32, actor, 0x260);
    return (flags & 8) != 0 && (flags & 2) != 0 &&
           F(Method, F(void *, actor, 0), 0xa8)(actor) == 0;
}

/* Reports whether presentation mode eight is active. */
extern "C" s32 func_ov095_0221b13c(void *actor)
{
    return F(s8, actor, 0x24c) == 8;
}

/* Reports whether the primary animation is outside state sixteen. */
extern "C" s32 func_ov095_0221b150(void *actor)
{
    return F(s16, actor, 0xd6) != 0x10;
}

/* Reports whether the primary animation is in state five or six. */
extern "C" s32 func_ov095_0221b170(void *actor)
{
    s16 state = F(s16, actor, 0xd6);
    return state == 5 || state == 6;
}

/* Reports whether the secondary animation is in state nine or ten. */
extern "C" s32 func_ov095_0221b188(void *actor)
{
    s16 state = F(s16, actor, 0xd8);
    return state == 9 || state == 10;
}

/* Reports whether the primary animation is in state nine or ten. */
extern "C" s32 func_ov095_0221b1a0(void *actor)
{
    s16 state = F(s16, actor, 0xd6);
    return state == 9 || state == 10;
}

/* Supplies the actor's default horizontal fixed-point magnitude. */
extern "C" s32 func_ov095_0221b1b8(void)
{
    return 0x800;
}

/* Supplies the actor's default vertical fixed-point magnitude. */
extern "C" s32 func_ov095_0221b1c0(void)
{
    return 0x800;
}

/* Empty optional presentation callback retained for its interface slot. */
extern "C" void func_ov095_0221b1c8(void)
{
}

/* Toggles bit two on the actor's auxiliary presentation sprite. */
extern "C" void func_ov095_0221b1cc(void *actor, s32 visible)
{
    void *sprite = F(void *, actor, 0x288);
    if (visible == 0)
        F(u16, sprite, 0x24) |= 4;
    else
        F(u16, sprite, 0x24) &= (u16)~4;
}

/* Supplies the actor's fixed movement range. */
extern "C" s32 func_ov095_0221b1ec(void)
{
    return 0x20000;
}

/* Empty optional movement callback retained for its interface slot. */
extern "C" void func_ov095_0221b1f4(void)
{
}

/* Marks the actor as accepting the inherited motion behavior. */
extern "C" void func_ov095_0221b1f8(void *actor)
{
    F(u32, actor, 0x260) |= 0x80;
}

/* Launches the inherited randomized motion state. */
extern "C" void func_ov095_0221b208(void)
{
    ActorExtendedType2_LaunchRandomMotion();
}

/* Supplies the actor's initial motion speed. */
extern "C" s32 func_ov095_0221b214(void)
{
    return 0x1800;
}

/* Supplies the actor's presentation resource index. */
extern "C" s32 func_ov095_0221b21c(void)
{
    return 0x29;
}

/* Supplies the actor's initial world height. */
extern "C" s32 func_ov095_0221b224(void)
{
    return 0x1a4000;
}

/* Supplies the actor's presentation frame count. */
extern "C" s32 func_ov095_0221b22c(void)
{
    return 0x18;
}

/* Empty optional initialization callback retained for its interface slot. */
extern "C" void func_ov095_0221b234(void)
{
}

/* Empty optional teardown callback retained for its interface slot. */
extern "C" void func_ov095_0221b238(void)
{
}

/* Constructs the linked minion actor and caches its terrain height. */
extern "C" void *func_ov095_0221b23c(void *actor)
{
    ActorExtendedType2_Init(actor);
    F(void *, actor, 0) = data_ov095_0221cf4c;
    F(s16, actor, 0x298) = 0;
    F(s16, actor, 0x29a) = 0;
    VecFx32Object_Init(P(actor, 0x29c));
    F(s32, actor, 0x238) =
        Actor_QueryTerrainHeight(actor, F(s32, actor, 0x230) >> 16,
                                 F(s32, actor, 0x234) >> 16) << 16;
    F(u32, actor, 0x260) |= 0x40000;
    return actor;
}

/* Destroys the minion's owned vector and inherited actor state. */
extern "C" void *func_ov095_0221b2a0(void *actor)
{
    VecFx32Object_Destroy(P(actor, 0x29c));
    ActorExtendedType2_Destroy(actor);
    return actor;
}

/* Deletes the minion actor after releasing owned and inherited state. */
extern "C" void *func_ov095_0221b2c0(void *actor)
{
    VecFx32Object_Destroy(P(actor, 0x29c));
    ActorExtendedType2_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Snapshots transient state and clears the actor's consumed-contact bit. */
extern "C" void func_ov095_0221b2e8(void *actor)
{
    Actor_SnapshotTransientState(actor);
    F(u32, actor, 0xd0) &= ~4u;
}

/* Tracks whether the actor occupies terrain class one at its current tile. */
extern "C" void func_ov095_0221b304(void *actor)
{
    Actor_UpdatePrimaryRenderAttachmentPriority(actor);
    void *terrain = F(void *, data_021052fc, 0x2ed4);
    Method query = F(Method, F(void *, terrain, 0), 0x2c);
    s32 tile = query(terrain, F(s32, actor, 0x1c) >> 16,
                     F(s32, actor, 0x20) >> 16);
    u16 previous = F(u16, actor, 0x298);
    F(u16, actor, 0x298) = ((tile >> 10) & 15) == 1;
    if (previous != F(u16, actor, 0x298))
    {
        F(u32, actor, 0xd0) |= 0x1000;
    }
}

/* Tests whether this minion owns the alternate linked resource pair. */
extern "C" s32 func_ov095_0221b6d8(void *actor)
{
    void *resource = F(void *, actor, 0x218);
    return resource == F(void *, data_ov095_0221cec0, 0x28) &&
           (F(void *, actor, 0x21c) == F(void *, data_ov095_0221cee8, 4) ||
            resource == 0);
}

/* Initializes a minion hop toward its parent and selects its sound variant. */
extern "C" void func_ov095_0221b720(void *actor)
{
    s16 alternate = F(s16, actor, 0x298);
    F(s16, actor, 0xae) = alternate == 0 ? 0x23 : 0x28;
    F(s16, actor, 0x29a) = F(s16, actor, 0xae);
    F(s16, actor, 0xac) = 2;
    if (alternate == 0)
    {
        F(s16, actor, 0xda) = 0;
    }
    else
    {
        F(s16, actor, 0xda) = 1;
        Actor_SetDirectionFromVector(actor, 0, 0x1000);
        func_ov095_0221bed0(actor);
    }
    VecFx32Object_Assign(P(actor, 0x29c), P(actor, 0x18));
}

/* Re-enters a minion, resets its state, and restores its saved target. */
extern "C" void func_ov095_0221b798(void *actor, void *target)
{
    ActorExtendedType2_InitializeReentryState(actor);
    F(Method, F(void *, actor, 0), 0x40)(actor);
    VecFx32Object_Assign(P(actor, 0x29c), target);
}

/* Runs the inherited attachment gate and resets presentation mode if linked. */
extern "C" void func_ov095_0221bbcc(void *actor)
{
    ActorExtendedType2_TryCompleteAttachmentGate(actor);
    if (F(s16, actor, 0x298) != 0)
    {
        F(u8, actor, 0x24c) = 0;
    }
}

/* Evaluates minion collision gates and selects its next resource target. */
extern "C" s32 func_ov095_0221bbf0(void *actor, void *context)
{
    func_ov095_0221bf8c(actor);
    void *vtable = F(void *, actor, 0);
    if (F(Method, vtable, 0x38)(actor) != 0 ||
        F(Method, vtable, 0x134)(actor, context) != 0)
    {
        return 0;
    }
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~1u) | 2;
    if ((F(u16, context, 0x1a) & 2) != 0)
    {
        F(void *, actor, 0x218) = F(void *, data_ov095_0221cec0, 0x38);
        F(void *, actor, 0x21c) = F(void *, data_ov095_0221cec0, 0x3c);
        return 0;
    }
    if (F(Method, vtable, 0x11c)(actor, context) != 0 ||
        F(Method, vtable, 0x124)(actor, context) != 0 ||
        F(Method, vtable, 0x12c)(actor, context) != 0 ||
        F(Method, vtable, 0x130)(actor, context) != 0)
    {
        return 0;
    }
    s32 dx = (F(s32, actor, 0x1c) - F(s32, actor, 0x230)) >> 12;
    s32 dy = (F(s32, actor, 0x20) - F(s32, actor, 0x234)) >> 12;
    if (dx * dx + dy * dy < 0x24)
    {
        F(void *, actor, 0x218) = F(void *, data_ov095_0221cec0, 0x20);
        F(void *, actor, 0x21c) = F(void *, data_ov095_0221cec0, 0x24);
        F(void *, actor, 0x220) = F(void *, data_ov095_0221cec0, 0x18);
        F(void *, actor, 0x224) = F(void *, data_ov095_0221cec0, 0x1c);
    }
    else
    {
        F(Method, vtable, 0xd0)(actor, P(actor, 0x22c));
    }
    return 0;
}

/* Redirects transition dispatch when proximity steering has taken control. */
extern "C" s32 func_ov095_0221bd68(void *actor, void *context)
{
    if (func_ov095_0221bf8c(actor) != 0)
    {
        F(Method, F(void *, actor, 0), 0xe8)(actor);
        return 0;
    }
    return ActorExtendedType2_DispatchTransitionCallback(actor, context);
}

/* Chooses and approaches a randomized patrol target around the spawn point. */
extern "C" s32 func_ov095_0221bda4(void *actor)
{
    s16 timer = F(s16, actor, 0x25a);
    if (timer == 0)
    {
        F(s16, actor, 0x258) = (s16)((u32)genrand_int32() % 120 + 120);
        F(s32, actor, 0x7c) = F(s32, actor, 0x230) +
            ((s32)((u32)genrand_int32() % 96) - 48) * 0x1000;
        F(s32, actor, 0x80) = F(s32, actor, 0x234) +
            ((s32)((u32)genrand_int32() & 15) - 8) * 0x1000;
    }
    else if (timer < (s32)F(u16, actor, 0x258))
    {
        s32 dx = (F(s32, actor, 0x1c) - F(s32, actor, 0x7c)) >> 12;
        s32 dy = (F(s32, actor, 0x20) - F(s32, actor, 0x80)) >> 12;
        if (dx * dx + dy * dy <= 4)
        {
            F(void *, actor, 0x220) = F(void *, data_ov095_0221cec0, 0);
            F(void *, actor, 0x224) = F(void *, data_ov095_0221cec0, 4);
        }
        else
        {
            F(Method, F(void *, actor, 0), 0xd0)(actor, P(actor, 0x78));
        }
        if (F(s16, actor, 0x298) != 0)
        {
            F(s32, actor, 0x3c) /= 2;
            F(s32, actor, 0x40) /= 2;
        }
    }
    else
    {
        F(void *, actor, 0x220) = F(void *, data_ov095_0221cec0, 8);
        F(void *, actor, 0x224) = F(void *, data_ov095_0221cec0, 0xc);
    }
    F(s16, actor, 0x25a) = timer + 1;
    return 0;
}

/* Emits the descriptor- and resource-specific minion voice cue. */
extern "C" void func_ov095_0221bed0(void *actor)
{
    s32 linked = func_ov095_0221b6d8(actor) != 0;
    s32 descriptor = ActorExtendedType2_GetDescriptorValue25(actor);
    static const u32 soundIds[3][2] = {
        {0xa303, 0xa302}, {0xe182, 0xe183}, {0xf502, 0xf503}
    };
    if (descriptor < 0 || descriptor > 2)
    {
        descriptor = 2;
    }
    u32 sound = soundIds[descriptor][linked];
    if (sound != 0)
    {
        Sound_PlayOwnedEffect(gSoundContext, (s32)sound >> 7,
                      sound & 0x7f, actor, 0, 0x100);
    }
}

/* Redirects an idle minion toward its spawn point when it strays nearby. */
extern "C" s32 func_ov095_0221bf8c(void *actor)
{
    if (F(u16, actor, 0x298) != 0 || F(s16, actor, 0xac) != 0xff)
    {
        return 0;
    }
    s32 dx = F(s32, actor, 0x230) - F(s32, actor, 0x1c);
    s32 dy = F(s32, actor, 0x20) - F(s32, actor, 0x234);
    s32 distance = Fx32Vector2_Magnitude(dx, dy);
    if (F(u16, actor, 0x204) == 0 &&
        (distance <= 0x10000 || distance >= 0x60000 ||
         dy >= 0x50000 || dy <= -0x30000))
    {
        return 0;
    }
    VecFx32Object_Assign(P(actor, 0xb0), P(actor, 0x22c));
    F(Method, F(void *, actor, 0), 0x3c)(actor, 0);
    Actor_SetDirectionFromVector(actor, dx, -dy);
    return 1;
}

/* Reports the default zero result for an optional minion query. */
extern "C" s32 func_ov095_0221c054(void)
{
    return 0;
}

/* Supplies the minion's default collision extent. */
extern "C" s32 func_ov095_0221c05c(void)
{
    return 0x10;
}

/* Supplies the minion's maximum roaming distance. */
extern "C" s32 func_ov095_0221c064(void)
{
    return 0xc0000;
}

/* Forwards an interaction with the optional mode forced to zero. */
extern "C" void func_ov095_0221c06c(void *actor, void *target)
{
    F(Method, F(void *, actor, 0), 0x108)(actor, target, 0);
}

/* Forwards a second interaction with the optional mode forced to zero. */
extern "C" void func_ov095_0221c084(void *actor, void *target)
{
    F(Method, F(void *, actor, 0), 0x108)(actor, target, 0);
}

/* Marks an interaction as consumed by this actor. */
extern "C" void func_ov095_0221c09c(void *actor)
{
    F(u32, actor, 0x260) |= 0x10;
}

/* Empty optional interaction callback retained for its interface slot. */
extern "C" void func_ov095_0221c0ac(void)
{
}

/* Constructs the tracked collision impulse actor. */
extern "C" void *func_ov095_0221c0b0(void *actor)
{
    TrackedResourceActorImpulse_InitBase(actor);
    F(void *, actor, 0) = data_ov095_0221d1a4;
    F(u8, actor, 0x200) = 0;
    F(u8, actor, 0x201) = 0;
    F(u16, actor, 0x202) = 0;
    return actor;
}

/* Releases the collision impulse actor and stops its descriptor sound. */
extern "C" void *func_ov095_0221c0e4(void *actor)
{
    F(void *, actor, 0) = data_ov095_0221d1a4;
    u32 sound = F(u16, F(void *, actor, 0x1fc), 0x1e);
    if (sound != 0)
    {
        Sound_StopEffect(gSoundContext, (s32)sound >> 7, sound & 0x7f);
    }
    TrackedResourceActorImpulse_Destroy(actor);
    return actor;
}

/* Deletes the collision impulse actor after its normal release path. */
extern "C" void *func_ov095_0221c130(void *actor)
{
    F(void *, actor, 0) = data_ov095_0221d1a4;
    u32 sound = F(u16, F(void *, actor, 0x1fc), 0x1e);
    if (sound != 0)
    {
        Sound_StopEffect(gSoundContext, (s32)sound >> 7, sound & 0x7f);
    }
    TrackedResourceActorImpulse_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Starts the descriptor-selected sound attached to this impulse actor. */
extern "C" void func_ov095_0221c184(void *actor)
{
    u32 sound = F(u16, F(void *, actor, 0x1fc), 0x1e);
    if (sound != 0)
    {
        Sound_PlayOwnedEffect(gSoundContext, (s32)sound >> 7,
                      sound & 0x7f, actor, 0, 0x100);
    }
}

/* Updates collision animation and periodically emits its auxiliary sprite. */
extern "C" void func_ov095_0221c1d0(void *actor)
{
    void *sprite = F(void *, actor, 0x54);
    u32 animation;
    if ((F(u16, actor, 0x1f0) & 0x7fff) == 0)
    {
        animation = 10;
        F(u16, sprite, 0x24) &= (u16)~2;
    }
    else
    {
        animation = Actor_TurnTowardVector(actor, F(s32, actor, 0x3c),
                                  F(s32, actor, 0x40), 0x800);
        if (F(u8, actor, 0x200) != 0)
        {
            F(s32, actor, 0x3c) = 0;
            F(s32, actor, 0x40) = 0;
            --F(u8, actor, 0x200);
        }
        if (F(s16, actor, 0x202) != 0)
        {
            animation += 11;
        }
        F(u16, sprite, 0x24) |= 2;
    }
    if (animation != F(u8, sprite, 0x38))
    {
        GraphicsSpriteState_SetAnimationIndex(sprite, animation & 0xff);
        F(u16, sprite, 0x24) &= (u16)~1;
    }
    if (F(s16, actor, 0x202) != 0)
    {
        if (F(u8, actor, 0x201) == 0)
        {
            void *effect = (void *)Heap_Alloc(0x14, data_ov095_0221d288,
                                              4, gHeapContext);
            if (effect != 0)
            {
                AuxiliaryTimedSpritePresentation_Init(
                    effect, P(actor, 0x18), F(void *, sprite, 0),
                    0x162b, 0x162c, 0x162d, 0, 12, -1, 1);
            }
        }
        if (++F(u8, actor, 0x201) > 30)
        {
            F(u8, actor, 0x201) = 0;
        }
    }
}

/* Queues removal and effects through the inherited impulse boundary. */
extern "C" void func_ov095_0221c338(void)
{
    TrackedResourceActorImpulse_QueueRemovalAndEmitEffects();
}

/* Installs an impulse descriptor and enters its active presentation state. */
extern "C" void func_ov095_0221c344(void *actor, void *descriptor)
{
    F(void *, actor, 0x1fc) = descriptor;
    func_ov095_02218404(P(actor, 0x38), 0, 0, 0);
    F(u32, actor, 0x14) |= 0x800000;
    F(u32, actor, 0xd0) |= 0x2000;
    F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000u) | 8;
    F(Method, F(void *, actor, 0), 0xd8)(actor);
}

/* Runs the inherited tracked-impulse frame update. */
extern "C" void func_ov095_0221c3a0(void)
{
    TrackedResourceActorImpulse_Update();
}

/* Accelerates the impulse actor toward the primary linked actor. */
extern "C" void func_ov095_0221c3ac(void *actor)
{
    if (F(s32, actor, 0x1dc) < F(s32, actor, 0x24))
    {
        return;
    }
    void *target = F(void *, data_021052fc, 0x2ea4);
    s32 dx = F(s32, target, 0x1c) - F(s32, actor, 0x1c);
    s32 dy = F(s32, target, 0x20) - F(s32, actor, 0x20);
    s32 distance = Fx32Vector2_Magnitude(dx, dy);
    if (F(s16, actor, 0x202) == 0 && F(void *, target, 0x278) != 0)
    {
        F(s16, actor, 0x202) = 1;
        F(u8, actor, 0x200) = 20;
        F(u8, actor, 0x201) = 0;
    }
    if (distance > 0x1000)
    {
        s32 speed = F(s16, actor, 0x202) == 0 ? 0x1000 : 0x1800;
        F(s32, actor, 0x3c) = func_020adc90(
            (s32)(((s64)dx * speed + 0x800) >> 12), distance);
        F(s32, actor, 0x40) = func_020adc90(
            (s32)(((s64)dy * speed + 0x800) >> 12), distance);
    }
}

/* Resolves a collision impulse, emits feedback, and queues actor removal. */
extern "C" void func_ov095_0221c4a4(void *actor, void *target)
{
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(
            gActorRuntimeCollection) == 0 && target != 0)
    {
        if (F(u8, target, 0x4d) == 1)
        {
            TrackedResourceActor_DispatchTargetInteraction(actor, target);
        }
        else
        {
            s32 dx = F(s32, target, 0x1c) - F(s32, actor, 0x1c);
            s32 dy = F(s32, target, 0x20) - F(s32, actor, 0x20);
            s32 distance = Fx32Vector2_Magnitude(dx, dy);
            if (distance > 0x1000)
            {
                dx = func_020adc90(dx, distance);
                dy = func_020adc90(dy, distance);
                s32 force = F(u8, target, 0x4d) == 7 ? 3 : 1;
                F(s32, actor, 0x8c) -= dx * force;
                F(s32, actor, 0x90) -= dy * force;
                F(s32, target, 0x8c) += dx * (force == 3 ? 2 : 1);
                F(s32, target, 0x90) += dy * (force == 3 ? 2 : 1);
                if (force == 3)
                    F(u8, actor, 0x200) = 10;
            }
            u8 direction[16];
            u8 scaled[16];
            func_ov095_02217d58(direction, P(actor, 0x18), P(target, 0x18));
            func_ov095_0221a208(scaled, direction, 0x2000);
            VecFx32Object_Destroy(direction);
            void *effects = (void *)func_0201e0ec(P(data_021052fc, 0x2f7c));
            EffectManager_SubmitPointEffect(
                effects, 0, F(s32, scaled, 4) >> 12,
                ((F(s32, scaled, 8) - F(s32, scaled, 0xc)) >> 12) - 28, 0);
            void *descriptor = F(void *, actor, 0x1fc);
            if (F(u16, descriptor, 0x1c) != 0)
            {
                Actor_PlayHorizontalSpatialSound(actor, F(u16, descriptor, 0x1c), 0);
            }
            VecFx32Object_Destroy(scaled);
        }
    }
    F(Method, F(void *, actor, 0), 0xc8)(actor);
    F(u32, actor, 0x14) &= ~0x800000u;
    ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
}

/* Marks the impulse record as active. */
extern "C" void func_ov095_0221c690(void *actor)
{
    F(u32, actor, 0x1f4) = (F(u32, actor, 0x1f4) & ~1u) | 1;
}

/* Processes the type-seven trigger and posts the inherited update. */
extern "C" void func_ov095_0221c6a4(void *actor, void *context)
{
    Type7Actor_ProcessGlobalInteractionTrigger(actor, context);
    TrackedResourceActor_PostUpdate(actor, context);
}

/* Empty optional impulse callback retained for its interface slot. */
extern "C" void func_ov095_0221c6c4(void)
{
}

/* Empty optional impulse callback retained for its interface slot. */
extern "C" void func_ov095_0221c6c8(void)
{
}

/* Marks inherited contact on the impulse actor. */
extern "C" void func_ov095_0221c6cc(void *actor)
{
    F(u32, actor, 0xd0) |= 0x80;
}

/* Reports the default zero result for an optional impulse query. */
extern "C" s32 func_ov095_0221c6dc(void)
{
    return 0;
}

/* Reports the default zero result for a second impulse query. */
extern "C" s32 func_ov095_0221c6e4(void)
{
    return 0;
}

/* Reports the default zero result for a third impulse query. */
extern "C" s32 func_ov095_0221c6ec(void)
{
    return 0;
}

/* Reports the default zero result for a fourth impulse query. */
extern "C" s32 func_ov095_0221c6f4(void)
{
    return 0;
}

/* Empty optional impulse callback retained for its interface slot. */
extern "C" void func_ov095_0221c6fc(void)
{
}

/* Reports whether this impulse actor still has a tracked resource. */
extern "C" s32 func_ov095_0221c700(void *actor)
{
    return (F(u16, actor, 0x1f0) & 0x7fff) != 0;
}

/* Supplies the impulse actor's fixed world-space range. */
extern "C" s32 func_ov095_0221c71c(void)
{
    return 0x100000;
}

/* Constructs the second tracked collision impulse actor. */
extern "C" void *func_ov095_0221c724(void *actor)
{
    TrackedResourceActorImpulse_InitBase(actor);
    F(void *, actor, 0) = data_ov095_0221d2e8;
    F(u8, actor, 0x201) = 0;
    return actor;
}

/* Releases the second tracked collision impulse actor. */
extern "C" void *func_ov095_0221c74c(void *actor)
{
    TrackedResourceActorImpulse_Destroy(actor);
    return actor;
}

/* Deletes the second impulse actor after its normal release path. */
extern "C" void *func_ov095_0221c760(void *actor)
{
    TrackedResourceActorImpulse_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Loads impulse state from its record and installs collision bounds. */
extern "C" void func_ov095_0221c77c(void *actor)
{
    TrackedResourceActorImpulse_SetupFromRecord(actor);
    Actor_TurnTowardVector(actor, F(s32, actor, 0x3c), F(s32, actor, 0x40), 0x8000);
    F(u32, actor, 0x10) |= 0x1f0000;
    F(u32, actor, 0xd0) &= ~0x2000u;
    F(u16, actor, 0x60) = 0xfff0;
    F(u16, actor, 0x62) = 0xffe8;
    F(u16, actor, 0x64) = 0x10;
    F(u16, actor, 0x66) = 0x10;
}

/* Holds the impact animation and periodically emits its configured sprite. */
extern "C" void func_ov095_0221c7d4(void *actor)
{
    void *sprite = F(void *, actor, 0x54);
    F(u16, sprite, 0x24) |= 2;
    if (F(u8, sprite, 0x38) != 0)
    {
        GraphicsSpriteState_SetAnimationIndex(sprite, 0);
        F(u16, sprite, 0x24) &= (u16)~1;
    }
    if (F(u8, actor, 0x201) == 0)
    {
        void *effect = (void *)Heap_Alloc(0x14, data_ov095_0221d3cc,
                                          4, gHeapContext);
        if (effect != 0)
        {
            void *record = F(void *, actor, 0x1ec);
            AuxiliaryTimedSpritePresentation_Init(
                effect, P(actor, 0x18), F(void *, sprite, 0),
                F(void *, F(void *, record, 4), 0x10),
                F(void *, F(void *, record, 8), 0x10),
                F(void *, F(void *, record, 0xc), 0x10), 1, 12, -1, 1);
        }
        Actor_PlayHorizontalSpatialSound(actor, 10, -0x200);
    }
    if (++F(u8, actor, 0x201) > 20)
    {
        F(u8, actor, 0x201) = 0;
    }
}

/* Queues removal and effects through the inherited impulse boundary. */
extern "C" void func_ov095_0221c8d0(void)
{
    TrackedResourceActorImpulse_QueueRemovalAndEmitEffects();
}

/* Runs the inherited tracked-impulse frame update. */
extern "C" void func_ov095_0221c8dc(void)
{
    TrackedResourceActorImpulse_Update();
}

/* Drives the second impulse toward the primary actor along its facing angle. */
extern "C" void func_ov095_0221c8e8(void *actor)
{
    F(u32, actor, 0x10) &= ~0xb0000u;
    F(u16, actor, 0x1f8) = 30;
    if (F(s32, actor, 0x1dc) < F(s32, actor, 0x24))
    {
        return;
    }
    void *target = F(void *, data_021052fc, 0x2ea4);
    s32 dx = F(s32, target, 0x1c) - F(s32, actor, 0x1c);
    s32 dy = F(s32, target, 0x20) - F(s32, actor, 0x20);
    if (Fx32Vector2_Magnitude(dx, dy) <= 0x1000)
    {
        return;
    }
    Actor_TurnTowardVector(actor, dx, dy, 0x80);
    u32 angle = (u16)F(u32, actor, 0xc8) >> 4;
    s32 xDirection = F(s16, data_020c9670, angle * 4);
    s32 yDirection = F(s16, data_020c9670, angle * 4 + 2);
    F(s32, actor, 0x3c) =
        (s32)(((s64)xDirection * -0x119a + 0x800) >> 12);
    F(s32, actor, 0x40) =
        (s32)(((s64)yDirection * 0x119a + 0x800) >> 12);
}

/* Resolves valid collision targets or cancels this impulse interaction. */
extern "C" void func_ov095_0221ca14(void *actor, void *target)
{
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(
            gActorRuntimeCollection) == 0 && target != 0 &&
        (F(u8, target, 0x4d) == 1 || F(u8, target, 0x4d) == 7 ||
         F(u8, target, 0x4d) == 2 ||
         (F(u8, target, 0x4d) == 3 && F(u16, target, 0x4e) == 5)))
    {
        TrackedResourceActor_EmitRecordEffects(actor);
        TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect(actor);
        F(Method, F(void *, actor, 0), 0xdc)(actor);
        return;
    }
    F(Method, F(void *, actor, 0), 0xc8)(actor);
    F(u32, actor, 0x14) &= ~0x800000u;
}

/* Marks the second impulse record as active. */
extern "C" void func_ov095_0221cae0(void *actor)
{
    F(u32, actor, 0x1f4) = (F(u32, actor, 0x1f4) & ~1u) | 1;
}

/* Processes the type-seven trigger and posts the inherited update. */
extern "C" void func_ov095_0221caf4(void *actor, void *context)
{
    Type7Actor_ProcessGlobalInteractionTrigger(actor, context);
    TrackedResourceActor_PostUpdate(actor, context);
}

/* Reports whether this impulse holds resource index two. */
extern "C" s32 func_ov095_0221cb14(void *actor)
{
    return (F(u16, actor, 0x1f0) & 0x7fff) == 2;
}

static void ReplaceMinionResources(void *actor, void *resources)
{
    GraphicsSpriteGroup_ReplaceStateResources(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)),
        F(void *, actor, 0x54), F(void *, resources, 4),
        F(void *, resources, 8), F(void *, resources, 0xc));
}

/* Selects the minion's resources, animation, playback flags, and scale. */
extern "C" void func_ov095_0221b38c(void *actor)
{
    void *sprite = F(void *, actor, 0x54);
    s16 overlayState = F(s16, actor, 0xda);
    if (overlayState == 1 || overlayState == 3)
    {
        ReplaceMinionResources(actor, F(void *, actor, 0x20c));
        GraphicsSpriteState_SetAnimationIndex(
            sprite, overlayState == 1 ? 0x14 : 0x15);
        F(u16, sprite, 0x24) &= (u16)~3;
        F(u16, sprite, 0x36) = 0x100;
        return;
    }
    if (overlayState == 2)
    {
        ReplaceMinionResources(actor,
            F(void *, actor, func_ov095_0221b6d8(actor) ? 0x20c : 0x208));
        GraphicsSpriteState_SetAnimationIndex(sprite, F(u8, actor, 0xd4));
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) | 2) & (u16)~1;
        F(u16, sprite, 0x36) = 0x100;
        return;
    }

    u32 resourceIndex = 0;
    u16 animation = 0;
    u16 scale = 0x100;
    s32 singleFrame = 0;
    s16 state = F(s16, actor, 0xd6);
    switch (state)
    {
    case 1:
        resourceIndex = F(u16, actor, 0x298) != 0;
        if (resourceIndex == 0)
        {
            scale = 0;
            singleFrame = 1;
        }
        animation = F(u8, actor, 0xd4) + 8;
        break;
    case 2: case 3: case 4:
        resourceIndex = F(u16, actor, 0x298) != 0;
        animation = F(u8, actor, 0xd4) + 8;
        break;
    case 5: case 6: case 7:
        resourceIndex = F(u16, actor, 0x298) != 0;
        animation = resourceIndex != 0 ? F(u8, actor, 0xd4) + 8
                                       : F(u8, actor, 0xd4);
        break;
    case 8: case 9:
        animation = F(u8, actor, 0xd4);
        break;
    case 11:
        resourceIndex = F(u16, actor, 0x298) != 0;
        animation = resourceIndex != 0 ? 8 : 0x12;
        break;
    case 13:
        animation = F(u8, actor, 0xd4) + 0x16;
        singleFrame = 1;
        break;
    case 17:
        if (data_020e6b74[F(u16, actor, 0x4e)] != 0)
        {
            animation = 0x15;
            singleFrame = 1;
        }
        break;
    case 18:
        animation = 0x10;
        singleFrame = 1;
        break;
    case 19:
        if (data_020e6adc[F(u16, actor, 0x4e)] != 0)
        {
            animation = 0x14;
            singleFrame = 1;
        }
        else
        {
            animation = F(u8, actor, 0xd4) + 8;
        }
        break;
    case 22:
        animation = 0x11;
        break;
    }

    ReplaceMinionResources(actor, F(void *, actor, 0x208 + resourceIndex * 4));
    GraphicsSpriteState_SetAnimationIndex(sprite, animation & 0xff);
    F(u16, sprite, 0x36) = scale;
    F(u16, sprite, 0x30) = 0;
    if (singleFrame != 0)
    {
        F(u16, sprite, 0x24) &= (u16)~3;
    }
    else
    {
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & (u16)~1) | 2;
    }
}

/* Updates minion pursuit, terrain targeting, landing state, and base motion. */
extern "C" void func_ov095_0221ba38(void *actor)
{
    if ((F(u32, actor, 0x14) & 0x200000) != 0)
    {
        return;
    }
    s32 canPursue = func_ov095_0221b6d8(actor) != 0;
    if (!canPursue)
    {
        void *resource = F(void *, actor, 0x218);
        canPursue = resource == F(void *, data_ov095_0221cec0, 0x10) &&
            (F(void *, actor, 0x21c) == F(void *, data_ov095_0221ced0, 4) ||
             resource == 0);
    }
    void *target = F(void *, actor, 0x228);
    if (canPursue && target != 0 && F(u16, actor, 0x298) != 0 &&
        F(s16, actor, 0xac) == 0xff)
    {
        VecFx32Object_Assign(P(actor, 0xb0), P(target, 0x22c));
        s32 dx = F(s32, actor, 0x1c) - F(s32, target, 0x1c);
        if (dx > 0x10000)
            F(s32, actor, 0xb4) -= 0x10000;
        else if (dx < -0x10000)
            F(s32, actor, 0xb4) += 0x10000;

        s32 verticalStep = F(s32, actor, 0xb4) < F(s32, target, 0x20)
                               ? 0x50000 : 0x30000;
        if (F(s32, target, 0x20) <= F(s32, actor, 0xb4))
            verticalStep = -verticalStep;
        F(s32, actor, 0xb8) += verticalStep;
        F(s32, actor, 0xbc) = Actor_QueryTerrainHeight(
            actor, F(s32, actor, 0xb4) >> 16,
            F(s32, actor, 0xb8) >> 16) << 16;
        F(Method, F(void *, actor, 0), 0x3c)(actor, 0);
    }

    if (F(s16, actor, 0x298) != 0 &&
        F(s32, actor, 0x24) == Actor_GetCachedTerrainHeight(actor))
        F(u32, actor, 0xd0) |= 0x80000;
    else
        F(u32, actor, 0xd0) &= ~0x80000u;
    ActorExtendedType2_UpdateFrame(actor);
}

/* Advances the minion along its curved hop and completes the transition. */
extern "C" s32 func_ov095_0221b7c8(void *actor)
{
    if (F(s16, actor, 0xac) == 0xff)
    {
        F(s16, actor, 0xda) = 0;
        return 0;
    }
    s16 state = F(s16, actor, 0xda);
    if ((state == 1 || state == 3) &&
        (F(u16, F(void *, actor, 0x54), 0x24) & 1) == 0)
    {
        return 1;
    }
    if (F(s16, actor, 0xae) <= 0)
    {
        if (F(u16, actor, 0x298) != 0)
        {
            if (state != 3)
            {
                F(s16, actor, 0xda) = 3;
                return 1;
            }
            F(s16, actor, 0x254) = 0;
            func_ov095_0221bed0(actor);
        }
        else
        {
            VecFx32Object_Assign(P(actor, 0x23c), P(actor, 0x18));
        }
        F(Method, F(void *, actor, 0), 0x40)(actor);
        F(u32, actor, 0x260) &= ~0x20u;
        VecFx32Object_Assign(P(actor, 0x18), P(actor, 0xb0));
        F(s16, actor, 0xda) = 0;
        return 2;
    }

    --F(s16, actor, 0xae);
    u8 control[16];
    VecFx32Object_Init(control);
    F(s32, control, 4) = F(s32, actor, 0x2a0) +
        (F(s32, actor, 0xb4) - F(s32, actor, 0x2a0)) / 2;
    if (func_ov095_0221b6d8(actor) != 0)
    {
        F(s32, control, 8) = F(s32, actor, 0x2a4);
        F(s32, control, 0xc) = F(s32, actor, 0x2a8) + 0x50000;
        if (F(s16, actor, 0xae) > 26 && (F(s16, actor, 0xae) & 1) == 0)
        {
            void *effects = (void *)func_0201e0ec(P(data_021052fc, 0x2f7c));
            func_020a2960(effects, 0, F(s32, actor, 0x1c) >> 12,
                          ((F(s32, actor, 0x20) - F(s32, actor, 0x24)) >> 12) - 32,
                          0x7fff);
        }
    }
    else
    {
        F(s32, control, 8) = F(s32, actor, 0x2a4) +
            (F(s32, actor, 0xb8) - F(s32, actor, 0x2a4)) / 2;
        F(s32, control, 0xc) = F(s32, actor, 0x2a8) + 0x30000;
    }

    u8 curve[48];
    u8 result[16];
    VecFx32Object_Init(curve);
    VecFx32Object_Init(P(curve, 0x10));
    VecFx32Object_Init(P(curve, 0x20));
    VecFx32Triple_Set(curve, P(actor, 0x29c), P(actor, 0xb0), control);
    s32 duration = F(u16, actor, 0x29a);
    s32 progress = ((duration - F(s16, actor, 0xae)) << 12) / duration;
    VecFx32Bezier_Evaluate3D(result, curve, progress);
    VecFx32Object_Assign(P(actor, 0x18), result);
    VecFx32Object_Destroy(result);
    F(s16, actor, 0xda) = 2;
    if (F(void *, actor, 0x228) != 0)
    {
        F(u32, actor, 0x260) |= 0x20;
    }
    VecFx32Triple_Destroy(curve);
    VecFx32Object_Destroy(control);
    return 1;
}

/* Chooses the primary encounter form from linked actors and nearby targets. */
extern "C" void func_ov095_0221a878(void *actor, void *context)
{
    F(u32, actor, 0x260) |= 0x1000;
    if (func_ov095_0221ae5c(actor) == 0 &&
        func_ov095_0221ae9c(actor) == 0)
    {
        F(u8, actor, 0x319) = 0;
        F(s16, actor, 0x2dc) = 0;
        F(s16, actor, 0xda) = 0x14;
        Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 9, actor, 0, 0x200);
        return;
    }
    func_ov078_02213c3c(actor, context);
    if (F(s16, actor, 0xac) != 0xff)
    {
        return;
    }
    F(u32, actor, 0x260) =
        (F(u32, actor, 0x260) | 1u) & 0xfffffbf5u;
    F(u8, actor, 0x24c) = 3;

    u32 flags = F(u32, actor, 0x314);
    u32 cooldown = (flags >> 22) & 0xff;
    if (cooldown != 0)
    {
        F(u32, actor, 0x314) =
            (flags & 0xc03fffffu) | ((cooldown - 1) << 22);
        F(u32, actor, 0x260) &= ~1u;
        return;
    }
    u32 cycle = (flags >> 16) & 0x3f;
    if (cycle != 0)
    {
        func_ov095_02218130(actor, 2);
        F(u32, actor, 0x314) &= ~0x3f0000u;
        return;
    }
    if (F(s16, actor, 0x2de) == 3 || ++F(s16, actor, 0x298) > 300)
    {
        func_ov095_02218130(actor, 4);
        F(u32, actor, 0x314) =
            (F(u32, actor, 0x314) & ~0x3f0000u) | ((cycle + 1) << 16);
        return;
    }
    if (F(s16, actor, 0x2de) == 7)
    {
        if ((F(u32, actor, 0x314) & 0x80000000u) == 0)
        {
            func_ov095_02218130(actor, 2);
            F(u32, actor, 0x314) |= 0x80000000u;
        }
        else
        {
            F(u32, actor, 0x314) &= ~0x80000000u;
            if (func_ov095_0221ae5c(actor) != 0)
            {
                F(u8, actor, 0x318) = 0;
                func_ov095_02218130(actor, 3);
            }
            else if (func_ov095_0221ae9c(actor) != 0)
            {
                F(u8, actor, 0x318) = 1;
                func_ov095_02218130(actor, 3);
            }
            else
            {
                func_ov095_02218130(actor, 2);
            }
        }
        return;
    }
    if (func_ov095_0221a294(actor) == 0)
    {
        return;
    }

    u8 difference[16];
    VecFx32Object_Init(difference);
    s32 primaryDistance = 0x7fffffff;
    if ((F(u16, context, 0x1a) & 0x10) == 0)
    {
        u8 value[16];
        func_ov095_02218414(value, P(actor, 0x18),
                            P(F(void *, data_021052fc, 0x2ea4), 0x18));
        VecFx32Object_Assign(difference, value);
        VecFx32Object_Destroy(value);
        primaryDistance = VecFx32Object_GetMagnitude(difference);
    }
    s32 secondaryDistance = 0x7fffffff;
    void *secondary = F(void *, data_021052fc, 0x2ea8);
    if ((F(u16, context, 0x1a) & 0x20) != 0 && secondary != 0 &&
        (F(u32, secondary, 0x268) & 0x10) != 0)
    {
        u8 value[16];
        func_ov095_02218414(value, P(actor, 0x18), P(secondary, 0x18));
        VecFx32Object_Assign(difference, value);
        VecFx32Object_Destroy(value);
        secondaryDistance = VecFx32Object_GetMagnitude(difference) + 0x18000;
    }
    if ((primaryDistance < 0x3c000 &&
         primaryDistance <= secondaryDistance &&
         primaryDistance != 0x7fffffff) ||
        (secondaryDistance < 0x3c000 && secondaryDistance != 0x7fffffff))
    {
        func_ov095_02218130(actor, 0);
    }
    VecFx32Object_Destroy(difference);
}

/* Runs the encounter's paired-actor finale and transition presentation. */
extern "C" void func_ov095_0221a418(void *actor, void *)
{
    if (F(s16, actor, 0x298) == 0 && F(s16, actor, 0xda) == 0x14)
    {
        F(u32, actor, 0x14) |= 0x02000040;
        F(s16, actor, 0x2d6) = 0;
        VecFx32Object_Assign(P(actor, 0x2e0), P(actor, 0x18));
        VecFx32Object_Assign(P(actor, 0x2f0),
                             P(F(void *, actor, 0x300), 0x18));
        F(s32, actor, 0x2fc) += 0x10000;
        F(s32, actor, 0x2f8) += 0x14000;
        s32 distance = Fx32Vector2_Magnitude(
            F(s32, actor, 0x2e4) - F(s32, actor, 0x2f4),
            F(s32, actor, 0x2e8) - F(s32, actor, 0x2f8));
        s32 duration = (distance / 6 >> 12) + 90;
        F(u32, actor, 0x314) =
            (F(u32, actor, 0x314) & 0xffff0003u) | (duration << 2);
        F(u32, actor, 0x14) |= 0x80;
        F(u8, F(void *, actor, 0x54), 0x3a) = 2;
    }

    func_ov095_02218404(P(actor, 0x38), 0, 0, 0);
    func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
    func_ov095_02218404(P(actor, 0x98), 0, 0, 0);
    F(u8, actor, 0x24c) = 0;
    F(u32, actor, 0x260) &= 0xffffebf5u;
    F(s16, actor, 0xd6) = 0x1b;

    switch (F(s16, actor, 0xda))
    {
    case 0x14:
    {
        s32 timer = ++F(s16, actor, 0x2dc);
        s32 duration = (F(u32, actor, 0x314) & 0xffff) >> 2;
        if (timer > duration)
        {
            F(s16, actor, 0xda) = 0x15;
            F(s16, actor, 0x2dc) = 0;
            F(u32, actor, 0x14) &= ~0x02000000u;
            break;
        }
        u8 delta[16], scaled[16], control[16], curve[48], result[16];
        func_ov095_02218414(delta, P(actor, 0x2f0), P(actor, 0x2e0));
        func_ov095_0221a208(scaled, delta, 0x2000);
        func_ov095_02217d58(control, P(actor, 0x2e0), scaled);
        VecFx32Object_Destroy(scaled);
        VecFx32Object_Destroy(delta);
        F(s32, control, 0xc) = F(s32, actor, 0x2fc) + 0x18000;
        func_ov095_0221a250(curve, P(actor, 0x2e0),
                            P(actor, 0x2f0), control);
        VecFx32Bezier_Evaluate3D(result, curve, (timer << 12) / duration);
        VecFx32Object_Assign(P(actor, 0x18), result);
        VecFx32Object_Destroy(result);
        VecFx32Triple_Destroy(curve);
        VecFx32Object_Destroy(control);
        break;
    }
    case 0x15:
        if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
        {
            F(s16, actor, 0xda) = 0x16;
            F(s16, actor, 0x2dc) = 0;
        }
        break;
    case 0x17:
    {
        u8 offset[16], position[16], spawn[16];
        VecFx32Object_InitComponents(offset, 0x5000, 0x8000, 0x1a000);
        func_ov095_02217d58(position, P(actor, 0x18), offset);
        VecFx32Object_Destroy(offset);
        if (F(s16, actor, 0x2dc) < 60 &&
            F(s16, actor, 0x2dc) % 20 == 0)
        {
            VecFx32Object_InitCopy(spawn, position);
            u8 destination[16];
            VecFx32Object_InitCopy(destination, position);
            F(s32, destination, 8) += 0x20000;
            F(s32, destination, 0xc) = Actor_GetCachedTerrainHeight(actor);
            TrackedResourceActor_SpawnFromKey(0x40, spawn, destination);
            VecFx32Object_Destroy(destination);
            VecFx32Object_Destroy(spawn);
        }
        if (++F(s16, actor, 0x2dc) >= 160)
        {
            F(s16, actor, 0xda) = 0x16;
            F(s16, actor, 0x2dc) = 0;
        }
        VecFx32Object_Destroy(position);
        break;
    }
    case 0x18:
        if (F(s16, actor, 0x2dc) == 120)
        {
            Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 12, actor, 0, 0x200);
            F(u16, F(void *, actor, 0x54), 0x36) = 0x200;
        }
        if (++F(s16, actor, 0x2dc) >= 180)
        {
            F(u8, actor, 0x319) = 1;
            F(u32, actor, 0x14) =
                (F(u32, actor, 0x14) | 0x02000000u) & ~0x40u;
            F(s16, actor, 0x2dc) = 0;
            F(u32, actor, 0x14) &= ~0x80u;
        }
        break;
    default:
        if (func_ov095_0221ae5c(actor) != 0 ||
            func_ov095_0221ae9c(actor) != 0)
        {
            F(s16, actor, 0xda) = 0x18;
            F(s16, actor, 0x2dc) = 0;
        }
        else if (++F(s16, actor, 0x2dc) > 600)
        {
            F(s16, actor, 0xda) = 0x17;
            F(s16, actor, 0x2dc) = 0;
            Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 11, actor, 0, 0x200);
        }
        break;
    }
}

static void AdvanceEncounterBezier(void *actor, void *start, void *end,
                                   void *control, s32 progress, s32 duration)
{
    u8 curve[48];
    u8 result[16];
    func_ov095_0221a250(curve, start, end, control);
    VecFx32Bezier_Evaluate3D(result, curve, (progress << 12) / duration);
    VecFx32Object_Assign(P(actor, 0x18), result);
    VecFx32Object_Destroy(result);
    VecFx32Triple_Destroy(curve);
}

static void CompleteEncounterAction(void *actor)
{
    F(Method, F(void *, actor, 0), 0x200)(actor);
    F(s16, actor, 0x298) = 0;
}

/* Runs the central encounter form state machine, motion, effects, and exits. */
extern "C" void func_ov095_0221858c(void *actor, void *context,
                                      s32, s32)
{
    F(u32, actor, 0x260) =
        (F(u32, actor, 0x260) | 0x1021u) & 0xfffffbf5u;
    F(s16, actor, 0xd6) = 0x1b;
    F(u8, actor, 0x24c) = 3;
    void *primary = F(void *, data_021052fc, 0x2ea4);
    s16 form = F(s16, actor, 0x2d4);

    if (F(s16, actor, 0x298) == 0)
    {
        switch (form)
        {
        case 0:
            VecFx32Object_Assign(P(actor, 0x2e0), P(actor, 0x18));
            F(s16, actor, 0xda) = 0;
            F(u32, actor, 0x260) |= 0x400;
            Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 9, actor, 0, 0x200);
            break;
        case 1:
            F(s16, actor, 0xda) = 4;
            F(s16, actor, 0x2d6) = 0;
            Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 1, actor, 0, 0x200);
            break;
        case 2:
            Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 9, actor, 0, -0x100);
            /* fall through */
        case 3:
            F(s16, actor, 0xda) = 0xc;
            F(s16, actor, 0x2d6) = 0;
            VecFx32Object_Assign(P(actor, 0x2e0), P(actor, 0x18));
            F(u32, actor, 0x314) =
                (F(u32, actor, 0x314) & 0xffff0003u) | (105u << 2);
            break;
        case 4:
            F(s16, actor, 0xda) = 0x11;
            F(s16, actor, 0x2d6) = 0;
            VecFx32Object_Assign(P(actor, 0x2e0), P(actor, 0x18));
            VecFx32Object_Assign(P(actor, 0x2f0), P(actor, 0x18));
            F(s32, actor, 0x2fc) += 0x10000;
            F(u32, actor, 0x314) =
                (F(u32, actor, 0x314) & 0xffff0003u) | (120u << 2);
            break;
        default:
            OS_Halt();
            return;
        }
        F(s16, actor, 0x2dc) = 0;
    }
    ++F(s16, actor, 0x298);

    if (form == 0)
    {
        func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
        func_ov095_02218404(P(actor, 0x98), 0, 0, 0);
        switch (F(s16, actor, 0xda))
        {
        case 0:
        {
            F(u8, actor, 0x24c) = 0;
            s32 timer = ++F(s16, actor, 0x2dc);
            if (timer >= 21)
            {
                F(s16, actor, 0xda) = 1;
                F(s16, actor, 0x2dc) = 0;
                break;
            }
            u8 delta[16], scaled[16], control[16];
            func_ov095_02218414(delta, P(actor, 0x2f0), P(actor, 0x2e0));
            func_ov095_0221a208(scaled, delta, 0x2000);
            func_ov095_02217d58(control, P(actor, 0x2e0), scaled);
            F(s32, control, 0xc) = F(s32, actor, 0x2fc);
            AdvanceEncounterBezier(actor, P(actor, 0x2e0), P(actor, 0x2f0),
                                   control, timer, 20);
            VecFx32Object_Destroy(control);
            VecFx32Object_Destroy(scaled);
            VecFx32Object_Destroy(delta);
            break;
        }
        case 1:
            F(u8, actor, 0x24c) = 0;
            F(s32, actor, 0x24) += 0x1000;
            if (++F(s16, actor, 0x2dc) >= 15)
            {
                F(s16, actor, 0xda) = 2;
                F(s16, actor, 0x2dc) = 0;
                F(u32, actor, 0x14) &= ~0x40u;
                F(s32, actor, 0x44) = -0x3000;
            }
            break;
        case 2:
            if (F(s32, actor, 0x24) <= Actor_GetCachedTerrainHeight(actor))
            {
                F(u32, actor, 0x260) |= 0x400;
                F(s16, actor, 0xda) = 3;
                F(s16, actor, 0x2dc) = 0;
                F(u32, actor, 0xd0) |= 0x2000;
                Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 2, actor, 0, 0x200);
                func_ov095_0221af0c(actor, F(s32, actor, 0x1c),
                                    F(s32, actor, 0x20), 40);
            }
            break;
        default:
            F(u32, actor, 0x260) |= 0x400;
            if (++F(s16, actor, 0x2dc) >
                (F(u16, actor, 0x2de) < 2 ? 120 : 150))
            {
                F(u8, actor, 0x24c) = 2;
                CompleteEncounterAction(actor);
            }
            break;
        }
        return;
    }

    if (form == 1)
    {
        s16 state = F(s16, actor, 0xda);
        s32 scale = 0x100;
        switch (state)
        {
        case 4:
            func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
            F(s16, actor, 0x2dc) += 8;
            F(s32, actor, 0x24) += 0x800;
            scale = 0x100 - F(s16, actor, 0x2dc);
            if (scale < 0x10)
            {
                scale = 0x10;
                F(s16, actor, 0xda) = 5;
                F(s16, actor, 0x2dc) = 0;
                VecFx32Object_Assign(P(actor, 0x2e0), P(actor, 0x18));
            }
            break;
        case 5:
        {
            scale = 0x10;
            F(u8, actor, 0x24c) = 0;
            s32 timer = ++F(s16, actor, 0x2dc);
            if (timer >= 46)
            {
                F(s16, actor, 0xda) = 6;
                F(s16, actor, 0x2dc) = 0x10;
                F(u32, actor, 0x14) |= 0x80;
                F(u8, F(void *, actor, 0x54), 0x3a) = 0;
                Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 5, actor, 0, 0x200);
                Sound_FadeDirectSequence(gSoundContext, 0xd0, 0x28, 0x50);
                break;
            }
            u8 target[16], delta[16], scaled[16], control[16];
            VecFx32Object_InitComponents(target, 0, 0, 0x20000);
            func_ov095_02217d58(delta, P(primary, 0x18), target);
            VecFx32Object_Destroy(target);
            func_ov095_0221b060(actor, delta);
            func_ov095_02218414(scaled, delta, P(actor, 0x2e0));
            func_ov095_0221a208(control, scaled, 0x2000);
            func_ov095_02217d58(target, P(actor, 0x2e0), control);
            AdvanceEncounterBezier(actor, P(actor, 0x2e0), delta,
                                   target, timer, 45);
            VecFx32Object_Destroy(target);
            VecFx32Object_Destroy(control);
            VecFx32Object_Destroy(scaled);
            VecFx32Object_Destroy(delta);
            break;
        }
        case 6:
            F(s16, actor, 0x2dc) += 0x10;
            scale = F(s16, actor, 0x2dc) > 0xff ? 0x100
                                                : F(s16, actor, 0x2dc);
            F(s32, actor, 0x24) += 0x800;
            if (F(s16, actor, 0x2dc) < 0x500)
            {
                F(u8, actor, 0x24c) = 0;
                F(s16, actor, 0x31e) += 0x18;
                if (F(s16, actor, 0x31e) > 0x5a0)
                    F(s16, actor, 0x31e) = 0x5a0;
                F(s16, actor, 0x31c) +=
                    func_020adae4(F(s16, actor, 0x31e), 60) + 6;
                if (F(s16, actor, 0x31c) > 0x1000)
                    F(s16, actor, 0x31c) = 0x1000;
                Sound_SetEffectPitch(gSoundContext, 0x1ee, 5,
                              F(s16, actor, 0x31c));
            }
            else
            {
                F(s16, actor, 0xda) = 7;
                F(s16, actor, 0x2dc) = 0;
                F(u32, actor, 0x14) &= ~0xc0u;
                F(s32, actor, 0x44) = 0x3800;
            }
            break;
        case 7:
            func_ov095_02218534(P(actor, 0x88), 0xccd);
            func_ov095_0221b060(actor, P(actor, 0x18));
            if (F(s32, actor, 0x24) <= Actor_GetCachedTerrainHeight(actor))
            {
                F(s16, actor, 0xda) = 8;
                F(s16, actor, 0x2dc) = 0;
                Sound_StopEffect(gSoundContext, 0x1ee, 5);
                func_ov095_0221af0c(actor, F(s32, actor, 0x1c),
                                    F(s32, actor, 0x20), 40);
                Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 8, actor, 0, 0x200);
            }
            break;
        case 8:
            func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
            if (++F(s16, actor, 0x2dc) > 10)
            {
                F(s16, actor, 0xda) = 9;
                F(s16, actor, 0x2dc) = 0;
                F(s32, actor, 0x44) = 0x5000;
                Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 7, actor, 0, 0x200);
            }
            break;
        case 9: case 10:
            F(u32, actor, 0x260) |= 10;
            F(u8, actor, 0x24c) = 8;
            if (++F(s16, actor, 0x2dc) > 170 &&
                func_ov095_0221a294(actor) != 0)
            {
                F(s16, actor, 0xda) = 0xb;
                F(s16, actor, 0x2dc) = 0;
                F(s32, actor, 0x44) = 0x5000;
                Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 9, actor, 0, 0x200);
            }
            break;
        default:
            if (func_ov095_0221a294(actor) != 0)
            {
                CompleteEncounterAction(actor);
                F(u32, actor, 0x314) =
                    (F(u32, actor, 0x314) & 0x7fc0ffffu) | 0x80000000u;
                F(s16, actor, 0x2de) = 7;
            }
            break;
        }
        F(u16, F(void *, actor, 0x54), 0x32) = (u16)scale;
        F(u16, F(void *, actor, 0x54), 0x34) = (u16)((scale + 0x100) / 2);
        return;
    }

    if (form == 2 || form == 3)
    {
        func_ov095_02218404(P(actor, 0x38), 0, 0, 0);
        func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
        func_ov095_02218404(P(actor, 0x98), 0, 0, 0);
        switch (F(s16, actor, 0xda))
        {
        case 0xc:
        {
            F(u8, actor, 0x24c) = 0;
            s32 timer = ++F(s16, actor, 0x2dc);
            s32 duration = (F(u32, actor, 0x314) & 0xffff) >> 2;
            if (timer > duration)
            {
                F(s16, actor, 0xda) = 0xd;
                F(s16, actor, 0x2dc) = 0;
                break;
            }
            u8 offset[16], destination[16], delta[16], control[16];
            VecFx32Object_InitComponents(offset, 0, 0x80000, 0x30000);
            func_ov095_02217d58(destination, P(primary, 0x18), offset);
            VecFx32Object_Destroy(offset);
            func_ov095_02218414(delta, destination, P(actor, 0x2e0));
            func_ov095_0221a208(control, delta, 0x2000);
            func_ov095_02217d58(offset, P(actor, 0x2e0), control);
            F(s32, offset, 0xc) += 0x8000;
            AdvanceEncounterBezier(actor, P(actor, 0x2e0), destination,
                                   offset, timer, duration);
            VecFx32Object_Destroy(offset);
            VecFx32Object_Destroy(control);
            VecFx32Object_Destroy(delta);
            VecFx32Object_Destroy(destination);
            break;
        }
        case 0xd:
            func_ov095_0221aedc(actor, 0x30000, 8);
            F(u8, actor, 0x24c) = 0;
            if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
            {
                F(s16, actor, 0xda) = 0xe;
                F(s16, actor, 0x2dc) = 0;
                Actor_PlayRadialSpatialSound(actor, 0x7a02, 0);
            }
            break;
        case 0xe:
            func_ov095_0221aedc(actor, 0x30000, 8);
            F(u8, actor, 0x24c) = 0;
            if (++F(s16, actor, 0x2dc) > 60)
            {
                F(s16, actor, 0xda) = form == 2 ? 0x10 : 0xf;
                F(s16, actor, 0x2dc) = 0;
            }
            break;
        case 0xf:
            func_ov095_0221aedc(actor, 0x30000, 8);
            if (++F(s16, actor, 0x2dc) >=
                (F(u8, actor, 0x318) == 2 ? 240 : 120))
            {
                CompleteEncounterAction(actor);
                F(u32, actor, 0x14) &= ~0x40u;
                F(u32, actor, 0x314) &= ~0x3f0000u;
            }
            break;
        default:
            F(u32, actor, 0x14) |= 0x80;
            F(u8, F(void *, actor, 0x54), 0x3a) = 0;
            func_ov095_0221aedc(actor, 0x30000, 8);
            if (++F(s16, actor, 0x2dc) > 480)
            {
                F(s16, actor, 0x298) = 0;
                F(u32, actor, 0x14) &= ~0x40u;
                F(u32, actor, 0x314) ^= 0x40000000u;
                func_ov095_02218130(actor, 1);
                F(u32, actor, 0x14) &= ~0x80u;
            }
            break;
        }
        return;
    }

    switch (F(s16, actor, 0xda))
    {
    case 0x11:
    {
        F(u8, actor, 0x24c) = 0;
        s32 timer = ++F(s16, actor, 0x2dc);
        s32 duration = (F(u32, actor, 0x314) & 0xffff) >> 2;
        if (timer > duration)
        {
            F(s16, actor, 0xda) = 0x12;
            F(s16, actor, 0x2dc) = 0;
            VecFx32Object_Assign(P(actor, 0x18), P(actor, 0x2f0));
            break;
        }
        u8 delta[16], control[16];
        func_ov095_02218414(delta, P(actor, 0x2f0), P(actor, 0x2e0));
        func_ov095_0221a208(control, delta, 0x2000);
        func_ov095_02217d58(delta, P(actor, 0x2e0), control);
        F(s32, delta, 0xc) = F(s32, actor, 0x2ec) + 0x14000;
        AdvanceEncounterBezier(actor, P(actor, 0x2e0), P(actor, 0x2f0),
                               delta, timer, duration);
        VecFx32Object_Destroy(control);
        VecFx32Object_Destroy(delta);
        break;
    }
    case 0x12:
        func_ov095_0221aedc(actor, 0x20000, 4);
        F(u8, actor, 0x24c) = 0;
        if (F(s16, actor, 0x2dc) < 60 &&
            F(s16, actor, 0x2dc) % 15 == 0)
            Sound_PlayOwnedEffect(gSoundContext, 0x1ee, 0, actor, 0, 0x200);
        if (++F(s16, actor, 0x2dc) > 120)
        {
            F(s16, actor, 0xda) = 0x13;
            F(s16, actor, 0x2dc) = 0;
            F(u32, actor, 0x14) &= ~0x40u;
        }
        break;
    default:
        func_ov095_02218404(P(actor, 0x88), 0, 0, 0);
        func_ov095_02218404(P(actor, 0x98), 0, 0, 0);
        if (F(s32, actor, 0x24) == Actor_GetCachedTerrainHeight(actor) &&
            ++F(s16, actor, 0x2dc) > 75)
        {
            CompleteEncounterAction(actor);
            F(u32, actor, 0x314) &= ~0x3f0000u;
        }
        break;
    }
}
