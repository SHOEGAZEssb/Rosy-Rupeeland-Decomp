#include "tingle/types.h"

/*
 * Recovered overlay 225 compact interpreter-data subsystem.
 *
 * The overlay initializes the actor-interaction runtime, registers three
 * category-one descriptors, and publishes its script and callback records.
 * The descriptor record at 0x0221db48 selects script 0x02220df7, which
 * configures its actor and dispatches mode 2 to script 0x02220f14. On the
 * normal boot branch that script dispatches actor zero to 0x022210f2, waits
 * for selected-actor flag 169 bit 0, then passes stage 84, area 912, phase 90,
 * and mode 0 to the shared phase-request opcode at 0x02220fbd.
 *
 * Script 0x022210f2 performs the confirmed presentation work before that
 * request: it changes the actor motion mode, sets actor word-0x14 bits 1 and
 * 2 and byte 0xe6, issues sound selector 24 with parameters 65 and 75, starts
 * a relative 64-unit Y movement at speed 6144, waits ten ticks, plays packed
 * sound 0x5a01 or 0x5a02 according to a modulo-two random result, waits for
 * movement completion, and restores the actor flags and motion mode. Other
 * record semantics remain partly unconfirmed, so address-derived data names
 * are retained rather than replacing them with inferred meanings.
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
/* Actor callback bytecode containing the confirmed splash-to-phase-90 path. */
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
