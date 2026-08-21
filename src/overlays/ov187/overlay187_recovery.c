/*
 * Recovered overlay 187 compact interpreter-data subsystem.
 *
 * The overlay registers fifteen initialized record groups with the engine
 * and owns trailing zero-initialized work storage. Record semantics remain
 * unconfirmed, so address-derived names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov187_0221d720[], data_ov187_0221d730[];
extern unsigned char data_ov187_0221d744[], data_ov187_0221e241[];

/* Register 15 category-one descriptors during load phase zero; later phases
 * have no effect. Returns no value and performs no direct hardware access. */
void func_ov187_0221d6c0(s32 phase)
{
    if (phase != 0) return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(data_ov187_0221d720, 15, data_ov187_0221d744);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov187_0221d730);
    ActorDescriptorBatch_SetCategory1Callback(data_ov187_0221e241);
}

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov187_0221d720[];
extern unsigned char data_ov187_BSSSTART[];
