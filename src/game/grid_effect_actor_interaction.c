#include "tingle/types.h"

/*
 * Recovered interaction transition for the grid/effect actor. It switches the
 * actor into its grid-rendered departure state and seeds that state from the
 * current world point and a globally selected mode.
 */

extern void *gGamePhaseRuntime;
extern void *data_021e9ac0;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *context, s32 bank, s32 sound);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern void VecFx32Object_Subtract(void *destination, const void *source);
extern void ActorDerivedType1_TrySetStateVector(void *actor, const void *position, s32 value,
                          s32 mode);
extern void Type7Actor_ClearGlobalRelationshipToActor(void *actor);
extern s32 GridEffectActorModeAllocator_Reserve(void);
extern void InventoryRecordCollection_MergeOrInsert(void *context, void *subobject);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef s32 (*ActorPredicate)(void *actor);

/*
 * Inputs are an actor and the actor that triggered it. When the trigger byte
 * 0x4D equals one and the primary global actor's virtual predicate at 0xA8 is
 * clear, emit the recovered value-15/mode-2 response at actor position 0x18.
 * Release current presentation state, set low state bits 0x1F0 to two, clear
 * timer 0x1F2, enable presentation byte 0x3A, clear presentation flag 4, set
 * actor flag 0x1000000, copy the global point into position, fold height into
 * Y and clear height, set the low half of 0x5C to 0xFF00, choose byte 0x21A
 * through GridEffectActorModeAllocator_Reserve, play sound 0x11, and initialize the 0x1F4 subobject.
 * Returns nothing; actor, sound, and grid-related engine state change without
 * direct hardware access.
 */
void GridEffectActor_BeginDeparture(void *actor, const void *trigger)
{
    void *primary = FIELD(void *, gGamePhaseRuntime, 0x2ea4);
    if (FIELD(u8, trigger, 0x4d) == 1) {
        ActorPredicate predicate =
            *(ActorPredicate *)((u8 *)FIELD(void *, primary, 0) + 0xa8);
        if (predicate(primary) == 0)
            ActorDerivedType1_TrySetStateVector(primary, (u8 *)actor + 0x18, 15, 2);
    }

    Type7Actor_ClearGlobalRelationshipToActor(actor);
    FIELD(u16, actor, 0x1f0) =
        (FIELD(u16, actor, 0x1f0) & (u16)~3) | 2;
    FIELD(u16, actor, 0x1f2) = 0;
    FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 1;
    FIELD(u16, FIELD(void *, actor, 0x54), 0x24) &= (u16)~4;
    FIELD(u32, actor, 0x14) |= 0x1000000;
    void *point = ActorMotionAreaFollower_GetPosition((u8 *)gGamePhaseRuntime + 0x2fbc);
    VecFx32Object_Subtract((u8 *)actor + 0x18, point);
    FIELD(s32, actor, 0x20) -= FIELD(s32, actor, 0x24);
    FIELD(s32, actor, 0x24) = 0;
    FIELD(u32, actor, 0x5c) =
        (FIELD(u32, actor, 0x5c) & 0xffff0000) | 0xff00;
    FIELD(u8, actor, 0x21a) = (u8)GridEffectActorModeAllocator_Reserve();
    Sound_Play(gSoundContext, 0, 0x11);
    InventoryRecordCollection_MergeOrInsert(data_021e9ac0, (u8 *)actor + 0x1f4);
}
