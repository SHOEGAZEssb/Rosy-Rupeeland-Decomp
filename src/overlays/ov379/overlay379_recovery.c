#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/*
 * Recovered overlay 379 interpreter-data subsystem.
 *
 * This module is byte-identical to overlays 377 and 378. It owns a
 * sentinel-terminated actor descriptor array, actor bytecode callback, and
 * phase-region table whose exact bytes remain in the matching data object.
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

extern ActorScriptBytecode data_ov379_022342a2[];
extern u8 data_ov379_022342c0[];
extern GamePhaseRegionTable data_ov379_022342c4;
extern ActorSpawnDescriptor data_ov379_022342c8[];

#ifdef __cplusplus
}
#endif

/*
 * Register and spawn the overlay's category-two descriptors, install their
 * bytecode callback, then publish the overlay-owned region table as active.
 * The literal three matches retail although registration is sentinel-driven.
 * Returns no value and performs no direct hardware or SDK operation.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov379_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov379_022342c0, 3, data_ov379_022342c8);
    ActorDescriptorBatch_SetCategory2Callback(data_ov379_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov379_022342c4);
}

/* Additional exact command-stream records in the matching data object. */
extern unsigned char data_ov379_02233ed6[];
extern unsigned char data_ov379_02233f19[];
extern unsigned char data_ov379_02233f30[];
extern unsigned char data_ov379_02233f56[];
extern unsigned char data_ov379_02233f90[];
extern unsigned char data_ov379_02234084[];
extern unsigned char data_ov379_02234098[];
extern unsigned char data_ov379_022340be[];
extern unsigned char data_ov379_02234141[];
extern unsigned char data_ov379_02234142[];
