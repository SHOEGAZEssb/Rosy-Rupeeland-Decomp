#include "tingle/types.h"

/* Recovered overlay 97 paired actor, interaction, and presentation runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define P(base, offset) ((void *)((u8 *)(base) + (offset)))
typedef s32 (*Method)(...);

extern "C" void *gGameWork;
extern "C" void *gSoundContext;
extern "C" void *gHeapContext;
extern "C" void *gActorRuntimeCollection;
extern "C" u8 *gGamePhaseRuntime;
extern "C" s16 gFx32CosSinTable[];
extern "C" u16 data_020e6e68[];
extern "C" u8 data_ov097_0221a4c8[];
extern "C" u16 data_ov097_0221a4a4[];
extern "C" u8 data_ov097_0221a4d0[];
extern "C" u8 data_ov097_0221a500[];
extern "C" u8 data_ov097_0221a518[];
extern "C" u8 data_ov097_0221a520[];
extern "C" u8 data_ov097_0221a5f4[];
extern "C" u8 data_ov097_0221a80c[];
extern "C" u8 data_ov097_0221aa1c[];
extern "C" u8 data_ov097_0221aaa4[];

#define EXT(name) extern "C" s32 name(...)
EXT(ActorExtendedType2_GetDescriptorValue25);
EXT(ActorExtendedType2_GetDescriptorValue2A);
EXT(ActorExtendedType2_GetDescriptorValue2C);
EXT(ActorExtendedType2_InitializeReentryState);
EXT(ActorExtendedType2_PrepareRelease);
EXT(ActorExtendedType2_UpdateFrame);
EXT(ActorExtendedType2_RunVirtualFCAndResetProgress);
EXT(ActorExtendedType2_UpdateTimedAttachmentTransition);
EXT(ActorExtendedType2_InitializeTransformAndMotion);
EXT(ActorExtendedType2_LaunchRandomMotion);
EXT(Actor_GetCachedTerrainHeight);
EXT(ActorCollection_FindActorByRuntimeId);
EXT(GameWork_TestFlag);
EXT(GameWork_SetFlag);
EXT(VecFx32Object_Init);
EXT(VecFx32Object_Destroy);
EXT(VecFx32Object_Assign);
EXT(VecFx32Object_InitComponents);
EXT(VecFx32Object_InitCopy);
EXT(VecFx32Object_GetMagnitude);
EXT(Actor_GetOwningCollection);
EXT(ActorCollection_GetSpriteGroup);
EXT(GamePhaseRuntime_GetActorCollection);
EXT(ActorCollection_QueueActorForRemoval);
EXT(ActorRuntimeCollection_GetPendingAttachmentFlag);
EXT(GraphicsSpriteGroup_ReplaceStateResources);
EXT(GraphicsSpriteState_SetAnimationIndex);
EXT(TrackedResourceActorType28_InitBase);
EXT(TrackedResourceActorType28_Destroy);
EXT(TrackedResourceActor_PostUpdate);
EXT(TrackedResourceActor_EmitRecordEffects);
EXT(TrackedResourceActor_DispatchTargetInteraction);
EXT(Type7Actor_ProcessGlobalInteractionTrigger);
EXT(Actor_SynchronizeStatePresentation);
EXT(func_02003e2c);
EXT(Heap_Free);
EXT(Heap_Alloc);
EXT(OS_Halt);
EXT(AuxiliaryTimedSpritePresentation_Init);
EXT(TrackedResourceActor_SpawnFromKey);
EXT(func_020099c0);
extern "C" void *RuntimePresentationManager_GetGraphics3dPresentation(...);
EXT(func_0200634c);
EXT(func_0200637c);
EXT(func_020064b8);
EXT(func_02030ad4);
EXT(Actor_PlayRadialSpatialSound);
EXT(Fx32Vector2_Magnitude);
EXT(Actor_GetGravityAcceleration);
EXT(func_02033f7c);
EXT(Actor_PlayHorizontalSpatialSound);
EXT(Sound_PlayOwnedEffect);
EXT(Sound_StopEffect);
EXT(Sound_IsEffectPlaying);
EXT(func_0206e590);
EXT(Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt);
EXT(Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt);
EXT(func_020adc90);
EXT(func_020adff0);
EXT(func_020adae4);
EXT(func_020ae024);
EXT(func_020befec);
EXT(func_020bf1f8);
EXT(func_020adfbc);
EXT(genrand_int32);
#undef EXT

extern "C" void *func_ov075_02212ae0(void *, void *, s32, s32);
extern "C" void *func_ov078_02212ba0(void *);
extern "C" void func_ov078_0221361c(void);
extern "C" void func_ov078_02213a74(void *, void *);
extern "C" void func_ov078_02213c3c(void);
extern "C" void func_ov097_022177e0(void *, s32, s32, s16);
extern "C" void func_ov097_02217934(void *, s32, s32, s32, s32);
extern "C" s32 func_ov097_02217fd8(void *, s32, s32);
extern "C" s32 func_ov097_02217fec(void *);
extern "C" void func_ov097_0221818c(void *, s32, s32, s32);
extern "C" void func_ov097_022188f8(void *, void *, s32);
extern "C" void func_ov097_02218b40(void *, void *, void *);
extern "C" void func_ov097_02218d04(void *, void *, void *);
extern "C" void func_ov097_02218d3c(void *);
extern "C" void func_ov097_0221951c(void *, s32);
extern "C" s32 func_ov097_022194e8(void *);
extern "C" s32 func_ov097_0221a43c(void *);
extern "C" void func_ov097_0221a004(void *, s32);

static s32 MulFx(s32 left, s32 right)
{
    return (s32)(((long long)left * right + 0x800) >> 12);
}

/* Stores a signed configuration value in one of two indexed actor tables. */
extern "C" void func_ov097_022177e0(void *work, s32 alternate, s32 index,
                                     s16 value)
{
    s32 offset = alternate == 0 ? 0x3cc : 0x5cc;
    F(s32, work, offset + index * 4) = value;
}

/* Constructs the primary actor and initializes its presentation state. */
extern "C" void *func_ov097_02217804(void *actor, void *descriptor, s32 arg2,
                                      s32 arg3)
{
    func_ov075_02212ae0(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov097_0221a5f4;
    F(s16, actor, 0x2b8) = 0;
    F(s16, actor, 0x2ba) = 0;
    F(u8, actor, 0x2bc) = 0;
    F(u8, actor, 0x2bd) = 1;
    F(s16, actor, 0x2be) = 0;
    F(s16, actor, 0x2c0) = 0;
    F(s16, actor, 0x2c2) = 0;
    F(void *, actor, 0x2c4) = 0;
    VecFx32Object_Init(P(actor, 0x2c8));
    VecFx32Object_Init(P(actor, 0x2d8));
    func_ov097_02217934(P(actor, 8), -30, -20, 30, 8);
    F(s16, actor, 0x29e) = 25;
    F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0x40);
    F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 0x44);
    F(s16, actor, 0xda) = 4;
    s32 descriptorValue = ActorExtendedType2_GetDescriptorValue25(actor);
    func_ov097_022177e0(gGameWork, 0, descriptorValue == 0 ? 4 : 5, 0);
    descriptorValue = ActorExtendedType2_GetDescriptorValue25(actor);
    s32 flag = descriptorValue == 0 ? 0x415 : 0x416;
    if (GameWork_TestFlag(gGameWork, flag) != 0)
    {
        F(u32, actor, 0x260) |= 0x2000;
    }
    return actor;
}

/* Writes four signed presentation bounds into the supplied record. */
extern "C" void func_ov097_02217934(void *record, s32 left, s32 top,
                                     s32 right, s32 bottom)
{
    F(s8, record, 0) = (s8)left;
    F(s8, record, 1) = (s8)top;
    F(s8, record, 2) = (s8)right;
    F(s8, record, 3) = (s8)bottom;
}

/* Destroys the actor's two vector helpers and its recovered base object. */
extern "C" void *func_ov097_0221794c(void *actor)
{
    VecFx32Object_Destroy(P(actor, 0x2d8));
    VecFx32Object_Destroy(P(actor, 0x2c8));
    return func_ov078_02212ba0(actor);
}

/* Destroys the actor and releases its heap allocation. */
extern "C" void *func_ov097_02217974(void *actor)
{
    func_ov097_0221794c(actor);
    func_02003e2c(actor);
    return actor;
}

static s32 IsCallbackPair(void *actor, const void *first, const void *second)
{
    void *active = F(void *, actor, 0x2a4);
    return active == first &&
           (F(void *, actor, 0x2a8) == second || active == 0);
}

