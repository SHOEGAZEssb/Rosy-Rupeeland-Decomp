#include "tingle/types.h"

/* Recovered overlay 75 shared actor, interaction, and linked-actor runtime. */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define P(base, offset) ((void *)((u8 *)(base) + (offset)))
typedef s32 (*Method)(...);

extern "C" u8 *data_021052fc;
extern "C" void *gHeapContext;
extern "C" void *gGameWork;
extern "C" void *gSoundContext;
extern "C" void *gLupyContext;
extern "C" void *gSceneManager;
extern "C" void *gActorRuntimeCollection;
extern "C" s16 data_020c9670[];
extern "C" u8 data_020e6adc[], data_020e6b74[], data_020e6ca4[];
extern "C" u16 data_020e6e68[];
extern "C" void *data_020f4e18;
extern "C" u8 gTrackedResourceActorRecordTable[];
extern "C" u8 data_ov075_02216cc8[], data_ov075_02216cd8[];
extern "C" u8 data_ov075_02216ce0[], data_ov075_02216cf0[];
extern "C" u8 data_ov075_02216d00[];
extern "C" u8 data_ov075_02216db0[], data_ov075_02216f90[];
extern "C" u8 data_ov075_02217168[], data_ov075_022171bc[];
extern "C" u8 data_ov075_02217170[];
extern "C" u8 data_ov075_02217280[], data_ov075_02217288[];
extern "C" u8 data_ov075_02217290[], data_ov075_022172b0[];
extern "C" u8 data_ov075_02217298[], data_ov075_022172c0[];
extern "C" u8 data_ov075_022172d8[];
extern "C" u8 data_ov075_022172f8[], data_ov075_02217300[];
extern "C" u8 data_ov075_02217308[];
extern "C" u8 data_ov075_02217348[], data_ov075_02217350[];
extern "C" u8 data_ov075_02217358[];
extern "C" u8 data_ov075_02217410[];
extern "C" u8 data_ov075_022175ec[];
extern "C" u8 data_ov075_022177d0[];

#define EXT(name) extern "C" s32 name(...)
EXT(ActorExtendedType2_Init);
EXT(ActorDerivedRuntime_DestroyAlternate);
EXT(ActorDerivedRuntime_Init);
EXT(ActorDerivedRuntime_UpdateFrame);
EXT(ActorExtendedLinked_Destroy);
EXT(ActorExtendedLinked_Init);
EXT(ActorExtendedLinked_UpdateFrame);
EXT(ActorExtendedType2_CopyAdjustedDescriptor);
EXT(ActorExtendedType2_GetDescriptorValue25);
EXT(ActorExtendedType2_InitializeReentryState);
EXT(ActorExtendedType2_ResetVerticalMotionCallbacks);
EXT(ActorExtendedType2_IsInteractionEligible);
EXT(ActorExtendedType2_LaunchRandomMotion);
EXT(ActorExtendedType2_DispatchNearTargetState);
EXT(ActorExtendedType2_GetDescriptorValue28);
EXT(ActorExtendedLinkSource_Destroy);
EXT(ActorExtendedLinkSource_Init);
EXT(ActorExtendedLinkSource_ClearPartnerLinkedFlag);
EXT(ActorExtendedLinkSource_ClearRuntimeFlag2);
EXT(ActorExtendedLinkSource_LinkPartner);
EXT(ActorExtendedLinkSource_UpdateFrame);
EXT(Actor_RestoreSavedFlags);
EXT(Actor_RandomizeValueByTenPercent);
EXT(ActorMotionAreaFollower_GetPosition);
EXT(ActorDerivedType1_GetSingletonObject);
EXT(ActorDerivedType1_TeardownRecordAndApplyMotionImpulse);
EXT(Actor_GetCollection);
EXT(Actor_QueryTerrainCell);
EXT(Actor_QueryTerrainHeight);
EXT(ActorCollection_GetSpriteOwner);
EXT(ActorRuntimeCollection_GetPendingAttachmentFlag);
EXT(Actor_SetRuntimeFlag80);
EXT(Actor_UpdateAnimationState);
EXT(AuxiliaryTimedSpritePresentation_Init);
EXT(DualLayerTileRenderer_SetPackedTileValue);
EXT(GraphicsSpriteGroup_CreateState);
EXT(GraphicsSpriteGroup_ReplaceStateResources);
EXT(GameWork_TestFlag);
EXT(GamePhaseCurrencyHud_AddCurrency);
EXT(InteractionWaypointCursor_Advance);
EXT(InteractionWaypointCursor_GetCurrentDurationFrames);
EXT(InteractionWaypointCursor_GetCurrentRecord);
EXT(InteractionWaypointCursor_GetCurrentYPointer);
EXT(Type7Actor_GetStateCode);
EXT(PresentationList_AppendObject);
EXT(SceneManager_GetCurrent);
EXT(Sound_Play);
EXT(OverlayManager_GetGlobal);
EXT(OverlayManager_LoadOverlay);
EXT(VecFx32Bezier_Evaluate3D);
EXT(Actor_GetCachedTerrainHeight);
EXT(Actor_ClearTransientContactState);
EXT(GamePhaseRuntime_GetActorCollection);
EXT(func_02003e2c);
EXT(func_02003e20);
EXT(func_02003e14);
EXT(func_02004fe0);
EXT(func_0200500c);
EXT(func_02005030);
EXT(func_02005058);
EXT(func_0200634c);
EXT(func_0200637c);
EXT(func_02031720);
EXT(Actor_TurnTowardVector);
EXT(Actor_TurnTowardTargetPosition);
EXT(func_020064b8);
EXT(func_0201f864);
EXT(func_02022cb0);
EXT(func_02033b38);
EXT(func_02032a64);
EXT(Actor_GetCachedTerrainHeight);
EXT(func_020349b8);
EXT(func_0203e494);
EXT(func_020405c8);
EXT(func_020050a4);
EXT(ActorExtendedType2_GetDescriptorValue2A);
EXT(func_0204368c);
EXT(Sound_PlayOwnedEffect);
EXT(Sound_StopEffect);
EXT(Sound_IsEffectPlaying);
EXT(func_0204cfa4);
EXT(func_0204cff4);
EXT(func_02071ee0);
EXT(func_02050078);
EXT(func_02072b68);
EXT(func_020adc90);
EXT(func_020adfbc);
EXT(func_020adff0);
EXT(func_020ae024);
EXT(func_020befec);
EXT(VecFx32Object_InitCopy);
EXT(genrand_int32);
#undef EXT

extern "C" s32 func_ov075_02212d80(void *actor);
extern "C" s32 func_ov075_02212e04(void *actor);
extern "C" void func_ov075_02212f10(void *object, s32 x, s32 y, s32 z);
extern "C" void func_ov075_02212fd8(void *actor);
extern "C" void func_ov075_02213ca4(void *source, void *target);
extern "C" void func_ov075_02213cc0(void *actor);
extern "C" void func_ov075_02213cfc(void *actor);
extern "C" void func_ov075_022132e8(void *actor, const void *target,
                                     s32 maximumStep);
extern "C" s32 func_ov075_02213f08(void *actor);
extern "C" s32 func_ov075_022152ac(void *actor);
extern "C" s32 func_ov075_022154e8(void *actor);
extern "C" void func_ov075_022158bc(void *actor);
extern "C" void func_ov075_02215910(void *actor);
extern "C" void func_ov075_02215930(void *actor, s32 value);
extern "C" s32 func_ov075_0221625c(void *actor);
extern "C" void func_ov075_0221627c(void *actor);
extern "C" void func_ov075_0221647c(void *actor, void *target, s32 dx,
                                     s32 dy, s32 distance);
extern "C" void func_ov075_022168a8(void *result, const void *source,
                                     s32 scalar);
extern "C" void func_ov075_022168f0(void *result, const void *left,
                                     const void *right);
extern "C" s32 func_ov075_02214770(void *actor, const void *target);
extern "C" s32 func_ov075_02214d88(void *actor, s32 unused);
extern "C" s32 func_ov075_02214f18(void *actor, void *target);
extern "C" void func_ov059_0220fd20(void *object, s32 mode, s32 duration);

static s32 Invoke(void *object, s32 offset)
{
    return ((Method)F(void *, F(void *, object, 0), offset))(object);
}

static s32 InvokeMember(void *object, u32 callback, s32 encoding,
                        void *argument)
{
    u8 *adjusted = (u8 *)object + (encoding >> 1);
    Method method = (encoding & 1) != 0
                        ? (Method)F(void *, F(void *, adjusted, 0), callback)
                        : (Method)callback;
    return method(adjusted, argument);
}

static s32 MulFx(s32 left, s32 right)
{
    return (s32)(((long long)left * right + 0x800) >> 12);
}

static void *ConstructBaseActor(void *actor, void *descriptor, s32 arg2,
                                s32 arg3)
{
    u8 config[48];
    ActorExtendedType2_Init(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov075_02216f90;
    F(u32, actor, 0x298) = 0;
    F(u32, actor, 0x14) |= 0x150;
    F(u32, actor, 0x10) |= 0x60000;
    F(u32, actor, 0xd0) |= 0x20000;
    if (F(s8, actor, 0x27e) != 15)
        Invoke(actor, 0x1d4);
    ((Method)F(void *, F(void *, actor, 0), 0xc8))(actor, config);
    F(void *, actor, 0x2a0) = 0;
    if (config[37] != 0xff)
    {
        for (s32 i = 0; i < 67; ++i)
        {
            void *record = P(gTrackedResourceActorRecordTable, i * 0x32);
            if ((s32)(s8)config[37] == F(s16, record, 0))
                F(void *, actor, 0x2a0) = record;
        }
    }
    return actor;
}

/* Constructs the shared actor and selects its tracked-resource descriptor. */
extern "C" void *func_ov075_02212ae0(void *actor, void *descriptor, s32 arg2,
                                      s32 arg3)
{
    return ConstructBaseActor(actor, descriptor, arg2, arg3);
}

/* Constructs the alternate ABI entry for the same shared actor class. */
extern "C" void *func_ov075_02212bb8(void *actor, void *descriptor, s32 arg2,
                                      s32 arg3)
{
    return ConstructBaseActor(actor, descriptor, arg2, arg3);
}

/* Finds a compatible type-two actor and attaches it to the supplied actor. */
extern "C" void func_ov075_02212c90(void *actor)
{
    void *collection =
        (void *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    s32 count = F(s32, collection, 0x2e74);
    for (s32 i = 0; i < count; ++i)
    {
        void *candidate = F(void *, collection, i * 4);
        if (candidate != 0 && F(s8, candidate, 0x4d) == 2 &&
            F(s8, candidate, 0x27e) == 15 &&
            F(s16, candidate, 0x2a8) < ActorExtendedType2_GetDescriptorValue2A(candidate))
        {
            func_ov075_02213ca4(candidate, actor);
            F(void *, actor, 0x29c) = candidate;
            if (func_ov075_02212d80(candidate) != 0)
                Invoke(actor, 0xfc);
            return;
        }
    }
}

/* Reports whether the actor uses the first terminal state callback pair. */
extern "C" s32 func_ov075_02212d80(void *actor)
{
    return F(s32, actor, 0x218) == F(s32, data_ov075_02216cc8, 0x10) &&
           (F(s32, actor, 0x21c) == F(s32, data_ov075_02216cd8, 4) ||
            F(s32, actor, 0x218) == 0);
}

/* Destroys the actor while retaining caller-owned storage. */
extern "C" void *func_ov075_02212dc8(void *actor)
{
    func_0203e494(actor);
    return actor;
}

/* Destroys and releases the actor allocation. */
extern "C" void *func_ov075_02212ddc(void *actor)
{
    func_0203e494(actor);
    func_02003e2c(actor);
    return actor;
}

/* Returns the actor's runtime flag 0x80 without normalizing it. */
extern "C" u32 func_ov075_02212df8(void *actor)
{
    return F(u32, actor, 0xd0) & 0x80;
}

/* Reports whether the actor uses the second terminal state callback pair. */
extern "C" s32 func_ov075_02212e04(void *actor)
{
    return F(s32, actor, 0x218) == F(s32, data_ov075_02216cc8, 0x28) &&
           (F(s32, actor, 0x21c) == F(s32, data_ov075_02216cf0, 4) ||
            F(s32, actor, 0x218) == 0);
}

/* Initializes the attached actor presentation and terminal callback state. */
extern "C" void func_ov075_02212e4c(void *actor)
{
    func_02032a64(actor);
    F(void *, actor, 0x264) = 0;
    func_ov075_02212f10(P(actor, 0x38), 0, 0, 0);
    func_ov075_02212f10(P(actor, 0x88), 0, 0, 0);
    func_ov075_02212f10(P(actor, 0x98), 0, 0, 0);
    F(u32, actor, 0x14) |= 6;
    F(u32, actor, 0xd0) |= 0x20000;
    if (func_ov075_02212d80(F(void *, actor, 0x29c)) != 0)
    {
        F(void *, actor, 0x1fc) = 0;
        Invoke(actor, 0x100);
        return;
    }
    F(void *, actor, 0x1fc) = F(void *, actor, 0x200);
    F(u16, F(void *, actor, 0x54), 0x24) |= 0x14;
    F(s32, actor, 0x218) = F(s32, data_ov075_02216cc8, 0x48);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02216cc8, 0x4c);
}

/* Stores three fixed-point components in an optional vector wrapper. */
extern "C" void func_ov075_02212f10(void *object, s32 x, s32 y, s32 z)
{
    void *vector = object != 0 ? P(object, 4) : 0;
    F(s32, vector, 0) = x;
    F(s32, vector, 4) = y;
    F(s32, vector, 8) = z;
}

/* Starts the falling presentation state and synchronizes its sprite flags. */
extern "C" void func_ov075_02212f20(void *actor)
{
    F(s32, actor, 0x218) = F(s32, data_ov075_02216cc8, 0x20);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02216cc8, 0x24);
    func_020050a4(P(actor, 0x18), P(actor, 0x28));
    F(s32, actor, 0x24) = Actor_GetCachedTerrainHeight(actor) - 0x1000;
    F(s32, actor, 0x298) = 0;
    F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
    F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~4;
    F(void *, actor, 0x1fc) = F(void *, actor, 0x200);
}

