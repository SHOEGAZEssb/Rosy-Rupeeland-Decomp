#include "tingle/types.h"

/*
 * Sound-phase transition wrapper recovered from ARM9 0x02059880. The game
 * owns the +0xBC transition bit; the manager boundary stops the phase-owned
 * sequence/group and enters its transition state.
 */

extern void *data_021e9abc;
extern void SoundPhaseManager_StopSequence(void *manager);

/* Mark the context as transitioning and request the manager's retail state 16. */
void SoundContext_RequestPhaseTransition(void *sound_context, s32 unused)
{
    (void)unused;
    *(u32 *)((u8 *)sound_context + 0xbc) = 1;
    SoundPhaseManager_StopSequence(data_021e9abc);
}
