#include "tingle/types.h"

/*
 * Recovered overlay 89 controllable actor and auxiliary-sprite subsystem.
 *
 * The actor temporarily takes over the primary (and optional Type7) actor,
 * applies d-pad motion against the scene collision grid, owns one or two
 * auxiliary animation/sprite pairs, and hands transition presentations to
 * overlay 62.  Unknown base-class members deliberately remain offset based.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Ov89Vector {
    void *vtable;
    s32 x;
    s32 y;
    s32 z;
} Ov89Vector;

typedef struct Ov89Direction {
    void *vtable;
    s32 horizontal;
    s32 vertical;
} Ov89Direction;

typedef void (*Ov89VoidMethod)(void *);
typedef void (*Ov89ArgMethod)(void *, s32);
typedef s32 (*Ov89TerrainQuery)(void *, s32, s32);

extern "C" void *data_020f4e18;
extern "C" const s16 data_020c9670[];
extern "C" void *data_021052fc;
extern "C" void *gGameWork;
extern "C" void *gHeapContext;
extern "C" void *gSceneManager;
extern "C" void *gSoundContext;
extern "C" u8 gSystemState[];

extern "C" u8 data_ov089_02219918[];
extern "C" u8 data_ov089_02219928[];
extern "C" u8 data_ov089_022199ec[];
extern "C" u8 data_ov089_022199f4[];
extern "C" u8 data_ov089_022199fc[];
extern "C" u8 data_ov089_02219a04[];
extern "C" u8 data_ov089_02219a20[];
extern "C" u8 data_ov089_02219a24[];
extern "C" u8 data_ov089_02219a30[];
extern "C" u8 data_ov089_02219a3c[];
extern "C" u8 data_ov089_02219a48[];
extern "C" u8 data_ov089_02219a54[];
extern "C" u8 data_ov089_02219a60[];
extern "C" u8 data_ov089_02219a6c[];
extern "C" u8 data_ov089_02219a78[];
extern "C" u8 data_ov089_02219a84[];
extern "C" u8 data_ov089_02219a90[];
extern "C" u8 data_ov089_02219a9c[];
extern "C" u8 data_ov089_02219aa8[];
extern "C" u8 data_ov089_02219ab4[];
extern "C" u8 data_ov089_02219ac0[];
extern "C" u8 data_ov089_02219acc[];
extern "C" u8 data_ov089_02219ad8[];
extern "C" u8 data_ov089_02219ae4[];
extern "C" s32 data_ov089_02219ae8[];
extern "C" s32 data_ov089_02219aec[];
extern "C" u8 data_ov089_02219af0[];
extern "C" u8 data_ov089_02219afc[];
extern "C" u8 data_ov089_02219b08[];
extern "C" u8 data_ov089_02219b14[];
extern "C" u8 data_ov089_02219b20[];
extern "C" u8 data_ov089_02219b2c[];
extern "C" u8 data_ov089_02219b38[];
extern "C" u8 data_ov089_02219b44[];
extern "C" s32 data_ov089_02219b48[];
extern "C" s32 data_ov089_02219b4c[];
extern "C" u8 data_ov089_02219b50[];
extern "C" u8 data_ov089_02219b5c[];
extern "C" u8 data_ov089_02219b68[];
extern "C" u8 data_ov089_02219b74[];
extern "C" u8 data_ov089_02219b80[];
extern "C" u8 data_ov089_02219b8c[];
extern "C" u8 data_ov089_02219b98[];

extern "C" void *ActorDerivedRuntime_Init(void *, const void *);
extern "C" void *ActorDerivedRuntime_DestroyAlternate(void *);
extern "C" void ActorDerivedRuntime_UpdateFrame(void *);
extern "C" void ActorDerivedRuntime_HandlePairActive(void *, void *, s32);
extern "C" void ActorDerivedRuntime_ForwardTouchPoint(void *, void *, const void *);
extern "C" void ActorContactState_AddContact(void *, void *, s32);
extern "C" void Actor_UpdateAnimationState(void *);
extern "C" void Actor_SnapshotTransientState(void *);
extern "C" void *Actor_GetCollisionBounds(void *);
extern "C" void *Actor_GetCollection(void *);
extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void Actor_SetDirectionFromVector(void *, s32, s32);
extern "C" void ActorDerivedType1_ResetToBaseState(void *);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void *AnimationResource_Init(void *, s32, s32, s32);
extern "C" void func_02071ee0(void *, void *, s32, s32, s32);
extern "C" void func_02071bdc(void *, void *);
extern "C" void func_02071c38(void *, void *);
extern "C" void func_02071c94(void *, void *);
extern "C" void *GraphicsSpriteGroup_CreateState(void *, void *, void *, void *, s32);
extern "C" void GraphicsSpriteGroup_ReleaseState(void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void GraphicsSpriteState_AdvanceAnimation(void *);
extern "C" void GraphicsSpriteState_SetDepthOrderedWorldPosition(void *, s32, s32, s32, s32);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Subtract(void *, const void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" s32 func_020adc40(s32);
extern "C" s32 func_020adc90(s32, s32);
extern "C" s32 func_020ae024(s32, s32);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" void *SceneManager_GetCurrent(void *);
extern "C" void Type7Actor_SetActorEnabled(void *, s32);
extern "C" s32 Type7Actor_GetStateCode(void *);
extern "C" void Type7Actor_EnterFlag40000State(void *);
extern "C" void Type7Actor_ResetMotionAndCooldown(void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_LoadOverlay(void *, s32, s32);
extern "C" void GameWork_SetFlag(void *, s32);
extern "C" void GameWork_ClearFlag(void *, s32);
extern "C" void *AuxiliaryTimedSpritePresentation_Init(void *, const void *, void *, s32, s32, s32, s32, s32, s32, s32);
extern "C" void func_ov062_0220fe78(void *, const void *, s32, s32, s32, void *, s32);
extern "C" void func_ov062_02210674(void *, void *, const void *, s32, s32, s32, void *);
extern "C" void func_02001944(void *, s32);
extern "C" void func_0200199c(void *, s32);
extern "C" void func_0201f864(void *, const void *, void *, s32, s32, s32, s32, s32, s32);
extern "C" void func_0203292c(void *);
extern "C" void func_02033b38(void *);

extern "C" void func_ov089_02217890(void *);
extern "C" void func_ov089_02218c9c(void *, const void *);
extern "C" void func_ov089_02219214(void *, s32, s32, s32);

/* Invoke a no-argument method at the supplied byte offset in an object's vtable. */
static void call_void(void *object, u32 offset)
{
    void *vtable = FIELD(void *, object, 0);
    (*(Ov89VoidMethod *)((u8 *)vtable + offset))(object);
}

