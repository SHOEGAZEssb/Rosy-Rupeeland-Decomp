/*
 * Recovered overlay 126 compact interpreter-data subsystem.
 *
 * The overlay registers a large initialized bytecode-like record set with the
 * engine and owns two trailing zero-initialized work fields. Record semantics
 * remain unconfirmed, so address-derived names are retained.
 */

#include "tingle/types.h"

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(void *, s32, void *);
extern void ActorDescriptorBatch_SetCategory1Callback(void *);
extern void GamePhaseRuntime_SetGlobalValue30F8(void *);
extern unsigned char data_ov126_0221d734[], data_ov126_0221d748[];
extern unsigned char data_ov126_02220059[], data_ov126_0222c700[];

/*
 * Register the overlay's category-one descriptors during load phase zero.
 * Nonzero phases have no effect; the routine returns no value and performs no
 * direct SDK or hardware access.
 */
void func_ov126_0221d6c0(s32 phase)
{
    if (phase != 0) return;
    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(data_ov126_0222c700,
        3, data_ov126_0221d748);
    ActorInteractionRuntime_NoOp();
    GamePhaseRuntime_SetGlobalValue30F8(data_ov126_0221d734);
    ActorDescriptorBatch_SetCategory1Callback(data_ov126_02220059);
}

/* Exact initialized records and zero-initialized work fields used by the overlay. */
extern unsigned char data_ov126_0221d720[];
extern unsigned char data_ov126_0222c700[];
