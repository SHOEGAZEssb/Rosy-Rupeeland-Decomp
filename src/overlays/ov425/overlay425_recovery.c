#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/* Recovered overlay 425 category-two actor-registration subsystem. */
typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);
extern u8 data_ov425_02233ca0[];
extern GamePhaseRegionTable data_ov425_02234800;
extern ActorScriptBytecode data_ov425_0223450a[];
extern ActorSpawnDescriptor data_ov425_02233cb0[];

/* Register the sentinel-driven descriptor array with retail's literal count
 * of fifteen, install its bytecode callback, and publish the region table.
 * Returns no value and performs no direct hardware or SDK operation. */
void func_ov425_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov425_02233ca0, 15, data_ov425_02233cb0);
    ActorDescriptorBatch_SetCategory2Callback(data_ov425_0223450a);
    GamePhaseRegionTable_PublishActive(&data_ov425_02234800);
}
