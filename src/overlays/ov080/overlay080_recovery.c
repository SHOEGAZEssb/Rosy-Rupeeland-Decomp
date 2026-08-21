#include "tingle/types.h"

/*
 * Recovered overlay 80 roaming actor subsystem.
 *
 * This ActorExtendedType2 subclass creates an actor from a tracked-resource
 * descriptor, selects its presentation from the current action, chooses one
 * of the two primary actors as a target, searches for a valid nearby spawn
 * position, and drives the approach/retreat states used around that target.
 * Base-class state and the retail callback-pair representation remain offset
 * based until their shared types are recovered.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef s32 (*Ov80Method0)(void *);
typedef s32 (*Ov80Method2)(void *, void *, void *);
typedef void (*Ov80VoidMethod0)(void *);
typedef void (*Ov80VoidMethod1)(void *, void *);

extern "C" void *gGameWork;
extern "C" void *data_021052fc;
extern "C" void *gSoundContext;
extern "C" void *gActorRuntimeCollection;
extern "C" u8 data_0210576c, data_0210576d, data_0210576e, data_0210576f;
extern "C" u16 data_02105770;
extern "C" const u8 data_020e6adc[], data_020e6b74[], data_020e6c0c[];
extern "C" const u16 data_020e7318[];
extern "C" const u8 data_020e8380[], gTrackedResourceActorRecordTable[];
extern "C" const s16 data_020c9670[];
extern "C" u8 data_ov080_02213e68[], data_ov080_02213e70[];
extern "C" u8 data_ov080_02213e78[], data_ov080_02213e90[];
extern "C" u8 data_ov080_02213ea8[], data_ov080_02213eb0[];
extern "C" const u16 data_ov080_02213ef0[];
extern "C" u8 data_ov080_02213f44[];

extern "C" void *ActorExtendedType2_Init(void *, const void *);
extern "C" void *ActorExtendedType2_Destroy(void *);
extern "C" void Heap_Free(void *);
extern "C" void *Actor_GetCollection(void *);
extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void *, void *, void *, void *, void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void Actor_SaveAndForceFlags(void *);
extern "C" void Actor_RestoreSavedFlags(void *);
extern "C" s32 Actor_GetCachedTerrainHeight(void *);
extern "C" s32 func_02033f4c(void);
extern "C" void ActorExtendedType2_UpdateFrame(void *);
extern "C" void ActorExtendedType2_CopyAdjustedDescriptor(void *, const void *);
extern "C" void ActorExtendedType2_TriggerContactFeedback(void *);
extern "C" void ActorExtendedType2_InitializeReentryState(void *);
extern "C" void ActorExtendedType2_UpdateTargetMotion(void *);
extern "C" s32 ActorExtendedType2_GetDescriptorValue25(void *);
extern "C" s32 GameWork_TestFlag(void *, s32);
extern "C" u32 genrand_int32(void);
extern "C" u64 func_020bf1f8(u32, u32);
extern "C" s32 func_020befec(s32, s32);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void Actor_QueryTerrainHeight(void *, s32, s32);
extern "C" s32 func_02034568(void *, s32, s32, s32);
extern "C" void func_02034a60(void *, u16, s32);
extern "C" s32 func_020adcac(const void *, const void *);
extern "C" void func_0205940c(void *, s32, s32);
extern "C" s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *);
extern "C" void *TrackedResourceActor_SpawnFromKey(s32, const void *, const void *);

extern "C" void func_ov080_022136f4(void *, s32);
extern "C" void func_ov080_0221375c(void *, s32);
extern "C" void func_ov080_02213b24(void *);
extern "C" void func_ov080_02213a8c(void *, s32, s32, s32);

/* Return an unrecovered vtable entry without imposing a speculative class. */
static void *vmethod(void *actor, u32 offset)
{
    return FIELD(void *, FIELD(void *, actor, 0), offset);
}

/* Read one of the two signed halfword tables embedded in GameWork. */
extern "C" s32 func_ov080_02212ae0(void *work, s32 secondTable, s32 index)
{
    return FIELD(s16, work, index * 4 + (secondTable == 0 ? 0x3cc : 0x5cc));
}