/* Invoke a one-integer-argument method at the supplied vtable byte offset. */
static void call_arg(void *object, u32 offset, s32 argument)
{
    void *vtable = FIELD(void *, object, 0);
    (*(Ov89ArgMethod *)((u8 *)vtable + offset))(object, argument);
}

/* Multiply two signed 20.12 values using the retail half-up bias. */
static s32 fx_mul(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/* Static-vector destructor; the records own no resources. */
extern "C" void func_ov089_022177e0(void)
{
}

/* Construct the derived actor and reset its takeover, input, and attachment state. */
extern "C" void *func_ov089_022177e4(void *actor, const void *configuration)
{
    ActorDerivedRuntime_Init(actor, configuration);
    FIELD(void *, actor, 0) = data_ov089_02219928;
    FIELD(s32, actor, 0x208) = 0;
    FIELD(u16, actor, 0x20c) = 0;
    FIELD(s16, actor, 0x214) = 0;
    FIELD(u8, actor, 0x216) = 0;
    FIELD(u8, actor, 0x217) = 0;
    func_ov089_02217890((u8 *)actor + 0x218);
    FIELD(s32, actor, 0x224) = 0;
    FIELD(s32, actor, 0x228) = 0;
    FIELD(s16, actor, 0x234) = 0;
    FIELD(u16, actor, 0x236) = 500;
    FIELD(s32, actor, 0x238) = 0x1800;
    FIELD(u16, actor, 0x23c) = 0;
    if ((FIELD(u32, actor, 0x14) & 0x400) != 0)
        FIELD(u32, actor, 0xd0) |= 4;
    if (FIELD(void *, configuration, 0x2c) != 0)
        call_void(actor, 0x74);
    FIELD(void *, actor, 0x240) = 0;
    FIELD(void *, actor, 0x244) = 0;
    return actor;
}

/* Initialize the embedded two-axis input vector. */
extern "C" void func_ov089_02217890(void *direction)
{
    FIELD(void *, direction, 0) = data_ov089_02219918;
    FIELD(s32, direction, 4) = 0;
    FIELD(s32, direction, 8) = 0;
}

extern "C" void func_ov089_02217904(void *actor);

/* Destroy owned attachments and the base actor, retaining the allocation. */
extern "C" void *func_ov089_022178ac(void *actor)
{
    FIELD(void *, actor, 0) = data_ov089_02219928;
    func_ov089_02217904(actor);
    ActorDerivedRuntime_DestroyAlternate(actor);
    return actor;
}

/* Destroy the actor and release its heap allocation. */
extern "C" void *func_ov089_022178d4(void *actor)
{
    func_ov089_022178ac(actor);
    Heap_Free(actor);
    return actor;
}

extern "C" void func_ov089_02217b94(void *);

/* Destroy and free the optional secondary and primary sprite attachments. */
extern "C" void func_ov089_02217904(void *actor)
{
    void *attachment = FIELD(void *, actor, 0x244);
    if (attachment != 0) {
        func_ov089_02217b94(attachment);
        Heap_Free(attachment);
        FIELD(void *, actor, 0x244) = 0;
    }
    attachment = FIELD(void *, actor, 0x240);
    if (attachment != 0) {
        func_ov089_02217b94(attachment);
        Heap_Free(attachment);
        FIELD(void *, actor, 0x240) = 0;
    }
}

/* Load the actor sprite resource triplet and create its sprite state. */
extern "C" void func_ov089_02217960(void *actor, const void *descriptor)
{
    void *owner;
    func_02071ee0((u8 *)actor + 0x1f0, data_020f4e18,
                  FIELD(s32, descriptor, 4), FIELD(s32, descriptor, 8),
                  FIELD(s32, descriptor, 0xc));
    owner = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
    FIELD(void *, actor, 0x54) = GraphicsSpriteGroup_CreateState(
        owner, FIELD(void *, actor, 0x1f0), FIELD(void *, actor, 0x1f4),
        FIELD(void *, actor, 0x1f8), FIELD(u8, descriptor, 0x10));
    call_void(actor, 0x14);
    if ((FIELD(u32, actor, 0x14) & 0x80) != 0)
        FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = FIELD(u8, descriptor, 0x3c);
}

extern "C" void func_ov089_02217b04(void *, s32, s32, s32, void *, s32);

/* Allocate and clear the two pointer fields initialized by the retail constructor. */
static void *allocate_attachment(void)
{
    void *attachment = Heap_Alloc(0x1c, data_ov089_022199ec, 4, gHeapContext);
    if (attachment != 0) {
        FIELD(void *, attachment, 0) = 0;
        FIELD(void *, attachment, 4) = 0;
    }
    return attachment;
}

/* Allocate the primary auxiliary sprite and the optional Type7 companion sprite. */
extern "C" void func_ov089_022179dc(void *actor)
{
    void *attachment = allocate_attachment();
    void *owner;
    FIELD(void *, actor, 0x240) = attachment;
    owner = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
    func_ov089_02217b04(attachment, 0x1629, 0x1611, 0x162a, owner, 2);
    FIELD(s16, attachment, 0x18) = -200;
    FIELD(u16, FIELD(void *, attachment, 4), 0x24) &= (u16)~2;

    if ((FIELD(u16, actor, 0x20c) & 0x800) != 0) {
        void *secondary = FIELD(void *, data_021052fc, 0x2ea8);
        void *resource = FIELD(void *, secondary, 0x29c);
        attachment = allocate_attachment();
        FIELD(void *, actor, 0x244) = attachment;
        owner = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
        func_ov089_02217b04(attachment, FIELD(u16, resource, 0x14),
                            FIELD(u16, resource, 0x16), FIELD(u16, resource, 0x18),
                            owner, 2);
        FIELD(s16, attachment, 0x18) = -200;
    }
}

/* Construct one animation resource and its sprite state. */
extern "C" void func_ov089_02217b04(void *attachment, s32 first, s32 second,
                                      s32 third, void *owner, s32 screen)
{
    void *resource = Heap_Alloc(0x10, data_ov089_022199f4, 4, gHeapContext);
    if (resource != 0)
        resource = AnimationResource_Init(resource, first, second, third);
    FIELD(void *, attachment, 0) = resource;
    FIELD(void *, attachment, 4) = GraphicsSpriteGroup_CreateState(
        owner, FIELD(void *, resource, 4), FIELD(void *, resource, 8),
        FIELD(void *, resource, 0xc), screen);
    FIELD(s32, attachment, 0x14) = 1;
    FIELD(s16, attachment, 0x18) = 0;
    FIELD(u8, attachment, 0x1a) = 0;
    FIELD(u16, FIELD(void *, attachment, 4), 0x24) |= 2;
}

/* Release one auxiliary sprite and its animation resource. */
extern "C" void func_ov089_02217b94(void *attachment)
{
    void *sprite = FIELD(void *, attachment, 4);
    void *resource;
    if (sprite != 0) {
        GraphicsSpriteGroup_ReleaseState(sprite);
        func_02071bdc(data_020f4e18, FIELD(void *, attachment, 8));
        func_02071c38(data_020f4e18, FIELD(void *, attachment, 0xc));
        func_02071c94(data_020f4e18, FIELD(void *, attachment, 0x10));
        FIELD(void *, attachment, 4) = 0;
    }
    resource = FIELD(void *, attachment, 0);
    if (resource != 0) {
        call_void(resource, 4);
        FIELD(void *, attachment, 0) = 0;
    }
}

/* Position an auxiliary sprite in world space and apply its depth bias. */
extern "C" void func_ov089_02217c14(void *attachment, const void *position)
{
    void *sprite = FIELD(void *, attachment, 4);
    GraphicsSpriteState_SetDepthOrderedWorldPosition(
        sprite, FIELD(s32, position, 4), FIELD(s32, position, 8),
        FIELD(s32, position, 0xc), 4);
    FIELD(s16, sprite, 0x28) += FIELD(s16, attachment, 0x18);
    FIELD(u8, sprite, 0x3a) = 1;
}

/* Query one collision-grid cell through terrain virtual slot 0x2c. */
static s32 terrain_cell(void *terrain, s32 x, s32 y)
{
    void *vtable = FIELD(void *, terrain, 0);
    Ov89TerrainQuery query = *(Ov89TerrainQuery *)((u8 *)vtable + 0x2c);
    return query(terrain, x, y);
}

/* Return whether the packed terrain type lies outside the three passable codes. */
static s32 terrain_blocks(s32 value)
{
    u32 type = ((u32)value << 22) >> 27;
    return type < 0x1d || type > 0x1f;
}

/* Return the 20.12 magnitude of a two-component motion vector. */
static s32 motion_length(s32 x, s32 y)
{
    return func_020adc40(fx_mul(x, x) + fx_mul(y, y));
}

/* Round a moved coordinate toward the leading pixel in retail fixed-point form. */
static s32 collision_leading_pixel(s32 position, s32 motion)
{
    s32 combined = position + motion;
    if (motion < 0)
        return (combined + ((u32)(combined >> 11) >> 20)) >> 12;
    return (combined + 0xfff) >> 12;
}

/* Probe both corners of one leading edge, snap on impact, and retain slide direction. */
static void resolve_axis_collision(void *actor, void *terrain, s32 horizontal,
                                   s32 speed, s32 *playedImpact)
{
    s32 position = FIELD(s32, actor, horizontal ? 0x1c : 0x20);
    s32 motion = FIELD(s32, actor, horizontal ? 0x3c : 0x40);
    s32 perpendicular = FIELD(s32, actor, horizontal ? 0x20 : 0x1c) >> 12;
    s32 edge[2] = {(perpendicular - 16) >> 4, (perpendicular + 15) >> 4};
    s32 leading = collision_leading_pixel(position, motion);
    s32 blocked[2];
    s32 i;

    leading += motion < 0 ? -16 : 15;
    leading >>= 4;
    for (i = 1; i >= 0; --i) {
        s32 tile = horizontal ? terrain_cell(terrain, leading, edge[i])
                              : terrain_cell(terrain, edge[i], leading);
        blocked[i] = terrain_blocks(tile);
    }
    if (blocked[0] || blocked[1]) {
        s32 snapped = collision_leading_pixel(position, motion);
        if (speed > 0xe66)
            *playedImpact = 1;
        snapped += motion < 0 ? 16 : 0;
        snapped = (snapped & ~15) << 12;
        FIELD(s32, actor, horizontal ? 0x1c : 0x20) = snapped;
        FIELD(s32, actor, horizontal ? 0x3c : 0x40) = 0;
        if (horizontal) {
            if (blocked[0] && !blocked[1]) FIELD(s32, actor, 0x230) = 0;
            if (!blocked[0] && blocked[1]) FIELD(s32, actor, 0x230) = 4;
        } else {
            if (blocked[0] && !blocked[1]) FIELD(s32, actor, 0x230) = 2;
            if (!blocked[0] && blocked[1]) FIELD(s32, actor, 0x230) = 6;
        }
    }
}

/* Select idle/turn attachment animation and emit the turn sprite and alternating sound. */
static void update_primary_attachment_animation(void *actor, s32 turning,
                                                const Ov89Vector *effectPosition)
{
    void *attachment = FIELD(void *, actor, 0x240);
    void *sprite = FIELD(void *, attachment, 4);
    u8 direction = FIELD(u8, actor, 0xd4);
    u8 currentDirection = FIELD(u8, attachment, 0x1a);
    u8 animation = FIELD(u8, sprite, 0x38);
    s32 completed = currentDirection == animation &&
                    (FIELD(u16, sprite, 0x24) & 1) == 0;

    if (currentDirection != direction) {
        FIELD(u8, attachment, 0x1a) = direction;
        GraphicsSpriteState_SetAnimationIndex(sprite, direction);
        return;
    }
    if (!turning) {
        if (!completed && animation != (u8)(direction + 0x10)) {
            GraphicsSpriteState_SetAnimationIndex(sprite, (u8)(direction + 8));
            FIELD(u16, sprite, 0x24) |= 2;
        }
        return;
    }
    if (completed)
        return;

    GraphicsSpriteState_SetAnimationIndex(sprite, direction);
    FIELD(u16, sprite, 0x24) &= (u16)~2;
    {
        void *effect = Heap_Alloc(0x14, data_ov089_022199fc, 4, gHeapContext);
        if (effect != 0) {
            AuxiliaryTimedSpritePresentation_Init(
                effect, effectPosition, FIELD(void *, FIELD(void *, actor, 0x54), 0),
                0x1628, 0x1629, 0x162a, 0, 0, -1, 1);
        }
    }
    {
        u16 packed = FIELD(u16, actor, 0x23c) == 0 ? 0x4200 : 0x4201;
        Sound_Play(gSoundContext, packed >> 7, packed & 0x7f);
        FIELD(u16, actor, 0x23c) ^= 1;
    }
}

extern "C" void func_ov089_022186b4(void *, const void *, s32);
extern "C" void func_ov089_02218cb4(void *);
extern "C" void func_ov089_02218e80(void *, void *, s32);

/*
 * Run the controlled actor frame: consume directional input, turn and damp
 * motion, resolve the two collision-grid axes, synchronize the controlled
 * actors, and advance the auxiliary sprites and turn effect.
 */
extern "C" void func_ov089_02217c60(void *actor)
{
    void *terrain;
    s32 turning = 0;
    s32 speed;
    s32 angle;
    s32 sine;
    s32 cosine;
    s32 projection;
    s32 impact = 0;
    Ov89Vector scaled;

    if ((FIELD(u32, actor, 0x10) & 0x1000000) != 0) {
        ActorDerivedRuntime_UpdateFrame(actor);
        return;
    }
    if ((FIELD(u16, actor, 0x20c) & 0x80) != 0) {
        void *scene = SceneManager_GetCurrent(gSceneManager);
        if (FIELD(s32, scene, 4) == 0xe)
            return;
        FIELD(s16, actor, 0x234) = 0;
        FIELD(s32, actor, 0x238) = 0x3000;
        FIELD(u16, actor, 0x236) = 2000;
        FIELD(u16, actor, 0x20c) &= (u16)~0x80;
        if (FIELD(void *, actor, 0x240) != 0)
            FIELD(s32, FIELD(void *, actor, 0x240), 0x14) = 1;
        if (FIELD(void *, actor, 0x244) != 0)
            FIELD(s32, FIELD(void *, actor, 0x244), 0x14) = 1;
    }

    Actor_SnapshotTransientState(actor);
    func_ov089_02218cb4(actor);
    terrain = FIELD(void *, data_021052fc, 0x2ed4);
    if (FIELD(s16, actor, 0x214) == 1) {
        s32 tile = terrain_cell(terrain, (FIELD(s32, actor, 0x1c) >> 12) / 16,
                                (FIELD(s32, actor, 0x20) >> 12) / 16);
        s32 tileType = (s32)(((u32)tile << 22) >> 27);
        s32 desired;
        FIELD(s32, actor, 0x3c) += FIELD(s32, actor, 0x21c);
        FIELD(s32, actor, 0x40) += FIELD(s32, actor, 0x220);
        speed = motion_length(FIELD(s32, actor, 0x21c),
                              FIELD(s32, actor, 0x220));
        if (speed > 0xcd) {
            desired = func_020ae024(FIELD(s32, actor, 0x21c),
                                    FIELD(s32, actor, 0x220));
            if (desired < 0) desired += 0x10000;
            if (tileType == 0x1e)
                desired = (FIELD(s32, actor, 0x224) & 0x8000) + 0x4000;
            else if (tileType == 0x1f)
                desired = ((FIELD(s32, actor, 0x224) + 0x4000) & 0xffff) <= 0x8000
                              ? 0 : 0x8000;
            angle = desired - FIELD(s32, actor, 0x224);
            if (angle != 0) {
                if (angle < -0x8000) angle += 0x10000;
                if (angle > 0x7fff) angle -= 0x10000;
                FIELD(s32, actor, 0x224) += angle > 0 ? 0x200 : -0x200;
                if (FIELD(s32, actor, 0x224) < 0)
                    FIELD(s32, actor, 0x224) += 0x10000;
                FIELD(s32, actor, 0x224) &= 0xffff;
                FIELD(u8, actor, 0xd4) =
                    (u8)(7 - (((FIELD(s32, actor, 0x224) + 0xf000) >> 13) & 7));
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, actor, 0x54),
                                                       FIELD(u8, actor, 0xd4));
            }
            turning = 1;
        }
    }

    angle = FIELD(s32, actor, 0x224) >> 4;
    sine = data_020c9670[angle * 2];
    cosine = data_020c9670[angle * 2 + 1];
    projection = fx_mul(-cosine, FIELD(s32, actor, 0x3c)) +
                 fx_mul(sine, FIELD(s32, actor, 0x40));
    projection = fx_mul(projection, 0x333);
    FIELD(s32, actor, 0x3c) -= fx_mul(-cosine, projection);
    FIELD(s32, actor, 0x40) -= fx_mul(sine, projection);
    projection = fx_mul(sine, FIELD(s32, actor, 0x3c)) +
                 fx_mul(cosine, FIELD(s32, actor, 0x40));
    if (fx_mul(projection, 0x333) < 0) {
        FIELD(s32, actor, 0x3c) = 0;
        FIELD(s32, actor, 0x40) = 0;
    }
    func_ov089_022186b4(&scaled, (u8 *)actor + 0x38,
                        FIELD(s32, actor, 0x208));
    VecFx32Object_Subtract((u8 *)actor + 0x38, (u8 *)actor + 0x38, &scaled);
    VecFx32Object_Destroy(&scaled);

    if (FIELD(s16, actor, 0x214) == 1) {
        u8 *bounds = (u8 *)Actor_GetCollisionBounds(actor);
        speed = motion_length(FIELD(s32, actor, 0x3c), FIELD(s32, actor, 0x40));
        bounds[0] = 0xff;
        bounds[1] = 0xff;
        bounds[2] = 1;
        bounds[3] = 1;
        FIELD(s32, actor, 0x230) = -1;
        resolve_axis_collision(actor, terrain, 0, speed, &impact);
        resolve_axis_collision(actor, terrain, 1, speed, &impact);
        if (impact)
            Sound_Play(gSoundContext, 0x84, 2);
    }

    call_void(actor, 0xa4);
    if (FIELD(s16, actor, 0x214) == 1) {
        Ov89Vector effectPosition;
        void *primary = FIELD(void *, data_021052fc, 0x2ea4);
        VecFx32Object_InitCopy(&effectPosition, (u8 *)actor + 0x18);
        effectPosition.x += data_ov089_02219b48[FIELD(u8, FIELD(void *, actor, 0x240), 0x1a) * 3];
        effectPosition.y += data_ov089_02219b4c[FIELD(u8, FIELD(void *, actor, 0x240), 0x1a) * 3];
        VecFx32Object_Assign((u8 *)primary + 0x18, (u8 *)actor + 0x18);
        if (FIELD(void *, data_021052fc, 0x2ea8) != 0 &&
            (FIELD(u16, actor, 0x20c) & 0x800) != 0) {
            Ov89Vector position;
            func_ov089_02218e80(&position, actor, 0);
            VecFx32Object_Assign((u8 *)FIELD(void *, data_021052fc, 0x2ea8) + 0x18,
                                 &position);
            VecFx32Object_Destroy(&position);
        }
        update_primary_attachment_animation(actor, turning, &effectPosition);
        if (FIELD(void *, actor, 0x244) != 0 &&
            FIELD(u8, FIELD(void *, actor, 0x244), 0x1a) != FIELD(u8, actor, 0xd4)) {
            void *secondary = FIELD(void *, actor, 0x244);
            FIELD(u8, secondary, 0x1a) = FIELD(u8, actor, 0xd4);
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, secondary, 4),
                                                   FIELD(u8, secondary, 0x1a));
        }
        VecFx32Object_Destroy(&effectPosition);
    }
    Actor_UpdateAnimationState(actor);
    call_void(actor, 0x20);
}

