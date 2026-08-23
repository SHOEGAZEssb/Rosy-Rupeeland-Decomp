#include "tingle/types.h"

/* Forward phase changes from the sound facade to each retail audio manager. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9ab8;
extern void *data_021e9abc;
extern void func_0205bbdc(void *manager, s32 phaseId);
extern void func_0205e248(void *manager, s32 phaseId);
extern void func_020598e8(void *context, s32 phaseId);
void SoundPhaseManager_SetPhase(void *context, s32 phaseId);
#ifdef __cplusplus
}
#endif

/*
 * Select phaseId for the primary phase-sequence manager, rebuild the separate
 * phase ambient-sound manager, update the facade's group configuration, and
 * clear its transition marker at offset 0xBC. The manager at data_021e9ab8 is
 * distinct from the direct-sequence manager at data_021e9abc; omitting this
 * third handoff loses phase-owned, data-selected sound behavior.
 */
void SoundPhaseManager_SetPhase(void *context, s32 phaseId)
{
    func_0205e248(data_021e9abc, phaseId);
    func_020598e8(context, phaseId);
    func_0205bbdc(data_021e9ab8, phaseId);
    *(s32 *)((u8 *)context + 0xbc) = 0;
}
