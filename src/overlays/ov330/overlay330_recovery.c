/*
 * Recovered phase-225 splash setup and actor-bytecode records from overlay 330.
 *
 * Phase record 225 at 0x020dd7e4 selects physical overlay 330 at offset 0x1c
 * and this overlay's callback at offset 0x24. The callback initializes the
 * shared actor-interaction runtime and registers the single live descriptor in
 * the sentinel-terminated table at 0x0221d734; the literal count three is not
 * consumed by the retail batch routine.
 *
 * Category callback 0x0221e351 hides the touch prompt and currency HUD, loads
 * bgLibKatsu main-screen resources 0xa135..0xa137 ("bg_vpl_ttl") and sub-screen
 * resources 0xa132..0xa134 ("bg_white_black"), disables the descriptor actor's
 * attachment, and starts mode-three script 0x0221e527. That script fades both
 * screens from brightness -16 to 0 over 30 updates, holds for 60 updates, sets
 * GameWork flag 1016, fades both screens back to -16 over 30 updates, and then
 * submits the retail request for phase 90. The descriptor script at 0x0221e493
 * configures its actor and services GameWork flag 1012 by reapplying the same
 * main/sub background setup. Address-derived names are retained for the exact
 * ROM-delinked bytecode records.
 */

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

extern void ActorInteractionRuntime_Init(void);
extern void ActorInteractionRuntime_NoOp(void *work);
extern void ActorDescriptorBatch_RegisterAndSpawnCategory1(
    void *work, s32 count, const void *descriptors);
extern void ActorDescriptorBatch_SetCategory1Callback(const void *callback);
extern void func_02008f58(void *value);

extern u8 data_ov330_0221d720[];
extern u8 data_ov330_0221d734[];
extern u8 data_ov330_0221e351[];
extern u8 data_ov330_0221e5a0[];
extern u8 data_ov330_0221e5a4[];

#ifdef __cplusplus
}
#endif

/*
 * Initializes and registers the overlay when r0 is zero; updates engine
 * registration state, returns no value, and has no direct hardware effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov330_0221d6c0(s32 mode)
{
    if (mode != 0)
        return;

    ActorInteractionRuntime_Init();
    ActorDescriptorBatch_RegisterAndSpawnCategory1(
        data_ov330_0221e5a4, 3, data_ov330_0221d734);
    ActorInteractionRuntime_NoOp(data_ov330_0221e5a0);
    func_02008f58(data_ov330_0221d720);
    ActorDescriptorBatch_SetCategory1Callback(data_ov330_0221e351);
}

/* Exact initialized bytecode records and BSS remain ROM-delinked. */
