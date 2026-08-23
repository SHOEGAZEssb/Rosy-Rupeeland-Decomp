#include "tingle/types.h"

/*
 * Overlay 81 actor implementation.
 *
 * This overlay owns a derived actor used by actor specification 0x258.  It
 * loads and switches the actor's sprite resources, runs a table-driven motion
 * state machine, resolves actor-pair contact, drives a Type7 marker
 * presentation, and emits the actor-specific sound and debug feedback.  The
 * retail layout is still only partly named, so actor members which are shared
 * with unrecovered base classes remain explicit offsets.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define VCALL(type, object, offset) \
    ((type)(*(void ***)((u8 *)(object)))[(offset) / sizeof(void *)])

typedef struct Overlay081Vector {
    u32 vtable;
    s32 x;
    s32 y;
    s32 z;
} Overlay081Vector;

/* State records contain a callback/virtual offset and its dispatch selector. */
typedef struct Overlay081StateDescriptor {
    u32 callback;
    u32 selector;
} Overlay081StateDescriptor;

typedef void (*Overlay081VoidMethod)(void *);
typedef s32 (*Overlay081QueryMethod)(void *);
typedef void (*Overlay081PairMethod)(void *, void *, s32);
typedef void (*Overlay081PositionMethod)(void *, const void *);
typedef void (*Overlay081TargetMethod)(void *, void *, s32);
typedef void (*Overlay081ResourceMethod)(void *, void *);

extern void *data_020f4e18;
extern const s16 data_020c9670[];
extern u8 *data_021052fc;
extern u8 gActorRuntimeCollection[];
extern void *gDebugFont;
extern void *gSoundContext;

extern const u8 data_ov081_02215268[];
extern const u8 data_ov081_02215270[];
extern const u8 data_ov081_02215278[];
extern const u8 data_ov081_02215280[];
extern const u8 data_ov081_02215288[];
extern const u8 data_ov081_02215290[];
extern const u8 data_ov081_02215298[];
extern const u8 data_ov081_022152a0[];
extern const u8 data_ov081_022152a8[];
extern const u8 data_ov081_022152b0[];
extern const u8 data_ov081_022152b8[];
extern const u8 data_ov081_022152c0[];
extern const u8 data_ov081_022152c8[];
extern const u8 data_ov081_022152d0[];
extern const u8 data_ov081_022152d8[];
extern const u8 data_ov081_022152e0[];
extern const u8 data_ov081_022152e8[];
extern const u8 data_ov081_022152f0[];
extern const u8 data_ov081_022152f8[];
extern const u8 data_ov081_02215300[];
extern const u8 data_ov081_02215308[];
extern const u8 data_ov081_02215310[];
extern const u8 data_ov081_02215318[];
extern const u8 data_ov081_02215320[];
extern const u8 data_ov081_02215328[];
extern const u8 data_ov081_02215330[];
extern const u8 data_ov081_02215338[];
extern const u8 data_ov081_02215340[];
extern const u8 data_ov081_02215350[];
extern const u8 data_ov081_02215358[];
extern const u8 data_ov081_02215360[];
extern const u8 data_ov081_02215368[];
extern const u8 data_ov081_02215370[];
extern const u8 data_ov081_02215378[];
extern const u8 data_ov081_02215380[];
extern const u8 data_ov081_022153b8[];
extern const Overlay081StateDescriptor data_ov081_022153e0[];
extern const Overlay081StateDescriptor data_ov081_02215428[];
extern const u8 data_ov081_0221551c[];
extern const u8 data_ov081_02215540[];
extern const u8 data_ov081_02215670[];
extern const char data_ov081_02215798[];
extern const char data_ov081_022157a8[];
extern const char data_ov081_022157c4[];
extern const char data_ov081_022157e0[];
extern const char data_ov081_022157e8[];
extern const char data_ov081_022157f0[];
extern const char data_ov081_022157f8[];
extern const char data_ov081_02215800[];
extern const char data_ov081_02215808[];
extern const char data_ov081_02215810[];
extern const char data_ov081_02215814[];
extern const char data_ov081_0221581c[];
extern const char data_ov081_02215824[];
extern const char data_ov081_02215830[];
extern const char data_ov081_0221583c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetOwningCollection(void *);
extern s32 Actor_GetCachedTerrainHeight(void *);
extern s32 Actor_QueryTerrainHeight(void *, s32, s32);
extern void Actor_RefreshCachedTerrainHeight(void *);
extern void Actor_SetRuntimeFlag80(void *);
extern void Actor_SynchronizeStatePresentation(void *);
extern void Actor_UpdateTimedResourceState(void *);
extern void *ActorCollection_GetSpriteGroup(void *);
extern s32 ActorDerivedRuntime_AcceptInteractionQuery(void *);
extern void *ActorDerivedRuntime_DestroyAlternate(void *);
extern s32 ActorDerivedRuntime_HandlePairActive(void *, void *, s32);
extern void *ActorDerivedRuntime_Init(void *, const void *);
extern void ActorDerivedRuntime_UpdateFrame(void *);
extern void ActorDerivedType1_TrySetStateVector(void *, const void *, s32, s32);
extern void *ActorMotionAreaFollower_GetPosition(void *);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *);
extern void DebugText_Printf(void *, s32, s32, s32, const char *, ...);
extern void Actor_UpdatePresentation(void *, void *, s32);
extern void Actor_TurnTowardVector(void *, s32, s32, s32);
extern void Actor_TurnTowardTargetPosition(void *, const void *, s32);
extern void func_02033b38(void *);
extern s32 Fx32Vector2_Magnitude(s32, s32);
#ifdef __MWERKS__
/* These two exact ARM callers leave the tested icon pointer in r0. */
extern s32 ActorInteractionIcon_IsActive(void);
#define ACTOR_INTERACTION_ICON_IS_ACTIVE(icon) ActorInteractionIcon_IsActive()
#else
extern s32 ActorInteractionIcon_IsActive(const void *icon);
#define ACTOR_INTERACTION_ICON_IS_ACTIVE(icon) ActorInteractionIcon_IsActive(icon)
#endif
extern void Sound_PlayEffectWithParameters(void *, s32, s32, s32, s32, s32);
extern void Sound_PlayOwnedEffect(void *, s32, s32, void *, s32, s32, ...);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern s32 func_020adae4(s32, s32);
extern s32 func_020adc90(s32, s32);
extern s32 func_020adcac(const void *, const void *);
extern void func_020adfbc(const void *, const void *, void *);
extern void func_020adff0(const void *, const void *, void *);
extern s32 func_020ae024(s32, s32);
extern u32 SignedAbsoluteValueVariant(s32);
extern s32 func_020befec(s32, s32);
extern u64 func_020bf1f8(u32, u32);
extern u32 genrand_int32(void);
extern void *GraphicsSpriteGroup_CreateState(void *, u32, u32, u32, s32);
extern void GraphicsSpriteGroup_ReplaceStateResources(void *, void *, u32, u32,
                                                      u32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void Heap_Free(void *);
extern void OS_Halt(void);
extern void Type7MarkerPresentation_Destroy(void *);
extern void Type7MarkerPresentation_Init(void *, void *);
extern void Type7MarkerPresentation_ReloadResources(void *, s32);
extern void Type7MarkerPresentation_SelectAnimation(void *, s32);
extern void VecFx32Object_Assign(void *, const void *);
extern void VecFx32Object_Destroy(void *);
extern s32 VecFx32Object_GetMagnitude(const void *);
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_InitCopy(void *, const void *);
#ifdef __cplusplus
}
#endif

/* Forward declarations for relationships internal to the overlay. */
void *func_ov081_02212b94(void *, const void *);
void *func_ov081_02212d1c(void *);
void func_ov081_02212d64(void *, const void *);
void func_ov081_02212de0(void *);
void func_ov081_022130dc(void *);
void func_ov081_0221312c(void *, s32, s32, s32);
void func_ov081_02213370(void *, const void *);
void func_ov081_02213528(void *, const void *, const void *);
void func_ov081_022135a4(void *);
void func_ov081_0221367c(void *);
void func_ov081_02213710(void *, u32, u32, s32);
void *func_ov081_022140a0(void *);
void func_ov081_02214524(void *, s32);
void func_ov081_02214f20(void *, const void *, const void *);

