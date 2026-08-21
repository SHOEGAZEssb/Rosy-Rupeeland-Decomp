/*
 * Recovered overlay 227 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three top-level records
 * plus two auxiliary data regions. Internal record fields, including the
 * leading value six at 0x0221d734, remain semantically unconfirmed.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov227_0221d720[], data_ov227_0221d734[];
extern unsigned char data_ov227_0221f5d2[], data_ov227_02221e40[];
extern unsigned char data_ov227_02221e44[];

/* Register three category-one descriptors during load phase zero; later phases
 * have no effect. Returns no value and performs no direct hardware access. */
void func_ov227_0221d6c0(s32 phase)
{
    if (phase != 0) return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(data_ov227_02221e44, 3, data_ov227_0221d734);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov227_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov227_0221f5d2);
}

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov227_0221d720[];
extern unsigned char data_ov227_0221d734[];
extern unsigned char data_ov227_0221f5d2[];
extern unsigned char data_ov227_02221e40[];
extern unsigned char data_ov227_02221e44[];