/* Handles eligible contact by marking the actor and spawning feedback. */
extern "C" void func_ov097_022179a4(void *actor, void *other)
{
    s32 eligible =
        IsCallbackPair(actor, F(void *, data_ov097_0221a4c8, 0x50),
                       F(void *, data_ov097_0221a518, 4)) ||
        IsCallbackPair(actor, F(void *, data_ov097_0221a4c8, 8),
                       F(void *, data_ov097_0221a4d0, 4));
    if (!eligible)
    {
        eligible = IsCallbackPair(actor,
                                  F(void *, data_ov097_0221a4c8, 0x58),
                                  F(void *, data_ov097_0221a520, 4));
    }
    if (eligible)
    {
        return;
    }
    F(u32, actor, 0x260) |= 0x10;
    if ((F(u32, other, 0xd0) & 0x100) != 0 ||
        F(s16, other, 0x268) > 0)
    {
        return;
    }
    Actor_PlayHorizontalSpatialSound(actor, 0x3089, 0);
}

/* Empty virtual hook retained by the primary actor vtable. */
extern "C" void func_ov097_02217ac0(void)
{
}

/* Initializes a vector object from the optional source-vector payloads. */
extern "C" void func_ov097_02217ac4(void *object, void *from, void *to)
{
    VecFx32Object_Init(object);
    func_020adff0(from != 0 ? P(from, 4) : 0,
                  to != 0 ? P(to, 4) : 0, P(object, 4));
}

/* Returns the signed vertical span stored in a compact bounds record. */
extern "C" s32 func_ov097_02217afc(void *record)
{
    return (s16)(F(s16, record, 6) - F(s16, record, 2));
}

/* Return state-scaled signed FX32 gravity acceleration for this actor type. */
extern "C" s32 func_ov097_02217b14(void *actor)
{
    if (F(s16, actor, 0xda) == 0 && F(s32, actor, 0x44) >= 0)
        return func_020befec(Actor_GetGravityAcceleration(actor) * 5, 7);
    return Actor_GetGravityAcceleration(actor);
}

/* Selects presentation resources and animation for actor modes 26 and 27. */
extern "C" void func_ov097_02217b4c(void *actor)
{
    void *sprite = F(void *, actor, 0x54);
    if (F(s16, actor, 0xd6) == 26)
    {
        void *record = F(void *, actor, 0x208);
        void *collection = (void *)Actor_GetOwningCollection(actor);
        void *owner = (void *)ActorCollection_GetSpriteGroup(collection);
        GraphicsSpriteGroup_ReplaceStateResources(
            owner, sprite, F(void *, record, 4), F(void *, record, 8),
            F(void *, record, 12));
        GraphicsSpriteState_SetAnimationIndex(
            sprite, (u8)(F(s8, actor, 0xd4) + 16));
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & 0xfffe) | 2;
    }
    else if (F(s16, actor, 0xd6) == 27)
    {
        void *record = F(void *, actor, 0x208);
        void *collection = (void *)Actor_GetOwningCollection(actor);
        void *owner = (void *)ActorCollection_GetSpriteGroup(collection);
        GraphicsSpriteGroup_ReplaceStateResources(
            owner, sprite, F(void *, record, 4), F(void *, record, 8),
            F(void *, record, 12));
        s32 animation = -1;
        s32 visible = 1;
        switch (F(u16, actor, 0xda))
        {
        case 0: animation = F(u8, actor, 0xd4) + 24; break;
        case 1: animation = F(u8, actor, 0xd4) + 32; break;
        case 2: animation = 40; break;
        case 3: animation = F(u8, actor, 0xd4) + 51; break;
        case 4: animation = 42; break;
        case 5: animation = 8; visible = 0; break;
        case 6: animation = F(u8, actor, 0xd4) + 43; break;
        case 7: animation = F(u8, actor, 0xd4) + 32; break;
        case 8:
        case 9: animation = 42; break;
        }
        if (animation != -1)
        {
            GraphicsSpriteState_SetAnimationIndex(sprite, animation);
        }
        F(u16, sprite, 0x24) &= 0xfffe;
        if (visible != 0)
        {
            F(u16, sprite, 0x24) |= 2;
        }
        else
        {
            F(u16, sprite, 0x24) &= 0xfffd;
        }
    }
    F(s16, sprite, 0x36) = 0x100;
    F(s16, sprite, 0x30) = 0;
}

/* Forwards the shared actor update through overlay 78's recovered hook. */
extern "C" void func_ov097_02217cec(void)
{
    func_ov078_0221361c();
}

/* Stops the owned sound if active and prepares the actor for release. */
extern "C" void func_ov097_02217cf8(void *actor)
{
    if (Sound_IsEffectPlaying(gSoundContext, 0x1ed, 9) != 0)
    {
        Sound_StopEffect(gSoundContext, 0x1ed, 9);
    }
    ActorExtendedType2_PrepareRelease(actor);
}

/* Applies the actor's reentry or completion transition and related effects. */
extern "C" void func_ov097_02217d44(void *actor)
{
    ActorExtendedType2_InitializeReentryState(actor);
    if (F(s32, actor, 0x1fc) > 0)
    {
        F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0x60);
        F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 0x64);
        F(u8, actor, 0x2bc) = 0;
        s32 value = ActorExtendedType2_GetDescriptorValue25(actor);
        func_ov097_022177e0(gGameWork, 0, value == 0 ? 4 : 5, 0);
        F(s16, actor, 0x298) = 0;
        F(s16, actor, 0x2be) = 0;
        F(s16, actor, 0xda) = 4;
        F(u32, actor, 0x260) &= ~8u;
        return;
    }

    void *effectOwner =
        (void *)RuntimePresentationManager_GetGraphics3dPresentation(P(gGamePhaseRuntime, 0x2f7c));
    Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt(effectOwner, 0, F(s32, actor, 0x1c) >> 12,
                  (F(s32, actor, 0x20) >> 12) -
                      (F(s32, actor, 0x24) >> 12) - 24,
                  8);
    s32 firstVariant =
        ActorExtendedType2_GetDescriptorValue25(actor) == 0;
    func_ov097_022177e0(gGameWork, 0, firstVariant ? 4 : 5, 2);
    GameWork_SetFlag(gGameWork, firstVariant ? 0x415 : 0x416);
    s32 linkedIndex =
        ActorExtendedType2_GetDescriptorValue25(actor) == 0 ? 5 : 4;
    if (func_ov097_02217fd8(gGameWork, 0, linkedIndex) == 2)
    {
        void *primary = F(void *, F(void *, gGamePhaseRuntime, 0x2ea4), 0x26c);
        if (primary != 0)
        {
            func_0206e590(primary, 1);
        }
        void *secondary = F(void *, gGamePhaseRuntime, 0x2ea8);
        if (secondary != 0)
        {
            secondary = F(void *, secondary, 0x234);
        }
        if (secondary != 0)
        {
            func_0206e590(secondary, 1);
        }
        for (s32 i = 0; i < 3; ++i)
        {
            if (func_ov097_02217fd8(gGameWork, 0, i + 6) == 0)
            {
                continue;
            }
            void *collection = (void *)Actor_GetOwningCollection(actor);
            s32 descriptor = func_ov097_02217fd8(gGameWork, 0, i + 9);
            void *linked = (void *)ActorCollection_FindActorByRuntimeId(
                collection, descriptor);
            if (func_ov097_02217fec(linked) == 0)
            {
                ((Method)F(void *, F(void *, linked, 0), 0x100))(linked);
                Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt(effectOwner, 0,
                              F(s32, linked, 0x1c) >> 12,
                              (F(s32, linked, 0x20) >> 12) -
                                  (F(s32, linked, 0x24) >> 12) - 24,
                              3);
            }
        }
    }
    else
    {
        func_ov097_022177e0(gGameWork, 0, 12, 2);
    }
    Actor_PlayRadialSpatialSound(actor, 0xf688, 0);
}

/* Reads an indexed signed value from one of the two GameWork actor tables. */
extern "C" s32 func_ov097_02217fd8(void *work, s32 alternate, s32 index)
{
    s32 offset = alternate == 0 ? 0x3cc : 0x5cc;
    return F(s32, work, offset + index * 4);
}

/* Tests whether an actor uses the completion callback pair. */
extern "C" s32 func_ov097_02217fec(void *actor)
{
    return IsCallbackPair(actor, F(void *, data_ov097_0221a4c8, 0x38),
                          F(void *, data_ov097_0221a500, 4));
}