static const Overlay081StateDescriptor *Overlay081_State(const void *data)
{
    return (const Overlay081StateDescriptor *)data;
}

/* Dispatch a state record, whose low selector bit distinguishes direct from virtual calls. */
static void Overlay081_DispatchState(void *actor,
                                     const Overlay081StateDescriptor *state)
{
    Overlay081VoidMethod callback;

    if ((state->selector & 1) == 0) {
        callback = (Overlay081VoidMethod)state->callback;
    } else {
        void *subobject = (u8 *)actor + (state->selector >> 1);
        callback = *(Overlay081VoidMethod *)((u8 *)(*(void **)subobject) +
                                             state->callback);
    }
    callback(actor);
}

/* Invoke virtual slot 0x120; callers use these distinct entries as vtable adapters. */
void func_ov081_02212ae0(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212af4(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b08(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b1c(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b30(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b44(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b58(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b6c(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/* Invoke virtual slot 0x120; this address is retained for a separate callback record. */
void func_ov081_02212b80(void *actor)
{
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/*
 * Construct the overlay's common derived actor.  The configuration is consumed
 * after the base constructor: a non-null word at +0x2c triggers virtual slot
 * 0x74.  Initializes the position copy and motion defaults and returns actor.
 */
void *func_ov081_02212b94(void *actor, const void *configuration)
{
    ActorDerivedRuntime_Init(actor, configuration);
    FIELD(const void *, actor, 0) = data_ov081_02215670;
    VecFx32Object_Init((u8 *)actor + 0x214);
    FIELD(u32, actor, 0x224) = 0x666;
    FIELD(s32, actor, 0x228) = 0x1000;
    FIELD(u16, actor, 0x23a) = 0xffff;
    FIELD(u16, actor, 0x23c) = 0;
    FIELD(u16, actor, 0x23e) = 0;
    FIELD(s32, actor, 0x240) = 0x1000;
    VecFx32Object_Assign((u8 *)actor + 0x214, (u8 *)actor + 0x18);
    if ((FIELD(u32, actor, 0x14) & 0x400) != 0)
        FIELD(u32, actor, 0xd0) |= 4;
    VCALL(Overlay081VoidMethod, actor, 0xc4)(actor);
    if (FIELD(void *, configuration, 0x2c) != 0)
        VCALL(Overlay081ResourceMethod, actor, 0x74)(
            actor, FIELD(void *, configuration, 0x2c));
    return actor;
}

/* Alternate constructor entry; behavior and return value match func_ov081_02212b94. */
void *func_ov081_02212c40(void *actor, const void *configuration)
{
    return func_ov081_02212b94(actor, configuration);
}

/* Install the initial state, clear target +0x210, and reset position/motion fields. */
void func_ov081_02212cec(void *actor)
{
    const Overlay081StateDescriptor *state = Overlay081_State(data_ov081_022152c8);
    func_ov081_02213710(actor, state->callback, state->selector, 0x78);
    FIELD(void *, actor, 0x210) = 0;
    func_ov081_022130dc(actor);
}

/* Destroy the embedded vector and base actor, returning the original actor pointer. */
void *func_ov081_02212d1c(void *actor)
{
    VecFx32Object_Destroy((u8 *)actor + 0x214);
    return ActorDerivedRuntime_DestroyAlternate(actor);
}

/* Destroy the actor and then release its heap allocation; return the original pointer. */
void *func_ov081_02212d3c(void *actor)
{
    void *result = func_ov081_02212d1c(actor);
    Heap_Free(actor);
    return result;
}

/*
 * Load the descriptor's sprite resource triplet into +0x1f0, create attachment
 * +0x54, invoke virtual setup slot 0x14, and apply descriptor palette byte
 * +0x3c for actors carrying flag 0x80.
 */
void func_ov081_02212d64(void *actor, const void *descriptor)
{
    void *owner;

    func_02071ee0((u8 *)actor + 0x1f0, data_020f4e18,
                  FIELD(s32, descriptor, 4), FIELD(s32, descriptor, 8),
                  FIELD(s32, descriptor, 0xc));
    owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
    FIELD(void *, actor, 0x54) = GraphicsSpriteGroup_CreateState(
        owner, FIELD(u32, actor, 0x1f0), FIELD(u32, actor, 0x1f4),
        FIELD(u32, actor, 0x1f8), FIELD(u8, descriptor, 0x10));
    VCALL(Overlay081VoidMethod, actor, 0x14)(actor);
    if ((FIELD(u32, actor, 0x14) & 0x80) != 0)
        FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) =
            (u8)FIELD(s16, descriptor, 0x3c);
}

/*
 * Run one common actor frame.  A pending attachment or inactive runtime takes
 * the teardown-facing path; otherwise the current state callback, motion,
 * animation, and final virtual update slots execute in retail order.
 */
void func_ov081_02212de0(void *actor)
{
    s32 state;

    if (FIELD(void *, actor, 0x114) != 0) {
        ActorDerivedRuntime_UpdateFrame(actor);
        return;
    }

    VCALL(Overlay081VoidMethod, actor, 0x18)(actor);
    Actor_SetRuntimeFlag80(actor);
    Actor_UpdateTimedResourceState(actor);
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) != 0 ||
        (FIELD(u32, actor, 0x14) & 0x10000000) != 0) {
        state = FIELD(s16, actor, 0xd6);
        if ((u32)(state - 5) <= 2) {
            FIELD(s16, actor, 0xd6) = 1;
            VCALL(Overlay081VoidMethod, actor, 0x5c)(actor);
        }
        VCALL(Overlay081VoidMethod, actor, 0x20)(actor);
        return;
    }

    FIELD(u16, actor, 0x23c) &= 2;
    FIELD(s16, actor, 0xd6) = 1;
    FIELD(s32, actor, 0x3c) = 0;
    FIELD(s32, actor, 0x40) = 0;
    if (VCALL(Overlay081QueryMethod, actor, 0x38)(actor) == 0) {
        if (FIELD(s32, actor, 0x234) != -1) {
            if (FIELD(s32, actor, 0x230) < FIELD(s32, actor, 0x234))
                ++FIELD(s32, actor, 0x230);
            else
                func_ov081_0221367c(actor);
        }

        {
            Overlay081StateDescriptor stateDescriptor;
            stateDescriptor.callback = FIELD(u32, actor, 0x208);
            stateDescriptor.selector = FIELD(u32, actor, 0x20c);
            Overlay081_DispatchState(actor, &stateDescriptor);
        }

        state = FIELD(s16, actor, 0xd6);
        if ((u32)(state - 1) <= 1 &&
            VCALL(Overlay081QueryMethod, actor, 0x124)(actor) != 0)
            FIELD(s16, actor, 0xd6) = 5;

        if (FIELD(void *, actor, 0x210) != 0) {
            Actor_TurnTowardTargetPosition(actor, (u8 *)FIELD(void *, actor, 0x210) + 0x18,
                          0x800);
        } else if (VecFx32Object_GetMagnitude((u8 *)actor + 0x98) > 0x19a) {
            Actor_TurnTowardVector(actor, FIELD(s32, actor, 0x9c),
                          FIELD(s32, actor, 0xa0), 0x400);
        } else {
            Actor_TurnTowardVector(actor, FIELD(s32, actor, 0x3c),
                          FIELD(s32, actor, 0x40), 0x800);
        }
    }

    VCALL(Overlay081VoidMethod, actor, 0xa4)(actor);
    Actor_SynchronizeStatePresentation(actor);
    VCALL(Overlay081VoidMethod, actor, 0x20)(actor);
}

/*
 * Rebind the current sprite resources, select the animation implied by state
 * +0xd6/+0xda, and update the low presentation-flag bits at sprite +0x24.
 */
void func_ov081_02212fe4(void *actor)
{
    void *sprite = FIELD(void *, actor, 0x54);
    s32 animation = -1;
    u16 setFlags = 2;
    u16 clearFlags = 1;

    GraphicsSpriteGroup_ReplaceStateResources(
        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)), sprite,
        FIELD(u32, actor, 0x1f0), FIELD(u32, actor, 0x1f4),
        FIELD(u32, actor, 0x1f8));

    switch (FIELD(s16, actor, 0xd6)) {
    case 1:
        animation = FIELD(u8, actor, 0xd4) + 8;
        clearFlags = 3;
        setFlags = 0;
        break;
    case 2:
    case 3:
    case 4:
        animation = FIELD(u8, actor, 0xd4) + 8;
        break;
    case 5:
    case 6:
    case 7:
        animation = FIELD(s16, actor, 0xda) == 1
                        ? FIELD(u8, actor, 0xd4) + 0x19
                        : FIELD(u8, actor, 0xd4);
        break;
    case 8:
        animation = FIELD(u8, actor, 0xd4);
        break;
    }

    if (animation != -1) {
        if (animation != FIELD(u8, sprite, 0x38))
            GraphicsSpriteState_SetAnimationIndex(sprite, animation);
        FIELD(u16, sprite, 0x24) &= (u16)~clearFlags;
        FIELD(u16, sprite, 0x24) |= setFlags;
    }
}

/* Restore the actor position and terrain height, then clear both motion vectors. */
void func_ov081_022130dc(void *actor)
{
    VecFx32Object_Assign((u8 *)actor + 0x18, (u8 *)actor + 0x214);
    Actor_RefreshCachedTerrainHeight(actor);
    FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
    func_ov081_0221312c((u8 *)actor + 0x38, 0, 0, 0);
    func_ov081_0221312c((u8 *)actor + 0x88, 0, 0, 0);
}

/* Assign x/y/z after the vector's four-byte vtable word; returns no value. */
void func_ov081_0221312c(void *vector, s32 x, s32 y, s32 z)
{
    u8 *components = (u8 *)vector;

    if (components != 0)
        components += 4;
    FIELD(s32, components, 0) = x;
    FIELD(s32, components, 4) = y;
    FIELD(s32, components, 8) = z;
}

/*
 * Resolve active contact with actor kinds 1,2,3,7,9.  Contact impulses are
 * split for kinds 3/9, reduced for flag 0x10, and otherwise applied to this
 * actor.  It can play the packed sound at +0x23a, then delegates pair handling.
 */
void func_ov081_0221313c(void *actor, void *other, s32 mode)
{
    u8 kind;
    s32 dx;
    s32 dy;
    s32 distance;
    s32 impulseX;
    s32 impulseY;

    if (ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0 &&
        FIELD(void *, actor, 0x114) == 0) {
        kind = FIELD(u8, other, 0x4d);
        if (kind == 1 || kind == 2 || kind == 3 || kind == 7 || kind == 9) {
            dx = FIELD(s32, other, 0x1c) - FIELD(s32, actor, 0x1c);
            dy = FIELD(s32, other, 0x20) - FIELD(s32, actor, 0x20);
            distance = Fx32Vector2_Magnitude(dx, dy);
            if (distance > 0x1000) {
                impulseX = func_020adc90(dx, distance) * 3 / 2;
                impulseY = func_020adc90(dy, distance) * 3 / 2;
                if ((FIELD(u32, actor, 0xd0) & 0x10) != 0) {
                    impulseX /= 2;
                    impulseY /= 2;
                }

                if (kind == 9) {
                    FIELD(s32, other, 0x9c) += impulseX / 2;
                    FIELD(s32, other, 0xa0) += impulseY / 2;
                    FIELD(s32, actor, 0x8c) -= impulseX / 2;
                    FIELD(s32, actor, 0x90) -= impulseY / 2;
                } else if (kind == 3) {
                    FIELD(s32, actor, 0x8c) -= impulseX / 2;
                    FIELD(s32, actor, 0x90) -= impulseY / 2;
                } else {
                    FIELD(s32, actor, 0x9c) -= impulseX;
                    FIELD(s32, actor, 0xa0) -= impulseY;
                }

                if (mode == 0 && (FIELD(u32, actor, 0xd0) & 0x10) == 0 &&
                    FIELD(u16, actor, 0x23a) != 0xffff) {
                    u16 sound = FIELD(u16, actor, 0x23a);
                    Sound_PlayOwnedEffect(gSoundContext, sound >> 7, sound & 0x7f,
                                  actor, 0, 0x100);
                }
                if (FIELD(s32, actor, 0x234) != -1)
                    FIELD(s32, actor, 0x230) = FIELD(s32, actor, 0x234);
            }
        }
    }
    ActorDerivedRuntime_HandlePairActive(actor, other, mode);
}

/*
 * Recompute motion toward +0x78.  Distant targets select state 5/6/7 and a
 * fixed-point direction; nearby targets stop in state 1.  Terrain and virtual
 * obstruction checks can override the state with 8 or clear all impulses.
 */
void func_ov081_02213370(void *actor, const void *target)
{
    Overlay081Vector delta;
    s32 magnitude;
    s32 speed;
    s32 angle;

    VecFx32Object_Assign((u8 *)actor + 0x78, target);
    func_ov081_02213528(&delta, (u8 *)actor + 0x78, (u8 *)actor + 0x18);
    magnitude = Fx32Vector2_Magnitude(delta.x, delta.y);
    if (magnitude > 0x4000) {
        if ((FIELD(u32, actor, 0xd0) & 2) != 0) {
            speed = FIELD(s32, actor, 0x228);
            FIELD(s16, actor, 0xd6) = 7;
        } else {
            speed = FIELD(s32, actor, 0x224);
            if (FIELD(u32, actor, 0x208) ==
                    FIELD(u32, data_ov081_02215268, 0x68) &&
                (FIELD(u32, actor, 0x20c) ==
                     FIELD(u32, data_ov081_022152d0, 4) ||
                 FIELD(u32, actor, 0x208) == 0))
                FIELD(s16, actor, 0xd6) = 6;
            else
                FIELD(s16, actor, 0xd6) = 5;
        }
        if ((FIELD(u16, actor, 0x23c) & 2) != 0)
            speed *= 2;
        if ((FIELD(u32, actor, 0x14) & 0x40) != 0)
            speed = func_020befec(speed, 10);
        angle = func_020ae024(delta.y, delta.x) >> 4;
        FIELD(s32, actor, 0x3c) = speed * data_020c9670[angle * 2 + 1] >> 12;
        FIELD(s32, actor, 0x40) = speed * data_020c9670[angle * 2] >> 12;
    } else {
        if (FIELD(s16, actor, 0xd8) == 7) {
            FIELD(s32, actor, 0x8c) = FIELD(s32, actor, 0x3c) / 2;
            FIELD(s32, actor, 0x90) = FIELD(s32, actor, 0x40) / 2;
        }
        FIELD(s32, actor, 0x3c) = 0;
        FIELD(s32, actor, 0x40) = 0;
        FIELD(s16, actor, 0xd6) = 1;
    }
    if ((FIELD(u32, actor, 0x14) & 0x40) == 0 &&
        FIELD(s32, actor, 0x1dc) < FIELD(s32, actor, 0x24))
        FIELD(s16, actor, 0xd6) = 8;
    if ((FIELD(u32, actor, 0xd0) & 4) != 0 &&
        VCALL(Overlay081QueryMethod, actor, 0x30)(actor) != 0) {
        FIELD(s32, actor, 0x8c) = 0;
        FIELD(s32, actor, 0x90) = 0;
        FIELD(s32, actor, 0x94) = 0;
    }
    VecFx32Object_Destroy(&delta);
}

/* Build a vector whose components are the difference of the two input vectors. */
void func_ov081_02213528(void *result, const void *left, const void *right)
{
    VecFx32Object_Init(result);
    func_020adfbc(left == 0 ? 0 : (const u8 *)left + 4,
                  right == 0 ? 0 : (const u8 *)right + 4,
                  (u8 *)result + 4);
}

/* Select state data_022152b0 for duration and invoke virtual slot 0xcc. */
void func_ov081_02213560(void *actor, void *argument, s32 duration)
{
    const Overlay081StateDescriptor *state = Overlay081_State(data_ov081_022152b0);
    FIELD(s32, actor, 0x234) = duration;
    func_ov081_02213710(actor, state->callback, state->selector, duration);
    VCALL(Overlay081ResourceMethod, actor, 0xcc)(actor, argument);
}

/* Store the actor target pointer at +0x210. */
void func_ov081_0221359c(void *actor, void *target)
{
    FIELD(void *, actor, 0x210) = target;
}

/* Enter state 2, set runtime flag 0x1000, and select the 120-frame state record. */
void func_ov081_022135a4(void *actor)
{
    const Overlay081StateDescriptor *state = Overlay081_State(data_ov081_022152b8);
    FIELD(s16, actor, 0xd6) = 2;
    FIELD(u32, actor, 0xd0) |= 0x1000;
    func_ov081_02213710(actor, state->callback, state->selector, 0x78);
}

/* Randomly choose one of six state-table entries and its bounded duration. */
void func_ov081_022135d4(void *actor)
{
    u32 random = genrand_int32();
    s32 index;
    s32 duration;

    if ((random & 0xf) == 0) {
        index = 5;
        duration = (s32)(func_020bf1f8(random, 0x3c) >> 32) + 0x3c;
    } else {
        index = (s32)(func_020bf1f8(random, 9) >> 32);
        if ((FIELD(u32, actor, 0xd0) & 0x10) != 0)
            ++index;
        if (FIELD(u8, actor, 0x4a) != 0)
            index += 2;
        if (index > 5)
            index = 5;
        duration = (s32)(func_020bf1f8(random, 0x78) >> 32) + 0x50;
    }
    FIELD(s32, actor, 0x234) = duration;
    func_ov081_02213710(actor, data_ov081_022153e0[index].callback,
                        data_ov081_022153e0[index].selector, duration);
}

/* Return whether the +0x98 motion vector magnitude exceeds 0.5 in fx32 units. */
s32 func_ov081_02213660(void *actor)
{
    return VecFx32Object_GetMagnitude((u8 *)actor + 0x98) > 0x800;
}

/*
 * Advance to the next state using the nine-entry current-state/transition
 * tables.  A missing current state is a retail invariant violation and halts.
 */
void func_ov081_0221367c(void *actor)
{
    s32 i;

    for (i = 0; i < 9; ++i) {
        const Overlay081StateDescriptor *current = &data_ov081_022153e0[i];
        if (current->callback == FIELD(u32, actor, 0x208) &&
            (current->selector == FIELD(u32, actor, 0x20c) ||
             current->callback == 0)) {
            Overlay081_DispatchState(actor, &data_ov081_02215428[i]);
            return;
        }
    }
    OS_Halt();
}

/* Install a state callback/selector, clear both timers, and set its duration. */
void func_ov081_02213710(void *actor, u32 callback, u32 selector, s32 duration)
{
    FIELD(u32, actor, 0x208) = callback;
    FIELD(u32, actor, 0x20c) = selector;
    FIELD(s32, actor, 0x22c) = 0;
    FIELD(s32, actor, 0x230) = 0;
    FIELD(s32, actor, 0x234) = duration;
}

/*
 * If the actor has left the squared +0x240 radius around +0x214 (or byte +0x4b
 * forces a refresh), copy the target through virtual slot 0xc8, clear +0x210,
 * install the 300-frame return state, and report one.  Otherwise report zero.
 */
s32 func_ov081_0221373c(void *actor)
{
    s32 dx = (FIELD(s32, actor, 0x1c) - FIELD(s32, actor, 0x218)) >> 12;
    s32 dy = (FIELD(s32, actor, 0x20) - FIELD(s32, actor, 0x21c)) >> 12;

    if (FIELD(u8, actor, 0x4b) == 0 &&
        dx * dx + dy * dy <= FIELD(s32, actor, 0x240))
        return 0;
    VCALL(Overlay081PositionMethod, actor, 0xc8)(actor, (u8 *)actor + 0x214);
    FIELD(void *, actor, 0x210) = 0;
    {
        const Overlay081StateDescriptor *state =
            Overlay081_State(data_ov081_022152e8);
        func_ov081_02213710(actor, state->callback, state->selector, 0x12c);
    }
    return 1;
}

/* Shared completion test for the four state callbacks at 0x22137c8..0x2213888. */
static s32 Overlay081_UpdateStateCode(void *actor, s16 normalState)
{
    if (VCALL(Overlay081QueryMethod, actor, 0xd4)(actor) == 0) {
        FIELD(s16, actor, 0xd6) =
            FIELD(s32, actor, 0x1dc) < FIELD(s32, actor, 0x24)
                ? 8
                : normalState;
    }
    return 0;
}

/* After virtual slot 0xd4 completes, select normal state 1 or terrain state 8. */
s32 func_ov081_022137c8(void *actor)
{
    return Overlay081_UpdateStateCode(actor, 1);
}

/* After virtual slot 0xd4 completes, select normal state 2 or terrain state 8. */
s32 func_ov081_02213808(void *actor)
{
    return Overlay081_UpdateStateCode(actor, 2);
}

/* After virtual slot 0xd4 completes, select normal state 3 or terrain state 8. */
s32 func_ov081_02213848(void *actor)
{
    return Overlay081_UpdateStateCode(actor, 3);
}

/* After virtual slot 0xd4 completes, select normal state 4 or terrain state 8. */
s32 func_ov081_02213888(void *actor)
{
    return Overlay081_UpdateStateCode(actor, 4);
}

/* Complete a motion state after slot 0xd4, advancing once both impulses stop. */
static s32 Overlay081_UpdateMotionState(void *actor)
{
    if (VCALL(Overlay081QueryMethod, actor, 0xd4)(actor) != 0)
        return 0;
    VCALL(Overlay081PositionMethod, actor, 0xc8)(actor, (u8 *)actor + 0x78);
    if (FIELD(s32, actor, 0x3c) == 0 && FIELD(s32, actor, 0x40) == 0)
        func_ov081_0221367c(actor);
    return 0;
}

/*
 * On state entry, choose a random direction and distance in [0x18000,0x77fff],
 * offset +0x78, query its terrain height into +0x84, then run normal motion.
 */
s32 func_ov081_022138c8(void *actor)
{
    s32 angle;
    s32 distance;

    FIELD(u32, actor, 0xd0) &= ~2U;
    if (FIELD(s32, actor, 0x230) == 0) {
        VecFx32Object_Assign((u8 *)actor + 0x78, (u8 *)actor + 0x214);
        angle = (s32)(genrand_int32() & 0xffff) >> 4;
        distance = (s32)(func_020bf1f8(genrand_int32(), 0x60000) >> 32) +
                   0x18000;
        FIELD(s32, actor, 0x7c) += distance * data_020c9670[angle * 2 + 1];
        FIELD(s32, actor, 0x80) += distance * data_020c9670[angle * 2];
        FIELD(s32, actor, 0x84) = Actor_QueryTerrainHeight(
                                       actor, FIELD(s32, actor, 0x7c) >> 16,
                                       FIELD(s32, actor, 0x80) >> 16)
                                   << 16;
        FIELD(void *, actor, 0x210) = 0;
    }
    if (VCALL(Overlay081QueryMethod, actor, 0xd4)(actor) == 0) {
        if (FIELD(u8, actor, 0x4b) != 0) {
            func_ov081_0221367c(actor);
        } else {
            VCALL(Overlay081PositionMethod, actor, 0xc8)(actor,
                                                        (u8 *)actor + 0x78);
            if (FIELD(s32, actor, 0x3c) == 0 &&
                FIELD(s32, actor, 0x40) == 0)
                func_ov081_0221367c(actor);
        }
    }
    return 0;
}

/*
 * On entry, offset target +0x78 by 0x80000 in a random direction, clear the
 * target actor, and run until both motion components stop.  Clears flag 2.
 */
s32 func_ov081_022139dc(void *actor)
{
    s32 angle;

    FIELD(u32, actor, 0xd0) &= ~2U;
    if (FIELD(s32, actor, 0x230) == 0) {
        VecFx32Object_Assign((u8 *)actor + 0x78, (u8 *)actor + 0x214);
        angle = (s32)(genrand_int32() & 0xffff) >> 4;
        FIELD(s32, actor, 0x7c) += data_020c9670[angle * 2 + 1] << 19;
        FIELD(s32, actor, 0x80) += data_020c9670[angle * 2] << 19;
        FIELD(void *, actor, 0x210) = 0;
    }
    return Overlay081_UpdateMotionState(actor);
}

/* Same random 0x80000 target motion as func_ov081_022139dc, but sets flag 2. */
s32 func_ov081_02213aac(void *actor)
{
    s32 angle;

    FIELD(u32, actor, 0xd0) |= 2;
    if (FIELD(s32, actor, 0x230) == 0) {
        VecFx32Object_Assign((u8 *)actor + 0x78, (u8 *)actor + 0x214);
        angle = (s32)(genrand_int32() & 0xffff) >> 4;
        FIELD(s32, actor, 0x7c) += data_020c9670[angle * 2 + 1] << 19;
        FIELD(s32, actor, 0x80) += data_020c9670[angle * 2] << 19;
        FIELD(void *, actor, 0x210) = 0;
    }
    return Overlay081_UpdateMotionState(actor);
}

/* Copy the saved position on entry, set flag 2, and advance when motion stops. */
s32 func_ov081_02213b7c(void *actor)
{
    FIELD(u32, actor, 0xd0) |= 2;
    if (FIELD(s32, actor, 0x230) == 0) {
        VecFx32Object_Assign((u8 *)actor + 0x78, (u8 *)actor + 0x214);
        FIELD(void *, actor, 0x210) = 0;
    }
    VCALL(Overlay081PositionMethod, actor, 0xc8)(actor, (u8 *)actor + 0x78);
    if (FIELD(s32, actor, 0x3c) == 0 && FIELD(s32, actor, 0x40) == 0)
        func_ov081_0221367c(actor);
    return 0;
}

/*
 * Follow target +0x210 using its virtual position builder at slot 0xb4.  A
 * missing target enters the fallback state; otherwise the temporary vector is
 * passed to this actor's slot 0xc8 and destroyed.  Returns zero.
 */
s32 func_ov081_02213be8(void *actor)
{
    Overlay081Vector position;
    void *target = FIELD(void *, actor, 0x210);

    FIELD(u32, actor, 0xd0) |= 2;
    if (target == 0) {
        func_ov081_022135a4(actor);
    } else {
        VCALL(void (*)(void *, void *, void *), target, 0xb4)(target, &position,
                                                              actor);
        VCALL(Overlay081PositionMethod, actor, 0xc8)(actor, &position);
        VecFx32Object_Destroy(&position);
    }
    return 0;
}

/* Initialize result as a copy of actor position +0x18. */
void func_ov081_02213c50(void *result, const void *actor)
{
    VecFx32Object_InitCopy(result, (const u8 *)actor + 0x18);
}

/* Return true when the installed state matches a vtable callback and selector record. */
static s32 Overlay081_StateEquals(void *actor, u32 callbackOffset,
                                  const void *selectorRecord)
{
    u32 callback = FIELD(u32, data_ov081_02215268, callbackOffset);
    return FIELD(u32, actor, 0x208) == callback &&
           (FIELD(u32, actor, 0x20c) == FIELD(u32, selectorRecord, 4) ||
            callback == 0);
}

/*
 * Draw the actor's debug lines.  Disabled actors print the three fixed status
 * strings; active actors print the recognized state name, state-code name,
 * and the +0x218/+0x21c fixed-point coordinates.  DebugText_Printf performs
 * the sprite-font writes; this helper has no gameplay state changes.
 */
void func_ov081_02213c60(void *actor, s32 column)
{
    const char *stateName = 0;
    s16 state;

    func_02033b38(actor);
    if ((FIELD(u32, actor, 0x10) & 0x1000000) != 0) {
        DebugText_Printf(gDebugFont, 1, 8, column, data_ov081_02215798);
        DebugText_Printf(gDebugFont, 1, 9, column, data_ov081_022157a8);
        DebugText_Printf(gDebugFont, 1, 10, column, data_ov081_022157c4);
        return;
    }

    if (Overlay081_StateEquals(actor, 0xe8, data_ov081_02215350))
        stateName = data_ov081_022157e0;
    else if (Overlay081_StateEquals(actor, 0x88, data_ov081_022152f0))
        stateName = data_ov081_022157e8;
    else if (Overlay081_StateEquals(actor, 0x18, data_ov081_02215280))
        stateName = data_ov081_022157f0;
    else if (Overlay081_StateEquals(actor, 0x20, data_ov081_02215288))
        stateName = data_ov081_022157f8;
    else if (Overlay081_StateEquals(actor, 0x30, data_ov081_02215298))
        stateName = data_ov081_02215800;
    else if (Overlay081_StateEquals(actor, 0x40, data_ov081_022152a8))
        stateName = data_ov081_02215808;
    else if (Overlay081_StateEquals(actor, 0x90, data_ov081_022152f8))
        stateName = data_ov081_02215810;
    else if (Overlay081_StateEquals(actor, 0x38, data_ov081_022152a0))
        stateName = data_ov081_02215814;
    else if (Overlay081_StateEquals(actor, 0x98, data_ov081_02215300))
        stateName = data_ov081_0221581c;

    if (stateName != 0)
        DebugText_Printf(gDebugFont, 1, 8, column, data_ov081_02215824,
                         stateName);
    state = FIELD(s16, actor, 0xd6);
    DebugText_Printf(gDebugFont, 1, 9, column, data_ov081_02215830,
                     FIELD(const char *, data_ov081_022153b8, state * 4));
    DebugText_Printf(gDebugFont, 1, 10, column, data_ov081_0221583c,
                     FIELD(s32, actor, 0x218) >> 12,
                     FIELD(s32, actor, 0x21c) >> 12);
}

/*
 * Construct actor specification 0x258.  Builds the common actor, installs the
 * specialized vtable, initializes its Type7 marker, clears presentation and
 * cooldown bytes, and installs the initial 300-frame state.  Returns actor.
 */
void *func_ov081_02214008(void *actor, const void *configuration)
{
    const Overlay081StateDescriptor *state;

    func_ov081_02212b94(actor, configuration);
    FIELD(const void *, actor, 0) = data_ov081_02215540;
    Type7MarkerPresentation_Init((u8 *)actor + 0x244, actor);
    FIELD(s16, actor, 0x254) = 0;
    FIELD(u8, actor, 0x256) = 0;
    FIELD(u32, actor, 0x5c) &= 0xffff0000;
    FIELD(s32, actor, 0x240) = 0x4000;
    state = Overlay081_State(data_ov081_02215368);
    func_ov081_02213710(actor, state->callback, state->selector, 0x12c);
    FIELD(u16, actor, 0x23a) = 0x10;
    FIELD(u32, actor, 0x224) = 0x666;
    FIELD(u32, actor, 0x228) = 0xccd;
    FIELD(u8, actor, 0x257) = 0;
    return actor;
}

/* Destroy the marker, vector, and base actor; return the original actor pointer. */
void *func_ov081_022140a0(void *actor)
{
    Type7MarkerPresentation_Destroy((u8 *)actor + 0x244);
    return func_ov081_02212d1c(actor);
}

/* Destroy the specialized actor, free its allocation, and return the original pointer. */
void *func_ov081_022140c8(void *actor)
{
    void *result = func_ov081_022140a0(actor);
    Heap_Free(actor);
    return result;
}

/* Tail adapter to the common sprite-resource loader. */
void func_ov081_022140f8(void *actor, const void *descriptor)
{
    func_ov081_02212d64(actor, descriptor);
}

/* Compute the actor-relative horizontal sound parameter clamped to [-96,96]. */
static s32 Overlay081_GetSoundOffset(void *actor)
{
    void *position = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
    s32 offset = ((FIELD(s32, actor, 0x1c) - FIELD(s32, position, 4) -
                   0x80000) >>
                  12) /
                 2;
    if (offset < -0x60)
        offset = -0x60;
    else if (offset > 0x60)
        offset = 0x60;
    return offset;
}

/*
 * Main specialized actor update.  Clears transient motion flags, runs the
 * common frame, maps selected state callbacks to marker animations, updates
 * the marker, and emits the state-change/idle spatial sounds and cooldowns.
 */
void func_ov081_02214104(void *actor)
{
    s32 blocked;
    s32 markerAnimation = -1;
    s32 offset;
    s32 pan;
    void *sprite;

    FIELD(u32, actor, 0xd0) &= ~0x10U;
    FIELD(u32, actor, 0x14) &= ~0x40U;
    FIELD(u16, actor, 0x23c) &= 0xfffd;

    if ((FIELD(u32, actor, 0x14) & 0x10000000) == 0 &&
        FIELD(s16, actor, 0x254) > 0 && --FIELD(s16, actor, 0x254) == 0) {
        FIELD(s32, actor, 0x44) = 0x2666;
        FIELD(s32, actor, 0x8c) = FIELD(s32, actor, 0x3c);
        FIELD(s32, actor, 0x90) = FIELD(s32, actor, 0x40);
        FIELD(s32, actor, 0x3c) = 0;
        FIELD(s32, actor, 0x40) = 0;
        offset = Overlay081_GetSoundOffset(actor);
        pan = 0x40 - func_020adae4(SignedAbsoluteValueVariant(offset), 3);
        Sound_PlayEffectWithParameters(gSoundContext, 0x133, 1, pan, offset, 0x100);
    }

    FIELD(s16, actor, 0xda) = 0;
    func_ov081_02212de0(actor);
    blocked = (FIELD(u32, actor, 0x10) & 0x1000000) != 0 ||
              ActorRuntimeCollection_GetPendingAttachmentFlag(
                  gActorRuntimeCollection) != 0 ||
              (FIELD(u32, actor, 0x14) & 0x10000000) != 0;

    if (FIELD(void *, actor, 0x114) == 0 &&
        (FIELD(void *, actor, 0x1e0) == 0 ||
         ACTOR_INTERACTION_ICON_IS_ACTIVE(
             FIELD(void *, actor, 0x1e0)) == 0)) {
        if (Overlay081_StateEquals(actor, 0xf8, data_ov081_02215360)) {
            markerAnimation = 2;
        } else if (!blocked) {
            if (Overlay081_StateEquals(actor, 0xf0, data_ov081_02215358)) {
                markerAnimation = 0xd;
            } else if (Overlay081_StateEquals(actor, 8,
                                               data_ov081_02215270) &&
                       FIELD(s32, actor, 0x230) < 10) {
                markerAnimation = 0xc;
            } else if (Overlay081_StateEquals(actor, 0xd8,
                                               data_ov081_02215340) &&
                       FIELD(u8, FIELD(void *, actor, 0x54), 0x38) == 0x1a &&
                       FIELD(s32, actor, 0x230) < 0x96) {
                markerAnimation = 4;
            }
        }
    }

    if (markerAnimation == -1) {
        func_ov081_02214524((u8 *)actor + 0x244, 0);
    } else {
        if (FIELD(s16, actor, 0x252) != 0)
            Type7MarkerPresentation_ReloadResources((u8 *)actor + 0x244,
                                                     markerAnimation);
        Type7MarkerPresentation_SelectAnimation((u8 *)actor + 0x244,
                                                 markerAnimation);
        func_ov081_02214524((u8 *)actor + 0x244, 1);
    }
    VCALL(Overlay081VoidMethod, (u8 *)actor + 0x244, 8)((u8 *)actor + 0x244);

    if (!blocked) {
        if ((s8)FIELD(u8, actor, 0x256) > 0) {
            --FIELD(u8, actor, 0x256);
        } else {
            sprite = FIELD(void *, actor, 0x54);
            if (FIELD(u8, sprite, 0x38) <= 7 &&
                FIELD(s16, sprite, 0x36) > 0 &&
                FIELD(void *, sprite, 0x20) == 0) {
                offset = Overlay081_GetSoundOffset(actor);
                pan = 0x40 - func_020adae4(SignedAbsoluteValueVariant(offset), 3);
                Sound_PlayEffectWithParameters(gSoundContext, 5, 5, pan, offset, 0);
                FIELD(u8, actor, 0x256) = 10;
            }
        }
    }
}

/* Set or clear sprite visibility bit 4 through the marker's state pointer +4. */
void func_ov081_02214524(void *marker, s32 visible)
{
    void *sprite = FIELD(void *, marker, 4);
    if (visible == 0)
        FIELD(u16, sprite, 0x24) |= 4;
    else
        FIELD(u16, sprite, 0x24) &= 0xfffb;
}

/*
 * Render callback: run common actor render setup, draw the marker 0x18000
 * below actor position when active, or hide it while the actor is disabled.
 */
void func_ov081_02214544(void *context, void *actor, s32 argument)
{
    Overlay081Vector position;

    Actor_UpdatePresentation(context, actor, argument);
    if ((FIELD(u32, actor, 0x14) & 0x10000000) == 0) {
        VecFx32Object_InitCopy(&position, (u8 *)actor + 0x18);
        position.y -= 0x18000;
        VCALL(void (*)(void *, s32, const void *, s32),
              (u8 *)actor + 0x244, 0xc)((u8 *)actor + 0x244, argument,
                                       &position, 0);
        VecFx32Object_Destroy(&position);
    } else {
        func_ov081_02214524((u8 *)actor + 0x244, 0);
    }
}

/* Empty callback used by the specialized vtable; has no state or SDK effects. */
void func_ov081_022145c4(void)
{
}

/*
 * Specialized actor-pair response.  Kind-one active actors can force state
 * transitions, sound, knockback, or a target-state callback depending on this
 * actor's current state.  Inactive pairs in states 5..7 invoke slot 0x120.
 * Always finishes with the common pair handler.
 */
void func_ov081_022145c8(void *actor, void *other, s32 mode)
{
    s32 dx;
    s32 dy;
    s32 distance;
    s32 impulseX;
    s32 impulseY;

    if ((FIELD(u32, actor, 0x10) & 0x1000000) == 0 &&
        ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0) {
        if (FIELD(u8, other, 0x4d) == 1 &&
            VCALL(Overlay081QueryMethod, other, 0x68)(other) != 0) {
            if (!Overlay081_StateEquals(actor, 0x58, data_ov081_022152c0)) {
                if (Overlay081_StateEquals(actor, 0xd0, data_ov081_02215338)) {
                    const Overlay081StateDescriptor *state =
                        Overlay081_State(data_ov081_02215330);
                    func_ov081_02213710(actor, state->callback,
                                        state->selector, 0x5a);
                    FIELD(u8, actor, 0x257) = 1;
                    {
                        u16 sound = FIELD(u16, actor, 0x23a);
                        Sound_PlayOwnedEffect(gSoundContext, sound >> 7,
                                      sound & 0x7f, actor, 0, 0x100);
                    }
                } else {
                    dx = FIELD(s32, other, 0x1c) - FIELD(s32, actor, 0x1c);
                    dy = FIELD(s32, other, 0x20) - FIELD(s32, actor, 0x20);
                    distance = Fx32Vector2_Magnitude(dx, dy);
                    if (distance > 0x1000) {
                        impulseX = func_020adc90(dx, distance);
                        impulseY = func_020adc90(dy, distance);
                        FIELD(s32, actor, 0x9c) -= impulseX * 2;
                        FIELD(s32, actor, 0xa0) -= impulseY * 2;
                        if (Overlay081_StateEquals(actor, 0xc0,
                                                   data_ov081_02215328)) {
                            VCALL(Overlay081TargetMethod, actor, 0xd0)(
                                actor, FIELD(void *, data_021052fc, 0x2ea4),
                                0xf0);
                        } else if (!Overlay081_StateEquals(
                                       actor, 0xb8,
                                       data_ov081_02215320)) {
                            const Overlay081StateDescriptor *state =
                                Overlay081_State(data_ov081_02215318);
                            func_ov081_02213710(actor, state->callback,
                                                state->selector, 0x1e);
                        }
                    }
                }
            }
        } else if (mode == 0 &&
                   (u32)(FIELD(s16, actor, 0xd6) - 5) <= 2) {
            VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
        }
    }
    ActorDerivedRuntime_HandlePairActive(actor, other, mode);
}

/* Return zero for the specialized interaction query's default branch. */
s32 func_ov081_02214874(void)
{
    return 0;
}

/* Play the packed actor sound stored at +0x23a. */
static void Overlay081_PlayPackedSound(void *actor)
{
    u16 sound = FIELD(u16, actor, 0x23a);
    Sound_PlayOwnedEffect(gSoundContext, sound >> 7, sound & 0x7f, actor, 0, 0x100);
}

/*
 * Specialized interaction acceptance.  Depending on current state it can
 * launch the global primary actor toward this actor, enter timed state records,
 * clear/set byte +0x257, and play the packed sound.  The common acceptance
 * query is always called last and supplies the return value.
 */
s32 func_ov081_0221487c(void *actor, void *query)
{
    s32 shouldLaunch = 0;

    if (ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0 &&
        (FIELD(u32, actor, 0x14) & 0x10000000) == 0 &&
        (FIELD(void *, actor, 0x1e0) == 0 ||
         ACTOR_INTERACTION_ICON_IS_ACTIVE(
             FIELD(void *, actor, 0x1e0)) == 0)) {
        if (Overlay081_StateEquals(actor, 0xa8, data_ov081_02215310) &&
            (FIELD(u32, actor, 0xd0) & 0x10) == 0 &&
            FIELD(s32, actor, 0x24) == FIELD(s32, actor, 0x1dc) &&
            FIELD(s16, actor, 0x254) == 0) {
            shouldLaunch = 1;
        }

        if (shouldLaunch) {
            void *primary = FIELD(void *, data_021052fc, 0x2ea4);
            s32 dx;
            s32 dy;

            FIELD(s16, actor, 0x254) = 4;
            FIELD(u32, actor, 0xd0) |= 0x1000;
            dx = (FIELD(s32, primary, 0x1c) - FIELD(s32, actor, 0x1c)) >> 12;
            dy = (FIELD(s32, primary, 0x20) - FIELD(s32, actor, 0x20)) >> 12;
            if (dx * dx + dy * dy > 4)
                ActorDerivedType1_TrySetStateVector(primary,
                                                    (u8 *)actor + 0x18,
                                                    0x14, -2);
        } else if (Overlay081_StateEquals(actor, 0xa0,
                                           data_ov081_02215308)) {
            const Overlay081StateDescriptor *state =
                Overlay081_State(data_ov081_02215268);
            func_ov081_02213710(actor, state->callback, state->selector, 0xc8);
            FIELD(u8, actor, 0x257) = 0;
            Overlay081_PlayPackedSound(actor);
        } else if (!Overlay081_StateEquals(actor, 0x10,
                                            data_ov081_02215278) &&
                   !Overlay081_StateEquals(actor, 0x118,
                                            data_ov081_02215380)) {
            const Overlay081StateDescriptor *state =
                Overlay081_State(data_ov081_02215378);
            Overlay081_PlayPackedSound(actor);
            func_ov081_02213710(actor, state->callback, state->selector, 0x1e);
        }
    }
    (void)query;
    return ActorDerivedRuntime_AcceptInteractionQuery(actor);
}

/*
 * Rebind sprite resources and map state +0xd6 to its animation.  States 1,2,
 * 5,7 choose grounded versus airborne variants via cached terrain height;
 * every selected animation clears sprite flag 1 and sets flag 2.
 */
void func_ov081_02214b50(void *actor)
{
    void *sprite = FIELD(void *, actor, 0x54);
    s32 animation = -1;
    s32 grounded;

    GraphicsSpriteGroup_ReplaceStateResources(
        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)), sprite,
        FIELD(u32, actor, 0x1f0), FIELD(u32, actor, 0x1f4),
        FIELD(u32, actor, 0x1f8));
    grounded = FIELD(s32, actor, 0x24) == Actor_GetCachedTerrainHeight(actor);
    switch (FIELD(s16, actor, 0xd6)) {
    case 1:
    case 2:
        animation = FIELD(u8, actor, 0xd4) + (grounded ? 8 : 0x1a);
        break;
    case 3:
        animation = 0x11;
        break;
    case 4:
        animation = 0x38;
        break;
    case 5:
    case 7:
        animation = grounded ? FIELD(u8, actor, 0xd4)
                             : FIELD(u8, actor, 0xd4) + 0x1a;
        break;
    case 6:
        animation = FIELD(u8, actor, 0xd4) + 0x1a;
        break;
    case 8:
        animation = FIELD(u8, actor, 0xd4);
        break;
    }
    if (animation != -1) {
        FIELD(u16, sprite, 0x24) &= 0xfffe;
        FIELD(u16, sprite, 0x24) |= 2;
        if (animation != FIELD(u8, sprite, 0x38))
            GraphicsSpriteState_SetAnimationIndex(sprite, animation);
    }
}

/* Randomly choose state-table entry 1,4,or 6 and a 60-based bounded duration. */
void func_ov081_02214d3c(void *actor)
{
    u32 random = genrand_int32();
    s32 index;
    s32 duration;

    if ((random & 0xf) == 0) {
        index = 6;
        duration = (s32)(func_020bf1f8(random, 0x3c) >> 32) + 0x3c;
    } else {
        index = (random & 1) == 0 ? 1 : 4;
        duration = (s32)(func_020bf1f8(random, 0x78) >> 32) + 0x3c;
    }
    FIELD(s32, actor, 0x234) = duration;
    func_ov081_02213710(actor, data_ov081_022153e0[index].callback,
                        data_ov081_022153e0[index].selector, duration);
}

/* Clear flag 2, target the global primary actor, and return zero. */
s32 func_ov081_02214d9c(void *actor)
{
    FIELD(u32, actor, 0xd0) &= ~2U;
    FIELD(void *, actor, 0x210) = FIELD(void *, data_021052fc, 0x2ea4);
    return 0;
}

/* Invoke virtual slot 0xd0 toward the global primary actor for 300 frames. */
void func_ov081_02214dc8(void *actor)
{
    VCALL(Overlay081TargetMethod, actor, 0xd0)(
        actor, FIELD(void *, data_021052fc, 0x2ea4), 0x12c);
}

/*
 * Follow target +0x210 using its slot 0xb4.  Distances below 0xc000 reflect
 * the target vector around the actor; distances below 0x20000 snap to actor
 * position.  Slot 0xc8 then updates motion, with damped impulse carry-over.
 */
s32 func_ov081_02214df4(void *actor)
{
    Overlay081Vector targetPosition;
    Overlay081Vector difference;
    Overlay081Vector reflected;
    void *target = FIELD(void *, actor, 0x210);
    s32 distance;

    FIELD(u32, actor, 0xd0) |= 2;
    if (target == 0) {
        func_ov081_022135a4(actor);
        return 0;
    }
    VCALL(void (*)(void *, void *, void *), target, 0xb4)(
        target, &targetPosition, actor);
    distance = func_020adcac((u8 *)&targetPosition + 4,
                             (u8 *)actor + 0x1c);
    if (distance < 0xc000) {
        func_ov081_02213528(&difference, (u8 *)actor + 0x18,
                            &targetPosition);
        func_ov081_02214f20(&reflected, &difference,
                            (u8 *)actor + 0x18);
        VecFx32Object_Assign(&targetPosition, &reflected);
        VecFx32Object_Destroy(&reflected);
        VecFx32Object_Destroy(&difference);
    } else if (distance < 0x20000) {
        VecFx32Object_Assign(&targetPosition, (u8 *)actor + 0x18);
    }
    VCALL(Overlay081PositionMethod, actor, 0xc8)(actor, &targetPosition);
    FIELD(s32, actor, 0x8c) += func_020befec(FIELD(s32, actor, 0x3c), 10);
    FIELD(s32, actor, 0x90) += func_020befec(FIELD(s32, actor, 0x40), 10);
    FIELD(s32, actor, 0x3c) = func_020befec(FIELD(s32, actor, 0x3c), 3);
    FIELD(s32, actor, 0x40) = func_020befec(FIELD(s32, actor, 0x40), 3);
    VecFx32Object_Destroy(&targetPosition);
    return 0;
}

/* Build a vector whose components are the sum of the two input vectors. */
void func_ov081_02214f20(void *result, const void *left, const void *right)
{
    VecFx32Object_Init(result);
    func_020adff0(left == 0 ? 0 : (const u8 *)left + 4,
                  right == 0 ? 0 : (const u8 *)right + 4,
                  (u8 *)result + 4);
}

/*
 * State-four animation event.  At timer 50 choose animation 0x37 or 0x1a;
 * the 0x37 branch clears sprite flags 1/2 and plays sound 0x133.  A later
 * runtime flag can force that branch and clamp the state timer to 50/90.
 */
s32 func_ov081_02214f58(void *actor)
{
    void *sprite = FIELD(void *, actor, 0x54);

    FIELD(s16, actor, 0xd6) = 4;
    if (FIELD(s32, actor, 0x230) == 0x32) {
        if (FIELD(u8, actor, 0x257) == 1) {
            GraphicsSpriteState_SetAnimationIndex(sprite, 0x37);
            FIELD(u16, sprite, 0x24) &= 0xfffc;
            Sound_PlayOwnedEffect(gSoundContext, 0x133, 0, actor, 0, 0x100);
        } else {
            GraphicsSpriteState_SetAnimationIndex(sprite, 0x1a);
            FIELD(u16, sprite, 0x24) &= 0xfffe;
            FIELD(u16, sprite, 0x24) |= 2;
        }
    } else if (FIELD(s32, actor, 0x230) > 0x32 &&
               FIELD(u8, actor, 0x257) == 0 &&
               (FIELD(u32, actor, 0x10) & 0x2000) != 0) {
        FIELD(u8, actor, 0x257) = 1;
        GraphicsSpriteState_SetAnimationIndex(sprite, 0x37);
        FIELD(u16, sprite, 0x24) &= 0xfffc;
        Sound_PlayOwnedEffect(gSoundContext, 0x133, 0, actor, 0, 0x100);
        FIELD(s32, actor, 0x230) = 0x32;
        FIELD(s32, actor, 0x234) = 0x5a;
    }
    return 0;
}

/* Enable the paired 0x2000 parameters and bytes, clear +0x1ea, then invoke slot 0x120. */
void func_ov081_02215078(void *actor)
{
    FIELD(s32, actor, 0xc8) = 0x2000;
    FIELD(s32, actor, 0xcc) = 0x2000;
    FIELD(u8, actor, 0xd4) = 1;
    FIELD(u8, actor, 0xd5) = 1;
    FIELD(u16, actor, 0x1ea) = 0;
    VCALL(Overlay081VoidMethod, actor, 0x120)(actor);
}

/*
 * Clear the paired parameters/bytes.  If animation is not 0x1a, target the
 * global primary actor through slot 0xd0; otherwise install the 300-frame
 * data_02215370 state.
 */
void func_ov081_022150b0(void *actor)
{
    FIELD(s32, actor, 0xc8) = 0;
    FIELD(s32, actor, 0xcc) = 0;
    FIELD(u8, actor, 0xd4) = 0;
    FIELD(u8, actor, 0xd5) = 0;
    FIELD(u16, actor, 0x1ea) = 0;
    if (FIELD(u8, FIELD(void *, actor, 0x54), 0x38) != 0x1a) {
        VCALL(Overlay081TargetMethod, actor, 0xd0)(
            actor, FIELD(void *, data_021052fc, 0x2ea4), 0x12c);
    } else {
        const Overlay081StateDescriptor *state =
            Overlay081_State(data_ov081_02215370);
        func_ov081_02213710(actor, state->callback, state->selector, 0x12c);
    }
}

/* Clear target, push saved position through slot 0xc8, and install state data_022152d8. */
void func_ov081_02215120(void *actor)
{
    const Overlay081StateDescriptor *state = Overlay081_State(data_ov081_022152d8);
    FIELD(void *, actor, 0x210) = 0;
    VCALL(Overlay081PositionMethod, actor, 0xc8)(actor, (u8 *)actor + 0x214);
    func_ov081_02213710(actor, state->callback, state->selector, 0x12c);
}

/* Install state data_02215290 for 300 frames. */
void func_ov081_0221515c(void *actor)
{
    const Overlay081StateDescriptor *state = Overlay081_State(data_ov081_02215290);
    func_ov081_02213710(actor, state->callback, state->selector, 0x12c);
}

/* Return whether magnitudes of vectors +0x98,+0x38,+0x88 sum above 0x800. */
s32 func_ov081_02215178(void *actor)
{
    return VecFx32Object_GetMagnitude((u8 *)actor + 0x98) +
               VecFx32Object_GetMagnitude((u8 *)actor + 0x38) +
               VecFx32Object_GetMagnitude((u8 *)actor + 0x88) >
           0x800;
}

/* Return the actor's fixed 0x40000 scalar used by the specialized vtable. */
s32 func_ov081_022151b8(void)
{
    return 0x40000;
}

/* Return zero for an unsupported specialized query. */
s32 func_ov081_022151c0(void)
{
    return 0;
}

/* Return runtime flag 0x80 in its encoded (zero or 0x80) form. */
u32 func_ov081_022151c8(void *actor)
{
    return FIELD(u32, actor, 0xd0) & 0x80;
}

/* Return one when runtime flag 0x40 is set, otherwise zero. */
s32 func_ov081_022151d4(void *actor)
{
    return (FIELD(u32, actor, 0xd0) & 0x40) != 0;
}

/* Return zero for an unsupported specialized query. */
s32 func_ov081_022151e8(void)
{
    return 0;
}

/* Empty specialized callback; no state or SDK effects. */
void func_ov081_022151f0(void)
{
}

/* Empty specialized callback; no state or SDK effects. */
void func_ov081_022151f4(void)
{
}

/* Set runtime flag 0x80. */
void func_ov081_022151f8(void *actor)
{
    FIELD(u32, actor, 0xd0) |= 0x80;
}

/* Return zero for an unsupported specialized query. */
s32 func_ov081_02215208(void)
{
    return 0;
}

/* Return zero for an unsupported specialized query. */
s32 func_ov081_02215210(void)
{
    return 0;
}

/* Empty specialized callback; no state or SDK effects. */
void func_ov081_02215218(void)
{
}

/* Return zero for an unsupported specialized query. */
s32 func_ov081_0221521c(void)
{
    return 0;
}

/* Forward visibility selection to the actor's embedded marker at +0x244. */
void func_ov081_02215224(void *actor, s32 visible)
{
    func_ov081_02214524((u8 *)actor + 0x244, visible);
}

/* Empty specialized callback; no state or SDK effects. */
void func_ov081_02215234(void)
{
}

/* Free actor storage and return the original pointer. */
void *func_ov081_02215238(void *actor)
{
    Heap_Free(actor);
    return actor;
}
