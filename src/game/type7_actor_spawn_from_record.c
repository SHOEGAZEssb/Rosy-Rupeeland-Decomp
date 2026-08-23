#include "tingle/types.h"

/*
 * Recovered type-seven actor factory. It builds an actor from a table record,
 * initializes its runtime fields, and repairs references to a replaced actor.
 */

extern u8 *data_021052fc;
extern u8 data_020e16b0[];
extern u16 data_020e5804;

typedef struct Type7SpawnDescriptor {
    u8 bytes[0x64];
} Type7SpawnDescriptor;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 category);
extern void *func_02025d14(void *state);
extern u32 GamePhaseMetadata_GetFlagsBits12To15(s32 phase);
extern void ActorCollection_QueueActorForRemoval(void *collection, void *actor);
extern void *ActorCollection_SpawnActorFromDescriptor(void *collection, const void *descriptor);
extern void Actor_RefreshCachedTerrainHeight(void *actor);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern void ActorSpawnDescriptor_Init(
    void *, u16, u16, s32, s32, s32, u8, u8, u16, u16, u16, u8, u8,
    s32, const s8 *, s32, s32, s32, u16, u8, u8, u8, u8);
extern void Type7Actor_SetTarget(void *actor, void *object);
extern void Type7Actor_InitializeStationaryMotionState(void *actor);
extern s32 Type7Actor_MatchesGlobalRecordIndex(void *actor);
extern u8 *Type7Actor_FindSpawnRecord(s32 index);
extern u8 *Type7Actor_FindAuxiliaryRecord(s32 index);
extern s32 func_020be8c0(s32 left, s32 right);
extern s32 func_020beae4(void);
extern s32 func_020beb18(s32 value);
extern s32 func_020beb6c(s32 left, s32 right);
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/* Invoke a recovered actor virtual method with one integer argument. */
static void callActorMethod(u8 *actor, u32 byteOffset, s32 argument)
{
    void (**vtable)(void *, s32) = *(void (***)(void *, s32))actor;
    vtable[byteOffset / 4](actor, argument);
}

/* Invoke a recovered actor virtual method whose only input is the actor. */
static void callActorVoidMethod(u8 *actor, u32 byteOffset)
{
    void (**vtable)(void *) = *(void (***)(void *))actor;
    vtable[byteOffset / 4](actor);
}

/*
 * Inputs are a record index, phase-like halfword, X/Y descriptor values, and a
 * fifth word supplied on the stack. Return zero when the record is absent or
 * its byte +0x55 rejects the phase mapping from GamePhaseMetadata_GetFlagsBits12To15; otherwise spawn
 * a category-seven actor and return one.
 *
 * The record supplies descriptor words +0x02..+0x06, signed bytes +0x42/+0x43,
 * bounds +0x4c..+0x53, motion values +0x20/+0x28..+0x30, script pointers
 * +0x44/+0x48, and flags +0x38. Bit 0x40 suppresses replacement of the prior
 * global actor at +0x2ea8 and selects descriptor halfword +0x52 value 99 rather
 * than one. Bit zero controls actor +0x268 bit 0x4000.
 *
 * After insertion, initialize actor offsets +0x24, +0x60..+0x66, +0x1fc,
 * +0x200, +0x238..+0x260, +0x27e, and +0x294..+0x29c; update recovered globals
 * data_020e16b0+0x2b4..+0x2cc; apply global presentation flag 0x40000; and, if
 * replacing an actor, redirect category-one type-two references at +0x228 and
 * notify active objects through virtual slot 0x13c. Finally publish record
 * byte +0x13 and clear byte +0x8d of state obtained through global +0x30e8.
 * Allocation, collection membership, actor virtual calls, global state, and
 * fixed-point SDK helpers have observable effects; no hardware is accessed
 * directly.
 */