/* Initialize a vector and store input components scaled by a 20.12 scalar. */
extern "C" void func_ov089_022186b4(void *result, const void *input, s32 scale)
{
    VecFx32Object_Init(result);
    FIELD(s32, result, 4) = fx_mul(FIELD(s32, input, 4), scale);
    FIELD(s32, result, 8) = fx_mul(FIELD(s32, input, 8), scale);
    FIELD(s32, result, 0xc) = fx_mul(FIELD(s32, input, 0xc), scale);
}

/* Apply pending sound flags and select the actor/attachment animation for state +0xd6. */
extern "C" void func_ov089_02218720(void *actor)
{
    void *sprite = FIELD(void *, actor, 0x54);
    s16 state;
    if ((FIELD(u16, actor, 0x20c) & 2) != 0) {
        FIELD(u16, actor, 0x20c) &= (u16)~2;
        FIELD(s16, actor, 0xd6) = 2;
    }
    if ((FIELD(u16, actor, 0x20c) & 0x80) != 0)
        Sound_Play(gSoundContext, 0x84, 3);
    if ((FIELD(u16, actor, 0x20c) & 0x100) != 0) {
        void *secondary = FIELD(void *, data_021052fc, 0x2ea8);
        u32 value;
        FIELD(u16, actor, 0x20c) &= (u16)~0x100;
        value = (u32)FIELD(u16, FIELD(void *, secondary, 0x29c), 0x38) >> 7;
        Sound_Play(gSoundContext, 0x84, value <= 10 ? 4 : value <= 20 ? 5 : 6);
    }
    state = FIELD(s16, actor, 0xd6);
    if (state == 0 || state > 4)
        return;
    GraphicsSpriteState_SetAnimationIndex(sprite, FIELD(u8, actor, 0xd4));
    if (state != 2) {
        FIELD(u16, sprite, 0x24) &= (u16)~1;
        FIELD(u16, sprite, 0x24) |= 2;
        return;
    }
    FIELD(u16, sprite, 0x24) &= (u16)~3;
    {
        void *attachment = FIELD(void *, actor, 0x240);
        FIELD(s32, attachment, 0x14) = 1;
        FIELD(u8, attachment, 0x1a) = FIELD(u8, actor, 0xd4);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, attachment, 4),
                                               FIELD(u8, actor, 0xd4) + 8);
        FIELD(u16, FIELD(void *, attachment, 4), 0x24) |= 2;
        func_ov089_02217c14(attachment, (u8 *)actor + 0x18);
    }
    if (FIELD(void *, data_021052fc, 0x2ea8) != 0 &&
        (FIELD(u16, actor, 0x20c) & 0x800) != 0 &&
        (FIELD(u16, FIELD(void *, FIELD(void *, data_021052fc, 0x2ea8), 0x54), 0x24) & 4) != 0)
        Type7Actor_SetActorEnabled(FIELD(void *, data_021052fc, 0x2ea8), 0);
}

