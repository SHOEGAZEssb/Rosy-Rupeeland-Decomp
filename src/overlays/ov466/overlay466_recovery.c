#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/*
 * Recovered phase-90 category-two actor registration from overlay 466.
 *
 * The overlay supplies a sentinel-terminated actor descriptor array, actor
 * bytecode callback, and phase-region table. Their bytes remain ROM-delinked;
 * this source captures the confirmed registration and ownership links.
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

extern ActorScriptBytecode data_ov466_022342a2[];
extern u8 data_ov466_02234380[];
extern GamePhaseRegionTable data_ov466_02234384;
extern ActorSpawnDescriptor data_ov466_02234388[];

#ifdef __cplusplus
}
#endif

/*
 * Register and spawn the phase-90 category-two descriptor array, install its
 * bytecode callback, and publish the overlay-owned region table. The literal
 * three is preserved from retail despite sentinel-based descriptor traversal.
 * Returns no value and has no direct hardware or SDK effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov466_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov466_02234380, 3, data_ov466_02234388);
    ActorDescriptorBatch_SetCategory2Callback(data_ov466_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov466_02234384);
}

/* Exact descriptors, bytecode, region data, and work storage remain ROM-delinked. */
