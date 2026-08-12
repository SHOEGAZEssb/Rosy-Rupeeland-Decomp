#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/*
 * Recovered phase-225 category-two actor registration from overlay 601.
 *
 * The overlay supplies a sentinel-terminated actor descriptor array, actor
 * bytecode callback, and phase-region table. Their exact bytes remain in the
 * matching data object; the portable function captures their runtime links.
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

extern ActorScriptBytecode data_ov601_022342a2[];
extern u8 data_ov601_022342c0[];
extern GamePhaseRegionTable data_ov601_022342c4;
extern ActorSpawnDescriptor data_ov601_022342c8[];

#ifdef __cplusplus
}
#endif

/*
 * Register and spawn the phase-225 category-two descriptor array, install its
 * bytecode callback, and publish the overlay-owned region table. The literal
 * three matches retail although the shared registration routine terminates on
 * a zero-type descriptor. Returns no value and has no direct hardware or SDK
 * effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov601_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov601_022342c0, 3, data_ov601_022342c8);
    ActorDescriptorBatch_SetCategory2Callback(data_ov601_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov601_022342c4);
}

/* Exact descriptors, bytecode, region data, and work storage remain ROM-delinked. */