/* Creates the paired interaction volumes for the falling actor state. */
extern "C" void func_ov075_02212f98(void *actor)
{
    func_020349b8(actor, 0x57, 0);
    func_020405c8(actor, 0, 0x100, -20);
    func_020405c8(actor, 1, 0x100, 20);
}

/* Advances the attached presentation's visibility and animation state. */
extern "C" void func_ov075_02212fd8(void *actor)
{
    Invoke(actor, 0x18);
    F(u32, actor, 0x260) &= ~3U;
    F(u32, actor, 0x14) = (F(u32, actor, 0x14) & ~0x800000U) | 6;
    func_020050a4(P(actor, 0x28), P(actor, 0x18));

    bool recognized = Invoke(actor, 0xa8) != 0 ||
                      func_ov075_02212d80(actor) != 0 ||
                      func_ov075_02212e04(actor) != 0;
    if (!recognized)
    {
        recognized =
            F(s32, actor, 0x218) == F(s32, data_ov075_02216cc8, 0x38) &&
            (F(s32, actor, 0x21c) == F(s32, data_ov075_02216d00, 4) ||
             F(s32, actor, 0x218) == 0);
    }
    void *attached = F(void *, actor, 0x29c);
    bool hidden = !recognized && func_ov075_02212d80(attached) == 0;
    void *sprite = F(void *, actor, 0x54);
    void *secondarySprite = F(void *, actor, 0xa8);
    if (!hidden)
    {
        F(u16, sprite, 0x24) |= 0x10;
        if (secondarySprite != 0)
            F(u16, secondarySprite, 0x24) |= 0x10;
    }
    else
    {
        if (secondarySprite != 0)
            F(u16, secondarySprite, 0x24) &= (u16)~0x10;
        switch (F(u32, actor, 0x298))
        {
        case 0:
            if (F(s32, actor, 0x24) < Actor_GetCachedTerrainHeight(actor))
            {
                F(u16, sprite, 0x24) |= 0x10;
            }
            else
            {
                F(u32, actor, 0x298) = 1;
                func_02072b68(sprite, 0x14);
                F(u16, sprite, 0x24) &= (u16)~3;
                F(u16, sprite, 0x24) &= (u16)~0x10;
                Invoke(actor, 0x8c);
            }
            break;
        case 1:
            F(u16, sprite, 0x24) &= (u16)~0x10;
            F(u32, actor, 0x260) |= 3;
            F(u32, actor, 0x14) &= ~6U;
            if ((F(u16, sprite, 0x24) & 1) != 0)
            {
                F(u32, actor, 0x298) = 2;
                func_02072b68(sprite, F(u8, actor, 0xd4));
                F(u16, sprite, 0x24) |= 2;
                F(u16, sprite, 0x24) &= (u16)~1;
            }
            break;
        case 2:
            F(u32, actor, 0x260) |= 3;
            F(u32, actor, 0x14) &= ~6U;
            F(u16, sprite, 0x24) &= (u16)~0x10;
            break;
        case 3:
            F(u32, actor, 0x260) |= 3;
            F(u32, actor, 0x14) &= ~6U;
            F(u16, sprite, 0x24) &= (u16)~0x10;
            if ((F(u16, sprite, 0x24) & 1) != 0)
            {
                F(u32, actor, 0x298) = 4;
                F(u16, sprite, 0x24) |= 0x10;
            }
            break;
        default:
            break;
        }
        u32 state = F(u32, actor, 0x298);
        s32 height = Actor_GetCachedTerrainHeight(actor);
        if ((state == 1 || state == 2) && height < F(s32, actor, 0x24) &&
            F(s32, actor, 0x24) < height + 0x10000)
        {
            F(u32, actor, 0x14) |= 0x800000;
        }
    }
    func_02031720(actor);
}

/* Rotates the actor sprite toward a target by at most the supplied step. */
extern "C" void func_ov075_022132e8(void *actor, const void *target,
                                     s32 maximumStep)
{
    s32 dy = F(s32, actor, 0x20) - F(s32, target, 8);
    if (F(s32, actor, 0x1c) == F(s32, target, 4) && dy == 0)
        return;
    s32 targetAngle = func_020ae024(-dy);
    s16 current = F(s16, F(void *, actor, 0x54), 0x30);
    if (targetAngle < current)
        targetAngle += 0x10000;
    s32 difference = targetAngle - current;
    s32 delta;
    if (difference < 0x8000)
        delta = difference < maximumStep ? difference : maximumStep;
    else
    {
        difference = 0x10000 - difference;
        delta = -(difference < maximumStep ? difference : maximumStep);
    }
    F(s16, F(void *, actor, 0x54), 0x30) = (s16)(current + delta);
}

/* Scales the actor sprite from its vertical distance to a reference height. */
extern "C" void func_ov075_02213368(void *actor, s32 referenceHeight)
{
    s32 scale = ((F(s32, actor, 0x24) - referenceHeight) >> 12) + 0x100;
    if (scale < 0x20)
        scale = 0x20;
    else if (scale > 0x200)
        scale = 0x200;
    F(s16, F(void *, actor, 0x54), 0x32) = (s16)scale;
    F(s16, F(void *, actor, 0x54), 0x34) = (s16)scale;
}

/* Advances the short falling-animation sequence after crossing terrain. */
extern "C" void func_ov075_022133a4(void *actor, const void *position)
{
    if (F(u32, actor, 0x298) > 2)
        return;
    func_020050a4(P(actor, 0x18), position);
    if (F(u32, actor, 0x298) != 2 ||
        Actor_GetCachedTerrainHeight(actor) <= F(s32, actor, 0x24))
        return;
    F(s32, actor, 0x24) = Actor_GetCachedTerrainHeight(actor);
    F(u32, actor, 0x298) = 3;
    void *sprite = F(void *, actor, 0x54);
    func_02072b68(sprite, 0x15);
    F(u16, sprite, 0x24) &= (u16)~3;
    if ((F(u16, sprite, 0x24) & 0x10) == 0)
        Invoke(actor, 0x8c);
}

/* Reports whether the attached actor or local presentation blocks transition. */
extern "C" s32 func_ov075_0221343c(void *actor)
{
    void *attached = F(void *, actor, 0x29c);
    return Invoke(attached, 0xa8) != 0 || F(void *, actor, 0x264) != 0;
}

/* Spawns the optional tracked presentation below the actor. */
extern "C" void func_ov075_02213480(void *actor)
{
    if (F(void *, actor, 0x2a0) == 0 ||
        (F(u32, actor, 0x10) & 4) == 0 ||
        (F(u16, F(void *, actor, 0x54), 0x24) & 0x14) != 0)
        return;
    u8 position[16];
    func_02005030(position, P(actor, 0x18));
    F(s32, position, 0xc) -= 0x4000;
    void *primary = F(void *, F(void *, data_021052fc, 0), 0x2ea4);
    void *presentation = (void *)func_02050078(
        F(s16, F(void *, actor, 0x2a0), 0), position, P(primary, 0x18));
    F(u32, presentation, 0x5c) =
        (F(u32, presentation, 0x5c) & 0xffff0000) | 0xffe8;
    func_02005058(position);
}

/* No-op virtual hook retained by the shared actor vtable. */
extern "C" void func_ov075_02213528(void)
{
}

/* Constructs the presentation-owning derived actor and its child table. */
extern "C" void *func_ov075_0221352c(void *actor, void *descriptor, s32 arg2,
                                      s32 arg3)
{
    func_ov075_02212ae0(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov075_02216db0;
    F(u16, actor, 0x2a8) = 0;
    F(s16, actor, 0x2aa) = 0;
    F(void *, actor, 0x2ac) = 0;
    func_02004fe0(P(actor, 0x2b0));
    F(void *, F(void *, actor, 0x26c), 4) = 0;
    s32 value = ActorExtendedType2_GetDescriptorValue2A(actor);
    F(s16, actor, 0x2aa) = (s16)(value < 1 ? 1 : value);
    F(void *, actor, 0x2a4) = (void *)func_02003e20(
        F(s16, actor, 0x2aa) * 4, data_ov075_02217168, 4, gHeapContext);
    F(u32, actor, 0xd0) |= 0x20000;
    return actor;
}

/* Destroys the derived actor while retaining caller-owned storage. */
extern "C" void *func_ov075_022135c4(void *actor)
{
    func_02005058(P(actor, 0x2b0));
    func_0203e494(actor);
    return actor;
}

/* Destroys and releases the derived actor allocation. */
extern "C" void *func_ov075_022135e4(void *actor)
{
    func_02005058(P(actor, 0x2b0));
    func_0203e494(actor);
    func_02003e2c(actor);
    return actor;
}

/* Initializes the derived actor's presentation and active child records. */
extern "C" void func_ov075_0221360c(void *actor)
{
    func_02032a64(actor);
    F(void *, actor, 0x264) = 0;
    func_ov075_02212f10(P(actor, 0x38), 0, 0, 0);
    func_ov075_02212f10(P(actor, 0x88), 0, 0, 0);
    func_ov075_02212f10(P(actor, 0x98), 0, 0, 0);
    F(u32, actor, 0xd0) |= 0x20000;
    if (F(s32, actor, 0x1fc) < 1)
    {
        Invoke(actor, 0x100);
        for (s32 i = 0; i < F(s16, actor, 0x2a8); ++i)
        {
            void *child = F(void *, F(void *, actor, 0x2a4), i * 4);
            if (child != 0)
                F(void *, child, 0x1fc) = 0;
        }
        return;
    }
    F(s32, actor, 0x218) = F(s32, data_ov075_02216cc8, 0x40);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02216cc8, 0x44);
    func_02072b68(F(void *, actor, 0x54), 0x15);
    F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~0x17;
    F(u32, actor, 0x298) = 3;
    F(u16, actor, 0x26a) = 120;
    Sound_PlayOwnedEffect(gSoundContext, 0x1e9, 1, actor, 0, 0x100);
    void *effect = (void *)func_02003e14(0x14, data_ov075_02217170, 4,
                                         gHeapContext);
    if (effect != 0)
    {
        AuxiliaryTimedSpritePresentation_Init(
            effect, P(actor, 0x18), F(void *, F(void *, actor, 0x54), 0),
            0x1631, 0x1632, 0x1633, 0, 0x80, 2, 1);
    }
}