/* Construct the roaming actor and locate its tracked-resource descriptor. */
extern "C" void *func_ov080_02212af4(void *actor, const void *configuration)
{
    u8 descriptor[0x30];
    ActorExtendedType2_Init(actor, configuration);
    FIELD(void *, actor, 0) = data_ov080_02213f44;
    FIELD(u8, actor, 0x298) = 0;
    FIELD(u8, actor, 0x299) = 0;
    FIELD(u16, actor, 0x2a2) = 0;
    FIELD(u32, actor, 0x14) |= 0x40;
    ((Ov80VoidMethod1)vmethod(actor, 0xc8))(actor, descriptor);
    void *record = 0;
    s32 key = FIELD(s8, descriptor, 0x25);
    for (s32 i = 0; i < 0x43; ++i) {
        const u8 *candidate = gTrackedResourceActorRecordTable + i * 0x32;
        if (FIELD(s16, candidate, 0) == key)
            record = (void *)candidate;
    }
    FIELD(void *, actor, 0x29c) = record;
    FIELD(u16, actor, 0x29a) = (u16)(func_020bf1f8(genrand_int32(), 0x78) >> 32);
    FIELD(u16, actor, 0x2a0) = (u16)func_ov080_02212ae0(gGameWork, 0, 0x7d);
    return actor;
}

/* Destroy the base actor while retaining its allocation. */
extern "C" void *func_ov080_02212bbc(void *actor)
{
    ActorExtendedType2_Destroy(actor);
    return actor;
}

/* Destroy the actor and release its allocation. */
extern "C" void *func_ov080_02212bd0(void *actor)
{
    ActorExtendedType2_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* Select resources, animation, and playback flags for the current action. */
extern "C" void func_ov080_02212bec(void *actor)
{
    s32 animation = 0;
    bool freeze = false;
    switch (FIELD(s16, actor, 0xd6)) {
    case 1: case 2: case 3: case 4:
        animation = FIELD(u8, actor, 0xd4) + 8;
        break;
    case 5: case 6:
        goto ordinary;
    case 7:
        freeze = data_020e6c0c[FIELD(u16, actor, 0x4e)] != 0;
        if (freeze) { animation = FIELD(u8, actor, 0xd4) + 0x15; break; }
        goto ordinary;
    case 8: case 9:
        animation = FIELD(u8, actor, 0xd4);
        break;
    case 11: animation = 0x12; break;
    case 13: animation = 0x16; freeze = true; break;
    case 17:
        freeze = data_020e6b74[FIELD(u16, actor, 0x4e)] != 0;
        if (freeze) animation = 0x15;
        break;
    case 18: animation = 0x10; freeze = true; break;
    case 19:
        freeze = data_020e6adc[FIELD(u16, actor, 0x4e)] != 0;
        animation = freeze ? 0x14 : FIELD(u8, actor, 0xd4) + 8;
        break;
    case 22: animation = 0x11; break;
    default: break;
    }
    goto install;
ordinary:
    animation = ActorExtendedType2_GetDescriptorValue25(actor) == -1 ||
                        FIELD(s16, actor, 0xda) != 1
                    ? FIELD(u8, actor, 0xd4) : FIELD(u8, actor, 0xd4) + 0x16;
install:
    u8 *resource = FIELD(u8 *, actor, 0x208 + (FIELD(s16, actor, 0x2a0) != 0 ? 4 : 0));
    void *sprite = FIELD(void *, actor, 0x54);
    GraphicsSpriteGroup_ReplaceStateResources(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)), sprite,
        FIELD(void *, resource, 4), FIELD(void *, resource, 8), FIELD(void *, resource, 0xc));
    if (animation != FIELD(u8, sprite, 0x38))
        GraphicsSpriteState_SetAnimationIndex(sprite, animation & 0xff);
    FIELD(u16, sprite, 0x36) = 0x100;
    FIELD(u16, sprite, 0x30) = 0;
    if (freeze)
        FIELD(u16, sprite, 0x24) &= ~3u;
    else
        FIELD(u16, sprite, 0x24) = (FIELD(u16, sprite, 0x24) & ~1u) | 2;
}

