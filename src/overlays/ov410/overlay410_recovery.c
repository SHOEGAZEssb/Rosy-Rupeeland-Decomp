#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/* Recovered overlay 410 category-two actor-registration subsystem. */
typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);
extern u8 data_ov410_022342e0[];
extern GamePhaseRegionTable data_ov410_022342e4;
extern ActorScriptBytecode data_ov410_022342a2[];
extern ActorSpawnDescriptor data_ov410_022342e8[];

/* Register the sentinel-driven descriptor array with retail's literal count
 * of three, install its bytecode callback, and publish the region table.
 * Returns no value and performs no direct hardware or SDK operation. */
void func_ov410_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov410_022342e0, 3, data_ov410_022342e8);
    ActorDescriptorBatch_SetCategory2Callback(data_ov410_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov410_022342e4);
}