/* Runs the derived actor's child, visibility, and animation state machine. */
extern "C" void func_ov075_022137a0(void *actor)
{
    if ((F(u32, actor, 0x14) & 0x200000) != 0)
        return;
    F(u32, actor, 0x260) &= ~3U;
    F(u32, actor, 0x14) = (F(u32, actor, 0x14) & ~0x800000U) | 6;
    func_020050a4(P(actor, 0x28), P(actor, 0x18));
    Invoke(actor, 0x18);
    func_ov075_02213f08(actor);
    bool normal = Invoke(actor, 0xa8) == 0 &&
                  func_ov075_02212d80(actor) == 0 &&
                  func_ov075_02212e04(actor) == 0;
    void *sprite = F(void *, actor, 0x54);
    if (normal)
    {
        switch (F(u32, actor, 0x298))
        {
        case 0:
            F(u16, sprite, 0x24) |= 0x10;
            if (F(s16, actor, 0x25a) == 0)
            {
                func_ov075_02213cfc(actor);
                F(u32, actor, 0x298) = 1;
                func_02072b68(sprite, 0x14);
                F(u16, sprite, 0x24) &= (u16)~3;
                Invoke(actor, 0x8c);
                Sound_PlayOwnedEffect(gSoundContext, 0x1e9, 0, actor, 0, 0x100);
            }
            else
                --F(s16, actor, 0x25a);
            F(u32, actor, 0x5c) &= 0xffff0000;
            break;
        case 1:
            F(u16, sprite, 0x24) &= (u16)~0x10;
            if ((F(u16, sprite, 0x24) & 1) != 0)
            {
                F(u32, actor, 0x298) = 2;
                func_02072b68(sprite, F(u8, actor, 0x2ac));
                F(u16, sprite, 0x24) |= 2;
                F(u16, sprite, 0x24) &= (u16)~1;
            }
            F(u32, actor, 0x5c) &= 0xffff0000;
            break;
        case 2:
            F(u32, actor, 0x260) |= 3;
            F(u32, actor, 0x14) &= ~6U;
            F(u16, sprite, 0x24) &= (u16)~0x10;
            if (F(u8, sprite, 0x38) < 2 || F(u8, sprite, 0x38) > 5)
                F(u32, actor, 0x5c) =
                    (F(u32, actor, 0x5c) & 0xffff0000) | 0xfffc;
            else
                F(u32, actor, 0x5c) =
                    (F(u32, actor, 0x5c) & 0xffff0000) | 4;
            break;
        case 3:
            F(u16, sprite, 0x24) &= (u16)~0x10;
            if ((F(u16, sprite, 0x24) & 1) != 0)
            {
                F(u32, actor, 0x298) = 0;
                F(u16, sprite, 0x24) |= 0x10;
            }
            F(u32, actor, 0x5c) &= 0xffff0000;
            break;
        default:
            break;
        }
    }
    else
    {
        F(u16, sprite, 0x24) |= 0x10;
        if (Invoke(actor, 0xa8) == 0 && func_ov075_02212d80(actor) != 0)
        {
            u8 config[48];
            ((Method)F(void *, F(void *, actor, 0), 0xc8))(actor, config);
            InvokeMember(actor, F(u32, actor, 0x218),
                         F(s32, actor, 0x21c), config);
        }
        else if (Invoke(actor, 0xa8) != 0)
        {
            bool allBusy = true;
            for (s32 i = 0; i < F(s16, actor, 0x2a8); ++i)
            {
                void *child = F(void *, F(void *, actor, 0x2a4), i * 4);
                if (child != 0 && Invoke(child, 0xa8) == 0)
                {
                    allBusy = false;
                    break;
                }
            }
            F(u32, actor, 0xd0) = allBusy
                                      ? F(u32, actor, 0xd0) & ~0x20000U
                                      : F(u32, actor, 0xd0) | 0x20000;
            for (s32 i = 0; i < F(s16, actor, 0x2a8); ++i)
            {
                void *child = F(void *, F(void *, actor, 0x2a4), i * 4);
                if (child != 0 && Invoke(child, 0xa8) != 0)
                {
                    if (allBusy)
                    {
                        F(u32, child, 0xd0) &= ~0x20000U;
                        F(void *, child, 0x1fc) = 0;
                    }
                    else
                        F(u32, child, 0xd0) |= 0x20000;
                }
            }
        }
    }
    func_ov075_02213cc0(actor);
    if (F(u32, actor, 0x298) == 2)
    {
        s32 height = Actor_GetCachedTerrainHeight(actor);
        if (height < F(s32, actor, 0x24) &&
            F(s32, actor, 0x24) < height + 0x10000)
            F(u32, actor, 0x14) |= 0x800000;
    }
    func_02031720(actor);
}

/* Reports whether a child actor is outside the two transition pairs. */
extern "C" s32 func_ov075_02213c04(void *actor)
{
    bool first =
        F(s32, actor, 0x218) == F(s32, data_ov075_02216cc8, 0) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_02216cc8, 4) ||
         F(s32, actor, 0x218) == 0);
    bool second =
        F(s32, actor, 0x218) == F(s32, data_ov075_02216cc8, 0x18) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_02216ce0, 4) ||
         F(s32, actor, 0x218) == 0);
    return !first && !second && F(s32, actor, 0x298) != 3;
}

/* Appends a child actor pointer to the source's fixed-capacity child table. */
extern "C" void func_ov075_02213ca4(void *source, void *target)
{
    s16 index = F(s16, source, 0x2a8)++;
    F(void *, F(void *, source, 0x2a4), index * 4) = target;
}

/* Advances every active child through the shared presentation update. */
extern "C" void func_ov075_02213cc0(void *actor)
{
    for (s32 i = 0; i < F(s16, actor, 0x2a8); ++i)
    {
        void *child = F(void *, F(void *, actor, 0x2a4), i * 4);
        if (child != 0)
            func_ov075_02212fd8(child);
    }
}

/* Advances the waypoint cursor and launches each child toward the next point. */
extern "C" void func_ov075_02213cfc(void *actor)
{
    void *cursor = F(void *, actor, 0x26c);
    F(u16, actor, 0x26a) = 1;
    F(s32, actor, 0x230) =
        F(s32, (void *)InteractionWaypointCursor_GetCurrentRecord(cursor), 0)
        << 12;
    F(s32, actor, 0x234) =
        F(s32,
          (void *)InteractionWaypointCursor_GetCurrentYPointer(cursor), 0)
        << 12;
    F(s32, actor, 0x238) =
        Actor_QueryTerrainHeight(actor, F(s32, actor, 0x230) >> 16,
                                 F(s32, actor, 0x234) >> 16)
        << 16;
    func_020050a4(P(actor, 0x28), P(actor, 0x22c));
    func_020050a4(P(actor, 0x18), P(actor, 0x28));

    InteractionWaypointCursor_Advance(cursor);
    F(s32, actor, 0x2b4) =
        F(s32, (void *)InteractionWaypointCursor_GetCurrentRecord(cursor), 0)
        << 12;
    F(s32, actor, 0x2b8) =
        F(s32,
          (void *)InteractionWaypointCursor_GetCurrentYPointer(cursor), 0)
        << 12;
    F(s32, actor, 0x2bc) =
        Actor_QueryTerrainHeight(actor, F(s32, actor, 0x2b4) >> 16,
                                 F(s32, actor, 0x2b8) >> 16)
        << 16;
    s32 dx = F(s32, actor, 0x2b4) - F(s32, actor, 0x230);
    s32 dy = F(s32, actor, 0x2b8) - F(s32, actor, 0x234);
    if (dx <= 0)
        F(s32, actor, 0x2ac) = dy <= 0 ? 2 : 0;
    else
        F(s32, actor, 0x2ac) = dy <= 0 ? 4 : 6;
    InteractionWaypointCursor_Advance(cursor);
    F(u16, actor, 0x25a) =
        InteractionWaypointCursor_GetCurrentDurationFrames(cursor);
    Actor_TurnTowardVector(actor, F(s32, actor, 0x2b4) - F(s32, actor, 0x1c),
                  F(s32, actor, 0x2b8) - F(s32, actor, 0x20), 0x8000);
    F(u8, actor, 0xd4) &= 0x0e;
    u8 position[16];
    func_02005030(position, P(actor, 0x18));
    F(s32, position, 0xc) -= 0x1000;
    for (s32 i = 0; i < F(s16, actor, 0x2a8); ++i)
    {
        void *child = F(void *, F(void *, actor, 0x2a4), i * 4);
        if (child != 0)
        {
            func_ov075_02212f20(child);
            func_ov075_022132e8(child, P(actor, 0x2b0), 0x8000);
        }
    }
    func_02005058(position);
}

/* Evaluates a Bezier point and adds the retail sinusoidal height offset. */
extern "C" void func_ov075_02213ec4(void *result, const void *unused,
                                     const void *curve, s32 time)
{
    VecFx32Bezier_Evaluate3D(result, curve, time);
    u32 phase = ((u32)time << 19) >> 16;
    F(s32, result, 0xc) += data_020c9670[(s32)phase >> 4] * 0x40;
}

/* Interpolates the source and its children along the active waypoint curve. */
extern "C" s32 func_ov075_02213f08(void *actor)
{
    if (func_ov075_02212d80(actor) != 0 ||
        func_ov075_02212e04(actor) != 0)
        return 1;
    u8 midpoint[16];
    u8 curve[16];
    s32 x = MulFx(0x266, F(s32, actor, 0x230)) +
            MulFx(0xd9a, F(s32, actor, 0x2b4));
    s32 y = F(s32, actor, 0x234) +
            (F(s32, actor, 0x2b8) - F(s32, actor, 0x234)) / 2;
    s32 z = F(s32, actor, 0x238) +
            (F(s32, actor, 0x2bc) - F(s32, actor, 0x238)) / 2;
    func_0200500c(midpoint, x, y, z);
    func_02004fe0(curve);
    func_0200634c(curve, P(actor, 0x22c), P(actor, 0x2b0), midpoint);
    s32 time = func_020befec((u32)F(u16, actor, 0x26a) << 12, 120);
    s32 visibleCount = 0;
    if (func_ov075_02213c04(actor) != 0)
    {
        if (time < 0 || time > 0x1000)
        {
            if (F(u8, F(void *, actor, 0x54), 0x38) != 0x15)
            {
                func_02072b68(F(void *, actor, 0x54), 0x15);
                F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~3;
                F(u32, actor, 0x298) = 3;
                Invoke(actor, 0x8c);
            }
            F(s32, actor, 0x24) = Actor_GetCachedTerrainHeight(actor);
        }
        else
        {
            u8 position[16];
            func_ov075_02213ec4(position, actor, curve, time);
            func_020050a4(P(actor, 0x18), position);
            func_02005058(position);
            s32 height = Actor_GetCachedTerrainHeight(actor);
            if (F(s32, actor, 0x24) < height)
                F(s32, actor, 0x24) = height;
            F(u16, F(void *, actor, 0x54), 0x24) &= (u16)~0x10;
            u32 animation = F(u8, actor, 0x2ac) + (time > 0x800 ? 1 : 0);
            if (animation != F(u8, F(void *, actor, 0x54), 0x38))
                func_02072b68(F(void *, actor, 0x54), animation);
            func_ov075_02213368(actor, F(s32, actor, 0x238));
            visibleCount = 1;
        }
    }
    void *previous = 0;
    u32 childTimer = F(u16, actor, 0x26a);
    for (s32 i = 0; i < F(s16, actor, 0x2a8); ++i)
    {
        void *child = F(void *, F(void *, actor, 0x2a4), i * 4);
        bool normal = Invoke(child, 0xa8) == 0 &&
                      func_ov075_02212d80(child) == 0 &&
                      func_ov075_02212e04(child) == 0;
        if (!normal)
            continue;
        time -= 0xf6;
        childTimer -= 10;
        u8 position[16];
        func_ov075_02213ec4(position, actor, curve, time);
        func_ov075_022133a4(child, position);
        func_02005058(position);
        func_ov075_022132e8(child,
                            previous != 0 ? P(previous, 0x18)
                                          : P(actor, 0x18),
                            0x300);
        func_ov075_02213368(child, F(s32, actor, 0x238));
        if (time >= 0 && time <= 0x1000)
            ++visibleCount;
        previous = child;
        if (childTimer == 60)
            func_ov075_02213480(child);
    }
    if (++F(u16, actor, 0x26a) > 0xef)
        F(u16, actor, 0x26a) = 0xef;
    func_0200637c(curve);
    func_02005058(midpoint);
    return visibleCount == 0;
}