/* Refresh terrain state and synchronize the descriptor pair after form changes. */
extern "C" void func_ov080_02212de8(void *actor)
{
    if ((FIELD(u32, actor, 0x14) & 0x200000) != 0)
        return;
    FIELD(u32, actor, 0xd0) |= 0x80000;
    FIELD(s32, actor, 0x24) = Actor_GetCachedTerrainHeight(FIELD(void *, data_021052fc, 0x2ea4));
    s16 form = (s16)func_ov080_02212ae0(gGameWork, 0, 0x7d);
    if (FIELD(s16, actor, 0x2a0) != form) {
        FIELD(s16, actor, 0x2a0) = form;
        bool already = FIELD(s32, actor, 0x218) == FIELD(s32, data_ov080_02213e68, 0x10) &&
            (FIELD(s32, actor, 0x21c) == FIELD(s32, data_ov080_02213e78, 4) || FIELD(s32, actor, 0x218) == 0);
        already = already || (FIELD(s32, actor, 0x218) == FIELD(s32, data_ov080_02213e68, 8) &&
            (FIELD(s32, actor, 0x21c) == FIELD(s32, data_ov080_02213e70, 4) || FIELD(s32, actor, 0x218) == 0));
        if (already) {
            Actor_SaveAndForceFlags(actor);
            FIELD(u16, actor, 0x25a) = 1;
            FIELD(u32, actor, 0x260) &= ~0x800u;
            FIELD(u32, actor, 0x218) = FIELD(u32, data_ov080_02213e68, 0x20);
            FIELD(u32, actor, 0x21c) = FIELD(u32, data_ov080_02213e68, 0x24);
        }
    }
    if (!GameWork_TestFlag(gGameWork, 0x3ee)) FIELD(u32, actor, 0x10) |= 0x10000;
    else FIELD(u32, actor, 0x10) &= ~0x10000u;
    ActorExtendedType2_UpdateFrame(actor);
}

/* Forward descriptor copying to the ActorExtendedType2 base helper. */
extern "C" void func_ov080_02212f6c(void *actor, const void *descriptor)
{ ActorExtendedType2_CopyAdjustedDescriptor(actor, descriptor); }

/* Trigger contact feedback and clear the descriptor-side mode field. */
extern "C" void func_ov080_02212f78(void *actor)
{
    ActorExtendedType2_TriggerContactFeedback(actor);
    FIELD(u16, actor, 0xda) = 0;
}