/* Resolve contact with type-two/three actors and delegate the common pair path. */
extern "C" void func_ov089_02218954(void *actor, void *other, s32 mode)
{
    if ((FIELD(u32, actor, 0x10) & 0x1000000) == 0) {
        u8 kind = FIELD(u8, other, 0x4d);
        if (kind == 2 || kind == 3) {
            s32 dx = FIELD(s32, other, 0x1c) - FIELD(s32, actor, 0x1c);
            s32 dy = FIELD(s32, other, 0x20) - FIELD(s32, actor, 0x20);
            s32 distance = motion_length(dx, dy);
            if (distance > 0x1000) {
                s32 impulseX = func_020adc90(dx, distance);
                s32 impulseY = func_020adc90(dy, distance);
                if ((FIELD(u32, actor, 0xd0) & 0x10) != 0) {
                    impulseX /= 2;
                    impulseY /= 2;
                }
                FIELD(s32, actor, 0x9c) -= impulseX / 2;
                FIELD(s32, actor, 0xa0) -= impulseY / 2;
                FIELD(s32, other, 0x8c) += impulseX;
                FIELD(s32, other, 0x90) += impulseY;
            }
        }
        ActorContactState_AddContact(actor, other, mode);
    } else {
        ActorDerivedRuntime_HandlePairActive(actor, other, mode);
    }
}