/* Reports whether interaction-state flag eight is active. */
extern "C" s32 func_ov075_0221424c(void *actor)
{
    return (F(u32, actor, 0x260) & 8) != 0;
}

/* Advances the timed child-spawn gate and enters its interaction phase. */
extern "C" s32 func_ov075_02214260(void *actor, const void *descriptor)
{
    F(u16, actor, 0xd6) = 0x11;
    void *sprite = F(void *, actor, 0x54);
    if ((F(u32, actor, 0x260) & 0x800) == 0)
    {
        if (F(s16, actor, 0x250) == 0)
        {
            F(u16, sprite, 0x24) |= 0x17;
            F(u32, actor, 0x14) |= 0x10000000;
            F(u16, actor, 0x24e) = F(u16, descriptor, 0x14);
            return 0;
        }
        if ((F(u16, actor, 0x272) & 0x800) != 0 &&
            GameWork_TestFlag(gGameWork, F(s32, actor, 0x1cc)) == 0)
        {
            F(u32, actor, 0x14) |= 0x10000000;
            F(u16, sprite, 0x24) |= 0x17;
            F(u16, actor, 0x24e) = 0;
            return 0;
        }
        if (++F(s16, actor, 0x24e) > F(u16, descriptor, 0x14))
        {
            func_ov075_02213cfc(actor);
            F(u16, actor, 0x24e) = F(u16, descriptor, 0x14);
            F(u32, actor, 0x260) |= 0x800;
        }
        return 0;
    }

    u16 contactFlags = F(u16, actor, 0x272);
    bool ready = false;
    if ((F(u32, actor, 0x10) & 4) == 0)
    {
        ready = (contactFlags & 0x200) != 0 &&
                ((contactFlags & 0x400) == 0 ||
                 Invoke(F(void *, F(void *, data_021052fc, 0), 0x2ea4),
                        0xa8) != 0);
    }
    else
    {
        ready = (contactFlags & 0x100) != 0 &&
                ((contactFlags & 0x400) == 0 ||
                 Invoke(F(void *, F(void *, data_021052fc, 0), 0x2ea4),
                        0xa8) != 0);
    }
    if (!ready)
    {
        F(u16, actor, 0x24e) = F(u16, descriptor, 0x14);
        return 0;
    }
    if (F(void *, actor, 0x1fc) == 0)
        F(void *, actor, 0x1fc) = F(void *, actor, 0x200);
    F(u16, actor, 0xd6) = 1;
    F(s32, actor, 0x218) = F(s32, data_ov075_02216cc8, 8);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02216cc8, 0xc);
    F(u32, actor, 0x14) &= ~0x10000000U;
    F(u32, actor, 0x298) = 1;
    func_02072b68(sprite, 0x14);
    F(u16, sprite, 0x24) &= (u16)~0x17;
    F(u32, actor, 0x260) &= ~0x800U;
    Sound_PlayOwnedEffect(gSoundContext, 0x1e9, 0, actor, 0, 0x100);
    if (F(s16, actor, 0x250) > 0)
        --F(s16, actor, 0x250);
    func_ov075_02213cfc(actor);
    return 1;
}

/* Subtracts two wrapped fixed-point vectors. */
extern "C" void func_ov075_02214898(void *result, const void *left,
                                     const void *right)
{
    func_02004fe0(result);
    const void *leftValue = left != 0 ? P(left, 4) : 0;
    const void *rightValue = right != 0 ? P(right, 4) : 0;
    func_020adfbc(leftValue, rightValue, P(result, 4));
}

/* Builds the linked actor's sprite resources from its descriptor. */
extern "C" void func_ov075_022146ec(void *actor, const void *descriptor)
{
    func_02071ee0(P(actor, 0x1f0), data_020f4e18,
                  F(s32, descriptor, 4), F(s32, descriptor, 8),
                  F(s32, descriptor, 0xc));
    void *collection = (void *)Actor_GetCollection(actor);
    void *owner = (void *)ActorCollection_GetSpriteOwner(collection);
    F(void *, actor, 0x54) = (void *)GraphicsSpriteGroup_CreateState(
        owner, F(void *, actor, 0x1f0), F(void *, actor, 0x1f4),
        F(void *, actor, 0x1f8), F(u8, descriptor, 0x10));
    if ((F(u32, actor, 0x14) & 0x80) != 0)
        F(s8, F(void *, actor, 0x54), 0x3a) = F(s16, descriptor, 0x3c);
    F(u32, actor, 0x5c) =
        (F(u32, actor, 0x5c) & 0xffff0000) | 0x30;
}

/* Computes terrain-safe planar motion toward the stored target vector. */
extern "C" s32 func_ov075_02214770(void *actor, const void *target)
{
    u8 delta[16];
    func_020050a4(P(actor, 0x78), target);
    func_ov075_02214898(delta, P(actor, 0x78), P(actor, 0x18));
    s32 dx = F(s32, delta, 4);
    s32 dy = F(s32, delta, 8);
    s32 distance = func_0204cfa4(dx, dy);
    if (distance < 0x1001)
    {
        F(s32, actor, 0x3c) = 0;
        F(s32, actor, 0x40) = 0;
    }
    else
    {
        s32 angle = func_020ae024(dy, dx);
        s32 speed = F(s32, actor, 0x224);
        F(s32, actor, 0x3c) =
            (speed * data_020c9670[((angle >> 4) * 2) + 1]) >> 12;
        F(s32, actor, 0x40) =
            (speed * data_020c9670[(angle >> 4) * 2]) >> 12;
        s32 stepX = F(s32, actor, 0x3c) << 6;
        s32 stepY = F(s32, actor, 0x40) << 6;
        func_0204cff4(&stepX, &stepY, 0x18000);
        s32 cell = Actor_QueryTerrainCell(
            actor, (F(s32, actor, 0x1c) + stepX) >> 16,
            (F(s32, actor, 0x20) + stepY) >> 16);
        if (((u32)cell << 18) >> 28 != 8)
        {
            F(s32, actor, 0x3c) = 0;
            F(s32, actor, 0x40) = 0;
            func_02005058(delta);
            return 0;
        }
    }
    func_02005058(delta);
    return 1;
}

/* Runs the first linked actor's target search, pursuit, and overlay handoff. */
extern "C" void func_ov075_022148d0(void *actor)
{
    if ((F(u32, actor, 0x10) & 0x1000000) != 0)
    {
        ActorDerivedRuntime_UpdateFrame(actor);
        return;
    }
    Invoke(actor, 0x18);
    Actor_UpdateAnimationState(actor);
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(
            gActorRuntimeCollection) != 0)
    {
        Invoke(actor, 0x20);
        return;
    }
    F(s32, actor, 0x3c) = 0;
    F(s32, actor, 0x40) = 0;
    void *work = F(void *, data_021052fc, 0);
    void *primary = F(void *, work, 0x2ea4);
    switch (F(u16, actor, 0xd6))
    {
    case 0:
        if (func_ov075_02214d88(primary, 0) != 0 &&
            (F(u32, primary, 0x230) & 0x20000) == 0)
        {
            s32 cell = Actor_QueryTerrainCell(
                primary, F(s32, primary, 0x1c) >> 16,
                F(s32, primary, 0x20) >> 16);
            if (((u32)cell << 18) >> 28 == 8)
            {
                if (++F(s16, actor, 0x222) > 240 &&
                    func_ov075_02214f18(actor, primary) != 0)
                {
                    F(u16, actor, 0xd6) = 1;
                    F(u16, actor, 0x222) = 0;
                    Sound_PlayOwnedEffect(gSoundContext, 0, 120, actor, 0, 0x100);
                }
            }
            else
                F(u16, actor, 0x222) = 0;
        }
        break;
    case 1:
        if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
        {
            F(u16, actor, 0xd6) = 2;
            F(u16, actor, 0x220) = 0;
            F(s32, actor, 0x224) = 0x4cd;
        }
        break;
    case 2:
        if (++F(s16, actor, 0x220) < 481)
        {
            u8 targetPosition[16];
            func_02005030(targetPosition,
                          P(F(void *, actor, 0x208), 0x18));
            if (func_ov075_02214770(actor, targetPosition) == 0)
            {
                F(u16, actor, 0xd6) = 3;
                Sound_StopEffect(gSoundContext, 0, 120);
            }
            else
            {
                if (Sound_IsEffectPlaying(gSoundContext, 0, 120) == 0)
                    Sound_PlayOwnedEffect(gSoundContext, 0, 120, actor, 0, 0x100);
                F(s32, actor, 0x224) += 0x29;
                if (F(s32, actor, 0x224) > 0x1333)
                    F(s32, actor, 0x224) = 0x1333;
                s32 cell = Actor_QueryTerrainCell(
                    primary, F(s32, primary, 0x1c) >> 16,
                    F(s32, primary, 0x20) >> 16);
                void *scene = (void *)SceneManager_GetCurrent(gSceneManager);
                bool invalid = scene == 0 || F(u32, scene, 4) != 1 ||
                               ((u32)cell << 18) >> 28 != 8 ||
                               func_ov075_02214d88(primary, 0) == 0 ||
                               (F(u32, primary, 0x230) & 0x20000) != 0;
                if (invalid)
                {
                    F(s32, actor, 0x3c) /= 2;
                    F(s32, actor, 0x40) /= 2;
                }
                else
                {
                    s32 dx = (F(s32, targetPosition, 4) -
                              F(s32, actor, 0x1c)) >> 12;
                    s32 dy = (F(s32, targetPosition, 8) -
                              F(s32, actor, 0x20)) >> 12;
                    if (dx * dx + dy * dy < 0x100)
                    {
                        F(u16, F(void *, actor, 0x54), 0x24) |= 0x10;
                        Sound_StopEffect(gSoundContext, 0, 120);
                        void *manager = (void *)OverlayManager_GetGlobal();
                        OverlayManager_LoadOverlay(manager, 2, 0x40);
                        void *handoff = (void *)func_02003e14(
                            0x88, data_ov075_02217280, 4, gHeapContext);
                        if (handoff != 0)
                            func_ov059_0220fd20(handoff, 1, 2000);
                        func_02005058(targetPosition);
                        return;
                    }
                }
                if (F(s16, actor, 0x228) < 1)
                {
                    void *effect = (void *)func_02003e14(
                        0x14, data_ov075_02217288, 4, gHeapContext);
                    if (effect != 0)
                    {
                        AuxiliaryTimedSpritePresentation_Init(
                            effect, P(actor, 0x18),
                            F(void *, F(void *, actor, 0x54), 0),
                            0x1202, 0x1200, 0x1203, 0,
                            (s16)F(u32, actor, 0x5c) - 8, -1, 1);
                    }
                    F(u16, actor, 0x228) =
                        func_020befec(0xa000, F(s32, actor, 0x224) + 0x100);
                }
                else
                    --F(s16, actor, 0x228);
            }
            func_02005058(targetPosition);
        }
        else
            F(u16, actor, 0xd6) = 3;
        break;
    case 3:
        if ((F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0)
        {
            F(u16, actor, 0xd6) = 0;
            Sound_StopEffect(gSoundContext, 0, 120);
        }
        break;
    default:
        break;
    }
    Invoke(actor, 0xa4);
    Actor_SetRuntimeFlag80(actor);
    Invoke(actor, 0x20);
}

