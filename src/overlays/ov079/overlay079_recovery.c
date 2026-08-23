#include "tingle/types.h"

/*
 * Recovered overlay 79 paired-creature actor subsystem.
 *
 * This ActorExtendedType2 subclass loads its presentation, separates from
 * colliding actors, looks for the primary actor or another compatible member
 * of its own class, and temporarily follows that partner. Unknown base-class
 * members and the retail callback-pair representation remain offset based.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Ov79ArgMethod)(void *, s32);
typedef void (*Ov79RecordMethod)(void *, const void *);

extern "C" void *data_021052fc;
extern "C" void *gSoundContext;
extern "C" const u8 data_020e6adc[];
extern "C" const u8 data_020e6b74[];
extern "C" u8 data_ov079_02213b08[];
extern "C" u8 data_ov079_02213b30[];
extern "C" u8 data_ov079_02213b38[];
extern "C" u8 data_ov079_02213c2c[];

extern "C" void *ActorExtendedType2_Init(void *, const void *);
extern "C" void *ActorExtendedType2_Destroy(void *);
extern "C" void ActorExtendedType2_InitializePresentation(void *, const void *);
extern "C" void Heap_Free(void *);
extern "C" void *Actor_GetOwningCollection(void *);
extern "C" void *ActorCollection_GetSpriteGroup(void *);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void *, void *, void *, void *, void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" s32 ActorContactState_AddContact(void *, void *, s32);
extern "C" s32 Fx32Vector2_Magnitude(s32, s32);
extern "C" s32 func_020adc90(s32, s32);
extern "C" void Sound_Play(void *, s32, s32);
extern "C" void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern "C" s32 ActorExtendedType2_IsDirectionToActorAccepted(void *, u32, void *);
extern "C" u32 genrand_int32(void);
extern "C" u64 func_020bf1f8(u32, u32);
extern "C" s32 ActorExtendedType2_SelectRandomDescriptorCallback(void *, const void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);

extern "C" void func_ov079_0221323c(void *);
extern "C" void func_ov079_0221329c(void *, void *);
extern "C" void *func_ov079_02213310(void *);
extern "C" s32 func_ov079_0221340c(void *);
extern "C" void func_ov079_02213458(void *, const void *);
extern "C" s32 func_ov079_0221317c(void *, u32);

/* Invoke a one-integer virtual method at a byte offset in the actor vtable. */
static void call_arg(void *actor, u32 offset, s32 value)
{
    (*(Ov79ArgMethod *)((u8 *)FIELD(void *, actor, 0) + offset))(actor, value);
}

/* Invoke the retail two-word member-function representation stored in an actor. */
static void call_member(void *actor, u32 functionOffset, u32 adjustOffset,
                        const void *record)
{
    u32 function = FIELD(u32, actor, functionOffset);
    u32 adjust = FIELD(u32, actor, adjustOffset);
    u8 *adjusted = (u8 *)actor + ((s32)adjust >> 1);
    Ov79RecordMethod callback;
    if ((adjust & 1) != 0)
        callback = *(Ov79RecordMethod *)(FIELD(u8 *, adjusted, 0) + function);
    else
        callback = (Ov79RecordMethod)(u64)function;
    callback(adjusted, record);
}

/* Copy a two-word callback pair from the overlay's initialized table. */
static void copy_pair(void *actor, u32 destination, u32 source)
{
    FIELD(u32, actor, destination) = FIELD(u32, data_ov079_02213b08, source);
    FIELD(u32, actor, destination + 4) = FIELD(u32, data_ov079_02213b08, source + 4);
}

/* Replace sprite resources from actor +0x208 and select an animation. */
static void install_presentation(void *actor, s32 animation, u16 setFlags,
                                 u16 clearFlags)
{
    u8 *resource = FIELD(u8 *, actor, 0x208);
    void *owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
    GraphicsSpriteGroup_ReplaceStateResources(
        owner, FIELD(void *, actor, 0x54), FIELD(void *, resource, 4),
        FIELD(void *, resource, 8), FIELD(void *, resource, 0xc));
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, actor, 0x54), animation);
    FIELD(u16, FIELD(void *, actor, 0x54), 0x24) =
        (FIELD(u16, FIELD(void *, actor, 0x54), 0x24) & ~clearFlags) | setFlags;
}

