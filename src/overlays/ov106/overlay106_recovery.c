/*
 * Recovered overlay 106 compact interpreter-data subsystem.
 *
 * The overlay exposes one engine callback and a large initialized bytecode-like
 * data set with two trailing work fields. Higher-level record semantics remain
 * unconfirmed, so address-based names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov106_0221d720[], data_ov106_0221d734[];
extern unsigned char data_ov106_0221e351[];
extern unsigned char data_ov106_0221e384[];

/* Register this overlay's category-one descriptors only for load phase zero. */
void func_ov106_0221d6c0(s32 phase)
{
    if (phase != 0) return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(data_ov106_0221e384,
        3, data_ov106_0221d734);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov106_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov106_0221e351);
}

/* Exact initialized records and zero-initialized work fields used by the overlay; individual semantic meanings remain unconfirmed. */
extern unsigned char data_ov106_0221d720[];
extern unsigned char data_ov106_0221e380[];