/* Reports whether a candidate actor is available for link acquisition. */
extern "C" s32 func_ov075_02214d88(void *actor, s32 unused)
{
    u32 flags = F(u32, actor, 0xd0);
    bool unblocked =
        (flags & 0x100) == 0 && (flags & 0x10000) == 0 &&
        (F(u32, actor, 0x230) & 0x980000) == 0 &&
        F(void *, actor, 0x270) == 0;
    return unblocked && (flags & 0x10) == 0 &&
           F(s32, actor, 0x24) == F(s32, actor, 0x1dc) &&
           F(s16, actor, 0x268) == 0 && (flags & 0x4000) == 0;
}

/* Refreshes sprite resources and selects presentation for the actor state. */
extern "C" void func_ov075_02214e28(void *actor)
{
    void *collection = (void *)Actor_GetCollection(actor);
    void *owner = (void *)ActorCollection_GetSpriteOwner(collection);
    GraphicsSpriteGroup_ReplaceStateResources(
        owner, F(void *, actor, 0x54), F(void *, actor, 0x1f0),
        F(void *, actor, 0x1f4), F(void *, actor, 0x1f8));
    void *sprite = F(void *, actor, 0x54);
    u32 animation = 0xffffffff;
    u16 setMask = 2;
    u16 clearMask = 1;
    F(u16, sprite, 0x24) &= (u16)~0x10;
    switch (F(u16, actor, 0xd6))
    {
    case 0:
        F(u16, sprite, 0x24) |= 0x10;
        break;
    case 1:
        animation = 0x12;
        setMask = 0;
        clearMask = 3;
        break;
    case 2:
        animation = F(u8, actor, 0xd4);
        break;
    case 3:
        animation = 0x13;
        setMask = 0;
        clearMask = 3;
        break;
    default:
        break;
    }
    if (animation != 0xffffffff)
    {
        if (animation != F(u8, sprite, 0x38))
            func_02072b68(sprite, animation);
        F(u16, sprite, 0x24) &= (u16)~clearMask;
        F(u16, sprite, 0x24) |= setMask;
    }
}

/* Selects the nearest allowed waypoint and prepares linked-actor movement. */
extern "C" s32 func_ov075_02214f18(void *actor, void *target)
{
    F(void *, actor, 0x208) = target;
    const s16 *waypoints = F(const s16 *, actor, 0x21c);
    if (waypoints == 0)
    {
        func_020050a4(P(actor, 0x20c), P(target, 0x18));
        F(s32, actor, 0x218) = Actor_GetCachedTerrainHeight(target);
        func_020050a4(P(actor, 0x18), P(actor, 0x20c));
        F(u16, actor, 0xd6) = 1;
        return 1;
    }
    s32 bestDistance = 0x7fffffff;
    s32 bestX = -1;
    s32 bestY = -1;
    while (waypoints[0] != -1)
    {
        s32 dx = waypoints[0] - (F(s32, target, 0x1c) >> 12);
        s32 dy = waypoints[1] - (F(s32, target, 0x20) >> 12);
        s32 distance = dx * dx + dy * dy;
        if (distance < bestDistance)
        {
            bestDistance = distance;
            bestX = waypoints[0];
            bestY = waypoints[1];
        }
        waypoints += 2;
    }
    if (bestX == -1)
        return 0;
    F(s32, actor, 0x210) = bestX << 12;
    F(s32, actor, 0x214) = bestY << 12;
    F(s32, actor, 0x218) = Actor_GetCachedTerrainHeight(target);
    func_020050a4(P(actor, 0x18), P(actor, 0x20c));
    return 1;
}

/* Returns the default false capability value. */
extern "C" s32 func_ov075_022144b8(void)
{
    return 0;
}

/* Copies another actor's wrapped position into the destination vector. */
extern "C" void func_ov075_022144c0(void *destination, const void *actor)
{
    VecFx32Object_InitCopy(destination, P(actor, 0x18));
}

/* Reports whether runtime flag 0x40 is active. */
extern "C" s32 func_ov075_022144d0(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x40) != 0;
}

/* Returns the default false interaction result. */
extern "C" s32 func_ov075_022144e4(void)
{
    return 0;
}

/* No-op callback retained by the actor vtable. */
extern "C" void func_ov075_022144ec(void)
{
}

/* No-op callback retained by the actor vtable. */
extern "C" void func_ov075_022144f0(void)
{
}

/* Returns the actor's fixed interaction radius in pixels. */
extern "C" s32 func_ov075_022144f4(void)
{
    return 0x10;
}

/* Returns the actor's wrapped position member. */
extern "C" void *func_ov075_022144fc(void *actor)
{
    return P(actor, 0x18);
}

/* Returns the fixed maximum actor separation in 20.12 units. */
extern "C" s32 func_ov075_02214504(void)
{
    return 0xc0000;
}

/* Forwards a contact through virtual method 0x108 with a zero mode. */
extern "C" void func_ov075_0221450c(void *actor, void *other, s32 arg2,
                                     s32 arg3)
{
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, other, 0, arg3);
}

/* Forwards the alternate contact through method 0x108 with a zero mode. */
extern "C" void func_ov075_02214524(void *actor, void *other, s32 arg2,
                                     s32 arg3)
{
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, other, 0, arg3);
}

/* Returns the default false state predicate. */
extern "C" s32 func_ov075_0221453c(void)
{
    return 0;
}

/* Marks the actor's interaction state as active. */
extern "C" void func_ov075_02214544(void *actor)
{
    F(u32, actor, 0x260) |= 0x10;
}

/* Reports whether the actor is in runtime phase eight. */
extern "C" s32 func_ov075_02214554(void *actor)
{
    return F(s8, actor, 0x24c) == 8;
}

/* Reports whether the primary animation state is not terminal state 16. */
extern "C" s32 func_ov075_02214568(void *actor)
{
    return F(s16, actor, 0xd6) != 0x10;
}

/* Reports whether the primary animation is in state five or six. */
extern "C" s32 func_ov075_02214588(void *actor)
{
    s16 state = F(s16, actor, 0xd6);
    return state == 5 || state == 6;
}

/* Reports whether the secondary animation is in state nine or ten. */
extern "C" s32 func_ov075_022145a0(void *actor)
{
    s16 state = F(s16, actor, 0xd8);
    return state == 9 || state == 10;
}

/* Reports whether the primary animation is in state nine or ten. */
extern "C" s32 func_ov075_022145b8(void *actor)
{
    s16 state = F(s16, actor, 0xd6);
    return state == 9 || state == 10;
}

/* Returns the first fixed motion step in 20.12 units. */
extern "C" s32 func_ov075_022145d0(void)
{
    return 0x800;
}

/* Returns the second fixed motion step in 20.12 units. */
extern "C" s32 func_ov075_022145d8(void)
{
    return 0x800;
}

/* No-op state callback retained by the actor vtable. */
extern "C" void func_ov075_022145e0(void)
{
}

/* No-op state callback retained by the actor vtable. */
extern "C" void func_ov075_022145e4(void)
{
}

/* Toggles sprite member 0x288's horizontal presentation flag. */
extern "C" void func_ov075_022145e8(void *actor, s32 enabled)
{
    void *sprite = F(void *, actor, 0x288);
    if (enabled == 0)
        F(u16, sprite, 0x24) |= 4;
    else
        F(u16, sprite, 0x24) &= (u16)~4;
}

/* Returns the fixed linked-actor range in 20.12 units. */
extern "C" s32 func_ov075_02214608(void)
{
    return 0x20000;
}

/* No-op linked-actor callback retained by the vtable. */
extern "C" void func_ov075_02214610(void)
{
}

/* No-op linked-actor callback retained by the vtable. */
extern "C" void func_ov075_02214614(void)
{
}

/* No-op linked-actor callback retained by the vtable. */
extern "C" void func_ov075_02214618(void)
{
}

/* Constructs the first linked-actor source and copies its initial position. */
extern "C" void *func_ov075_0221461c(void *actor, const void *descriptor)
{
    ActorDerivedRuntime_Init(actor, descriptor);
    F(void *, actor, 0) = data_ov075_022171bc;
    func_02004fe0(P(actor, 0x20c));
    F(void *, actor, 0x224) = 0;
    func_020050a4(P(actor, 0x20c), P(actor, 0x18));
    F(u16, actor, 0x220) = 0;
    F(u16, actor, 0x222) = 0;
    F(u16, actor, 0xd6) = 0;
    F(u32, actor, 0x10) |= 0x1f0000;
    F(void *, actor, 0x21c) = F(void *, descriptor, 0x34);
    F(u16, actor, 0x228) = 0;
    if (F(void *, descriptor, 0x2c) != 0)
        Invoke(actor, 0x74);
    return actor;
}

/* Destroys the first linked actor while retaining caller-owned storage. */
extern "C" void *func_ov075_022146a4(void *actor)
{
    func_02005058(P(actor, 0x20c));
    ActorDerivedRuntime_DestroyAlternate(actor);
    return actor;
}

/* Destroys and releases the first linked-actor allocation. */
extern "C" void *func_ov075_022146c4(void *actor)
{
    func_02005058(P(actor, 0x20c));
    ActorDerivedRuntime_DestroyAlternate(actor);
    func_02003e2c(actor);
    return actor;
}

/* Returns the second linked actor's fixed maximum range. */
extern "C" s32 func_ov075_02214ff8(void)
{
    return 0x40000;
}

/* No-op linked-actor callback retained by the vtable. */
extern "C" void func_ov075_02215000(void)
{
}

/* No-op linked-actor callback retained by the vtable. */
extern "C" void func_ov075_02215004(void)
{
}

/* Enables runtime flag 0x80 on the linked actor. */
extern "C" void func_ov075_02215008(void *actor)
{
    F(u32, actor, 0xd0) |= 0x80;
}

/* Returns the default false linked-state predicate. */
extern "C" s32 func_ov075_02215018(void)
{
    return 0;
}

/* Returns the default false linked-state predicate. */
extern "C" s32 func_ov075_02215020(void)
{
    return 0;
}

/* Returns the default false linked-state predicate. */
extern "C" s32 func_ov075_02215028(void)
{
    return 0;
}

/* Returns the default false linked-state predicate. */
extern "C" s32 func_ov075_02215030(void)
{
    return 0;
}

/* Forwards the actor's standard presentation update. */
extern "C" void func_ov075_02215038(void *actor)
{
    func_02033b38(actor);
}

/* Copies a four-short interaction extent record. */
extern "C" void func_ov075_02215044(void *destination, const void *source)
{
    F(u16, destination, 0) = F(u16, source, 0);
    F(u16, destination, 2) = F(u16, source, 2);
    F(u16, destination, 4) = F(u16, source, 4);
    F(u16, destination, 6) = F(u16, source, 6);
}