/* Updates the actor and lazily resolves its linked descriptor target. */
extern "C" void func_ov097_02218034(void *actor)
{
    F(u32, actor, 0x260) &= ~0x200000u;
    if (F(u8, actor, 0x2bd) != 0)
    {
        s32 variant = ActorExtendedType2_GetDescriptorValue25(actor);
        s32 descriptor = func_ov097_02217fd8(gGameWork, 0,
                                             variant != 0 ? 1 : 0);
        void *collection = (void *)Actor_GetOwningCollection(actor);
        F(void *, actor, 0x2c4) =
            (void *)ActorCollection_FindActorByRuntimeId(collection,
                                                                descriptor);
        F(u8, actor, 0x2bd) = 0;
    }
    ActorExtendedType2_UpdateFrame(actor);
    F(s16, actor, 0x6a) = F(u8, actor, 0x24c) == 8 ? -92 : -108;
}

/* Empty state hook retained by the primary actor state table. */
extern "C" void func_ov097_022180b8(void)
{
}

/* Runs the timed opening presentation and advances to its next callback pair. */
extern "C" void func_ov097_022180bc(void *actor)
{
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) | 0x21) & ~0xau;
    F(s16, actor, 0xd6) = 26;
    F(u8, actor, 0x24c) = 3;
    s32 limit = F(s16, actor, 0x2c2) == 0 ? 120 : 30;
    ++F(s16, actor, 0x298);
    if (F(s16, actor, 0x298) < limit)
    {
        func_ov097_0221818c(P(actor, 0x38), 0, 0, 0);
        return;
    }
    F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0x30);
    F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 0x34);
    F(s16, actor, 0x298) = 0;
    F(s16, actor, 0x29c) = 0;
    F(s16, actor, 0x2c2) = 0;
    F(s32, actor, 0x2b4) = 0;
    F(s32, actor, 0x2b0) = 0;
    Sound_PlayOwnedEffect(gSoundContext, 0x61, 0, actor, -0x100, 0x100);
}

/* Writes a three-component vector after an optional object header. */
extern "C" void func_ov097_0221818c(void *object, s32 x, s32 y, s32 z)
{
    void *vector = object != 0 ? P(object, 4) : object;
    F(s32, vector, 0) = x;
    F(s32, vector, 4) = y;
    F(s32, vector, 8) = z;
}

/* Empty callback retained between the primary actor's state families. */
extern "C" void func_ov097_0221819c(void)
{
}

/* Runs the primary actor's airborne, impact, and tracked-target state machine. */
extern "C" void func_ov097_022181a0(void *actor, void *argument)
{
    u8 current[16];
    u8 target[16];
    u8 path[16];
    u8 scaled[16];
    s32 point[3];

    F(u32, actor, 0x260) = (F(u32, actor, 0x260) | 0x23) & ~0xau;
    F(s16, actor, 0xd6) = 27;
    F(u8, actor, 0x24c) = 3;
    if (F(s16, actor, 0x298) == 0)
    {
        s32 variant = ActorExtendedType2_GetDescriptorValue25(actor);
        if (variant == 0)
        {
            F(s16, actor, 0x2a2) = 0;
            func_ov078_02213a74(actor, argument);
            ((Method)F(void *, F(void *, actor, 0), 0xd0))(
                actor, P(F(void *, actor, 0x228), 0x18));
            s32 scalar = ActorExtendedType2_GetDescriptorValue2A(actor);
            F(s32, actor, 0x2b0) = F(s32, actor, 0x3c) * scalar;
            scalar = ActorExtendedType2_GetDescriptorValue2A(actor);
            F(s32, actor, 0x2b4) = F(s32, actor, 0x40) * scalar;
            F(s16, actor, 0xda) = 0;
            if (F(s16, actor, 0x2c2) == 4)
            {
                F(s32, actor, 0x44) = 0x3800;
                F(s32, actor, 0x2b0) =
                    MulFx(F(s32, actor, 0x2b0), 0x1333);
                F(s32, actor, 0x2b4) =
                    MulFx(F(s32, actor, 0x2b4), 0x1333);
            }
            else
            {
                F(s32, actor, 0x44) = 0x3000;
            }
            F(u32, actor, 0x14) |= 0x2000000;
        }
        else if (variant == 1)
        {
            F(s16, actor, 0x2a2) = 1;
            F(s16, actor, 0xda) = 2;
            TrackedResourceActor_SpawnFromKey(0x21, P(actor, 0x18),
                                              P(actor, 0x18));
            s32 height = F(s32, actor, 0xc8) + 16000;
            F(s16, actor, 0x2b8) = (s16)(height >> 16);
            F(s16, actor, 0x2ba) =
                (genrand_int32() & 1) == 0 ? -0x300 : 0x300;
        }
        else
        {
            OS_Halt();
        }
        F(s16, actor, 0x29c) = 0;
    }
    ++F(s16, actor, 0x298);

    if (F(s16, actor, 0x2a2) == 0)
    {
        if (F(s32, actor, 0x44) <= 0 &&
            F(s32, actor, 0x24) <= Actor_GetCachedTerrainHeight(actor))
        {
            if (F(s16, actor, 0xda) == 1)
            {
                if (F(s16, actor, 0x2c2) < 4)
                {
                    if (++F(u16, actor, 0x29c) > 60)
                    {
                        F(s16, actor, 0x298) = 0;
                        F(s16, actor, 0x29c) = 0;
                        ++F(s16, actor, 0x2c2);
                        s32 pan = F(s16, actor, 0x2c2) == 4 ? -0x80
                                                            : -0x100;
                        Sound_PlayOwnedEffect(gSoundContext, 0x61, 0, actor, pan,
                                      0x100);
                    }
                }
                else
                {
                    if (F(u16, actor, 0x29c) > 20)
                    {
                        F(u32, actor, 0x260) |= 8;
                    }
                    if (++F(u16, actor, 0x29c) > 30)
                    {
                        F(u32, actor, 0x260) |= 8;
                        F(void *, actor, 0x2a4) =
                            F(void *, data_ov097_0221a4c8, 0x28);
                        F(void *, actor, 0x2a8) =
                            F(void *, data_ov097_0221a4c8, 0x2c);
                        F(s16, actor, 0x298) = 0;
                    }
                }
            }
            else
            {
                F(s16, actor, 0xda) = 1;
                Actor_PlayRadialSpatialSound(actor, 0xf68c, 0);
                VecFx32Object_InitCopy(point, P(actor, 0x18));
                void *effect = (void *)Heap_Alloc(0x14, data_ov097_0221aa1c,
                                                  4, gHeapContext);
                if (effect != 0)
                {
                    AuxiliaryTimedSpritePresentation_Init(
                        effect, point, F(void *, F(void *, actor, 0x54), 0),
                        0x162e, 0x162f, 0x1630, 0, 0x80, 2, 1);
                }
                s32 direction = ((u32)F(u8, actor, 0xd4) << 13) >> 4;
                s32 dx = gFx32CosSinTable[direction * 2];
                s32 dy = gFx32CosSinTable[direction * 2 + 1];
                TrackedResourceActor_SpawnFromKey(0x22, point, point);
                point[0] = F(s32, actor, 0x1c) - dx * 0x30;
                point[1] = F(s32, actor, 0x20) + dy * 0x14 - 0x8000;
                effect = (void *)Heap_Alloc(0x14, data_ov097_0221aa1c, 4,
                                            gHeapContext);
                if (effect != 0)
                {
                    AuxiliaryTimedSpritePresentation_Init(
                        effect, point, F(void *, F(void *, actor, 0x54), 0),
                        0x166a, 0x166b, 0x166c, 0, -4, -1, 1);
                }
                if ((F(u32, actor, 0x10) & 4) != 0)
                {
                    func_020099c0(P(gGamePhaseRuntime, 0x2fbc), 15, 1);
                }
                VecFx32Object_Destroy(point);
            }
        }
        else
        {
            F(s16, actor, 0xda) = 0;
            F(s32, actor, 0x3c) = F(s32, actor, 0x2b0);
            F(s32, actor, 0x40) = F(s32, actor, 0x2b4);
        }
        return;
    }

    if (F(s16, actor, 0x2a2) != 1)
    {
        return;
    }
    s16 timer = F(s16, actor, 0x298);
    if (timer >= 241)
    {
        F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0x18);
        F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 0x1c);
        F(s16, actor, 0x298) = 0;
        return;
    }

    s32 dx;
    s32 dy;
    if ((timer < 60 || timer > 90) && (timer < 150 || timer > 180))
    {
        s32 angle = (u16)F(s16, actor, 0x2b8) >> 4;
        s32 scalar = ActorExtendedType2_GetDescriptorValue2C(actor);
        dx = func_020befec(gFx32CosSinTable[angle * 2 + 1] * scalar, 12);
        scalar = ActorExtendedType2_GetDescriptorValue2C(actor);
        dy = func_020befec(gFx32CosSinTable[angle * 2] * scalar, 12);
    }
    else
    {
        void *primary = F(void *, gGamePhaseRuntime, 0x2ea4);
        dx = F(s32, primary, 0x1c) - F(s32, actor, 0x1c);
        dy = F(s32, primary, 0x20) - F(s32, actor, 0x20);
        s32 distance = Fx32Vector2_Magnitude(dx, dy);
        if (distance > 0x555)
        {
            dx = func_020adc90(dx, distance * 3);
            dy = func_020adc90(dy, distance * 3);
        }
    }
    F(s32, actor, 0x8c) += dx;
    F(s32, actor, 0x90) += dy;
    VecFx32Object_InitCopy(current, P(F(void *, actor, 0x228), 0x18));
    if (F(void *, actor, 0x278) != 0)
    {
        s16 *bounds = F(s16 *, F(void *, actor, 0x278), 4);
        VecFx32Object_InitComponents(
            target, (bounds[0] + (bounds[2] - bounds[0]) / 2) << 12,
            (bounds[1] + (bounds[3] - bounds[1]) / 2 + 32) << 12, 0);
        func_ov097_02217ac4(path, current, target);
        func_ov097_022188f8(scaled, path, 0x2000);
        VecFx32Object_Assign(current, scaled);
        VecFx32Object_Destroy(scaled);
        VecFx32Object_Destroy(path);
        VecFx32Object_Destroy(target);
    }
    ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor, current);
    F(s16, actor, 0xd6) = 27;
    F(s32, actor, 0x3c) = MulFx(F(s32, actor, 0x3c), 0xccd);
    F(s32, actor, 0x40) = MulFx(F(s32, actor, 0x40), 0xccd);
    F(s16, actor, 0x2b8) += F(s16, actor, 0x2ba);
    func_020befec(F(s16, actor, 0x298), 15);
    if (F(s16, actor, 0x298) % 15 == 0)
    {
        TrackedResourceActor_SpawnFromKey(0x21, P(actor, 0x18),
                                          P(actor, 0x18));
    }
    VecFx32Object_Destroy(current);
}