/* Bob the actor sprite and submit both active auxiliary sprites at direction offsets. */
extern "C" void func_ov089_02218a5c(void *context, void *actor,
                                      const void *transform)
{
    s32 bob;
    s32 index;
    s32 which;
    ActorDerivedRuntime_ForwardTouchPoint(context, actor, transform);
    if (FIELD(u16, actor, 0x236) > 500) FIELD(u16, actor, 0x236) -= 10;
    if (FIELD(u16, actor, 0x236) < 500) FIELD(u16, actor, 0x236) = 500;
    if (FIELD(s32, actor, 0x238) > 0x1800) FIELD(s32, actor, 0x238) -= 0xcd;
    if (FIELD(s32, actor, 0x238) < 0x1800) FIELD(s32, actor, 0x238) += 0xcd;
    FIELD(s16, actor, 0x234) += FIELD(s16, actor, 0x236);
    index = (u16)FIELD(s16, actor, 0x234) >> 4;
    bob = fx_mul(data_020c9670[index * 2], FIELD(s32, actor, 0x238)) >> 12;
    FIELD(s16, FIELD(void *, actor, 0x54), 0x2e) += (s16)bob;
    for (which = 0; which < 2; ++which) {
        void *attachment = FIELD(void *, actor, 0x240 + which * 4);
        if (attachment != 0 && FIELD(s32, attachment, 0x14) != 0) {
            Ov89Vector position;
            s32 direction = FIELD(u8, attachment, 0x1a);
            VecFx32Object_InitCopy(&position, (u8 *)actor + 0x18);
            position.x += data_ov089_02219b48[direction * 3];
            position.y += data_ov089_02219b4c[direction * 3];
            position.z += bob * -0x1000;
            func_ov089_02217c14(attachment, &position);
            GraphicsSpriteState_AdvanceAnimation(FIELD(void *, attachment, 4));
            VecFx32Object_Destroy(&position);
        }
    }
}

