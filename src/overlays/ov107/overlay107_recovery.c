#include "tingle/types.h"

/*
 * Recovered phase-two category-one actor registration from overlay 107.
 *
 * The overlay owns a sentinel-terminated array of actor spawn descriptors and
 * the bytecode reached through the descriptor records and category callback.
 * Exact record bytes remain in the matching data object.
 */

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

#ifdef __cplusplus
extern "C" {
#endif

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(
    const ActorScriptBytecode *callback);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *records);

extern u8 data_ov107_0221d720[];
extern ActorSpawnDescriptor data_ov107_0221d734[];
extern ActorScriptBytecode data_ov107_0221fb89[];
extern u8 data_ov107_02229d20[];
extern u8 data_ov107_02229d24[];

#ifdef __cplusplus
}
#endif

/*
 * When mode is zero, initialize shared actor-interaction state, register and
 * spawn the category-one descriptor batch, publish the work and auxiliary
 * records, and install the bytecode callback. Nonzero modes return unchanged.
 * The literal three matches retail although registration is sentinel-driven.
 * Returns no value and performs no direct hardware or SDK operation.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay107_RegisterCategory1Actors(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov107_02229d24, 3, data_ov107_0221d734);
    ActorInteractionRuntime_NoOp(data_ov107_02229d20);
    GamePhaseRuntime_SetGlobalValue30F8(data_ov107_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov107_0221fb89);
}

/* Exact initialized records and zero-initialized work fields used by the overlay. */