/* Initializes and scales a vector object's three fixed-point components. */
extern "C" void func_ov097_022188f8(void *result, void *source, s32 divisor)
{
    VecFx32Object_Init(result);
    F(s32, result, 4) = func_020adc90(F(s32, source, 4), divisor);
    F(s32, result, 8) = func_020adc90(F(s32, source, 8), divisor);
    F(s32, result, 12) = func_020adc90(F(s32, source, 12), divisor);
}

/* Runs the timed disappearance state and emits periodic debris effects. */
extern "C" void func_ov097_02218940(void *actor)
{
    F(s16, actor, 0xd6) = 27;
    F(u32, actor, 0x260) &= ~0x20u;
    s16 timer = F(s16, actor, 0x298);
    if (timer == 0)
    {
        Sound_PlayOwnedEffect(gSoundContext, 0x1ed, 9, actor, 0, 0x100);
    }
    if (timer < 240)
    {
        F(u8, actor, 0x24c) = 8;
        F(u32, actor, 0x260) |= 2;
        if (timer < 10 && ActorExtendedType2_GetDescriptorValue25(actor) == 1)
        {
            F(u32, actor, 0x260) &= ~8u;
        }
        else
        {
            F(u32, actor, 0x260) |= 8;
        }
        func_020befec(timer, 30);
        if (timer < 200 && timer % 30 == 0)
        {
            u32 random = genrand_int32();
            void *effectOwner =
                (void *)RuntimePresentationManager_GetGraphics3dPresentation(P(gGamePhaseRuntime, 0x2f7c));
            s32 height = func_ov097_02217afc(P(actor, 0x68));
            s32 randomX = (s32)(random % 36) - 18;
            Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt(effectOwner, 1,
                          randomX + (F(s32, actor, 0x1c) >> 12),
                          (F(s32, actor, 0x20) >> 12) -
                              (F(s32, actor, 0x24) >> 12) -
                              ((random >> 4) & 15) - height / 2);
        }
        F(s16, actor, 0x298) = timer + 1;
        F(s16, actor, 0xda) = 3;
        return;
    }
    F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0x10);
    F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 0x14);
    F(u8, actor, 0x2bc) = 0;
    s32 variant = ActorExtendedType2_GetDescriptorValue25(actor);
    func_ov097_022177e0(gGameWork, 0, variant == 0 ? 4 : 5, 0);
    F(s16, actor, 0x298) = 0;
    F(s16, actor, 0x2be) = 0;
    F(s16, actor, 0xda) = 4;
    F(u8, actor, 0x24c) = 0;
}

/* Dispatches the linked or unlinked actor behavior selected by field 0x2bc. */
extern "C" void func_ov097_02218b1c(void *actor, void *other,
                                     void *argument)
{
    if (F(u8, actor, 0x2bc) == 0)
    {
        func_ov097_02218d3c(actor);
    }
    else
    {
        func_ov097_02218b40(actor, other, argument);
    }
}

/* Empty interaction hook retained by the primary actor vtable. */
extern "C" void func_ov097_02218b3c(void)
{
}

/* Chooses the nearest eligible primary or secondary linked target. */
extern "C" void func_ov097_02218b40(void *actor, void *other,
                                     void *candidate)
{
    u8 delta[16];
    u8 temporary[16];
    func_ov078_02213c3c();
    F(u32, actor, 0x260) &= ~0xau;
    F(u8, actor, 0x24c) = 3;
    if (((Method)F(void *, F(void *, actor, 0), 0x38))(actor) != 0)
    {
        return;
    }
    VecFx32Object_Init(delta);
    s32 primaryDistance = 0x7fffffff;
    if ((F(u16, other, 0x1a) & 0x10) == 0)
    {
        void *primary = F(void *, gGamePhaseRuntime, 0x2ea4);
        func_ov097_02218d04(temporary, P(actor, 0x18), P(primary, 0x18));
        VecFx32Object_Assign(delta, temporary);
        VecFx32Object_Destroy(temporary);
        primaryDistance = VecFx32Object_GetMagnitude(delta);
    }
    s32 secondaryDistance = 0x7fffffff;
    if ((F(u16, other, 0x1a) & 0x20) != 0)
    {
        candidate = F(void *, gGamePhaseRuntime, 0x2ea8);
    }
    if (candidate != 0 && (F(u32, candidate, 0x268) & 0x10) != 0)
    {
        func_ov097_02218d04(temporary, P(actor, 0x18),
                            P(candidate, 0x18));
        VecFx32Object_Assign(delta, temporary);
        VecFx32Object_Destroy(temporary);
        secondaryDistance = VecFx32Object_GetMagnitude(delta) + 0x18000;
    }
    if ((primaryDistance > 0x3bfff ||
         secondaryDistance < primaryDistance ||
         primaryDistance == 0x7fffffff) &&
        secondaryDistance < 0x3c000 && secondaryDistance != 0x7fffffff)
    {
        F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0);
        F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 4);
        F(s16, actor, 0x298) = 0;
        u32 packed = data_020e6e68[F(u16, actor, 0x4e)];
        if (packed != 0)
        {
            Sound_PlayOwnedEffect(gSoundContext, packed >> 7, packed & 0x7f,
                          actor, 0, 0x100);
        }
    }
    VecFx32Object_Destroy(delta);
}

/* Initializes a vector object with the difference between two sources. */
extern "C" void func_ov097_02218d04(void *result, void *from, void *to)
{
    VecFx32Object_Init(result);
    func_020adfbc(from != 0 ? P(from, 4) : 0,
                  to != 0 ? P(to, 4) : 0, P(result, 4));
}

