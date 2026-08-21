#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/* Recovered overlay 427 category-two actor-registration subsystem. */
typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);
extern u8 data_ov427_02234940[];
extern GamePhaseRegionTable data_ov427_02234944;
extern ActorScriptBytecode data_ov427_022345c2[];
extern ActorSpawnDescriptor data_ov427_02233ca0[];

/* Register the sentinel-driven descriptor array with retail's literal count
 * of three, install its bytecode callback, and publish the region table.
 * Returns no value and performs no direct hardware or SDK operation. */
void func_ov427_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov427_02234940, 3, data_ov427_02233ca0);
    ActorDescriptorBatch_SetCategory2Callback(data_ov427_022345c2);
    GamePhaseRegionTable_PublishActive(&data_ov427_02234944);
}
