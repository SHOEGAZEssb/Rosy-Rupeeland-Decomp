#include "tingle/types.h"

/*
 * Recovered overlay 225 compact interpreter-data subsystem.
 *
 * The overlay initializes the actor-interaction runtime, registers three
 * category-one descriptors, and publishes its script and callback records.
 * The record semantics remain partly unconfirmed, so address-derived data
 * names are retained.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, s32 count, const void *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(const void *callback);
extern void func_02008f58(void *value);

extern u8 data_ov225_0221d720[];
extern u8 data_ov225_0221d734[];
extern u8 data_ov225_02220a93[];
extern u8 data_ov225_02221d00[];
extern u8 data_ov225_02221d04[];

#ifdef __cplusplus
}
#endif

/*
 * When mode is zero, initialize actor interaction state, register and spawn
 * the overlay's three category-one descriptors, publish the overlay work and
 * script regions, and install its category callback. Nonzero modes return
 * without changing state. The routine returns no value and has no direct
 * hardware effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov225_0221d6c0(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov225_02221d04, 3, data_ov225_0221d734);
    ActorInteractionRuntime_NoOp(data_ov225_02221d00);
    func_02008f58(data_ov225_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov225_02220a93);
}

/* Exact initialized records and zero-initialized work storage used by the overlay. */
