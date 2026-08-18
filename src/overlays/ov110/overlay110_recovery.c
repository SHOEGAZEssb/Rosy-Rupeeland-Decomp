#include "tingle/types.h"

/*
 * Recovered phase-five category-one actor registration from overlay 110.
 *
 * This overlay owns a sentinel-terminated array of 0x64-byte actor spawn
 * descriptors and the bytecode reached through those descriptors and the
 * category callback. The record bytes remain in the matching data object;
 * only their confirmed relationships are expressed here.
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

extern u8 data_ov110_0221d720[];
extern ActorSpawnDescriptor data_ov110_0221d734[];
extern ActorScriptBytecode data_ov110_0221ed15[];
extern u8 data_ov110_02222140[];
extern u8 data_ov110_02222144[];

#ifdef __cplusplus
}
#endif

/*
 * When mode is zero, initialize the shared actor-interaction runtime, register
 * and spawn overlay 110's category-one descriptor array, publish its work and
 * auxiliary records, and install its bytecode callback. Nonzero modes return
 * without changing state. The literal three is preserved even though the
 * shared routine walks descriptors to their type-zero sentinel. Returns no
 * value and has no direct hardware or SDK effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay110_RegisterCategory1Actors(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov110_02222144, 3, data_ov110_0221d734);
    ActorInteractionRuntime_NoOp(data_ov110_02222140);
    GamePhaseRuntime_SetGlobalValue30F8(data_ov110_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov110_0221ed15);
}

/* Exact descriptors, bytecode, and work storage remain ROM-delinked. */