/* Runs the linked-target travel, arrival, animation, and terminal states. */
extern "C" void func_ov097_02218d3c(void *actor)
{
    u8 difference[16];
    u8 halfDifference[16];
    u8 endpoint[16];
    u8 curve[64];
    u8 position[16];

    if (F(s16, actor, 0x298) == 0 && F(s16, actor, 0xda) == 4)
    {
        F(u32, actor, 0x14) = (F(u32, actor, 0x14) & ~0x2000000u) | 0x40;
        F(s16, actor, 0x2c2) = 0;
        F(s16, actor, 0x2be) = 0;
        VecFx32Object_Assign(P(actor, 0x2c8), P(actor, 0x18));
        VecFx32Object_Assign(P(actor, 0x2d8),
                             P(F(void *, actor, 0x2c4), 0x18));
        F(s32, actor, 0x2e4) += 0x10000;
        F(s32, actor, 0x2e0) += 0x24000;
        s32 distance = Fx32Vector2_Magnitude(
            F(s32, actor, 0x2cc) - F(s32, actor, 0x2dc),
            F(s32, actor, 0x2d0) - F(s32, actor, 0x2e0));
        F(s16, actor, 0x2c0) = (s16)(func_020befec(distance, 6) >> 12) + 30;
        ++F(s16, actor, 0x298);
        Actor_PlayHorizontalSpatialSound(actor, 0x4281, 0);
        func_ov097_0221951c(actor, 0);
    }
    F(u8, actor, 0x24c) = 0;
    F(u32, actor, 0x260) &= 0xfffffbf5;
    F(s16, actor, 0xd6) = 27;
    F(s32, actor, 0x40) = 0;
    F(s32, actor, 0x3c) = 0;
    func_ov097_0221818c(P(actor, 0x220), 0, 0, 0);
    func_ov097_0221818c(P(actor, 0x260), 0, 0, 0);

    switch (F(u16, actor, 0xda))
    {
    case 4:
        func_ov097_0221818c(P(actor, 0x38), 0, 0, 0);
        func_ov097_0221818c(P(actor, 0x220), 0, 0, 0);
        func_ov097_0221818c(P(actor, 0x260), 0, 0, 0);
        if (++F(u16, actor, 0x2be) > F(u16, actor, 0x2c0))
        {
            F(s16, actor, 0xda) = 5;
            F(s16, actor, 0x2be) = 0;
            func_ov097_0221951c(actor, 0);
            func_ov097_022177e0(gGameWork, 0, 12, 2);
        }
        else
        {
            func_ov097_02218d04(difference, P(actor, 0x2d8),
                                P(actor, 0x2c8));
            func_ov097_022188f8(halfDifference, difference, 0x2000);
            func_ov097_02217ac4(endpoint, P(actor, 0x2c8), halfDifference);
            VecFx32Object_Destroy(halfDifference);
            VecFx32Object_Destroy(difference);
            F(s32, endpoint, 12) = F(s32, actor, 0x2e4) +
                (F(u16, actor, 0x2c0) * 3 / 2) * 0x1000;
            VecFx32Object_Init(position);
            func_0200634c(curve, P(actor, 0x2c8), P(actor, 0x2d8), endpoint);
            s32 t = func_020befec(F(u16, actor, 0x2be) << 12,
                                  F(u16, actor, 0x2c0));
            func_020064b8(position, curve, t);
            VecFx32Object_Assign(P(actor, 0x18), position);
            VecFx32Object_Destroy(position);
            func_0200637c(curve);
            VecFx32Object_Destroy(endpoint);
        }
        break;
    case 5:
        func_ov097_0221818c(P(actor, 0x38), 0, 0, 0);
        func_ov097_0221818c(P(actor, 0x220), 0, 0, 0);
        func_ov097_0221818c(P(actor, 0x260), 0, 0, 0);
        if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
        {
            F(s16, actor, 0xda) = 6;
            F(s16, actor, 0x2be) = 0;
            F(u32, actor, 0x14) &= ~0x40u;
        }
        break;
    case 7:
        F(u32, actor, 0x260) |= 0x200400;
        if (++F(u16, actor, 0x2be) > 60)
        {
            F(s16, actor, 0xda) = 6;
            F(s16, actor, 0x2be) = 0;
        }
        break;
    case 8:
        if (F(s16, actor, 0x2be) == 120)
        {
            GraphicsSpriteState_SetAnimationIndex(F(void *, actor, 0x54), 59);
            Sound_PlayOwnedEffect(gSoundContext, 0x1ed, 13, actor, 0, 0x200);
        }
        if (++F(u16, actor, 0x2be) > 209)
        {
            F(u8, actor, 0x2bc) = 1;
            s32 variant = ActorExtendedType2_GetDescriptorValue25(actor);
            func_ov097_022177e0(gGameWork, 0, variant == 0 ? 4 : 5, 1);
            F(u32, actor, 0x14) &= ~0x2000040u;
            F(s16, actor, 0x2be) = 0;
        }
        break;
    case 6:
    default:
        F(u32, actor, 0x260) |= 0x200020;
        {
            s32 variant = ActorExtendedType2_GetDescriptorValue25(actor);
            s32 value = func_ov097_02217fd8(gGameWork, 0,
                                            variant == 0 ? 2 : 3);
            if (value != 0 && F(s32, actor, 0x24) ==
                                  Actor_GetCachedTerrainHeight(actor))
            {
                F(s32, actor, 0x44) = 0x3000;
            }
        }
        break;
    }
}

/* Applies an interaction impulse, quartering it during terminal states. */
extern "C" void func_ov097_022191b8(void *actor, void *vector, s32 mode)
{
    if ((F(u32, actor, 0x260) & 0x8000) != 0)
    {
        return;
    }
    if (func_ov097_022194e8(actor) == 0)
    {
        u8 scaled[16];
        func_ov097_022188f8(scaled, vector, 0x4000);
        func_02033f7c(actor, scaled, mode);
        VecFx32Object_Destroy(scaled);
    }
    else
    {
        func_02033f7c(actor, vector, mode);
    }
}

/* Responds to a terminal collision by launching the other actor away. */
extern "C" void func_ov097_02219228(void *actor, void *other)
{
    if (F(u8, actor, 0x2bc) != 0 ||
        (F(s16, actor, 0xda) != 6 && F(s16, actor, 0xda) != 7))
    {
        return;
    }
    F(s16, actor, 0xda) = 7;
    F(u32, actor, 0xd0) |= 0x1000;
    F(s16, actor, 0x2be) = 0;
    void *primary = F(void *, gGamePhaseRuntime, 0x2ea4);
    s32 dx = F(s32, primary, 0x1c) - F(s32, other, 0x1c);
    s32 dy = F(s32, primary, 0x20) - F(s32, other, 0x20);
    if (ActorExtendedType2_GetDescriptorValue25(actor) == 0)
    {
        if (dx < 0)
        {
            dx = 0;
        }
    }
    else if (dx > 0)
    {
        dx = 0;
    }
    s32 distance = Fx32Vector2_Magnitude(dx, dy);
    if (distance <= 0x19a)
    {
        return;
    }
    dx = func_020adc90(dx, distance);
    dy = func_020adc90(dy, distance);
    s32 speed = F(s16, F(void *, other, 0x1fc), 10) * 16;
    if (func_ov097_0221a43c(other) == 0)
    {
        speed = MulFx(speed, 0x1333);
    }
    F(s32, other, 0x3c) = MulFx(dx, speed);
    s32 vertical = MulFx(dy, speed);
    if (ActorExtendedType2_GetDescriptorValue25(actor) == 0)
    {
        if (vertical > 0x1800)
        {
            vertical = 0x1800;
            F(s32, other, 0x44) = 0x1000;
        }
        else
        {
            F(s32, other, 0x44) = 0x3000;
        }
    }
    else if (vertical < -0x1800)
    {
        vertical = -0x1800;
        F(s32, other, 0x44) = 0x1000;
    }
    else
    {
        F(s32, other, 0x44) = 0x3000;
    }
    F(s32, other, 0x40) = vertical;
    Actor_PlayRadialSpatialSound(actor, 0xf687, 0);
    u8 point[16];
    VecFx32Object_InitCopy(point, P(other, 0x18));
    void *effect = (void *)Heap_Alloc(0x14, data_ov097_0221aa1c, 4,
                                      gHeapContext);
    if (effect != 0)
    {
        AuxiliaryTimedSpritePresentation_Init(
            effect, point, F(void *, F(void *, actor, 0x54), 0), 0x1620,
            0x1001, 0x1621, 0, -0x20, 1, 1);
    }
    VecFx32Object_Destroy(point);
}