/* Search ten angular sectors for a valid terrain position and activate it. */
extern "C" s32 func_ov080_02212f90(void *actor)
{
    FIELD(u16, actor, 0xd6) = 0x11;
    s32 remaining = func_ov080_02212ae0(gGameWork, 0, 0x7f);
    void *sprite = FIELD(void *, actor, 0x54);
    if (remaining <= 0) {
        FIELD(u16, sprite, 0x24) |= 0x17;
        FIELD(u32, actor, 0x14) |= 0x10000000;
        return 0;
    }
    if ((FIELD(u16, actor, 0x272) & 0x800) != 0 &&
        !GameWork_TestFlag(gGameWork, FIELD(s32, actor, 0x1cc))) {
        FIELD(u32, actor, 0x14) |= 0x10000000;
        FIELD(u16, sprite, 0x24) |= 7;
        return 0;
    }
    if (data_02105770 != 0) {
        FIELD(u16, sprite, 0x24) |= 0x17;
        FIELD(u32, actor, 0x14) |= 0x10000000;
        return 0;
    }
    void *primary = FIELD(void *, data_021052fc, 0x2ea8);
    if (primary == 0 || (data_0210576c & 4) != 0)
        primary = FIELD(void *, data_021052fc, 0x2ea4);
    u8 origin[0x10], candidate[0x10];
    VecFx32Object_InitCopy(origin, (u8 *)primary + 0x18);
    VecFx32Object_Init(candidate);
    for (s32 attempt = 0; attempt < 10; ++attempt) {
        /* The runtime divider returns quotient in r0 and remainder in r1. */
        s32 sector = ((s32)data_0210576f + attempt) % 10;
        if ((data_0210576d & (1u << sector)) != 0)
            continue;
        VecFx32Object_Assign(candidate, origin);
        u16 angle = (u16)(sector * 0x471c);
        s32 trigIndex = angle >> 4;
        s32 radius = (data_0210576c & 1) != 0 ? 0x4b : 0x6c;
        FIELD(s32, candidate, 4) += radius * data_020c9670[trigIndex * 2 + 1];
        FIELD(s32, candidate, 8) += radius * data_020c9670[trigIndex * 2];
        s32 halfX = ((s32)FIELD(s8, actor, 0xa) - FIELD(s8, actor, 8)) / 2 + 2;
        s32 halfY = ((s32)FIELD(s8, actor, 0xb) - FIELD(s8, actor, 9)) / 2 + 2;
        bool valid = true;
        for (s32 probe = 0; probe < 9; ++probe) {
            s32 x = (FIELD(s32, candidate, 4) + halfX * 0x1000 * (probe % 3 - 1)) >> 16;
            s32 y = (FIELD(s32, candidate, 8) + halfY * 0x1000 * (probe / 3 - 1)) >> 16;
            Actor_QueryTerrainHeight(actor, x, y);
            if (func_02034568(actor, x, y, 0) == 0) { valid = false; break; }
        }
        if (!valid)
            continue;
        ((Ov80VoidMethod0)vmethod(actor, 0xc4))(actor);
        ++data_0210576c;
        FIELD(s32, gGameWork, 0x5c8) = (s16)(remaining - 1);
        FIELD(u16, actor, 0xd6) = 0x13;
        data_0210576d |= (u8)(1u << sector);
        data_02105770 = (data_0210576c & 3) == 0 ? 0x78 : 0x1e;
        FIELD(u8, actor, 0x298) = (u8)sector;
        data_0210576f = (u8)((sector + 1) % 10);
        VecFx32Object_Assign((u8 *)actor + 0x22c, candidate);
        ((Ov80VoidMethod0)vmethod(actor, 0xcc))(actor);
        FIELD(u32, actor, 0x260) &= ~0x800u;
        if (FIELD(void *, actor, 0x1fc) == 0)
            FIELD(void *, actor, 0x1fc) = FIELD(void *, actor, 0x200);
        FIELD(u32, actor, 0x218) = FIELD(u32, data_ov080_02213e68, 0x18);
        FIELD(u32, actor, 0x21c) = FIELD(u32, data_ov080_02213e68, 0x1c);
        s32 animation = (s32)(func_020bf1f8(genrand_int32(), 9) >> 32);
        func_02034a60(actor, data_ov080_02213ef0[animation], 0);
        FIELD(u16, actor, 0x25a) = 1;
        FIELD(u16, actor, 0x2a0) = (u16)func_ov080_02212ae0(gGameWork, 0, 0x7d);
        VecFx32Object_Destroy(candidate);
        VecFx32Object_Destroy(origin);
        return 1;
    }
    VecFx32Object_Destroy(candidate);
    VecFx32Object_Destroy(origin);
    return 0;
}

/* Finish the spawn animation, restore movement, and enter the normal state. */
extern "C" s32 func_ov080_022133a8(void *actor)
{
    FIELD(u16, actor, 0xd6) = 0x13;
    FIELD(u32, actor, 0x260) &= 0xffffbffcu;
    if (FIELD(s16, actor, 0x25a) > 0) {
        if (--FIELD(s16, actor, 0x25a) == 0) {
            FIELD(u16, FIELD(void *, actor, 0x54), 0x24) &= 0xffe8;
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, actor, 0x54), 0x14);
            FIELD(u32, actor, 0x14) &= ~0x10000000u;
        }
        return 0;
    }
    if ((FIELD(u16, FIELD(void *, actor, 0x54), 0x24) & 1) != 0) {
        FIELD(u16, FIELD(void *, actor, 0x54), 0x30) = 0;
        FIELD(u16, FIELD(void *, actor, 0x54), 0x32) = 0x100;
        FIELD(u16, FIELD(void *, actor, 0x54), 0x34) = 0x100;
        FIELD(u32, actor, 0x218) = FIELD(u32, data_ov080_02213e68, 0x38);
        FIELD(u32, actor, 0x21c) = FIELD(u32, data_ov080_02213e68, 0x3c);
        Actor_RestoreSavedFlags(actor);
        data_0210576d &= (u8)~(1u << (s8)FIELD(u8, actor, 0x298));
        func_ov080_022136f4(actor, 0);
        FIELD(u32, actor, 0x10) |= 0x40000;
        FIELD(u16, actor, 0xd6) = 2;
        FIELD(u32, actor, 0x260) |= 3;
        FIELD(u32, actor, 0xd0) &= ~0x100u;
        FIELD(u16, actor, 0x254) = 0;
        FIELD(u16, actor, 0x2a2) = 0;
    }
    return 0;
}

