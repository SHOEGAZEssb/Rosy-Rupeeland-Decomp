#include "tingle/types.h"

/*
 * Recovered overlay 245 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three records plus two
 * auxiliary data regions. The record semantics remain unconfirmed, so the
 * address-derived names are retained.
 */

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(
    const ActorScriptBytecode *callback);
extern void func_02008f58(void *records);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern u8 data_ov245_0221d720[];
extern ActorSpawnDescriptor data_ov245_0221d734[];
extern ActorScriptBytecode data_ov245_0221f3cd[];
extern u8 data_ov245_02221d00[];
extern u8 data_ov245_02221d04[];

/*
 * When mode is zero, initialize the shared actor-interaction runtime, register
 * and spawn the overlay's category-one descriptors, publish its work and
 * auxiliary records, and install its bytecode callback. Nonzero modes return
 * without changing state. The literal three is retained from retail although
 * descriptor iteration is sentinel-driven. Returns no value and has no direct
 * hardware or SDK effects.
 */
void func_ov245_0221d6c0(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov245_02221d04, 3, data_ov245_0221d734);
    ActorInteractionRuntime_NoOp(data_ov245_02221d00);
    func_02008f58(data_ov245_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov245_0221f3cd);
}