/* Constructs the second linked actor and initializes its interaction extents. */
extern "C" void *func_ov075_02215068(void *actor, void *descriptor, s32 arg2,
                                      s32 arg3)
{
    ActorExtendedLinked_Init(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov075_02217410;
    F(void *, actor, 0x2a4) = 0;
    func_ov075_02215044(P(actor, 0x29c), P(actor, 0x68));
    F(u32, actor, 0x260) |= 0x200000;
    if (ActorExtendedType2_GetDescriptorValue25(actor) != -1)
        func_ov075_022158bc(actor);
    return actor;
}

/* Destroys the second linked actor while retaining caller-owned storage. */
extern "C" void *func_ov075_022150c4(void *actor)
{
    ActorExtendedLinked_Destroy(actor);
    return actor;
}

/* Destroys and releases the second linked-actor allocation. */
extern "C" void *func_ov075_022150d8(void *actor)
{
    ActorExtendedLinked_Destroy(actor);
    func_02003e2c(actor);
    return actor;
}

/* Runs the inherited setup only while no linked source is attached. */
extern "C" void func_ov075_022150f4(void *actor)
{
    if (F(void *, actor, 0x2a4) == 0)
        func_0204368c(actor);
}

/* Copies adjusted descriptor data and clears it while a source is attached. */
extern "C" void func_ov075_02215110(void *actor, s16 *result)
{
    ActorExtendedType2_CopyAdjustedDescriptor(actor, result);
    if (F(void *, actor, 0x2a4) != 0)
        result[0] = result[1] = result[2] = 0;
}

/* Reports whether the actor is free of a busy source and terminal state 16. */
extern "C" s32 func_ov075_0221513c(void *actor)
{
    void *source = F(void *, actor, 0x298);
    if (source != 0 && F(s16, source, 0x2a4) != 0)
        return 0;
    return F(s16, actor, 0xd6) != 0x10;
}

/* Clears source counters and mirrors link presence into runtime flag 0x20. */
extern "C" void func_ov075_02215188(void *actor)
{
    void *source = F(void *, actor, 0x298);
    if (source != 0)
    {
        F(u16, source, 0x2a4) = 0;
        F(u16, source, 0x2a6) = 0;
    }
    if (F(void *, actor, 0x2a4) == 0)
        F(u32, actor, 0x260) &= ~0x20U;
    else
        F(u32, actor, 0x260) |= 0x20;
}

/* Breaks the current link and forwards contact mode one. */
extern "C" void func_ov075_022151bc(void *actor, void *other, s32 arg2,
                                     s32 arg3)
{
    F(u32, actor, 0x260) |= 2;
    func_ov075_02215910(actor);
    ((Method)F(void *, F(void *, actor, 0), 0x108))(actor, other, 1, arg3);
}

/* Applies inherited reentry state and detaches after presentation completion. */
extern "C" void func_ov075_022151f4(void *actor)
{
    ActorExtendedType2_InitializeReentryState(actor);
    if (F(void *, actor, 0x1fc) == 0)
        func_ov075_02215910(actor);
}

/* Resets vertical motion and either signals or releases the linked source. */
extern "C" void func_ov075_02215218(void *actor)
{
    ActorExtendedType2_ResetVerticalMotionCallbacks(actor);
    if (func_ov075_022152ac(actor) != 0)
        F(u16, actor, 0x25a) = 300;
    void *source = F(void *, actor, 0x298);
    if (source == 0 || (F(u32, source, 0x29c) & 1) == 0)
    {
        Sound_PlayOwnedEffect(gSoundContext, 0x1e8, 2, actor, 0, 0x100);
    }
    else
    {
        Invoke(source, 0x10c);
        Invoke(source, 0x1d8);
    }
}

/* Reports whether the actor uses the linked terminal callback pair. */
extern "C" s32 func_ov075_022152ac(void *actor)
{
    return F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0x20) &&
           (F(s32, actor, 0x21c) == F(s32, data_ov075_022172b0, 4) ||
            F(s32, actor, 0x218) == 0);
}

/* Updates linked-actor extents, callbacks, visibility, and source coupling. */
extern "C" void func_ov075_022152f4(void *actor)
{
    if ((F(u32, actor, 0x14) & 0x200000) != 0)
        return;
    func_ov075_02215044(P(actor, 0x68), P(actor, 0x29c));
    bool pair78 =
        F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0x78) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_02217308, 4) ||
         F(s32, actor, 0x218) == 0);
    bool pair30 =
        F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0x30) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_022172c0, 4) ||
         F(s32, actor, 0x218) == 0);
    void *source = F(void *, actor, 0x298);
    if (!pair78 && !pair30 && (F(u32, actor, 0xd0) & 0x100) == 0 &&
        Invoke(actor, 0xa8) == 0 && source != 0)
    {
        if ((F(u32, source, 0x29c) & 1) == 0)
        {
            if (func_ov075_022152ac(actor) == 0 &&
                func_ov075_022154e8(actor) == 0 &&
                (F(u32, source, 0xd0) & 0x100) == 0 &&
                Invoke(source, 0xa8) == 0)
            {
                F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x28);
                F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x2c);
            }
        }
        else
        {
            F(s16, actor, 0x6a) -= (s16)(Invoke(source, 0x1e0) >> 12) + 0x10;
        }
    }
    if (F(s32, actor, 0x2a4) == 0)
        F(u32, actor, 0x260) &= ~0x8000U;
    else
        F(u32, actor, 0x260) |= 0x8000;
    ActorExtendedLinked_UpdateFrame(actor);
    if (source != 0 && (F(u32, source, 0x29c) & 1) != 0)
    {
        F(u32, actor, 0x260) &= ~2U;
        return;
    }
    bool pair08 =
        F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 8) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_02217298, 4) ||
         F(s32, actor, 0x218) == 0);
    if (!pair08)
        F(u32, actor, 0x260) |= 0xa;
}

/* Reports whether either terminal callback pair is active. */
extern "C" s32 func_ov075_022154e8(void *actor)
{
    bool first =
        F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0x68) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_022172f8, 4) ||
         F(s32, actor, 0x218) == 0);
    bool second =
        F(s32, actor, 0x220) == F(s32, data_ov075_02217290, 0x70) &&
        (F(s32, actor, 0x224) == F(s32, data_ov075_02217300, 4) ||
         F(s32, actor, 0x220) == 0);
    return first || second;
}

/* Launches inherited random motion and releases the current source link. */
extern "C" void func_ov075_02215574(void *actor)
{
    ActorExtendedType2_LaunchRandomMotion(actor);
    func_ov075_02215910(actor);
}

/* Handles contact acquisition, pursuit, and attachment to a compatible source. */
extern "C" s32 func_ov075_0221558c(void *actor, void *other, s32 arg2,
                                    s32 arg3)
{
    if (Invoke(actor, 0x38) != 0 ||
        ((Method)F(void *, F(void *, actor, 0), 0x134))(actor, other) != 0)
        return 0;
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~1U) | 2;
    if ((F(u16, other, 0x1a) & 2) != 0)
    {
        F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x18);
        F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x1c);
        return 0;
    }
    void *source = F(void *, actor, 0x298);
    bool pursueSource = source != 0 &&
                        (F(u32, source, 0x29c) & 1) == 0 &&
                        (F(u32, source, 0xd0) & 0x100) == 0;
    if (!pursueSource)
    {
        F(u32, actor, 0xd0) &= ~2U;
        F(void *, actor, 0x228) = 0;
        if (((Method)F(void *, F(void *, actor, 0), 0x11c))(actor, other) != 0 ||
            ((Method)F(void *, F(void *, actor, 0), 0x124))(actor, other) != 0 ||
            ((Method)F(void *, F(void *, actor, 0), 0x12c))(actor, other) != 0 ||
            ((Method)F(void *, F(void *, actor, 0), 0x130))(actor, other) != 0)
            return 0;
        s32 dx = (F(s32, actor, 0x1c) - F(s32, actor, 0x230)) >> 12;
        s32 dy = (F(s32, actor, 0x20) - F(s32, actor, 0x234)) >> 12;
        if (dx * dx + dy * dy < 0x24)
        {
            F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x50);
            F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x54);
            F(s32, actor, 0x220) = F(s32, data_ov075_02217290, 0x10);
            F(s32, actor, 0x224) = F(s32, data_ov075_02217290, 0x14);
        }
        else
        {
            ((Method)F(void *, F(void *, actor, 0), 0xd0))(
                actor, P(actor, 0x22c));
        }
        return 0;
    }
    F(u32, actor, 0xd0) |= 2;
    F(void *, actor, 0x228) = source;
    s32 dx = (F(s32, actor, 0x1c) - F(s32, source, 0x1c)) >> 12;
    s32 dy = (F(s32, actor, 0x20) - F(s32, source, 0x20)) >> 12;
    if (dx * dx + dy * dy < 0x24)
    {
        F(u32, actor, 0x260) &= ~2U;
        ((Method)F(void *, F(void *, source, 0), 0x1d4))(source, actor);
        F(u32, source, 0x14) &= ~0x10U;
    }
    else
    {
        ((Method)F(void *, F(void *, actor, 0), 0xd0))(
            actor, P(source, 0x18), arg2, F(s32, source, 0x1c), arg3);
    }
    return 0;
}

/* Restores normal callback pairs and clears the terminal-state timer. */
extern "C" void func_ov075_022157c8(void *actor)
{
    Actor_RestoreSavedFlags(actor);
    F(u32, actor, 0x10) &= ~0x1f0000U;
    F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x58);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x5c);
    F(s32, actor, 0x220) = F(s32, data_ov075_02217290, 0x60);
    F(s32, actor, 0x224) = F(s32, data_ov075_02217290, 0x64);
    F(u32, actor, 0xd0) &= ~0x200U;
    F(u16, actor, 0xd6) = 2;
    F(u16, actor, 0x25a) = 0;
}

/* Counts down the terminal phase and installs its completion callback pairs. */
extern "C" s32 func_ov075_0221582c(void *actor)
{
    F(u32, actor, 0x260) &= ~1U;
    F(u8, actor, 0x24c) = 8;
    F(u16, actor, 0xd6) = 0x16;
    --F(s16, actor, 0x25a);
    if (F(s16, actor, 0x25a) < 0)
    {
        F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x98);
        F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x9c);
        F(s32, actor, 0x220) = F(s32, data_ov075_02217290, 0);
        F(s32, actor, 0x224) = F(s32, data_ov075_02217290, 4);
        F(u16, actor, 0x25a) = 0;
    }
    return 0;
}

/* Runs inherited interaction eligibility only while no terrain link is held. */
extern "C" s32 func_ov075_022158a0(void *actor)
{
    return F(void *, actor, 0x2a4) == 0
               ? ActorExtendedType2_IsInteractionEligible(actor)
               : 0;
}

/* Captures the surrounding three-by-two tile region for a new terrain link. */
extern "C" void func_ov075_022158bc(void *actor)
{
    if (F(s32, actor, 0x2a4) != 0)
        return;
    F(s32, actor, 0x2a4) = 1;
    s32 x = F(s32, actor, 0x1c) >> 16;
    s32 y = F(s32, actor, 0x20) >> 16;
    F(s32, actor, 0x2a8) = x - 1;
    F(s32, actor, 0x2b0) = x + 1;
    F(s32, actor, 0x2ac) = y - 1;
    F(s32, actor, 0x2b4) = y;
    func_ov075_02215930(actor, 7);
}

/* Releases the terrain link and clears its packed tile values. */
extern "C" void func_ov075_02215910(void *actor)
{
    if (F(s32, actor, 0x2a4) == 0)
        return;
    F(s32, actor, 0x2a4) = 0;
    func_ov075_02215930(actor, 0);
}

/* Writes one packed value across the terrain link's stored tile rectangle. */
extern "C" void func_ov075_02215930(void *actor, s32 value)
{
    void *renderer = F(void *, F(void *, data_021052fc, 0), 0x2ed4);
    for (s32 x = F(s32, actor, 0x2a8); x <= F(s32, actor, 0x2b0); ++x)
    {
        for (s32 y = F(s32, actor, 0x2ac); y <= F(s32, actor, 0x2b4); ++y)
        {
            u32 oldValue =
                ((Method)F(void *, F(void *, renderer, 0), 0x2c))(renderer,
                                                                  x, y);
            u32 packed = (oldValue & 0xfffffc1f) |
                         (((u32)value << 27) >> 22);
            DualLayerTileRenderer_SetPackedTileValue(renderer, x, y, packed);
        }
    }
}