/* Offer a contact to the nearer eligible primary actor. */
extern "C" s32 func_ov080_022134d8(void *actor, void *contact)
{
    if (FIELD(s16, actor, 0x252) > 0)
        return 0;
    if (FIELD(s16, actor, 0x254) != 0) {
        --FIELD(s16, actor, 0x254);
        return 0;
    }
    u16 flags = FIELD(u16, contact, 0x1a);
    if ((flags & 1) == 0 || FIELD(s16, contact, 0x16) <= 0)
        return 0;
    bool pairA = FIELD(u32, actor, 0x218) == FIELD(u32, data_ov080_02213e68, 0x40) &&
        (FIELD(u32, actor, 0x21c) == FIELD(u32, data_ov080_02213ea8, 4) || FIELD(u32, actor, 0x218) == 0);
    bool pairB = FIELD(u32, actor, 0x220) == FIELD(u32, data_ov080_02213e68, 0x28) &&
        (FIELD(u32, actor, 0x224) == FIELD(u32, data_ov080_02213e90, 4) || FIELD(u32, actor, 0x220) == 0);
    if (!pairA && !pairB)
        return 0;
    void *secondary = FIELD(void *, data_021052fc, 0x2ea8);
    void *primary = FIELD(void *, data_021052fc, 0x2ea4);
    void *target = primary;
    if (secondary != 0 && (FIELD(u32, secondary, 0xd0) & 0x100) == 0) {
        s32 secondaryDistance = func_020adcac((u8 *)secondary + 0x1c, (u8 *)actor + 0x1c);
        s32 primaryDistance = func_020adcac((u8 *)primary + 0x1c, (u8 *)actor + 0x1c);
        if (secondaryDistance <= primaryDistance) {
            if ((flags & 0x20) == 0) return 0;
            target = secondary;
        } else if ((flags & 0x10) != 0) return 0;
    } else if ((flags & 0x10) != 0) return 0;
    return ((Ov80Method2)vmethod(actor, 0x120))(actor, target, contact) != 0;
}

/* Invoke the current-state entry and install the default callback pair. */
extern "C" s32 func_ov080_022136c0(void *actor)
{
    ((Ov80VoidMethod0)vmethod(actor, 0xd4))(actor);
    FIELD(u32, actor, 0x220) = FIELD(u32, data_ov080_02213e68, 0);
    FIELD(u32, actor, 0x224) = FIELD(u32, data_ov080_02213e68, 4);
    return 1;
}

/* Configure visibility and targetability flags for the active form. */
extern "C" void func_ov080_022136f4(void *actor, s32 enabled)
{
    s16 form = FIELD(s16, actor, 0x2a0);
    if (form == 0 || form == 1) {
        FIELD(u32, actor, 0x10) |= 0x1f0000;
        func_ov080_0221375c(actor, enabled);
        if (form == 1) {
            if (enabled == 0) FIELD(u32, actor, 0x10) |= 0x80000;
            else FIELD(u32, actor, 0x10) &= ~0x80000u;
        }
    }
}

/* Toggle the actor's 0x20000 interaction flag. */
extern "C" void func_ov080_0221375c(void *actor, s32 enabled)
{
    if (enabled == 0) FIELD(u32, actor, 0x10) |= 0x20000;
    else FIELD(u32, actor, 0x10) &= ~0x20000u;
}