/* Apply an input direction to active takeover velocity, respecting the global inversion byte. */
extern "C" void func_ov089_02218c44(void *actor, const void *direction)
{
    if (FIELD(s16, actor, 0x214) == 0) {
        FIELD(s16, actor, 0xd6) = 1;
    } else if (data_ov089_02219a20[0] != 0) {
        FIELD(s32, actor, 0x21c) = -FIELD(s32, direction, 4);
        FIELD(s32, actor, 0x220) = -FIELD(s32, direction, 8);
    } else {
        func_ov089_02218c9c((u8 *)actor + 0x218, direction);
    }
}

/* Copy the two meaningful direction components. */
extern "C" void func_ov089_02218c9c(void *destination, const void *source)
{
    if (destination != source) {
        FIELD(s32, destination, 4) = FIELD(s32, source, 4);
        FIELD(s32, destination, 8) = FIELD(s32, source, 8);
    }
}

/* Latch d-pad input for 44 frames and emit the corresponding two-axis impulse. */
extern "C" void func_ov089_02218cb4(void *actor)
{
    Ov89Direction direction;
    u16 held = FIELD(u16, gSystemState, 0x1a);
    u16 pressed = FIELD(u16, gSystemState, 0x1c);
    s32 selected;
    direction.vtable = data_ov089_02219918;
    direction.horizontal = 0;
    direction.vertical = 0;
    if (FIELD(s32, actor, 0x228) < 1) {
        if (pressed & 0x40) selected = 4;
        else if (pressed & 0x80) selected = 0;
        else if (pressed & 0x20) selected = 6;
        else if (pressed & 0x10) selected = 2;
        else selected = -1;
        if (selected >= 0) {
            FIELD(s32, actor, 0x228) = 44;
            FIELD(s32, actor, 0x22c) = selected;
        }
    } else {
        selected = FIELD(s32, actor, 0x22c);
        if ((selected == 4 && !(held & 0x40)) ||
            (selected == 0 && !(held & 0x80)) ||
            (selected == 6 && !(held & 0x20)) ||
            (selected == 2 && !(held & 0x10))) {
            FIELD(s32, actor, 0x228) = 0;
            FIELD(s32, actor, 0x230) = -1;
        }
    }
    if (FIELD(s32, actor, 0x228) > 0) {
        --FIELD(s32, actor, 0x228);
        selected = FIELD(s32, actor, 0x230) >= 0
                     ? FIELD(s32, actor, 0x230) : FIELD(s32, actor, 0x22c);
        if (selected == 0) direction.vertical = 0xf6;
        else if (selected == 2) direction.horizontal = 0xf6;
        else if (selected == 4) direction.vertical = -0xf6;
        else if (selected == 6) direction.horizontal = -0xf6;
    }
    func_ov089_02218c44(actor, &direction);
}

/* Construct a two-axis offset record used by the overlay static initializer. */
extern "C" void func_ov089_02218e6c(void *record, s32 horizontal, s32 vertical)
{
    FIELD(void *, record, 0) = data_ov089_02219918;
    FIELD(s32, record, 4) = horizontal;
    FIELD(s32, record, 8) = vertical;
}

