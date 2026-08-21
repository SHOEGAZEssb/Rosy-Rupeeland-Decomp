#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/* Recovered overlay 385 category-two actor-registration subsystem. */
typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);
extern u8 data_ov385_022342c0[];
extern GamePhaseRegionTable data_ov385_022342c4;
extern ActorScriptBytecode data_ov385_022342a2[];
extern ActorSpawnDescriptor data_ov385_022342c8[];

/* Register the sentinel-driven descriptor array with retail's literal count
 * of three, install its bytecode callback, and publish the region table.
 * Returns no value and performs no direct hardware or SDK operation. */
void func_ov385_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov385_022342c0, 3, data_ov385_022342c8);
    ActorDescriptorBatch_SetCategory2Callback(data_ov385_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov385_022342c4);
}

/* Exact command-stream records and zero-initialized engine work storage. */
extern unsigned char data_ov385_02233ed6[];
extern unsigned char data_ov385_02233f19[];
extern unsigned char data_ov385_02233f30[];
extern unsigned char data_ov385_02233f56[];
extern unsigned char data_ov385_02233f90[];
extern unsigned char data_ov385_02234084[];
extern unsigned char data_ov385_02234098[];
extern unsigned char data_ov385_022340be[];
extern unsigned char data_ov385_02234141[];
extern unsigned char data_ov385_02234142[];