/* Constructs the extended link source and initializes its motion vector. */
extern "C" void *func_ov075_022159c4(void *actor, void *descriptor, s32 arg2,
                                      s32 arg3)
{
    ActorExtendedLinkSource_Init(actor, descriptor, arg2, arg3);
    F(void *, actor, 0) = data_ov075_022175ec;
    F(u16, actor, 0x2a0) = 0;
    F(u16, actor, 0x2a2) &= (u16)~1;
    F(u16, actor, 0x2a2) =
        (F(u16, actor, 0x2a2) | 2) & (u16)0x0003;
    F(u16, actor, 0x2a4) = 0;
    F(u16, actor, 0x2a6) = 0;
    F(void *, actor, 0x2a8) = 0;
    func_02004fe0(P(actor, 0x2ac));
    return actor;
}

/* Destroys the extended link source while retaining caller-owned storage. */
extern "C" void *func_ov075_02215a28(void *actor)
{
    func_02005058(P(actor, 0x2ac));
    ActorExtendedLinkSource_Destroy(actor);
    return actor;
}

/* Destroys and releases the extended link-source allocation. */
extern "C" void *func_ov075_02215a48(void *actor)
{
    func_02005058(P(actor, 0x2ac));
    ActorExtendedLinkSource_Destroy(actor);
    func_02003e2c(actor);
    return actor;
}

/* Selects sprite resources, animation, and flags for every actor state. */
extern "C" void func_ov075_02215a70(void *actor)
{
    u32 resourceIndex = 0;
    u32 animation = 0;
    bool clearAnimationFlags = F(s16, actor, 0xda) == 1;
    u16 priority = 0x100;
    if (clearAnimationFlags)
        animation = F(u8, actor, 0xd4) + 0x16;
    else
    {
        switch (F(u16, actor, 0xd6))
        {
        case 1:
            priority = 0;
            clearAnimationFlags = true;
            animation = F(u8, actor, 0xd4) + 8;
            break;
        case 2:
        case 3:
        case 4:
            animation = F(u8, actor, 0xd4) + 8;
            break;
        case 5:
        case 6:
        case 7:
        {
            bool callbackPair =
                F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0xc8) &&
                (F(s32, actor, 0x21c) == F(s32, data_ov075_02217358, 4) ||
                 F(s32, actor, 0x218) == 0);
            resourceIndex = callbackPair &&
                            data_020e6ca4[F(u16, actor, 0x4e)] != 0;
            animation = F(u8, actor, 0xd4);
            break;
        }
        case 8:
        case 9:
            animation = F(u8, actor, 0xd4);
            break;
        case 11:
            animation = 0x12;
            break;
        case 13:
            clearAnimationFlags = true;
            animation = F(u8, actor, 0xd4) + 0x16;
            break;
        case 17:
            clearAnimationFlags =
                data_020e6b74[F(u16, actor, 0x4e)] != 0;
            animation = clearAnimationFlags ? 0x15 : 0;
            break;
        case 18:
            animation = 0x10;
            clearAnimationFlags = true;
            break;
        case 19:
            clearAnimationFlags =
                data_020e6adc[F(u16, actor, 0x4e)] != 0;
            animation = clearAnimationFlags ? 0x14 : F(u8, actor, 0xd4) + 8;
            break;
        case 22:
            animation = 0x11;
            break;
        default:
            break;
        }
    }
    void *resource = F(void *, actor, 0x208 + resourceIndex * 4);
    void *collection = (void *)Actor_GetCollection(actor);
    void *owner = (void *)ActorCollection_GetSpriteOwner(collection);
    GraphicsSpriteGroup_ReplaceStateResources(
        owner, F(void *, actor, 0x54), F(void *, resource, 4),
        F(void *, resource, 8), F(void *, resource, 0xc));
    void *sprite = F(void *, actor, 0x54);
    func_02072b68(sprite, animation);
    F(u16, sprite, 0x36) = priority;
    F(u16, sprite, 0x30) = 0;
    if (clearAnimationFlags)
        F(u16, sprite, 0x24) &= (u16)~3;
    else
    {
        F(u16, sprite, 0x24) &= (u16)~1;
        F(u16, sprite, 0x24) |= 2;
    }
}

/* Resets vertical motion and enters the timed linked terminal state. */
extern "C" void func_ov075_02215c90(void *actor)
{
    F(u32, actor, 0x260) |= 2;
    ActorExtendedType2_ResetVerticalMotionCallbacks(actor);
    if (func_ov075_022152ac(actor) != 0)
        F(u16, actor, 0x25a) = 300;
    Sound_PlayOwnedEffect(gSoundContext, 0x1e8, 2, actor, 0, 0x100);
}

/* Updates partner coupling, animation mirroring, and link-source presentation. */
extern "C" void func_ov075_02215cf8(void *actor)
{
    if ((F(u32, actor, 0x14) & 0x200000) != 0)
        return;
    bool pairC0 =
        F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0xc0) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_02217350, 4) ||
         F(s32, actor, 0x218) == 0);
    bool pairB8 =
        F(s32, actor, 0x218) == F(s32, data_ov075_02217290, 0xb8) &&
        (F(s32, actor, 0x21c) == F(s32, data_ov075_02217348, 4) ||
         F(s32, actor, 0x218) == 0);
    if (pairC0 || pairB8)
    {
        ActorExtendedLinkSource_ClearPartnerLinkedFlag(actor);
        F(u16, actor, 0x2a4) = 0;
        ActorExtendedLinkSource_UpdateFrame(actor);
        return;
    }
    if ((F(u32, actor, 0xd0) & 0x100) == 0 && Invoke(actor, 0xa8) == 0)
    {
        void *partner = F(void *, actor, 0x298);
        if (partner == 0)
        {
            F(u16, actor, 0xda) = 0;
            F(u16, actor, 0x2a4) = 0;
            F(u32, actor, 0x5c) &= 0xffff0000;
        }
        else
        {
            func_020050a4(P(actor, 0x22c), P(partner, 0x22c));
            bool selfLinked = (F(u32, actor, 0x29c) & 1) != 0;
            if (Invoke(partner, 0xa8) == 0 || !selfLinked)
            {
                if (!selfLinked)
                {
                    bool attach =
                        (F(u16, actor, 0x2a2) & 1) == 0 &&
                        (F(u32, partner, 0xd0) & 0x100) == 0 &&
                        Invoke(partner, 0xa8) == 0 &&
                        func_ov075_022152ac(partner) == 0 &&
                        func_ov075_022154e8(partner) == 0 &&
                        func_ov075_022152ac(actor) == 0 &&
                        func_ov075_022154e8(actor) == 0 &&
                        func_0204cfa4(F(s32, actor, 0x1c) -
                                         F(s32, partner, 0x1c),
                                     F(s32, actor, 0x20) -
                                         F(s32, partner, 0x20)) < 0x60000;
                    if (attach)
                        ((Method)F(void *, F(void *, actor, 0), 0x1d4))(
                            actor, partner);
                    F(u32, actor, 0x5c) &= 0xffff0000;
                    F(u32, partner, 0x260) |= 8;
                }
                else if ((F(u32, partner, 0xd0) & 0x100) == 0)
                {
                    F(u32, partner, 0x260) &= ~8U;
                    if (F(s16, actor, 0x2a4) == 0)
                    {
                        if (F(s16, actor, 0xda) != 0)
                        {
                            F(u16, actor, 0xda) = 0;
                            F(u32, actor, 0xd0) |= 0x1000;
                        }
                    }
                    else
                    {
                        if (F(s16, actor, 0xda) != 1)
                        {
                            F(u16, actor, 0xda) = 1;
                            F(u32, actor, 0xd0) |= 0x1000;
                        }
                        --F(s16, actor, 0x2a4);
                    }
                    if (func_ov075_022154e8(partner) == 0)
                    {
                        F(u16, actor, 0xd6) = 2;
                        if (F(u8, actor, 0xd4) != F(u8, partner, 0xd4))
                        {
                            F(u8, actor, 0xd4) = F(u8, partner, 0xd4);
                            F(u32, actor, 0xd0) |= 0x1000;
                        }
                    }
                    else if (F(s16, actor, 0xd6) != 11)
                    {
                        F(u16, actor, 0xd6) = 11;
                        F(u32, actor, 0xd0) |= 0x1000;
                    }
                    func_ov075_0221627c(actor);
                    s32 height = Invoke(actor, 0x1e0);
                    F(u32, actor, 0x5c) =
                        (F(u32, actor, 0x5c) & 0xffff0000) |
                        (((u32)height << 4) >> 16);
                }
                else
                {
                    ActorExtendedLinkSource_ClearPartnerLinkedFlag(actor);
                    F(u16, actor, 0x2a4) = 0;
                }
            }
            else
            {
                Invoke(actor, 0x1d8);
                F(u32, actor, 0xd0) |= 0x2000;
                F(u16, actor, 0xda) = 0;
                F(u16, actor, 0x2a4) = 0;
                F(u32, actor, 0x5c) &= 0xffff0000;
            }
        }
    }
    ActorExtendedLinkSource_UpdateFrame(actor);
}

/* Returns the link source's fixed capture radius. */
extern "C" s32 func_ov075_0221609c(void)
{
    return 0x2a000;
}

/* Clears a partner link and prepares reflected motion from that partner. */
extern "C" void func_ov075_022160a4(void *actor)
{
    ActorExtendedLinkSource_ClearPartnerLinkedFlag(actor);
    func_ov075_02212f10(P(actor, 0x38), 0, 0, 0);
    func_ov075_02212f10(P(actor, 0x88), 0, 0, 0);
    func_ov075_02212f10(P(actor, 0x98), 0, 0, 0);
    F(s32, actor, 0x44) = 0x2800;
    F(u16, actor, 0xda) = 0;
    F(u16, actor, 0x2a4) = 0;
    F(void *, actor, 0x2a8) = 0;
    F(u16, actor, 0x2a2) &= (u16)~1;
    F(u32, actor, 0x5c) &= 0xffff0000;
    F(u32, actor, 0x14) &= ~6U;
    void *partner = F(void *, actor, 0x298);
    F(s32, actor, 0x8c) = -F(s32, partner, 0x8c);
    F(s32, actor, 0x90) = -F(s32, partner, 0x90);
}

/* Clears inherited runtime flag two and restores motion-update flags. */
extern "C" void func_ov075_02216158(void *actor)
{
    ActorExtendedLinkSource_ClearRuntimeFlag2(actor);
    F(u32, actor, 0x14) |= 6;
}

/* Links or unlinks a partner according to the source's two link-state bits. */
extern "C" void func_ov075_02216174(void *actor, void *partner)
{
    u16 flags = F(u16, actor, 0x2a2);
    if ((flags & 2) != 0)
    {
        F(u16, actor, 0x2a2) &= (u16)~2;
        ActorExtendedLinkSource_LinkPartner(actor, partner);
        F(void *, actor, 0x2a8) = 0;
        F(u16, actor, 0x2a2) &= (u16)~1;
        F(u32, actor, 0xd0) |= 0x1000;
        F(u16, actor, 0xd6) = 2;
        return;
    }
    if ((flags & 1) != 0 || func_ov075_0221625c(partner) == 0 ||
        Invoke(actor, 0xa8) != 0)
        return;
    F(void *, actor, 0x2a8) = partner;
    F(u16, actor, 0x2a2) = (F(u16, actor, 0x2a2) | 1) & 3;
    F(u16, actor, 0x2a0) = 0;
    func_020050a4(P(actor, 0x2ac), P(actor, 0x18));
    F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0xb0);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0xb4);
}

/* Reports whether an actor is horizontally settled and link-eligible. */
extern "C" s32 func_ov075_0221625c(void *actor)
{
    return (F(u32, actor, 0xd0) & 0x10) == 0 &&
           F(s32, actor, 0x24) == F(s32, actor, 0x1dc);
}

