#include "tingle/types.h"

/*
 * Recovered phase-90 setup and actor-bytecode records from overlay 195.
 *
 * Phase record 90 at 0x020da97c stores overlay ID 195 at offset 0x1c and this
 * overlay's callback at offset 0x24. The shared phase configuration path loads
 * that overlay before invoking the callback, which initializes the shared
 * actor-interaction runtime and registers three category-one descriptors. The
 * descriptors select resource triplets 0x1000..0x1002, 0x241B..0x241D
 * (anm_main_ttl), and 0x2421..0x2423 (anm_nin_c_ttl); only the first carries a
 * script payload, selected as descriptor value three.
 *
 * Category callback 0x0221E419 sets GameWork flags 514 and 1013, hides the
 * touch prompt and currency HUD, clears the phase collection actor flag via
 * opcode 0x79, initializes actor zero with script 0x0221D975, configures
 * selectors one and seven with 384-by-288 extents, and dispatches payload
 * 0x0221E48A through descriptor value three. The actor-zero script fixes its
 * position at the origin, clears inverse actor flag 0x200000, and disables its
 * optional attachment.
 *
 * Payload 0x0221E48A pushes runtime-scene selector five and parameter zero,
 * then invokes opcode 0x78 (func_02016238). Selector five constructs a
 * GamePhaseLoadScene of kind 16, whose retail loader branch selects overlays
 * 94 and 25 and calls func_ov025_021FF27C. After that scene completes, the
 * script waits one update and sets flags 1016 and 902. If title idle-timeout
 * flag 982 is set it stages phase 225, returning through the retail splash;
 * otherwise it stores 90 at GameWork halfword +0xFE and stages phase 5. The
 * bytecode and descriptor records remain ROM-delinked rather than rewritten
 * as a new C state machine.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, s32 count, const void *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(const void *callback);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *value);

extern u8 data_ov195_0221d720[];
extern u8 data_ov195_0221d734[];
/* First descriptor payload containing the kind-16 load and phase routing. */
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
    GamePhaseRuntime_SetGlobalValue30F8(data_ov195_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov195_0221e419);
}

/* Exact initialized records and zero-initialized work storage remain ROM-delinked. */
