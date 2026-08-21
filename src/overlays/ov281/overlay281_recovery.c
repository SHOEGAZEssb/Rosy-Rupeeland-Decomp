/*
 * Recovered overlay 281 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three records plus two
 * auxiliary runtime regions. The record semantics remain unconfirmed, so the
 * address-derived names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov281_0221d720[], data_ov281_0221d734[];
extern unsigned char data_ov281_0221f041[], data_ov281_02224300[];
extern unsigned char data_ov281_02224304[];

/* Register three category-one descriptors during load phase zero; later phases
 * have no effect. Returns no value and performs no direct hardware access. */
void func_ov281_0221d6c0(s32 phase)
{
    if (phase != 0)
        return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov281_02224304, 3, data_ov281_0221d734);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov281_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov281_0221f041);
}

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov281_0221d720[];
extern unsigned char data_ov281_0221d734[];
extern unsigned char data_ov281_0221f041[];
extern unsigned char data_ov281_02224300[];
extern unsigned char data_ov281_02224304[];