/* Construct the paired-creature actor and install its initial behavior pair. */
extern "C" void *func_ov079_02212ae0(void *actor, const void *configuration)
{
    u8 temporary[0x30];
    ActorExtendedType2_Init(actor, configuration);
    FIELD(void *, actor, 0) = data_ov079_02213c2c;
    FIELD(u8, actor, 0x4d) = 5;
    (*(void (**)(void *, void *))((u8 *)FIELD(void *, actor, 0) + 0xc8))(actor, temporary);
    copy_pair(actor, 0x298, 0x10);
    FIELD(u32, actor, 0x260) = (FIELD(u32, actor, 0x260) & ~8u) | 0x20;
    FIELD(s32, actor, 0x2a0) = 0;
    FIELD(s32, actor, 0x2a4) = 0;
    return actor;
}

/* Destroy the base actor while retaining its allocation. */
extern "C" void *func_ov079_02212b58(void *actor)
{
    ActorExtendedType2_Destroy(actor);
    return actor;
}

/* Destroy the actor and release its heap allocation. */
extern "C" void *func_ov079_02212b6c(void *actor)
{
    ActorExtendedType2_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Forward presentation initialization to the ActorExtendedType2 base. */
extern "C" void func_ov079_02212b88(void *actor, const void *descriptor)
{
    ActorExtendedType2_InitializePresentation(actor, descriptor);
}

/* Select the sprite resources, animation, and playback flags for actor state. */
extern "C" void func_ov079_02212b94(void *actor)
{
    s32 animation = FIELD(u8, actor, 0xd4);
    u16 delay = 0x100;
    switch (FIELD(s16, actor, 0xd6)) {
    case 1:
        install_presentation(actor, animation, 0, 3);
        delay = 0;
        break;
    case 2:
    case 5:
    case 6:
    case 8:
    case 9:
    case 22:
        install_presentation(actor, animation, 2, 1);
        break;
    case 3:
        install_presentation(actor, (animation + 8) & 0xff, 2, 1);
        break;
    case 4:
        install_presentation(actor, (animation + 16) & 0xff, 2, 1);
        break;
    case 17:
        if (data_020e6b74[FIELD(u16, actor, 0x4e)] != 0)
            install_presentation(actor, 17, 0, 3);
        break;
    case 19:
        if (data_020e6adc[FIELD(u16, actor, 0x4e)] != 0)
            install_presentation(actor, 16, 0, 3);
        else
            install_presentation(actor, 0, 2, 1);
        break;
    default:
        break;
    }
    FIELD(u16, FIELD(void *, actor, 0x54), 0x36) = delay;
    FIELD(u16, FIELD(void *, actor, 0x54), 0x30) = 0;
}

/* Resolve contacts, separating same-class actors and registering the contact. */
extern "C" void func_ov079_02212f68(void *actor, void *other, s32 contactKind)
{
    if (FIELD(u8, other, 0x4d) == 1) {
        (*(void (**)(void *, void *))((u8 *)FIELD(void *, actor, 0) + 0x1b4))(actor, other);
    } else if (FIELD(u8, other, 0x4d) == 2) {
        s32 dx = FIELD(s32, other, 0x1c) - FIELD(s32, actor, 0x1c);
        s32 dy = FIELD(s32, other, 0x20) - FIELD(s32, actor, 0x20);
        s32 distance = Fx32Vector2_Magnitude(dx, dy);
        if (distance > 0x1000) {
            dx = func_020adc90(dx, distance);
            dy = func_020adc90(dy, distance);
            FIELD(s32, actor, 0x8c) -= dx;
            FIELD(s32, actor, 0x90) -= dy;
            FIELD(s32, other, 0x8c) += dx;
            FIELD(s32, other, 0x90) += dy;
            if ((FIELD(u32, actor, 0x10) & 4) != 0)
                Sound_Play(gSoundContext, 0, 12);
        }
    }
    ActorContactState_AddContact(actor, other, contactKind);
}

/* Accept a compatible impact, push away, play feedback, and change behavior. */
extern "C" void func_ov079_02213064(void *actor, const void *other)
{
    s32 first = FIELD(s32, actor, 0x218);
    if (!(first == FIELD(s32, data_ov079_02213b08, 0x30) &&
          (FIELD(s32, actor, 0x21c) == FIELD(s32, data_ov079_02213b38, 4) || first == 0)))
        return;
    FIELD(u32, actor, 0x260) |= 0x10;
    s32 dx = FIELD(s32, other, 0x1c) - FIELD(s32, actor, 0x1c);
    s32 dy = FIELD(s32, other, 0x20) - FIELD(s32, actor, 0x20);
    s32 distance = Fx32Vector2_Magnitude(dx, dy);
    if (distance > 0x1000) {
        FIELD(s32, actor, 0x8c) -= func_020adc90(dx, distance);
        FIELD(s32, actor, 0x90) -= func_020adc90(dy, distance);
        if ((FIELD(u32, actor, 0x10) & 4) != 0)
            Sound_Play(gSoundContext, 0, 12);
    }
    Sound_Play(gSoundContext, 0, 12);
    copy_pair(actor, 0x298, 0x20);
    copy_pair(actor, 0x220, 0x18);
}

/* Begin following the primary actor when direction and distance permit it. */
extern "C" s32 func_ov079_0221317c(void *actor, u32 direction)
{
    if (FIELD(s32, actor, 0x2a4) > 0 ||
        FIELD(s32, actor, 0x24) != FIELD(s32, actor, 0x1dc))
        return 0;
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    void *primary = FIELD(void *, collection, 0x2e7c);
    if ((FIELD(u32, actor, 0x260) & 0x10) == 0 &&
        !ActorExtendedType2_IsDirectionToActorAccepted(actor, direction, primary))
        return 0;
    if (Fx32Vector2_Magnitude(FIELD(s32, primary, 0x1c) - FIELD(s32, actor, 0x1c),
                      FIELD(s32, primary, 0x20) - FIELD(s32, actor, 0x20)) >= 0x28000)
        return 0;
    func_ov079_0221323c(actor);
    return 1;
}

/* Bind the primary actor as partner and choose a randomized follow duration. */
extern "C" void func_ov079_0221323c(void *actor)
{
    copy_pair(actor, 0x298, 0x68);
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    FIELD(void *, actor, 0x228) = FIELD(void *, collection, 0x2e7c);
    func_ov079_02213458(actor, FIELD(void *, actor, 0x228));
    FIELD(s32, actor, 0x2a0) = (s32)(func_020bf1f8(genrand_int32(), 0x3c) >> 32) + 0xb4;
}

/* Enter or leave a mutual partner relationship and install the matching pairs. */
extern "C" void func_ov079_0221329c(void *actor, void *partner)
{
    if (partner != 0) {
        copy_pair(actor, 0x298, 0x88);
        FIELD(void *, actor, 0x228) = partner;
        FIELD(s32, actor, 0x2a0) = (s32)(func_020bf1f8(genrand_int32(), 0x78) >> 32) + 0x78;
    } else {
        copy_pair(actor, 0x298, 0);
        copy_pair(actor, 0x220, 0xa8);
        FIELD(s32, actor, 0x2a4) = 0xb4;
    }
}

/* Find a nearby compatible, idle actor of this same overlay subclass. */
extern "C" void *func_ov079_02213310(void *actor)
{
    if (FIELD(s32, actor, 0x2a4) > 0)
        return 0;
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    s32 count = FIELD(s32, collection, 0x2e74);
    for (s32 index = 0; index < count; ++index) {
        void *candidate = FIELD(void *, collection, index * 4);
        if (candidate == 0 || candidate == actor || FIELD(u8, candidate, 0x4d) != 5)
            continue;
        s32 first = FIELD(s32, candidate, 0x218);
        if (first != FIELD(s32, data_ov079_02213b08, 0x28) ||
            (FIELD(s32, candidate, 0x21c) != FIELD(s32, data_ov079_02213b30, 4) && first != 0) ||
            FIELD(s32, candidate, 0x2a4) != 0)
            continue;
        if (Fx32Vector2_Magnitude(FIELD(s32, candidate, 0x1c) - FIELD(s32, actor, 0x1c),
                          FIELD(s32, candidate, 0x20) - FIELD(s32, actor, 0x20)) < 0x30000)
            return candidate;
    }
    return 0;
}

/* Establish a symmetric relationship with a nearby compatible actor. */
extern "C" s32 func_ov079_0221340c(void *actor)
{
    if (FIELD(s32, actor, 0x24) != FIELD(s32, actor, 0x1dc))
        return 0;
    void *partner = func_ov079_02213310(actor);
    if (partner == 0)
        return 0;
    func_ov079_0221329c(actor, partner);
    func_ov079_0221329c(partner, actor);
    return 1;
}

/* Steer toward a partner by passing a translated position to virtual +0xd0. */
extern "C" void func_ov079_02213458(void *actor, const void *partner)
{
    u8 position[0x10];
    VecFx32Object_InitCopy(position, (u8 *)actor + 0x18);
    FIELD(s32, position, 4) += FIELD(s32, actor, 0x1c) - FIELD(s32, partner, 0x1c);
    FIELD(s32, position, 8) += FIELD(s32, actor, 0x20) - FIELD(s32, partner, 0x20);
    (*(void (**)(void *, void *))((u8 *)FIELD(void *, actor, 0) + 0xd0))(actor, position);
    FIELD(s32, actor, 0x44) = 0x4000;
    VecFx32Object_Destroy(position);
}

/* Select the next idle behavior unless a partner or primary follow begins. */
extern "C" s32 func_ov079_022134d0(void *actor, const void *descriptor)
{
    FIELD(void *, actor, 0x228) = 0;
    FIELD(s32, actor, 0x2a0) = 0;
    (void)genrand_int32();
    if (func_ov079_0221340c(actor) ||
        func_ov079_0221317c(actor, FIELD(u16, descriptor, 0x1e) & 3))
        return 0;
    return ActorExtendedType2_SelectRandomDescriptorCallback(actor, descriptor);
}

/* Run the active state callback, resetting or delaying when the anchor is lost. */
extern "C" s32 func_ov079_02213530(void *actor, const void *descriptor)
{
    FIELD(u32, actor, 0x260) |= 3;
    call_arg(actor, 0x54, 1);
    if ((*(s32 (**)(void *))((u8 *)FIELD(void *, actor, 0) + 0x38))(actor) != 0)
        return 0;
    if ((FIELD(u16, descriptor, 0x1a) & 2) != 0) {
        copy_pair(actor, 0x218, 0xa0);
        return 0;
    }
    if (FIELD(s32, actor, 0x24) == FIELD(s32, actor, 0x1dc)) {
        s32 dx = (FIELD(s32, actor, 0x1c) - FIELD(s32, actor, 0x230)) >> 12;
        s32 dy = (FIELD(s32, actor, 0x20) - FIELD(s32, actor, 0x234)) >> 12;
        s32 radius = FIELD(s16, descriptor, 8);
        if (dx * dx + dy * dy > radius * radius) {
            copy_pair(actor, 0x220, 0x98);
            (*(void (**)(void *, void *))((u8 *)FIELD(void *, actor, 0) + 0xd0))(
                actor, (u8 *)actor + 0x22c);
            FIELD(s32, actor, 0x2a4) = 0xb4;
            return 0;
        }
    }
    if (FIELD(s32, actor, 0x2a4) > 0)
        --FIELD(s32, actor, 0x2a4);
    call_member(actor, 0x298, 0x29c, descriptor);
    return 0;
}

/* Try primary and peer acquisition before invoking the current behavior pair. */
extern "C" void func_ov079_0221365c(void *actor, const void *descriptor)
{
    if (func_ov079_0221317c(actor, FIELD(u16, descriptor, 0x1e) & 3))
        return;
    if (func_ov079_0221340c(actor))
        return;
    call_member(actor, 0x220, 0x224, descriptor);
}

/* Count down partner-follow time, then transition to the close-follow callback. */
extern "C" void func_ov079_022136b8(void *actor)
{
    FIELD(s16, actor, 0xd6) = 3;
    if (FIELD(s32, actor, 0x2a0) != 0) {
        --FIELD(s32, actor, 0x2a0);
        return;
    }
    copy_pair(actor, 0x298, 0x90);
    copy_pair(actor, 0x220, 0x38);
}

/* Follow a partner, returning to idle when separation becomes excessive. */
extern "C" void func_ov079_02213700(void *actor)
{
    if (func_ov079_0221340c(actor))
        return;
    void *partner = FIELD(void *, actor, 0x228);
    if (FIELD(s32, actor, 0x2a0) == 0) {
        copy_pair(actor, 0x298, 0x80);
        copy_pair(actor, 0x220, 0x78);
    } else if (FIELD(s32, actor, 0x24) == FIELD(s32, actor, 0x1dc)) {
        --FIELD(s32, actor, 0x2a0);
        s32 distance = Fx32Vector2_Magnitude(FIELD(s32, partner, 0x1c) - FIELD(s32, actor, 0x1c),
                                     FIELD(s32, partner, 0x20) - FIELD(s32, actor, 0x20));
        if (distance > 0x50000) {
            copy_pair(actor, 0x298, 0x70);
            copy_pair(actor, 0x220, 8);
            FIELD(s32, actor, 0x2a4) = 0xb4;
        } else if (distance < 0x14000) {
            func_ov079_02213458(actor, partner);
        }
    } else {
        u8 position[0x10];
        VecFx32Object_InitCopy(position, (u8 *)actor + 0x18);
        FIELD(s32, position, 4) += FIELD(s32, actor, 0x1c) - FIELD(s32, partner, 0x1c);
        FIELD(s32, position, 8) += FIELD(s32, actor, 0x20) - FIELD(s32, partner, 0x20);
        (*(void (**)(void *, void *))((u8 *)FIELD(void *, actor, 0) + 0xd0))(actor, position);
        VecFx32Object_Destroy(position);
    }
    FIELD(s16, actor, 0xd6) = 4;
    FIELD(u8, actor, 0x24c) = 10;
}

/* Maintain a mutual pair and dissolve it on timeout or excessive distance. */
extern "C" void func_ov079_02213850(void *actor)
{
    FIELD(s16, actor, 0xd6) = 3;
    FIELD(u8, actor, 0x24c) = 9;
    void *partner = FIELD(void *, actor, 0x228);
    if (FIELD(s32, actor, 0x2a0) == 0) {
        func_ov079_0221329c(partner, 0);
        func_ov079_0221329c(actor, 0);
        return;
    }
    --FIELD(s32, actor, 0x2a0);
    (void)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    if (Fx32Vector2_Magnitude(FIELD(s32, partner, 0x1c) - FIELD(s32, actor, 0x1c),
                      FIELD(s32, partner, 0x20) - FIELD(s32, actor, 0x20)) > 0x40000) {
        copy_pair(actor, 0x298, 0x60);
        copy_pair(actor, 0x220, 0x58);
        FIELD(s32, actor, 0x2a4) = 0xb4;
    }
}

/* Enter the ordinary moving state and install its update pair. */
extern "C" void func_ov079_02213908(void *actor)
{
    FIELD(s16, actor, 0xd6) = 2;
    copy_pair(actor, 0x298, 0x50);
    copy_pair(actor, 0x220, 0x48);
}

/* Return the neutral encoded result used by this vtable slot. */
extern "C" s32 func_ov079_0221393c(void) { return 0; }

/* Copy the source actor's position into the supplied vector object. */
extern "C" void func_ov079_02213944(void *result, const void *actor)
{
    VecFx32Object_InitCopy(result, (const u8 *)actor + 0x18);
}

/* Return runtime flag 0x80 in its encoded (zero or 0x80) form. */
extern "C" u32 func_ov079_02213954(const void *actor) { return FIELD(u32, actor, 0xd0) & 0x80; }

/* Return whether runtime flag 0x40 is active. */
extern "C" s32 func_ov079_02213960(const void *actor) { return (FIELD(u32, actor, 0xd0) & 0x40) != 0; }

/* Return the neutral encoded result used by this vtable slot. */
extern "C" s32 func_ov079_02213974(void) { return 0; }

/* No-op vtable hook retained for ABI compatibility. */
extern "C" void func_ov079_0221397c(void) {}

/* No-op vtable hook retained for ABI compatibility. */
extern "C" void func_ov079_02213980(void) {}

/* Return the actor's fixed presentation category. */
extern "C" s32 func_ov079_02213984(void) { return 16; }

/* Return the address of the actor's embedded position vector. */
extern "C" void *func_ov079_0221398c(void *actor) { return (u8 *)actor + 0x18; }

/* Return the actor's fixed maximum range in 20.12 units. */
extern "C" s32 func_ov079_02213994(void) { return 0xc0000; }

/* Forward the supplied record to virtual +0x108 with a zero third argument. */
extern "C" void func_ov079_0221399c(void *actor, const void *record)
{
    (*(void (**)(void *, const void *, s32))((u8 *)FIELD(void *, actor, 0) + 0x108))(actor, record, 0);
}

/* Forward the supplied record to virtual +0x108 with a zero third argument. */
extern "C" void func_ov079_022139b4(void *actor, const void *record)
{
    (*(void (**)(void *, const void *, s32))((u8 *)FIELD(void *, actor, 0) + 0x108))(actor, record, 0);
}

/* Return the neutral encoded result used by this vtable slot. */
extern "C" s32 func_ov079_022139cc(void) { return 0; }

/* Report the active collision condition encoded by flags and virtual +0xa8. */
extern "C" s32 func_ov079_022139d4(void *actor)
{
    return (FIELD(u32, actor, 0x260) & 8) != 0 &&
           (FIELD(u32, actor, 0x260) & 2) != 0 &&
           (*(s32 (**)(void *))((u8 *)FIELD(void *, actor, 0) + 0xa8))(actor) == 0;
}

/* Return whether presentation mode byte +0x24c equals eight. */
extern "C" s32 func_ov079_02213a1c(const void *actor) { return FIELD(u8, actor, 0x24c) == 8; }

/* Return whether the actor is outside state sixteen. */
extern "C" s32 func_ov079_02213a30(const void *actor) { return FIELD(s16, actor, 0xd6) != 16; }

/* Return whether the actor occupies state five or six. */
extern "C" s32 func_ov079_02213a50(const void *actor)
{
    return FIELD(s16, actor, 0xd6) == 5 || FIELD(s16, actor, 0xd6) == 6;
}

/* Return whether secondary state +0xd8 is nine or ten. */
extern "C" s32 func_ov079_02213a68(const void *actor)
{
    return FIELD(s16, actor, 0xd8) == 9 || FIELD(s16, actor, 0xd8) == 10;
}

/* Return whether primary state +0xd6 is nine or ten. */
extern "C" s32 func_ov079_02213a80(const void *actor)
{
    return FIELD(s16, actor, 0xd6) == 9 || FIELD(s16, actor, 0xd6) == 10;
}

/* Return the fixed horizontal interaction extent in 20.12 units. */
extern "C" s32 func_ov079_02213a98(void) { return 0x800; }

/* Return the fixed vertical interaction extent in 20.12 units. */
extern "C" s32 func_ov079_02213aa0(void) { return 0x800; }

/* No-op vtable hook retained for ABI compatibility. */
extern "C" void func_ov079_02213aa8(void) {}

/* No-op vtable hook retained for ABI compatibility. */
extern "C" void func_ov079_02213aac(void) {}

/* Toggle bit two on the sprite-like object stored at actor +0x288. */
extern "C" void func_ov079_02213ab0(void *actor, s32 enabled)
{
    void *sprite = FIELD(void *, actor, 0x288);
    if (enabled == 0)
        FIELD(u16, sprite, 0x24) |= 4;
    else
        FIELD(u16, sprite, 0x24) &= (u16)~4;
}

/* Return the fixed partner-search distance in 20.12 units. */
extern "C" s32 func_ov079_02213ad0(void) { return 0x20000; }

/* Return the neutral encoded result used by the final vtable slot. */
extern "C" s32 func_ov079_02213ad8(void) { return 0; }
