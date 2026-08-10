#include "tingle/types.h"

/* Initialize and populate the global ten-entry actor target-selection cache. */
extern void *data_021052fc;
extern void *gActorTargetSelectionCandidates[10];
extern s32 gActorTargetSelectionPriorities[10];
extern u8 gActorTargetSelectionMetadata[4];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *manager, u32 slot);
extern void VecFx32_Subtract(void *output, const void *first, const void *second);
extern s32 VecFx32Object_GetMagnitude(void *value);
extern void VecFx32Object_Destroy(void *value);
#ifdef __cplusplus
}
#endif

/*
 * Clear all ten cached actor pointers, set selection index -1 and count zero
 * in gActorTargetSelectionMetadata, and clear word +0x278 of global manager object +0x2ea4.
 * Returns no value; only global selection/runtime state changes.
 */
void ActorTargetSelection_Reset(void)
{
    u32 i;
    u8 *owner;

    for (i = 0; i < 10; ++i) gActorTargetSelectionCandidates[i] = 0;
    *(s16 *)(gActorTargetSelectionMetadata + 2) = 0;
    *(s16 *)gActorTargetSelectionMetadata = -1;
    owner = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    *(s32 *)(owner + 0x278) = 0;
}

/* Clear the ten cached actor pointers and return no value. */
void ActorTargetSelection_ClearCandidates(void)
{
    u32 i;

    for (i = 0; i < 10; ++i) gActorTargetSelectionCandidates[i] = 0;
}

/*
 * Scan manager collection slot one until its count +0x2e74 is exhausted or
 * ten targets are accepted. Candidates must be non-null type byte 2, have bit
 * 2 at +0x260, return zero from vtable slot 0xa8, and lack actor flag
 * 0x01000000 at +0x10. Build a temporary displacement from global owner+0x18
 * to the candidate vector returned by slot 0x1c8, compute its magnitude, and
 * retain the actor/distance only when it is below the threshold returned by
 * slot 0x1c4. Slot 0x1b8 and temporary destruction run for every candidate
 * reaching the distance test. Update the global count and null-fill unused
 * pointer entries. Returns no value; virtual and vector helpers may affect
 * actor or SDK-managed state.
 */
void ActorTargetSelection_Populate(void)
{
    u8 *manager = (u8 *)data_021052fc;
    u8 *owner = *(u8 **)(manager + 0x2ea4);
    u32 found = 0;
    u32 index = 0;
    s32 smallest = 0x10000000;

    *(s16 *)(gActorTargetSelectionMetadata + 2) = 0;
    while (index < *(u32 *)((u8 *)GamePhaseRuntime_GetActorCollection(manager, 1) + 0x2e74) &&
           found < 10) {
        u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(manager, 1);
        u8 *actor = *(u8 **)(collection + index * 4);

        if (actor != 0 && actor[0x4d] == 2 &&
            (*(u32 *)(actor + 0x260) & 2) != 0) {
            s32 (*available)(void *) =
                *(s32 (**)(void *))(*(u8 **)actor + 0xa8);

            if (available(actor) == 0 &&
                (*(u32 *)(actor + 0x10) & 0x01000000) == 0) {
                void *temporaryPosition;
                u8 displacement[16];
                s32 distance;
                s32 (*threshold)(void *);
                void (*finish)(void *);

                temporaryPosition =
                    (*(void *(**)(void *))(*(u8 **)actor + 0x1c8))(actor);
                VecFx32_Subtract(displacement, owner + 0x18, temporaryPosition);
                *(s32 *)(displacement + 0x0c) = 0;
                distance = VecFx32Object_GetMagnitude(displacement);
                if (distance < smallest) smallest = distance;
                threshold = *(s32 (**)(void *))(*(u8 **)actor + 0x1c4);
                if (distance < threshold(actor)) {
                    gActorTargetSelectionCandidates[found] = actor;
                    gActorTargetSelectionPriorities[found] = distance;
                    ++found;
                    ++*(s16 *)(gActorTargetSelectionMetadata + 2);
                }
                finish = *(void (**)(void *))(*(u8 **)actor + 0x1b8);
                finish(actor);
                VecFx32Object_Destroy(displacement);
            }
        }
        ++index;
    }
    while (found < 10) gActorTargetSelectionCandidates[found++] = 0;
    (void)smallest; /* Retail tracks this minimum locally but never consumes it. */
}
