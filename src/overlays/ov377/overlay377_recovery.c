#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/*
 * Recovered overlay 377 phase-two category-two actor registration.
 *
 * The overlay owns a sentinel-terminated actor descriptor array, actor
 * bytecode callback, and phase-region table. Their exact bytes remain in the
 * matching data object while this portable entry point records the confirmed
 * registration and publication order.
 */

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);

extern ActorScriptBytecode data_ov377_022342a2[];
extern u8 data_ov377_022342c0[];
extern GamePhaseRegionTable data_ov377_022342c4;
extern ActorSpawnDescriptor data_ov377_022342c8[];

/*
 * Register and spawn category-two descriptors, install their bytecode
 * callback, then publish the overlay-owned region table. The literal three
 * matches retail although registration is sentinel-driven. Returns no value
 * and performs no direct hardware or SDK operation.
 */
void func_ov377_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov377_022342c0, 3, data_ov377_022342c8);
    ActorDescriptorBatch_SetCategory2Callback(data_ov377_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov377_022342c4);
}

/* Exact command-stream records and zero-initialized engine work storage. */
extern unsigned char data_ov377_02233ed6[];
extern unsigned char data_ov377_02233f19[];
extern unsigned char data_ov377_02233f30[];
extern unsigned char data_ov377_02233f56[];
extern unsigned char data_ov377_02233f90[];
extern unsigned char data_ov377_02234084[];
extern unsigned char data_ov377_02234098[];
extern unsigned char data_ov377_022340be[];
extern unsigned char data_ov377_02234141[];
extern unsigned char data_ov377_02234142[];