/* Build the primary or secondary transition point from actor position and facing. */
extern "C" void func_ov089_02218e80(void *result, void *actor, s32 primary)
{
    s32 direction = FIELD(u8, actor, 0xd4);
    VecFx32Object_Init(result);
    VecFx32Object_Assign(result, (u8 *)actor + 0x18);
    if (primary) {
        FIELD(s32, result, 4) += data_ov089_02219ae8[direction * 3];
        FIELD(s32, result, 8) += data_ov089_02219aec[direction * 3];
    } else {
        FIELD(s32, result, 4) += data_ov089_02219b48[direction * 3];
        FIELD(s32, result, 8) += data_ov089_02219b4c[direction * 3];
    }
    FIELD(s32, result, 0xc) += 0xa000;
}

/* Enter controlled mode and transfer both global actors into overlay-62 motion scenes. */
extern "C" void func_ov089_02218f28(void *actor, s32 amplitude)
{
    if (FIELD(s16, actor, 0x214) == 0) {
        void *primary;
        void *secondary;
        void *scene;
        FIELD(u16, actor, 0x20c) |= 2;
        secondary = FIELD(void *, data_021052fc, 0x2ea8);
        if (secondary != 0 && Type7Actor_GetStateCode(secondary) == 0)
            FIELD(u16, actor, 0x20c) |= 0x800;
        func_ov089_022179dc(actor);
        FIELD(u8, actor, 0xd4) = FIELD(u8, FIELD(void *, actor, 0x54), 0x38);
        FIELD(s32, actor, 0xc8) = ((8 - FIELD(u8, actor, 0xd4)) << 13) & 0xffff;
        FIELD(s32, actor, 0x224) = FIELD(s32, actor, 0xc8);
        FIELD(s32, actor, 0x228) = 0;
        FIELD(s32, actor, 0x230) = -1;
        primary = FIELD(void *, data_021052fc, 0x2ea4);
        if (amplitude < 1) {
            FIELD(u32, primary, 0x230) &= ~4u;
            func_ov089_02219214((u8 *)primary + 0x38, 0, 0, 0);
            func_ov089_02219214((u8 *)primary + 0x88, 0, 0, 0);
            func_ov089_02219214((u8 *)primary + 0x98, 0, 0, 0);
            FIELD(u32, primary, 0x230) |= 0x100;
            FIELD(u32, primary, 0x14) |= 2;
            call_arg(primary, 0x54, 0);
            if (secondary != 0) {
                call_arg(secondary, 0x54, 0);
                Type7Actor_EnterFlag40000State(secondary);
                Type7Actor_SetActorEnabled(secondary, 0);
            }
        } else {
            OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
            if ((FIELD(u16, actor, 0x20c) & 0x800) != 0) {
                Ov89Vector point;
                scene = Heap_Alloc(0x40, data_ov089_02219a04, 4, gHeapContext);
                if (scene != 0) {
                    func_ov089_02218e80(&point, actor, 0);
                    func_ov062_02210674(scene, secondary, &point, 0x18,
                                       amplitude, 1, actor);
                    VecFx32Object_Destroy(&point);
                }
                FIELD(u16, actor, 0x20c) |= 0x100;
                FIELD(s32, FIELD(void *, actor, 0x244), 0x14) = 0;
                Type7Actor_EnterFlag40000State(secondary);
            }
            scene = Heap_Alloc(0x48, data_ov089_02219a04, 4, gHeapContext);
            if (scene != 0) {
                Ov89Vector point;
                func_ov089_02218e80(&point, actor, 1);
                func_ov062_0220fe78(scene, &point, 0x18, amplitude, 1, actor, 1);
                VecFx32Object_Destroy(&point);
            }
            FIELD(u16, actor, 0x20c) |= 0x80;
            FIELD(s32, FIELD(void *, actor, 0x240), 0x14) = 0;
        }
        GameWork_SetFlag(gGameWork, 0x402);
    }
    FIELD(s16, actor, 0x214) = 1;
}

/* Store three components after a vector object's vtable word. */
extern "C" void func_ov089_02219214(void *vector, s32 x, s32 y, s32 z)
{
    u8 *components = vector != 0 ? (u8 *)vector + 4 : (u8 *)0;
    FIELD(s32, components, 0) = x;
    FIELD(s32, components, 4) = y;
    FIELD(s32, components, 8) = z;
}

/* Leave controlled mode, restore global actors, and destroy both attachments. */
extern "C" void func_ov089_02219224(void *actor, const void *target,
                                      s32 transition, s32 unused)
{
    (void)unused;
    if (FIELD(s16, actor, 0x214) == 1) {
        Ov89Direction direction;
        void *primary = FIELD(void *, data_021052fc, 0x2ea4);
        void *secondary = FIELD(void *, data_021052fc, 0x2ea8);
        direction.vtable = data_ov089_02219918;
        direction.horizontal = 0;
        direction.vertical = 0;
        func_ov089_02218c9c((u8 *)actor + 0x218, &direction);
        FIELD(s16, actor, 0xd6) = 1;
        call_void(actor, 0x5c);
        {
            Ov89Vector zero;
            VecFx32Object_InitComponents(&zero, 0, 0, 0);
            VecFx32Object_Assign((u8 *)actor + 0x38, &zero);
            VecFx32Object_Destroy(&zero);
        }
        if (transition < 1) {
            FIELD(u32, primary, 0x14) &= ~2u;
            FIELD(u32, primary, 0x230) |= 4;
            call_arg(primary, 0x54, 1);
            FIELD(u32, primary, 0x230) &= ~0x100u;
            VecFx32Object_Assign((u8 *)primary + 0x18, target);
            VecFx32Object_Assign((u8 *)primary + 0x28, (u8 *)primary + 0x18);
            func_ov089_02219214((u8 *)primary + 0x38, 0, 0, 0);
            func_ov089_02219214((u8 *)primary + 0x88, 0, 0, 0);
            func_ov089_02219214((u8 *)primary + 0x98, 0, 0, 0);
            Actor_SetDirectionFromVector(primary, 0, 0x1000);
            ActorDerivedType1_ResetToBaseState(primary);
        } else {
            Ov89Vector point;
            void *scene;
            func_ov089_02218e80(&point, actor, 1);
            VecFx32Object_Assign((u8 *)primary + 0x18, &point);
            VecFx32Object_Destroy(&point);
            VecFx32Object_Assign((u8 *)primary + 0x28, (u8 *)primary + 0x18);
            FIELD(u16, actor, 0x20c) |= 0x80;
            OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
            if (secondary != 0 && (FIELD(u16, actor, 0x20c) & 0x800) != 0) {
                func_ov089_02218e80(&point, actor, 0);
                VecFx32Object_Assign((u8 *)secondary + 0x18, &point);
                VecFx32Object_Destroy(&point);
                scene = Heap_Alloc(0x40, data_ov089_02219a04, 4, gHeapContext);
                if (scene != 0)
                    func_ov062_02210674(scene, secondary, target, 0x18,
                                       transition, 0, secondary);
                FIELD(u16, actor, 0x20c) =
                    (FIELD(u16, actor, 0x20c) | 0x100) & (u16)~0x800;
                FIELD(s32, FIELD(void *, actor, 0x244), 0x14) = 0;
                Type7Actor_SetActorEnabled(secondary, 1);
                FIELD(u32, secondary, 0x268) &= ~0x40000u;
                Type7Actor_ResetMotionAndCooldown(secondary);
            }
            scene = Heap_Alloc(0x48, data_ov089_02219a04, 4, gHeapContext);
            if (scene != 0)
                func_ov062_0220fe78(scene, target, 0x18, transition, 0, primary, 1);
        }
        GameWork_ClearFlag(gGameWork, 0x402);
    }
    func_ov089_02217904(actor);
    FIELD(s16, actor, 0x214) = 0;
}

