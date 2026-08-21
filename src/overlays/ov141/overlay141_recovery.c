/*
 * Recovered overlay 141 compact interpreter-data subsystem.
 *
 * The overlay registers an initialized bytecode-like record set with the
 * engine and owns trailing zero-initialized work storage. Record semantics
 * remain unconfirmed, so address-derived names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov141_0221d720[], data_ov141_0221d734[];
extern unsigned char data_ov141_0221dfd9[], data_ov141_0221e824[];

/*
 * Register the overlay's category-one descriptors during load phase zero.
 * Nonzero phases have no effect; the routine returns no value and performs no
 * direct SDK or hardware access.
 */
void func_ov141_0221d6c0(s32 phase)
{
    if (phase != 0) return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(data_ov141_0221e824, 3, data_ov141_0221d734);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov141_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov141_0221dfd9);
}

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov141_0221d720[];
extern unsigned char data_ov141_0221e820[];
