#include "tingle/types.h"

/*
 * Recovered overlay 108 compact interpreter-data subsystem.
 *
 * The overlay registers a large initialized bytecode-like record set with the
 * engine and owns two trailing zero-initialized work fields. Record semantics
 * remain unconfirmed, so address-derived names are retained.
 */

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;
typedef u8 ActorScriptBytecode;

#ifdef __cplusplus
extern "C" {
#endif

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, s32 unusedCount, ActorSpawnDescriptor *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(
    const ActorScriptBytecode *callback);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *records);

extern u8 data_ov108_0221d720[];
extern ActorSpawnDescriptor data_ov108_0221d734[];
extern ActorScriptBytecode data_ov108_0221f0fd[];
extern u8 data_ov108_022268a0[];
extern u8 data_ov108_022268a4[];

#ifdef __cplusplus
}
#endif

/*
 * When mode is zero, initialize shared actor-interaction state, register and
 * spawn the category-one descriptor batch, publish the work and auxiliary
 * records, and install the bytecode callback. Nonzero modes return unchanged.
 * The literal three matches retail although registration is sentinel-driven.
 * Returns no value and performs no direct hardware or SDK operation.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay108_RegisterCategory1Actors(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov108_022268a4, 3, data_ov108_0221d734);
    ActorInteractionRuntime_NoOp(data_ov108_022268a0);
    GamePhaseRuntime_SetGlobalValue30F8(data_ov108_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov108_0221f0fd);
}

/* Additional exact initialized records used by the overlay. */
