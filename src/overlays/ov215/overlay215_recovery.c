/*
 * Recovered overlay 215 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers 27 records plus auxiliary
 * initialized and work regions. Record semantics remain unconfirmed, so
 * address-derived names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov215_0221d720[], data_ov215_0221d734[];
extern unsigned char data_ov215_0221d750[], data_ov215_0221f09c[];
extern unsigned char data_ov215_02222f60[];

/* Register 27 category-one descriptors during load phase zero; later phases
 * have no effect. Returns no value and performs no direct hardware access. */
void func_ov215_0221d6c0(s32 phase)
{
    if (phase != 0) return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(data_ov215_0221d734, 27, data_ov215_0221d750);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov215_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov215_0221f09c);
}

/* Exact initialized tables, records, and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov215_0221d720[];
extern unsigned char data_ov215_0221d734[];
extern unsigned char data_ov215_0221d750[];
extern unsigned char data_ov215_0221f09c[];
extern unsigned char data_ov215_02222f60[];