/* Return the actor's fixed interaction extent. */
extern "C" s32 func_ov089_02219540(void) { return 0x40000; }

/* Return zero for an unsupported specialized query. */
extern "C" s32 func_ov089_02219548(void) { return 0; }

/* Copy the actor's current position into a vector result. */
extern "C" void func_ov089_02219550(void *result, void *actor)
{
    VecFx32Object_InitCopy(result, (u8 *)actor + 0x18);
}

/* Return runtime flag 0x80 in its encoded form. */
extern "C" u32 func_ov089_02219560(void *actor)
{
    return FIELD(u32, actor, 0xd0) & 0x80;
}

/* Return one exactly when runtime flag 0x40 is set. */
extern "C" s32 func_ov089_0221956c(void *actor)
{
    return (FIELD(u32, actor, 0xd0) & 0x40) != 0;
}

/* Return zero for an unsupported specialized query. */
extern "C" s32 func_ov089_02219580(void) { return 0; }

/* Empty specialized callback; it has no state or SDK effects. */
extern "C" void func_ov089_02219588(void) {}

/* Empty specialized callback retained as a distinct vtable entry. */
extern "C" void func_ov089_0221958c(void) {}

/* Empty specialized callback retained as a distinct vtable entry. */
extern "C" void func_ov089_02219590(void) {}

/* Set runtime flag 0x80. */
extern "C" void func_ov089_02219594(void *actor)
{
    FIELD(u32, actor, 0xd0) |= 0x80;
}

/* Return zero for an unsupported specialized query. */
extern "C" s32 func_ov089_022195a4(void) { return 0; }

/* Return zero for an unsupported specialized query. */
extern "C" s32 func_ov089_022195ac(void) { return 0; }

/* Return zero for an unsupported specialized query. */
extern "C" s32 func_ov089_022195b4(void) { return 0; }

/* Return zero for an unsupported specialized query. */
extern "C" s32 func_ov089_022195bc(void) { return 0; }

/* Empty specialized callback; it has no state or SDK effects. */
extern "C" void func_ov089_022195c4(void) {}

/* Forward the actor to the shared base collision/state helper. */
extern "C" void func_ov089_022195c8(void *actor)
{
    func_02033b38(actor);
}

/* Free actor storage and return the original pointer. */
extern "C" void *func_ov089_022195d4(void *actor)
{
    Heap_Free(actor);
    return actor;
}

extern "C" void __register_global_object(void *, void (*)(void *), void *);

/* Construct and register all sixteen direction-offset records used by the actor. */
extern "C" void __sinit_ov089_022195e8(void)
{
    static u8 *const objects[16] = {
        data_ov089_02219b44, data_ov089_02219b50, data_ov089_02219b5c,
        data_ov089_02219b68, data_ov089_02219b74, data_ov089_02219b80,
        data_ov089_02219b8c, data_ov089_02219b98, data_ov089_02219ae4,
        data_ov089_02219af0, data_ov089_02219afc, data_ov089_02219b08,
        data_ov089_02219b14, data_ov089_02219b20, data_ov089_02219b2c,
        data_ov089_02219b38
    };
    static u8 *const records[16] = {
        data_ov089_02219a78, data_ov089_02219a30, data_ov089_02219a54,
        data_ov089_02219a24, data_ov089_02219ad8, data_ov089_02219a48,
        data_ov089_02219acc, data_ov089_02219a3c, data_ov089_02219a6c,
        data_ov089_02219a9c, data_ov089_02219a90, data_ov089_02219a84,
        data_ov089_02219aa8, data_ov089_02219ab4, data_ov089_02219ac0,
        data_ov089_02219a60
    };
    static const s32 offsets[16][2] = {
        {0, -0xc000}, {0xd000, -0x6000}, {0x1a000, 0x7000},
        {0xb000, 0x15000}, {0, 0x16000}, {-0xa000, 0x17000},
        {-0x18000, 0x8000}, {-0xe000, -0x5000}, {0, 0xe000},
        {-0x8000, 0xb000}, {-0x9000, 0x2000}, {-0x6000, -0x7000},
        {0, -0xa000}, {0x9000, -0x7000}, {0x10000, 0x1000},
        {0xb000, 0xb000}
    };
    s32 i;
    for (i = 0; i < 16; ++i) {
        func_ov089_02218e6c(objects[i], offsets[i][0], offsets[i][1]);
        __register_global_object(objects[i],
                                 (void (*)(void *))func_ov089_022177e0,
                                 records[i]);
    }
}