/* Enters the terminal animation when the actor is in an eligible state. */
extern "C" void func_ov097_02219458(void *actor)
{
    if (func_ov097_022194e8(actor) == 0)
    {
        return;
    }
    F(s16, actor, 0xda) = 8;
    F(s16, actor, 0x2be) = 0;
    F(s32, actor, 0x44) += 0x4000;
    if (F(s32, actor, 0x44) > 0x6000)
    {
        F(s32, actor, 0x44) = 0x6000;
    }
    u32 previous = F(u32, actor, 0xd0);
    F(u32, actor, 0xd0) |= 0x3000;
    if ((previous & 0x10) == 0 &&
        F(s32, actor, 0x24) == F(s32, actor, 0x1dc))
    {
        func_ov097_0221951c(actor, 0);
    }
    Actor_PlayRadialSpatialSound(actor, 0xf684, 0);
}

/* Reports whether the unlinked actor is in terminal state six or seven. */
extern "C" s32 func_ov097_022194e8(void *actor)
{
    return F(u8, actor, 0x2bc) == 0 &&
           (F(s16, actor, 0xda) == 6 || F(s16, actor, 0xda) == 7);
}

/* Spawns the mode-selected auxiliary terminal presentation. */
extern "C" void func_ov097_0221951c(void *actor, s32 mode)
{
    s32 index = mode == 0 ? 3 : 0;
    void *effect = (void *)Heap_Alloc(0x14, data_ov097_0221aa1c, 4,
                                      gHeapContext);
    if (effect != 0)
    {
        AuxiliaryTimedSpritePresentation_Init(
            effect, P(actor, 0x18), F(void *, F(void *, actor, 0x54), 0),
            data_ov097_0221a4a4[index], data_ov097_0221a4a4[index + 1],
            data_ov097_0221a4a4[index + 2], 0, 0x80, 2, 1);
    }
}

/* Returns the fixed animation identifier used by the primary actor. */
extern "C" s32 func_ov097_022195d8(void)
{
    return 54;
}

/* Returns the fixed-point scale constant used by the primary actor. */
extern "C" s32 func_ov097_022195e0(void)
{
    return 0x10e000;
}

/* Returns the fixed resource identifier used by the primary actor. */
extern "C" s32 func_ov097_022195ec(void)
{
    return 41;
}

/* Constructs the linked partner actor and assigns its shared table slot. */
extern "C" void *func_ov097_022195f4(void *actor, void *descriptor,
                                      s32 arg2, s32 arg3)
{
    func_ov075_02212ae0(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov097_0221a80c;
    F(void *, actor, 0x2b0) = 0;
    F(s32, actor, 0x2b4) = 0;
    F(s32, actor, 0x2bc) = 0;
    func_ov097_02217934(P(actor, 8), -14, -6, 14, 6);

    void *collection = (void *)GamePhaseRuntime_GetActorCollection(
        F(void *, gGamePhaseRuntime, 0), 1);
    s32 count = 0;
    for (s32 index = 0; index < F(s32, collection, 0x2e74); ++index)
    {
        void *candidate = F(void *, collection, index * 4);
        if (candidate != 0 && F(u8, candidate, 0x4d) == 2 &&
            F(s8, candidate, 0x27e) == 3)
        {
            ++count;
        }
    }
    F(s32, actor, 0x2b8) = count + 6;
    func_ov097_022177e0(gGameWork, 0, count + 9,
                         F(s16, descriptor, 0x52));
    func_ov097_022177e0(gGameWork, 0, F(s32, actor, 0x2b8), 1);
    F(u32, actor, 0x260) |= 0x200000;
    return actor;
}

/* Destroys the linked partner's recovered base object. */
extern "C" void *func_ov097_02219718(void *actor)
{
    return func_ov078_02212ba0(actor);
}

/* Destroys and releases a linked partner allocation. */
extern "C" void *func_ov097_0221972c(void *actor)
{
    func_ov078_02212ba0(actor);
    Heap_Free(actor);
    return actor;
}

/* Runs the partner's virtual reset hook and clears elapsed progress. */
extern "C" void func_ov097_02219748(void *actor)
{
    ActorExtendedType2_RunVirtualFCAndResetProgress(actor);
    F(s32, actor, 0x2bc) = 0;
}

/* Return link-scaled signed FX32 gravity acceleration for this actor type. */
extern "C" s32 func_ov097_02219760(void *actor)
{
    if (F(void *, actor, 0x2b0) != 0)
        return func_020befec(Actor_GetGravityAcceleration(actor) << 3, 9);
    return Actor_GetGravityAcceleration(actor);
}

/* Advances the link timeout and updates its timed transition. */
extern "C" void func_ov097_0221978c(void *actor, void *context)
{
    if (F(s32, actor, 0x2bc) < 1200)
    {
        ++F(s32, actor, 0x2bc);
        if (F(s32, actor, 0x2bc) == 900)
        {
            func_ov097_022177e0(gGameWork, 0, F(s32, actor, 0x2b8), 0);
        }
    }
    ActorExtendedType2_UpdateTimedAttachmentTransition(actor, context);
}

/* Validates the linked target against bounds and selects active callbacks. */
extern "C" void func_ov097_022197e0(void *actor, void *, void *target)
{
    void *bounds = F(void *, actor, 0x278);
    if (bounds != 0)
    {
        target = F(void *, actor, 0x228);
    }
    if (bounds != 0 && target != 0)
    {
        s32 x = (F(s32, target, 0x1c) << 4) >> 16;
        s32 y = (F(s32, target, 0x20) << 4) >> 16;
        s32 inside = 0;
        for (s32 index = 0; index < F(s32, bounds, 8); ++index)
        {
            s16 *box = (s16 *)P(F(void *, bounds, 4), index * 8);
            if (x >= box[0] && x < box[2] && y >= box[1] && y < box[3])
            {
                inside = 1;
                break;
            }
        }
        if (inside == 0)
        {
            ((Method)F(void *, F(void *, actor, 0), 0xe8))(actor);
            return;
        }
    }
    F(void *, actor, 0x2a4) = F(void *, data_ov097_0221a4c8, 0x68);
    F(void *, actor, 0x2a8) = F(void *, data_ov097_0221a4c8, 0x6c);
    F(s16, actor, 0x298) = 0;
    F(s16, actor, 0x29c) = 0;
    F(u32, actor, 0x260) |= 10;
}

/* Copies the attached actor's transform or enters the detached fallback. */
extern "C" void func_ov097_022198e8(void *actor)
{
    void *linked = F(void *, actor, 0x2b0);
    if (linked == 0)
    {
        func_ov078_02213c3c();
    }
    else
    {
        u8 vector[16];
        VecFx32Object_InitCopy(vector, P(linked, 0x18));
        s32 height = F(s32, vector, 12) + F(s32, actor, 0x2b4);
        if (F(s32, actor, 0x24) < height)
        {
            F(s32, actor, 0x24) = height;
            F(s32, actor, 0x44) = 0x1800;
        }
        F(s32, actor, 0x1c) = F(s32, vector, 4);
        F(s32, actor, 0x2c) = F(s32, vector, 4);
        F(s32, actor, 0x20) = F(s32, vector, 8);
        F(s32, actor, 0x30) = F(s32, vector, 8);
        F(u8, actor, 0x24c) = 0;
        VecFx32Object_Destroy(vector);
    }
    F(u32, actor, 0x260) |= 10;
}

/* Establishes a partner link and synchronizes transform and feedback state. */
extern "C" void func_ov097_02219970(void *actor, void *linked,
                                      s32 heightOffset)
{
    F(void *, actor, 0x2b0) = linked;
    if (linked == 0)
    {
        return;
    }
    u8 vector[16];
    VecFx32Object_InitComponents(vector, 0, 0, 0);
    ActorExtendedType2_InitializeTransformAndMotion(actor, P(linked, 0x18),
                                                    vector);
    VecFx32Object_Destroy(vector);
    ((Method)F(void *, F(void *, actor, 0), 0x54))(actor, 1);
    ((Method)F(void *, F(void *, actor, 0), 0xd4))(
        actor, F(void *, F(void *, gGamePhaseRuntime, 0), 0x2ea4));
    F(s32, actor, 0x218) = F(s32, data_ov097_0221a4c8, 0x20);
    F(s32, actor, 0x21c) = F(s32, data_ov097_0221a4c8, 0x24);
    F(u32, actor, 0x10) |= 0x1f0000;
    F(u32, actor, 0x14) &= ~0x2000000u;
    F(s32, actor, 0x2b4) = heightOffset;
    VecFx32Object_Assign(P(actor, 0x18), P(linked, 0x18));
    F(s32, actor, 0x24) += heightOffset;
    func_ov097_022177e0(gGameWork, 0, F(s32, actor, 0x2b8), 1);
    F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000u) | 0xffe0;
    Sound_PlayOwnedEffect(gSoundContext, 0x1ed, 10, actor, 0, 0x100);
}

