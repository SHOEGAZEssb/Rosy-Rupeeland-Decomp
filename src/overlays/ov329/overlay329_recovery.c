/*
 * Recovered overlay 329 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three records plus two
 * auxiliary runtime regions. Their semantics remain unconfirmed, so the
 * address-derived names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov329_0221d72c[], data_ov329_0221d740[];
extern unsigned char data_ov329_0221f881[], data_ov329_02227660[];
extern unsigned char data_ov329_02227664[];

/* Register three category-one descriptors during load phase zero; later phases
 * have no effect. Returns no value and performs no direct hardware access. */
void func_ov329_0221d6c0(s32 phase)
{
    if (phase != 0)
        return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov329_02227664, 3, data_ov329_0221d740);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov329_0221d72c);
    ActorDescriptorBatch_SetCategory1Callback(data_ov329_0221f881);
}

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov329_0221d72c[];
extern unsigned char data_ov329_0221d740[];
extern unsigned char data_ov329_0221f881[];
extern unsigned char data_ov329_02227660[];
extern unsigned char data_ov329_02227664[];