/* Applies collision impulse, currency transfer, effects, and audio feedback. */
extern "C" void func_ov075_0221647c(void *actor, void *target, s32 dx,
                                     s32 dy, s32 distance)
{
    F(u16, actor, 0x2a4) = 90;
    F(u16, actor, 0x2a6) = 60;
    F(u32, actor, 0xd0) |= 0x1000;
    F(u16, actor, 0xda) = 1;
    void *partner = F(void *, actor, 0x298);
    F(u32, partner, 0x260) &= ~8U;
    func_ov075_02212f10(P(partner, 0x38), 0, 0, 0);
    F(u16, partner, 0xd6) = 2;
    Invoke(partner, 0x5c);
    if (F(s8, target, 0x4d) == 1 &&
        (F(u32, target, 0x230) & 0x20000) != 0)
    {
        void *singleton = (void *)ActorDerivedType1_GetSingletonObject();
        Invoke(singleton, 0xcc);
    }
    if (distance < 0x1000)
    {
        dx = 0;
        dy = -0x1000;
    }
    u32 random = genrand_int32();
    s32 sign = (random & 1) != 0 ? 1 : -1;
    s32 angle = func_020ae024(dy, dx);
    angle = (angle + (s32)(random % 0x3333) * sign) & 0xffff;
    s32 index = angle >> 4;
    s32 impulseX = data_020c9670[index * 2 + 1] * 3;
    s32 impulseY = data_020c9670[index * 2] * 3;
    u8 impulse[16];
    func_0200500c(impulse, impulseX, impulseY, 0);
    ((Method)F(void *, F(void *, actor, 0), 0xb8))(actor, impulse, 1);
    F(s32, impulse, 4) = MulFx(F(s32, impulse, 4), -0x1800);
    F(s32, impulse, 8) = MulFx(F(s32, impulse, 8), -0x1800);
    F(s32, impulse, 0xc) = MulFx(F(s32, impulse, 0xc), -0x1800);
    s32 descriptorValue = ActorExtendedType2_GetDescriptorValue28(actor);
    s32 currency = Actor_RandomizeValueByTenPercent(descriptorValue);
    if (F(s8, target, 0x4d) == 1 && currency > 0)
    {
        void *effect = (void *)func_02003e14(0x44, data_ov075_022177d0, 4,
                                             gHeapContext);
        if (effect != 0)
        {
            void *position = (void *)ActorMotionAreaFollower_GetPosition(
                F(void *, F(void *, data_021052fc, 0), 0x2fbc));
            func_02022cb0(effect, position, target, -currency, 0x2000, -192);
        }
        PresentationList_AppendObject(
            F(void *, F(void *, data_021052fc, 0), 0x2f7c), effect);
        GamePhaseCurrencyHud_AddCurrency(gLupyContext, -currency, 0);
        F(u32, target, 0x230) |= 0x40000;
        ActorDerivedType1_TeardownRecordAndApplyMotionImpulse(target, impulse);
        F(s32, target, 0x44) = 0x3000;
        F(u32, target, 0xd0) |= 0x2000;
    }
    else
    {
        ((Method)F(void *, F(void *, target, 0), 0xb8))(target, impulse, 1);
        F(s32, target, 0x44) = 0x3000;
        F(u32, target, 0xd0) |= 0x2000;
    }
    u32 sound = data_020e6e68[F(u16, actor, 0x4e)];
    if (sound != 0xffff)
        Sound_Play(gSoundContext, sound >> 7, sound & 0x7f);
    if (currency > 0)
        Actor_TurnTowardVector(actor, -impulseX, -impulseY, 0x8000);
    u8 delta[16];
    u8 scaled[16];
    u8 effectPosition[16];
    func_ov075_02214898(delta, P(target, 0x18), P(actor, 0x18));
    func_ov075_022168a8(scaled, delta, 0x2000);
    func_ov075_022168f0(effectPosition, P(actor, 0x18), scaled);
    func_02005058(scaled);
    func_02005058(delta);
    void *spark = (void *)func_02003e14(0x14, data_ov075_022177d0, 4,
                                        gHeapContext);
    if (spark != 0)
    {
        AuxiliaryTimedSpritePresentation_Init(
            spark, effectPosition, F(void *, F(void *, actor, 0x54), 0),
            0x1620, 0x1001, 0x1621, 0, -64, -1, 1);
    }
    func_02005058(effectPosition);
    func_02005058(impulse);
}

/* Multiplies every component of a wrapped vector by a fixed-point scalar. */
extern "C" void func_ov075_022168a8(void *result, const void *source,
                                     s32 scalar)
{
    func_02004fe0(result);
    F(s32, result, 4) = func_020adc90(F(s32, source, 4), scalar);
    F(s32, result, 8) = func_020adc90(F(s32, source, 8), scalar);
    F(s32, result, 0xc) = func_020adc90(F(s32, source, 0xc), scalar);
}

/* Adds two wrapped fixed-point vectors. */
extern "C" void func_ov075_022168f0(void *result, const void *left,
                                     const void *right)
{
    func_02004fe0(result);
    const void *leftValue = left != 0 ? P(left, 4) : 0;
    const void *rightValue = right != 0 ? P(right, 4) : 0;
    func_020adff0(leftValue, rightValue, P(result, 4));
}

/* Animates a thirty-frame Bezier link toward the selected partner. */
extern "C" s32 func_ov075_02216928(void *actor)
{
    if ((F(u16, actor, 0x2a2) & 1) == 0)
    {
        ActorExtendedType2_DispatchNearTargetState(actor);
        return 0;
    }
    F(u32, actor, 0x14) |= 6;
    void *target = F(void *, actor, 0x2a8);
    if (F(s16, actor, 0x2a0) < 30)
    {
        Actor_TurnTowardTargetPosition(actor, P(target, 0x18), Invoke(actor, 0x140));
        ++F(s16, actor, 0x2a0);
        u8 targetPosition[16];
        u8 delta[16];
        u8 scaled[16];
        u8 control[16];
        u8 curve[16];
        u8 position[16];
        func_02005030(targetPosition, P(target, 0x18));
        F(s32, targetPosition, 0xc) += Invoke(actor, 0x1e0);
        func_ov075_02214898(delta, targetPosition, P(actor, 0x2ac));
        func_ov075_022168a8(scaled, delta, 0x2000);
        func_ov075_022168f0(control, P(actor, 0x2ac), scaled);
        func_02005058(scaled);
        func_02005058(delta);
        F(s32, control, 0xc) += 0x30000;
        func_02004fe0(curve);
        func_0200634c(curve, P(actor, 0x2ac), targetPosition, control);
        s32 time = func_020befec(F(s16, actor, 0x2a0) << 12, 30);
        func_020064b8(position, curve, time);
        func_020050a4(P(actor, 0x18), position);
        func_02005058(position);
        func_0200637c(curve);
        func_02005058(control);
        func_02005058(targetPosition);
        return 0;
    }
    if (Invoke(target, 0xa8) == 0 &&
        (F(u32, target, 0xd0) & 0x100) == 0 &&
        Invoke(target, 0x1a8) == 0 && func_ov075_022154e8(target) == 0)
    {
        ActorExtendedLinkSource_LinkPartner(actor, target);
        F(u32, actor, 0xd0) |= 0x1000;
    }
    F(void *, actor, 0x2a8) = 0;
    F(u16, actor, 0x2a2) &= (u16)~1;
    F(u16, actor, 0xd6) = 2;
    F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0xa8);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0xac);
    F(s32, actor, 0x220) = F(s32, data_ov075_02217290, 0xa0);
    F(s32, actor, 0x224) = F(s32, data_ov075_02217290, 0xa4);
    F(u32, actor, 0x14) &= ~6U;
    return 0;
}

/* Acquires nearby eligible primary or type-seven actors for impact handling. */
extern "C" void func_ov075_0221627c(void *actor)
{
    void *partner = F(void *, actor, 0x298);
    bool partnerReady =
        F(s32, partner, 0x218) == F(s32, data_ov075_02217290, 0x48) &&
        (F(s32, partner, 0x21c) == F(s32, data_ov075_022172d8, 4) ||
         F(s32, partner, 0x218) == 0);
    if (!partnerReady || F(s16, actor, 0x2a4) != 0)
        return;
    if (F(s16, actor, 0x2a6) != 0)
    {
        --F(s16, actor, 0x2a6);
        return;
    }
    if ((F(u32, actor, 0x29c) & 1) == 0)
        return;
    void *work = F(void *, data_021052fc, 0);
    for (s32 index = 0; index < 2; ++index)
    {
        void *candidate = F(void *, work, 0x2ea4 + index * 4);
        if (candidate == 0 ||
            Actor_GetCachedTerrainHeight(candidate) != Actor_GetCachedTerrainHeight(actor))
            continue;
        bool eligible;
        if (index == 0)
        {
            u32 flags = F(u32, candidate, 0xd0);
            eligible =
                (flags & 0x100) == 0 && (flags & 0x10000) == 0 &&
                (F(u32, candidate, 0x230) & 0x980000) == 0 &&
                F(void *, candidate, 0x270) == 0 &&
                func_ov075_0221625c(candidate) != 0 &&
                F(s16, candidate, 0x268) == 0 &&
                (flags & 0x4000) == 0;
        }
        else
        {
            eligible = Type7Actor_GetStateCode(candidate) == 0 &&
                       func_ov075_0221625c(candidate) != 0 &&
                       (F(u32, candidate, 0x268) & 0x40000) == 0;
        }
        if (!eligible)
            continue;
        s32 dx = F(s32, actor, 0x1c) - F(s32, candidate, 0x1c);
        s32 dy = F(s32, actor, 0x20) - F(s32, candidate, 0x20);
        s32 distance = func_0204cfa4(dx, dy);
        if (distance < 0x20000)
            func_ov075_0221647c(actor, candidate, dx, dy, distance);
    }
}

/* Restores the first post-impact callback pairs and animation state. */
extern "C" s32 func_ov075_02216b5c(void *actor)
{
    Actor_RestoreSavedFlags(actor);
    F(u32, actor, 0x10) &= ~0x1f0000U;
    F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x38);
    F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x3c);
    F(s32, actor, 0x220) = F(s32, data_ov075_02217290, 0x90);
    F(s32, actor, 0x224) = F(s32, data_ov075_02217290, 0x94);
    F(u32, actor, 0xd0) &= ~0x200U;
    F(u16, actor, 0xd6) = 2;
    return 0;
}

/* Counts down impact recovery and installs its terminal callback pairs. */
extern "C" s32 func_ov075_02216bb8(void *actor)
{
    F(u32, actor, 0x260) &= ~1U;
    F(u8, actor, 0x24c) = 8;
    F(u16, actor, 0xd6) = 0x16;
    --F(s16, actor, 0x25a);
    if (F(s16, actor, 0x25a) < 0)
    {
        F(s32, actor, 0x218) = F(s32, data_ov075_02217290, 0x88);
        F(s32, actor, 0x21c) = F(s32, data_ov075_02217290, 0x8c);
        F(s32, actor, 0x220) = F(s32, data_ov075_02217290, 0x80);
        F(s32, actor, 0x224) = F(s32, data_ov075_02217290, 0x84);
    }
    return 0;
}

/* Reports an active, visible interaction with an idle virtual state. */
extern "C" s32 func_ov075_02216c20(void *actor)
{
    return (F(u32, actor, 0x260) & 8) != 0 &&
           (F(u32, actor, 0x260) & 2) != 0 && Invoke(actor, 0xa8) == 0;
}

/* Reports whether normal animation is active without a partner link. */
extern "C" s32 func_ov075_02216c68(void *actor)
{
    return F(s16, actor, 0xd6) != 0x10 &&
           (F(u32, actor, 0x29c) & 1) == 0;
}

/* Forwards the terminal partner-detach virtual callback. */
extern "C" void func_ov075_02216c8c(void *actor)
{
    Invoke(actor, 0x1bc);
}
