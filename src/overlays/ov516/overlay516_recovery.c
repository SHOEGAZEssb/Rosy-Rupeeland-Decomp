#include "tingle/game_phase_region_table.h"
#include "tingle/types.h"

/*
 * Recovered overlay 516 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in three zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorDescriptorBatch_RegisterAndSpawnCategory2(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory2Callback(
    const ActorScriptBytecode *callback);

/* Interpreter records and zero-initialized work areas used by the initializer. */
extern ActorScriptBytecode data_ov516_022342a2[];
extern u8 data_ov516_02234300[];
extern GamePhaseRegionTable data_ov516_02234304;
extern ActorSpawnDescriptor data_ov516_02234308[];

/*
 * Register and spawn the overlay's category-two descriptors, install their
 * bytecode callback, then publish the overlay-owned region table. The literal
 * three is retained from retail although descriptor iteration is
 * sentinel-driven. Returns no value and has no direct hardware or SDK effects.
 */
void func_ov516_02233c60(void)
{
    ActorDescriptorBatch_RegisterAndSpawnCategory2(
        data_ov516_02234300, 3, data_ov516_02234308);
    ActorDescriptorBatch_SetCategory2Callback(data_ov516_022342a2);
    GamePhaseRegionTable_PublishActive(&data_ov516_02234304);
}