/* Approach or retreat from the nearer primary actor using the contact radius. */
extern "C" s32 func_ov080_02213774(void *actor, const void *contact)
{
    if (data_0210576e == 0) data_0210576e = 0x14;
    FIELD(u32, actor, 0xd0) |= 2;
    FIELD(u32, actor, 0x260) &= ~1u;
    FIELD(u16, actor, 0xd6) = 6;
    FIELD(u8, actor, 0x24c) = 0;
    if (((Ov80Method0)vmethod(actor, 0x38))(actor) != 0)
        return 0;
    func_ov080_02213b24(actor);
    void *secondary = FIELD(void *, data_021052fc, 0x2ea8);
    void *primary = FIELD(void *, data_021052fc, 0x2ea4);
    void *target = primary;
    if (secondary != 0 && (FIELD(u32, secondary, 0xd0) & 0x100) == 0 &&
        func_020adcac((u8 *)secondary + 0x1c, (u8 *)actor + 0x1c) <
        func_020adcac((u8 *)primary + 0x1c, (u8 *)actor + 0x1c))
        target = secondary;
    FIELD(void *, actor, 0x228) = target;
    u8 direction[0x10];
    VecFx32Object_InitCopy(direction, (u8 *)actor + 0x18);
    u8 phase = FIELD(u8, actor, 0x299);
    s32 dx = (FIELD(s32, actor, 0x1c) - FIELD(s32, target, 0x1c)) >> 12;
    s32 dy = (FIELD(s32, actor, 0x20) - FIELD(s32, target, 0x20)) >> 12;
    FIELD(u8, actor, 0x299) = phase + 2;
    s32 radius = FIELD(s16, contact, 0x12) + (data_020c9670[((phase << 8) >> 4) * 2] >> 9);
    bool inside = ((Ov80Method0)vmethod(target, 0xa8))(target) == 0 && dx * dx + dy * dy < radius * radius;
    FIELD(s32, direction, 4) += (inside ? dx : -dx) << 12;
    FIELD(s32, direction, 8) += (inside ? dy : -dy) << 12;
    ((Ov80VoidMethod1)vmethod(actor, 0xd0))(actor, direction);
    if (FIELD(s16, actor, 0x2a2) != 0)
        FIELD(u16, actor, 0xd6) = 13;
    VecFx32Object_Destroy(direction);
    return 0;
}

/* Report the actor's 0x80 runtime-state bit. */
extern "C" u32 func_ov080_02213954(void *actor)
{ return FIELD(u32, actor, 0xd0) & 0x80; }

/* Enter the tracked target state and play the descriptor-selected sound. */
extern "C" s32 func_ov080_02213960(void *actor)
{
    FIELD(u32, actor, 0x260) &= ~1u;
    FIELD(u8, actor, 0x24c) = 0;
    FIELD(u16, actor, 0x25a) = 0;
    FIELD(u16, actor, 0x256) = 0;
    FIELD(u32, actor, 0x218) = FIELD(u32, data_ov080_02213e68, 0x50);
    FIELD(u32, actor, 0x21c) = FIELD(u32, data_ov080_02213e68, 0x54);
    ((Ov80VoidMethod0)vmethod(actor, 0x160))(actor);
    u16 sound = data_020e7318[FIELD(u16, actor, 0x4e)];
    if (sound != 0xffff) func_0205940c(gSoundContext, sound >> 7, sound & 0x7f);
    return 1;
}

/* Restore ordinary movement after the short target interaction. */
extern "C" s32 func_ov080_022139f0(void *actor)
{
    Actor_RestoreSavedFlags(actor);
    func_ov080_022136f4(actor, 1);
    ((Ov80VoidMethod0)vmethod(actor, 0xe8))(actor);
    FIELD(u16, actor, 0x254) = 0xc;
    FIELD(u32, actor, 0xd0) &= ~0x200u;
    FIELD(u16, actor, 0xd6) = 2;
    return 0;
}

