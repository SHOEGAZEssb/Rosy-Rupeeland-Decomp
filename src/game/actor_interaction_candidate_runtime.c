#include "tingle/actor_runtime_collection.h"
#include "tingle/types.h"

/*
 * Recovered actor-interaction candidate registry reset and target selection.
 * The subsystem owns five fixed global registries, consumes up to four
 * candidate actors each frame, and binds the nearest eligible candidate.
 */

extern ActorRuntimeCollection gActorRuntimeCollection;
extern u32 data_021057cc[4];
extern u32 data_021057dc[3];
extern u32 data_021057e8[3];
extern void *data_021057f4[4];
extern u32 data_02105804[16];
extern u8 gGamePhaseRuntime[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 ActorDerivedType1_IsIdleEligible(void *actor);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern void ActorDerivedType1_BindExternalRecordObject(void *actor,
                                                        void *object);

/*
 * Clear all five process-global interaction registries in retail order.
 * No input is consumed and no value is returned; all registered candidates
 * and auxiliary slots are discarded.
 */
void ActorInteractionCandidateRuntime_Reset(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
        data_021057e8[i] = 0;
    for (i = 0; i < 3; i++)
        data_021057dc[i] = 0;
    for (i = 0; i < 4; i++)
        data_021057f4[i] = 0;
    for (i = 0; i < 16; i++)
        data_02105804[i] = 0;
    data_021057cc[2] = 0;
    data_021057cc[3] = 0;
    data_021057cc[0] = 0;
    data_021057cc[1] = 0;
}

/*
 * Empty interaction-runtime shutdown hook. It accepts no input, changes no
 * state, performs no SDK or hardware work, and returns no value.
 */
void ActorInteractionCandidateRuntime_Shutdown(void)
{
}

/*
 * Consume the four interaction candidate slots. A pending collection
 * attachment clears the populated prefix immediately. Otherwise, eligible
 * actors at the main actor's terrain height (or one unit above it) compete by
 * descriptor priority; the winner is bound when its planar distance squared
 * is below 0x640. Returns no value and changes candidate and actor state only.
 */
void ActorInteractionCandidateRuntime_SelectNearest(void)
{
    s32 upperHeight;
    s32 bestPriority;
    void *selected;
    void *mainActor;
    s32 mainHeight;
    s32 index;

    if (ActorRuntimeCollection_GetPendingAttachmentFlag(
            &gActorRuntimeCollection) != 0) {
        for (index = 0; index < 4 && data_021057f4[index] != 0; ++index)
            data_021057f4[index] = 0;
        return;
    }

    mainActor = *(void **)(*(u8 **)gGamePhaseRuntime + 0x2ea4);
    mainHeight = Actor_GetCachedTerrainHeight(mainActor);
    upperHeight = mainHeight + 0x10000;
    if (!ActorDerivedType1_IsIdleEligible(mainActor))
        return;

    bestPriority = 0x7fffffff;
    selected = 0;
    for (index = 0; index < 4 && data_021057f4[index] != 0; ++index) {
        void *candidate = data_021057f4[index];
        s32 (*query)(void *) =
            *(s32 (**)(void *))(*(u8 **)candidate + 0xd4);

        if (query(candidate) != 0) {
            s32 height =
                Actor_GetCachedTerrainHeight(data_021057f4[index]);

            if (Actor_IsAtCachedTerrainHeight(data_021057f4[index]) != 0 &&
                (height == mainHeight || height == upperHeight)) {
                s32 priority = *(u16 *)(
                    *(u8 **)((u8 *)data_021057f4[index] + 0x54) + 0x28);
                if (priority < bestPriority) {
                    bestPriority = priority;
                    selected = data_021057f4[index];
                }
            }
            data_021057f4[index] = 0;
        }
    }

    if (selected != 0) {
        u8 *candidate = (u8 *)selected;
        u8 *actor = (u8 *)mainActor;
        s32 deltaY = *(s32 *)(actor + 0x20) >> 12;
        s32 deltaX = *(s32 *)(actor + 0x1c) >> 12;

        deltaY -= *(s32 *)(candidate + 0x20) >> 12;
        deltaX -= *(s32 *)(candidate + 0x1c) >> 12;
        if (deltaX * deltaX + deltaY * deltaY < 0x640)
            ActorDerivedType1_BindExternalRecordObject(mainActor, selected);
    }
}
#ifdef __cplusplus
}
#endif
