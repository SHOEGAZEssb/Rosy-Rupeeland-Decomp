#include "tingle/types.h"

/*
 * Recovered phase-90 setup and actor-bytecode records from overlay 195.
 *
 * The phase-90 metadata callback loads this overlay, initializes the shared
 * actor-interaction runtime, and registers three category-one descriptors.
 * The first descriptor's payload at 0x0221e48a begins by pushing runtime-scene
 * selector 5 and parameter zero, then invokes actor opcode 0x78. That opcode
 * is func_02016238; selector 5 constructs a GamePhaseLoadScene of kind 16,
 * whose retail loader branch selects overlay 25. Remaining record semantics
 * are not renamed because their bytecode roles are not fully established.
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

extern u8 data_ov195_0221d720[];
extern u8 data_ov195_0221d734[];
/* First descriptor payload containing the confirmed kind-16 load command. */
extern u8 data_ov195_0221e48a[];
extern u8 data_ov195_0221e419[];
extern u8 data_ov195_0221e500[];
extern u8 data_ov195_0221e504[];

#ifdef __cplusplus
}
#endif

/*
 * When mode is zero, initialize actor interaction state, register and spawn
 * the overlay's three category-one descriptors, publish its work and resource
 * records, and install the category callback. Nonzero modes return without
 * changing state. The routine returns no value and has no direct hardware
 * effects; registered actor bytecode can allocate and push retail scenes.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov195_0221d6c0(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov195_0221e504, 3, data_ov195_0221d734);
    ActorInteractionRuntime_NoOp(data_ov195_0221e500);
    func_02008f58(data_ov195_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov195_0221e419);
}

/* Exact initialized records and zero-initialized work storage remain ROM-delinked. */
