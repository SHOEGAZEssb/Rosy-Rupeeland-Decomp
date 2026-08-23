#include "tingle/types.h"

/*
 * Recovered 12-entry registry for grid/effect actors. It initializes the slot
 * array, supplies a free slot or evicts the oldest actor, and unregisters actors
 * while releasing their allocated mode bit.
 */

extern void *data_021052fc;
extern u8 gGridEffectActorRuntimeState[];
extern void *gGridEffectActorRegistry[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorCollection_QueueActorForRemoval(void *value, void *actor);
extern void *Actor_GetOwningCollection(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Ignore all register inputs, clear all 12 actor slots in gGridEffectActorRegistry, and
 * clear the mode-allocation word at gGridEffectActorRuntimeState+4. Returns nothing; registry
 * state changes and no SDK or hardware state is affected directly.
 */
void GridEffectActorRegistry_Reset(void)
{
    s32 i;
    for (i = 0; i < 12; i++)
        gGridEffectActorRegistry[i] = 0;
    FIELD(u32, gGridEffectActorRuntimeState, 4) = 0;
}

/*
 * Ignore all register inputs and return the address of the first empty slot.
 * If every slot is occupied, select the actor with the greatest upper-bit age
 * value from halfword 0x1F0, finish it through Actor_GetOwningCollection/ActorCollection_QueueActorForRemoval, set
 * global flag 0x10 at data_021052fc+0x30B8, and return its slot for reuse. The
 * evicted actor and global state change; no direct hardware effects occur.
 */
void **GridEffectActorRegistry_AcquireSlot(void)
{
    s32 i;
    s32 greatest_age = -1;
    void **oldest_slot = 0;

    for (i = 0; i < 12; i++) {
        void *actor = gGridEffectActorRegistry[i];
        if (actor == 0)
            return &gGridEffectActorRegistry[i];
        s32 age = FIELD(u16, actor, 0x1f0) >> 2;
        if (greatest_age < age) {
            oldest_slot = &gGridEffectActorRegistry[i];
            greatest_age = age;
        }
    }

    void *actor = *oldest_slot;
    ActorCollection_QueueActorForRemoval(Actor_GetOwningCollection(actor), actor);
    FIELD(u32, data_021052fc, 0x30b8) |= 0x10;
    return oldest_slot;
}

/*
 * Input is an actor being destroyed. If signed byte 0x21A is not -1, clear its
 * corresponding allocation bit in gGridEffectActorRuntimeState+4. Search the 12 slots and
 * clear the first one equal to the actor. Returns nothing; registry state may
 * change, and no SDK or hardware state is affected directly.
 */
void GridEffectActorRegistry_Unregister(void *actor)
{
    s8 mode = FIELD(s8, actor, 0x21a);
    s32 i;
    if (mode != -1)
        FIELD(u32, gGridEffectActorRuntimeState, 4) &= ~(1u << mode);
    for (i = 0; i < 12; i++) {
        if (gGridEffectActorRegistry[i] == actor) {
            gGridEffectActorRegistry[i] = 0;
            return;
        }
    }
}

