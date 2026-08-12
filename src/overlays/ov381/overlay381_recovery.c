#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/*
 * Recovered phase-five category-two actor registration from overlay 381.
 *
 * The overlay owns a sentinel-terminated 0x64-byte actor descriptor array,
 * its associated actor bytecode, and the active phase-region table storage.
 * Their exact bytes remain in the matching data object while this portable
 * entry point records the confirmed ownership and publication order.
 */

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

#ifdef __cplusplus
extern "C" {
#endif

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);

extern ActorSpawnDescriptor data_ov381_02233ca0[];
extern ActorScriptBytecode data_ov381_02235116[];
extern u8 data_ov381_02237880[];
extern GamePhaseRegionTable data_ov381_02237884;

#ifdef __cplusplus
}
#endif

/*
 * Register and spawn the overlay's category-two descriptors, install their
 * bytecode callback, then publish the overlay-owned region table as the active
 * table. The literal three is retained from retail although descriptor
 * iteration is sentinel-driven. Returns no value; publication changes shared
 * game state but performs no direct hardware or SDK operation.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov381_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov381_02237880, 3, data_ov381_02233ca0);
    ActorDescriptorBatch_SetCategory2Callback(data_ov381_02235116);
    GamePhaseRegionTable_PublishActive(&data_ov381_02237884);
}

/* Exact descriptors, bytecode, region data, and work storage remain ROM-delinked. */