/* Initialize base reentry state and clear three embedded vector targets. */
extern "C" void func_ov080_02213a40(void *actor)
{
    ActorExtendedType2_InitializeReentryState(actor);
    func_ov080_02213a8c((u8 *)actor + 0x38, 0, 0, 0);
    func_ov080_02213a8c((u8 *)actor + 0x88, 0, 0, 0);
    func_ov080_02213a8c((u8 *)actor + 0x98, 0, 0, 0);
}

/* Store three vector coordinates after the object's leading ABI word. */
extern "C" void func_ov080_02213a8c(void *vector, s32 x, s32 y, s32 z)
{
    u8 *payload = vector != 0 ? (u8 *)vector + 4 : (u8 *)vector;
    FIELD(s32, payload, 0) = x;
    FIELD(s32, payload, 4) = y;
    FIELD(s32, payload, 8) = z;
}

/* Advance target motion and apply deterministic per-axis wobble. */
extern "C" void func_ov080_02213a9c(void *actor)
{
    ActorExtendedType2_UpdateTargetMotion(actor);
    s32 vx = FIELD(s32, actor, 0x3c);
    s32 vy = FIELD(s32, actor, 0x40);
    s32 stepX = (vx + (s32)((u32)(vx >> 3) >> 28)) >> 4;
    s32 stepY = (vy + (s32)((u32)(vy >> 3) >> 28)) >> 4;
    FIELD(s32, actor, 0x8c) += func_020befec(FIELD(s32, actor, 0x9c), 6) + stepX;
    FIELD(s32, actor, 0x90) += func_020befec(FIELD(s32, actor, 0xa0), 6) + stepY;
    FIELD(s32, actor, 0x3c) = stepX;
    FIELD(s32, actor, 0x40) = stepY;
}

/* Count down and spawn a tracked attachment when terrain ownership is stable. */
extern "C" void func_ov080_02213b24(void *actor)
{
    if (FIELD(s16, actor, 0x2a2) != 0) --FIELD(s16, actor, 0x2a2);
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) != 0 ||
        FIELD(void *, actor, 0x29c) == 0)
        return;
    if (FIELD(s16, actor, 0x29a) != 0) { --FIELD(s16, actor, 0x29a); return; }
    if (FIELD(void *, actor, 0x228) != 0 &&
        FIELD(s32, actor, 0x24) == Actor_GetCachedTerrainHeight(actor)) {
        u8 target[0x10];
        VecFx32Object_InitCopy(target, (u8 *)FIELD(void *, actor, 0x228) + 0x18);
        TrackedResourceActor_SpawnFromKey(FIELD(s16, FIELD(void *, actor, 0x29c), 0),
                                          (u8 *)actor + 0x18, target);
        FIELD(u16, actor, 0x29a) = FIELD(u16, FIELD(void *, actor, 0x29c), 0x22);
        FIELD(u16, actor, 0x2a2) = 0x1e;
        VecFx32Object_Destroy(target);
    }
}

/* Report whether this actor may enter its ordinary target interaction. */
extern "C" bool func_ov080_02213bec(void *actor)
{
    if ((FIELD(u32, actor, 0x10) & 0x1000000) != 0 || (FIELD(u32, actor, 0x10) & 4) == 0)
        return false;
    if ((FIELD(u16, data_020e8380 + FIELD(u16, actor, 0x4e) * 0x30, 0x1e) >> 2) > 4)
        return false;
    u32 first = FIELD(u32, actor, 0x218);
    bool excluded = first == FIELD(u32, data_ov080_02213e68, 0x48) &&
        (FIELD(u32, actor, 0x21c) == FIELD(u32, data_ov080_02213eb0, 4) || first == 0);
    return !excluded && (FIELD(u32, actor, 0xd0) & 0x100) == 0;
}

/* Vtable leaf: this actor does not provide the optional zero-argument action. */
extern "C" s32 func_ov080_02213c8c(void) { return 0; }

/* Copy another actor's position vector into this callback's destination. */
extern "C" void func_ov080_02213c94(void *destination, const void *actor)
{ VecFx32Object_InitCopy(destination, (const u8 *)actor + 0x18); }

/* Report the actor's 0x40 runtime-state bit. */
extern "C" bool func_ov080_02213ca4(void *actor)
{ return (FIELD(u32, actor, 0xd0) & 0x40) != 0; }