/* Clears a completed link and restores the partner's ordinary actor flags. */
extern "C" void func_ov097_02219aa8(void *actor)
{
    if (func_ov097_02217fec(actor) != 0)
    {
        return;
    }
    func_ov097_0221818c(P(actor, 0x38), 0, 0, 0);
    func_ov097_0221818c(P(actor, 0x88), 0, 0, 0);
    func_ov097_0221818c(P(actor, 0x98), 0, 0, 0);
    void *linked = F(void *, actor, 0x2b0);
    if (linked != 0 && F(s32, actor, 0x24) == F(s32, linked, 0x24))
    {
        F(s32, actor, 0x44) = 0x3000;
    }
    F(u32, actor, 0x10) &= ~0x1f0000u;
    F(u32, actor, 0x14) |= 0x2000000;
    F(u32, actor, 0x5c) &= 0xffff0000u;
    F(void *, actor, 0x2b0) = 0;
}

/* Returns the partner actor's fixed descriptor category. */
extern "C" s32 func_ov097_02219b50(void)
{
    return 50;
}

/* Reports that the partner supplies no optional descriptor mode. */
extern "C" s32 func_ov097_02219b58(void)
{
    return 0;
}

/* Copies an actor position into a caller-owned vector object. */
extern "C" void func_ov097_02219b60(void *destination, void *actor)
{
    VecFx32Object_InitCopy(destination, P(actor, 0x18));
}

/* Returns the actor's raw 0x80 state bit. */
extern "C" u32 func_ov097_02219b70(void *actor)
{
    return F(u32, actor, 0xd0) & 0x80;
}

/* Reports whether the actor's 0x40 state bit is set. */
extern "C" s32 func_ov097_02219b7c(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_02219b90(void)
{
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_02219b94(void)
{
}

/* Returns the fixed partner presentation extent. */
extern "C" s32 func_ov097_02219b98(void)
{
    return 16;
}

/* Returns the address of the actor's embedded position vector. */
extern "C" void *func_ov097_02219ba0(void *actor)
{
    return P(actor, 0x18);
}

/* Returns the fixed partner transform scale. */
extern "C" s32 func_ov097_02219ba8(void)
{
    return 0xc0000;
}

/* Dispatches the shared virtual operation with its optional value cleared. */
extern "C" void func_ov097_02219bb0(void *actor, s32 value)
{
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, value, 0);
}

/* Dispatches the paired shared virtual operation with no optional value. */
extern "C" void func_ov097_02219bc8(void *actor, s32 value)
{
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, value, 0);
}

/* Reports that this virtual capability is disabled by default. */
extern "C" s32 func_ov097_02219be0(void)
{
    return 0;
}

/* Reports whether callback processing is enabled and not suppressed. */
extern "C" s32 func_ov097_02219be8(void *actor)
{
    if ((F(u32, actor, 0x260) & 8) == 0)
    {
        return 0;
    }
    if ((F(u32, actor, 0x260) & 2) == 0)
    {
        return 1;
    }
    return ((Method)F(void *, F(void *, actor, 0), 0xa8))(actor) == 0;
}

/* Reports whether the current byte state is eight. */
extern "C" s32 func_ov097_02219c30(void *actor)
{
    return F(s8, actor, 0x24c) == 8;
}

/* Reports whether the primary animation state differs from sixteen. */
extern "C" s32 func_ov097_02219c44(void *actor)
{
    return F(s16, actor, 0xd6) != 16;
}

/* Reports whether the primary animation is state five or six. */
extern "C" s32 func_ov097_02219c64(void *actor)
{
    return F(s16, actor, 0xd6) == 5 || F(s16, actor, 0xd6) == 6;
}

/* Reports whether the secondary animation is state nine or ten. */
extern "C" s32 func_ov097_02219c7c(void *actor)
{
    return F(s16, actor, 0xd8) == 9 || F(s16, actor, 0xd8) == 10;
}

/* Reports whether the primary animation is state nine or ten. */
extern "C" s32 func_ov097_02219c94(void *actor)
{
    return F(s16, actor, 0xd6) == 9 || F(s16, actor, 0xd6) == 10;
}

/* Returns the first fixed motion magnitude. */
extern "C" s32 func_ov097_02219cac(void)
{
    return 0x800;
}