s32 Type7Actor_SpawnFromRecord(s32 recordIndex, s32 phase, s32 x, s32 y, s32 field2b8)
{
    u8 *record = Type7Actor_FindSpawnRecord(recordIndex);
    Type7SpawnDescriptor descriptor;
    u8 *actor;
    void *collection;
    void *replacedActor = 0;
    u16 recordFlags;
    u32 mappedPhase;
    s32 angle;

    if (record == 0)
        return 0;
    mappedPhase = GamePhaseMetadata_GetFlagsBits12To15(phase);
    if (record[0x55] != 0 && mappedPhase != 0
        && record[0x55] != GamePhaseMetadata_GetFlagsBits12To15(phase))
        return 0;

    recordFlags = *(u16 *)(record + 0x38);
    collection = GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    if ((recordFlags & 0x40) == 0) {
        replacedActor = *(void **)(data_021052fc + 0x2ea8);
        if (replacedActor != 0)
            ActorCollection_QueueActorForRemoval(collection, replacedActor);
    }

    ActorSpawnDescriptor_Init(
        &descriptor, 7, (u16)recordIndex,
        *(u16 *)(record + 0x02), *(u16 *)(record + 0x04),
        *(u16 *)(record + 0x06), 2, 0, (u16)x, (u16)y, 0,
        (u8)*(s8 *)(record + 0x42), (u8)*(s8 *)(record + 0x43),
        0x02000408, 0, 0, 0, 0, 0xff, 0, 0, 0, 0);
    *(s16 *)(descriptor.bytes + 0x52) =
        (recordFlags & 0x40) != 0 ? 99 : 1;
    *(s16 *)(descriptor.bytes + 0x1a) = *(s8 *)(record + 0x50);
    *(s16 *)(descriptor.bytes + 0x1c) = *(s8 *)(record + 0x51);
    *(s16 *)(descriptor.bytes + 0x1e) = *(s8 *)(record + 0x52);
    *(s16 *)(descriptor.bytes + 0x20) = *(s8 *)(record + 0x53);

    actor = (u8 *)ActorCollection_SpawnActorFromDescriptor(collection, &descriptor);
    *(u8 **)(actor + 0x29c) = record;
    *(s16 *)(actor + 0x60) = *(s8 *)(record + 0x4c);
    *(s16 *)(actor + 0x62) = *(s8 *)(record + 0x4d);
    *(s16 *)(actor + 0x64) = *(s8 *)(record + 0x4e);
    *(s16 *)(actor + 0x66) = *(s8 *)(record + 0x4f);
    callActorMethod(actor, 0x54, 1);
    Actor_RefreshCachedTerrainHeight(actor);
    *(s32 *)(actor + 0x24) = Actor_GetCachedTerrainHeight(actor);
    *(s16 *)(actor + 0x27e) = (s16)phase;
    *(u32 *)(actor + 0x200) = *(u16 *)(record + 0x20);
    Type7Actor_SetTarget(actor, *(void **)(data_021052fc + 0x2ea4));
    *(u32 *)(actor + 0x10) &= ~0x01000000;

    if (*(s8 *)(actor + 0x48) == 1) {
        if (recordIndex == *(s32 *)(data_020e16b0 + 0x2b4)
            && recordIndex != 0x25b) {
            *(u32 *)(actor + 0x1fc) =
                *(u32 *)(data_020e16b0 + 0x2bc);
        } else {
            *(s32 *)(data_020e16b0 + 0x2b4) = recordIndex;
            *(u32 *)(actor + 0x1fc) = *(u32 *)(actor + 0x200);
            *(u32 *)(data_020e16b0 + 0x2bc) = *(u32 *)(actor + 0x200);
        }
    } else {
        *(u32 *)(actor + 0x1fc) = *(u32 *)(actor + 0x200);
    }
    *(s32 *)(data_020e16b0 + 0x2b8) = field2b8;
    *(u32 *)(actor + 0x104) = 0;
    *(u32 *)(data_020e16b0 + 0x2cc) = record[0x55];
    if (*(s8 *)(actor + 0x48) == 1)
        Type7Actor_MatchesGlobalRecordIndex(actor);

    *(s32 *)(actor + 0x238) =
        func_020befec(*(u16 *)(record + 0x28) * 0x4b0, 100);
    *(u32 *)(actor + 0x23c) = (u32)*(u16 *)(record + 0x28) << 4;
    angle = (s32)*(s16 *)(record + 0x2a) << 12;
    if (*(s16 *)(record + 0x2a) > 0)
        func_020be8c0(0x3f000000, func_020beb18(angle));
    else
        func_020beb6c(func_020beb18(angle), 0x3f000000);
    *(s32 *)(actor + 0x25c) = func_020beae4();
    angle = (s32)*(s16 *)(record + 0x2c) << 12;
    if (*(s16 *)(record + 0x2c) > 0)
        func_020be8c0(0x3f000000, func_020beb18(angle));
    else
        func_020beb6c(func_020beb18(angle), 0x3f000000);
    *(s32 *)(actor + 0x260) = func_020beae4();
    *(s16 *)(actor + 0x258) = *(s16 *)(record + 0x30);
    *(const s8 **)(actor + 0x294) = *(const s8 **)(record + 0x44);
    *(const s8 **)(actor + 0x298) = *(const s8 **)(record + 0x48);
    if ((recordFlags & 1) == 0)
        *(u32 *)(actor + 0x268) |= 0x4000;
    if (*(u32 *)(actor + 0x1fc) == 0) {
        Type7Actor_InitializeStationaryMotionState(actor);
        callActorVoidMethod(actor, 0x5c);
    }

    if ((*(u32 *)(*(u8 **)(data_021052fc + 0x2ea4) + 0xd0)
         & 0x40000) != 0) {
        *(u32 *)(actor + 0xd0) |= 0x40000;
        *(u32 *)(actor + 0x10) |= 0x100;
        *(u32 *)(actor + 0x14) |= 0x8000;
    }

    if (replacedActor != 0) {
        s32 index;
        for (index = 0;; ++index) {
            u8 *category = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
            u8 *other;
            if (index >= *(s32 *)(category + 0x2e74))
                break;
            other = *(u8 **)(category + index * 4);
            if (other != 0 && *(u8 *)(other + 0x4d) == 2) {
                if (*(void **)(other + 0x228) == replacedActor)
                    *(u8 **)(other + 0x228) = actor;
                if (*(void **)(other + 0x264) != 0)
                    callActorMethod(other, 0x13c, 0);
            }
        }
    }

    record = Type7Actor_FindAuxiliaryRecord(recordIndex);
    data_020e5804 = record[0x13];
    *(u8 *)((u8 *)func_02025d14(
        *(void **)(data_021052fc + 0x30e8)) + 0x8d) = 0;
    return 1;
}