/* Vtable leaf: this actor does not claim the optional predicate. */
extern "C" s32 func_ov080_02213cb8(void) { return 0; }

/* Ignore the first optional vtable notification without changing state. */
extern "C" void func_ov080_02213cc0(void) {}

/* Ignore the second optional vtable notification without changing state. */
extern "C" void func_ov080_02213cc4(void) {}

/* Return the fixed interaction radius in pixels. */
extern "C" s32 func_ov080_02213cc8(void) { return 0x10; }

/* Return the actor's embedded world-position object. */
extern "C" void *func_ov080_02213cd0(void *actor) { return (u8 *)actor + 0x18; }

/* Return the fixed interaction mask consumed by the base actor. */
extern "C" u32 func_ov080_02213cd8(void) { return 0xc0000; }

/* Dispatch the optional actor-to-actor callback with a zero third argument. */
extern "C" void func_ov080_02213ce0(void *actor, void *other)
{ ((void (*)(void *, void *, s32))vmethod(actor, 0x108))(actor, other, 0); }

/* Dispatch the parallel callback slot, which shares the same base operation. */
extern "C" void func_ov080_02213cf8(void *actor, void *other)
{ ((void (*)(void *, void *, s32))vmethod(actor, 0x108))(actor, other, 0); }

/* Vtable leaf: no optional object is returned. */
extern "C" s32 func_ov080_02213d10(void) { return 0; }

/* Mark the embedded behavior descriptor as active. */
extern "C" void func_ov080_02213d18(void *actor) { FIELD(u32, actor, 0x260) |= 0x10; }

/* Report whether the queued interaction can execute in the current state. */
extern "C" s32 func_ov080_02213d28(void *actor)
{
    return (FIELD(u32, actor, 0x260) & 8) != 0 &&
           (FIELD(u32, actor, 0x260) & 2) != 0 &&
           ((Ov80Method0)vmethod(actor, 0xa8))(actor) == 0;
}

/* Report the base actor's action-byte-eight state. */
extern "C" bool func_ov080_02213d70(void *actor)
{ return FIELD(u8, actor, 0x24c) == 8; }

/* Reject only action 16. */
extern "C" bool func_ov080_02213d84(void *actor)
{ return FIELD(s16, actor, 0xd6) != 0x10; }

/* Report whether the actor is in approach state 5 or 6. */
extern "C" bool func_ov080_02213da4(void *actor)
{ s16 state = FIELD(s16, actor, 0xd6); return state == 5 || state == 6; }

/* Report whether the previous action was state 9 or 10. */
extern "C" bool func_ov080_02213dbc(void *actor)
{ s16 state = FIELD(s16, actor, 0xd8); return state == 9 || state == 10; }

/* Report whether the current action is state 9 or 10. */
extern "C" bool func_ov080_02213dd4(void *actor)
{ s16 state = FIELD(s16, actor, 0xd6); return state == 9 || state == 10; }

/* Ignore the first late vtable notification without changing state. */
extern "C" void func_ov080_02213dec(void) {}

/* Ignore the second late vtable notification without changing state. */
extern "C" void func_ov080_02213df0(void) {}

/* Toggle bit 2 on the sprite-like object at actor +0x288. */
extern "C" void func_ov080_02213df4(void *actor, s32 enabled)
{
    void *object = FIELD(void *, actor, 0x288);
    if (enabled == 0) FIELD(u16, object, 0x24) |= 4;
    else FIELD(u16, object, 0x24) &= ~4u;
}

/* Return the fixed secondary interaction mask. */
extern "C" u32 func_ov080_02213e14(void) { return 0x20000; }

/* Choose one of three variants from the base actor's current terrain value. */
extern "C" s32 func_ov080_02213e1c(void)
{ return func_020befec(func_02033f4c(), 3); }

/* Return the fixed movement scale used by the base actor. */
extern "C" s32 func_ov080_02213e30(void) { return 0x400; }

/* Return the fixed animation scale used by the base actor. */
extern "C" s32 func_ov080_02213e38(void) { return 0x100; }
