/* Finalize rewards and result state for an active auxiliary interaction. */
#include "tingle/types.h"

extern void ActorAttachmentManager_FinalizeRewards(void *manager);
extern void AuxiliaryInteraction_FinalizeResult(void *interaction, s32 value);

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/* Complete an interaction whose unsigned state +0x1a is zero or one
 * (0x0206e590). Finalize rewards in its owned manager at +0x44, then finalize
 * the result with the logical inverse of the caller's mode. Higher states
 * are inert. Ownership changes and reward effects are delegated to recovered
 * callees; no status is returned. */
void func_0206e590(void *interaction, s32 mode)
{
    if (FIELD(u16, interaction, 0x1a) > 1)
        return;
    ActorAttachmentManager_FinalizeRewards(FIELD(void *, interaction, 0x44));
    AuxiliaryInteraction_FinalizeResult(interaction, mode == 0);
}