/* Returns the second fixed motion magnitude. */
extern "C" s32 func_ov097_02219cb4(void)
{
    return 0x800;
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_02219cbc(void)
{
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_02219cc0(void)
{
}

/* Toggles the embedded presentation object's visibility bit. */
extern "C" void func_ov097_02219cc4(void *actor, s32 hidden)
{
    void *presentation = F(void *, actor, 0x288);
    if (hidden == 0)
    {
        F(u16, presentation, 0x24) |= 4;
    }
    else
    {
        F(u16, presentation, 0x24) &= (u16)~4;
    }
}

/* Returns the larger fixed motion limit. */
extern "C" s32 func_ov097_02219ce4(void)
{
    return 0x20000;
}

/* Returns the unit fixed-point scale. */
extern "C" s32 func_ov097_02219cec(void)
{
    return 0x1000;
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_02219cf4(void)
{
}

/* Marks the actor's recovered 0x80 runtime capability. */
extern "C" void func_ov097_02219cf8(void *actor)
{
    F(u32, actor, 0x260) |= 0x80;
}

/* Launches the actor using the base class's random-motion routine. */
extern "C" void func_ov097_02219d08(void *actor)
{
    ActorExtendedType2_LaunchRandomMotion(actor);
}

/* Returns the fixed vertical launch speed. */
extern "C" s32 func_ov097_02219d14(void)
{
    return 0x1800;
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_02219d1c(void)
{
}

/* Constructs a tracked resource actor and reconnects an available partner. */
extern "C" void *func_ov097_02219d20(void *actor, void *descriptor,
                                      s32 arg2, s32 arg3)
{
    TrackedResourceActorType28_InitBase(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov097_0221aaa4;
    F(s32, actor, 0x200) = 0;
    F(void *, actor, 0x204) = 0;

    s32 left = func_ov097_02217fd8(gGameWork, 0, 4);
    s32 right = func_ov097_02217fd8(gGameWork, 0, 5);
    s32 shouldLink = left == 2 || right == 2;
    if (!shouldLink && (left == 0 || right == 0))
    {
        s32 retries = func_ov097_02217fd8(gGameWork, 0, 12);
        if (retries > 0)
        {
            shouldLink = 1;
            func_ov097_022177e0(gGameWork, 0, 12, (s16)(retries - 1));
        }
    }
    if (shouldLink)
    {
        for (s32 index = 0; index < 3; ++index)
        {
            if (func_ov097_02217fd8(gGameWork, 0, index + 6) == 0)
            {
                void *collection = (void *)Actor_GetOwningCollection(actor);
                s32 key = func_ov097_02217fd8(gGameWork, 0, index + 9);
                void *partner = (void *)ActorCollection_FindActorByRuntimeId(
                    collection, key);
                F(void *, actor, 0x204) = partner;
                func_ov097_02219970(partner, actor, 0x19000);
                break;
            }
        }
    }
    return actor;
}

/* Destroys the tracked actor after releasing any active partner link. */
extern "C" void *func_ov097_02219e4c(void *actor)
{
    F(void *, actor, 0) = data_ov097_0221aaa4;
    if (F(void *, actor, 0x204) != 0)
    {
        func_ov097_02219aa8(F(void *, actor, 0x204));
    }
    TrackedResourceActorType28_Destroy(actor);
    return actor;
}

/* Destroys and frees the tracked actor allocation. */
extern "C" void *func_ov097_02219e80(void *actor)
{
    F(void *, actor, 0) = data_ov097_0221aaa4;
    if (F(void *, actor, 0x204) != 0)
    {
        func_ov097_02219aa8(F(void *, actor, 0x204));
    }
    TrackedResourceActorType28_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Initializes launch motion and presentation for the tracked actor. */
extern "C" void func_ov097_02219ebc(void *actor, void *descriptor,
                                      void *target)
{
    F(void *, actor, 0x1fc) = descriptor;
    u8 vector[16];
    func_ov097_02218d04(vector, target, P(actor, 0x18));
    VecFx32Object_Assign(P(actor, 0x38), vector);
    VecFx32Object_Destroy(vector);
    s32 magnitude = VecFx32Object_GetMagnitude(P(actor, 0x38));
    if (magnitude < 4)
    {
        magnitude = 4;
    }
    F(s32, actor, 0x3c) = func_020adc90(F(s32, actor, 0x3c), magnitude);
    F(s32, actor, 0x40) = func_020adc90(F(s32, actor, 0x40), magnitude);
    F(s32, actor, 0x44) = func_020adc90(F(s32, actor, 0x44), magnitude);
    func_ov097_0221a004(P(actor, 0x38), F(s16, descriptor, 10) << 4);
    F(s32, actor, 0x44) = 0x6000;
    F(u16, F(void *, actor, 0x54), 0x36) =
        (u16)func_020adae4(F(s16, descriptor, 10), 3);
    F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000u) | 8;
    s32 angle = func_020ae024(F(s32, actor, 0x40),
                              -F(s32, actor, 0x3c));
    u16 adjusted = (u16)(angle + 0xc000);
    GraphicsSpriteState_SetAnimationIndex(F(void *, actor, 0x54),
                                           adjusted >> 13);
    F(u32, actor, 0x14) |= 0x800002;
    F(u32, actor, 0xd0) |= 0x2000;
    F(u32, actor, 0x10) =
        (F(u32, actor, 0x10) | 0x1f0000) & ~0x20000u;
    F(s16, actor, 0x68) = -24;
    F(s16, actor, 0x6a) = -24;
    F(s16, actor, 0x6c) = 24;
    F(s16, actor, 0x6e) = 24;
}

/* Scales the three spatial components of an embedded vector. */
extern "C" void func_ov097_0221a004(void *vector, s32 scale)
{
    F(s32, vector, 4) = MulFx(F(s32, vector, 4), scale);
    F(s32, vector, 8) = MulFx(F(s32, vector, 8), scale);
    F(s32, vector, 12) = MulFx(F(s32, vector, 12), scale);
}

/* Runs the tracked actor's global trigger and ordinary post-update passes. */
extern "C" void func_ov097_0221a05c(void *actor, void *context)
{
    Type7Actor_ProcessGlobalInteractionTrigger(actor, context);
    TrackedResourceActor_PostUpdate(actor, context);
}

/* Advances the launched actor's animation, height flags, and virtual hooks. */
extern "C" void func_ov097_0221a07c(void *actor)
{
    ((Method)F(void *, F(void *, actor, 0), 0x18))(actor);
    F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~4;
    if ((F(u8, actor, 0x4b) & 15) != 0)
    {
        ((Method)F(void *, F(void *, actor, 0), 0xc4))(actor, 0);
    }
    ++F(s16, actor, 0x1f8);
    ((Method)F(void *, F(void *, actor, 0), 0xd4))(actor);
    ((Method)F(void *, F(void *, actor, 0), 0xa4))(actor);
    Actor_SynchronizeStatePresentation(actor);
    F(u32, actor, 0x5c) = (F(u32, actor, 0x5c) & 0xffff0000u) | 0xffe8;
    if ((F(u32, actor, 0x1f4) & 1) == 0)
    {
        s32 delta = F(s32, actor, 0x24) - Actor_GetCachedTerrainHeight(actor);
        if (delta < 0x48000)
        {
            F(u32, actor, 0x10) &= ~0x20000u;
        }
        else
        {
            F(u32, actor, 0x10) |= 0x20000;
        }
    }
    if ((F(u32, actor, 0xd0) & 0x2000) == 0)
    {
        if ((F(u32, actor, 0x1f4) & 1) == 0)
        {
            F(u32, actor, 0x10) &= ~0x1f0000u;
            F(u32, actor, 0x14) =
                (F(u32, actor, 0x14) & ~2u) | 0x800000;
            F(u32, actor, 0x1f4) |= 1;
            Actor_PlayRadialSpatialSound(actor, 0xf686, 0);
        }
        F(u32, actor, 0xd0) |= 0x2000;
    }
    ((Method)F(void *, F(void *, actor, 0), 0x20))(actor);
}

/* Resolves a target interaction and queues the tracked actor when complete. */
extern "C" void func_ov097_0221a1c8(void *actor, void *target)
{
    s32 complete = 0;
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(
            gActorRuntimeCollection) == 0 && target != 0)
    {
        complete = 1;
        u8 vector[16];
        VecFx32Object_InitCopy(vector, P(actor, 0x38));
        F(s32, vector, 12) = 0;
        void *descriptor = F(void *, actor, 0x1fc);
        func_ov097_0221a004(vector, F(s16, descriptor, 0x2a) << 4);
        s32 dispatch = 0;
        if (F(u8, target, 0x4d) == 1)
        {
            dispatch = F(s16, descriptor, 0x0c) > 0;
        }
        else
        {
            dispatch = F(s16, descriptor, 0x0e) > 0;
            if (F(u8, target, 0x4d) == 2)
            {
                complete = 0;
                if (F(s32, actor, 0x200) == 0 &&
                    F(s8, target, 0x27e) == 0x1d)
                {
                    func_ov097_02219228(target, actor);
                    F(s32, actor, 0x200) = 1;
                    dispatch = 0;
                }
                else if (F(s8, target, 0x27e) == 0x1d)
                {
                    complete = 1;
                }
            }
        }
        if (dispatch)
        {
            ((Method)F(void *, F(void *, target, 0), 0xb8))(
                target, vector, 1);
        }
        VecFx32Object_Destroy(vector);
    }
    else if (target == 0)
    {
        complete = 1;
    }

    if (complete)
    {
        F(s32, actor, 0x3c) = 0;
        F(s32, actor, 0x40) = 0;
        F(s32, actor, 0x44) = 0;
        F(u16, actor, 0x1f0) = (F(u16, actor, 0x1f0) & 0x8000) | 2;
        F(u32, actor, 0x10) |= 0x1f0000;
        F(s16, actor, 0x1f8) = 0;
        F(u32, actor, 0x14) &= 0xff7fffbf;
        void *collection = (void *)Actor_GetOwningCollection(actor);
        ActorCollection_QueueActorForRemoval(collection, actor);
        TrackedResourceActor_EmitRecordEffects(actor);
    }
    else if (target != 0)
    {
        Actor_PlayRadialSpatialSound(actor, 0xf686, 0);
    }
    TrackedResourceActor_DispatchTargetInteraction(actor, target);
}

/* Updates the tracked actor's height-dependent collision bit. */
extern "C" void func_ov097_0221a3b8(void *actor)
{
    s32 active = ((Method)F(void *, F(void *, actor, 0), 0xd0))(actor);
    if (active != 0 && F(s16, actor, 0x1f8) > 20)
    {
        s32 delta = F(s32, actor, 0x24) - Actor_GetCachedTerrainHeight(actor);
        if (delta < 0x18000)
        {
            F(u32, actor, 0x10) &= ~0x40000u;
        }
        else
        {
            F(u32, actor, 0x10) |= 0x40000;
        }
    }
    else
    {
        F(u32, actor, 0x10) |= 0x40000;
    }
}

/* Reports whether the tracked record has a nonzero low state value. */
extern "C" s32 func_ov097_0221a420(void *actor)
{
    return (F(u16, actor, 0x1f0) & 0x7fff) != 0;
}

/* Reports whether the tracked actor currently owns a linked partner. */
extern "C" s32 func_ov097_0221a43c(void *actor)
{
    return F(void *, actor, 0x204) != 0;
}

/* Reports the default disabled state for the optional virtual feature. */
extern "C" s32 func_ov097_0221a450(void)
{
    return 0;
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_0221a458(void)
{
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_0221a45c(void)
{
}

/* Marks the tracked actor's raw 0x80 state bit. */
extern "C" void func_ov097_0221a460(void *actor)
{
    F(u32, actor, 0xd0) |= 0x80;
}

/* Reports the first disabled tracked-actor capability. */
extern "C" s32 func_ov097_0221a470(void)
{
    return 0;
}

/* Reports the second disabled tracked-actor capability. */
extern "C" s32 func_ov097_0221a478(void)
{
    return 0;
}

/* Reports the third disabled tracked-actor capability. */
extern "C" s32 func_ov097_0221a480(void)
{
    return 0;
}

/* Reports the fourth disabled tracked-actor capability. */
extern "C" s32 func_ov097_0221a488(void)
{
    return 0;
}

/* Empty recovered virtual hook. */
extern "C" void func_ov097_0221a490(void)
{
}

/* Returns the tracked actor's fixed transform scale. */
extern "C" s32 func_ov097_0221a494(void)
{
    return 0x100000;
}
