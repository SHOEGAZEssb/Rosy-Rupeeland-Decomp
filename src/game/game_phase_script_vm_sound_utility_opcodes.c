#include "tingle/game_phase_script_vm.h"
#include "tingle/sound_stream.h"

/* Implement adjacent numeric conversion and global sound-context opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern s32 SignedByteTable_LookupFx12Index(u16 fx12Index);
extern void GameWork_SelectWeightedValueFromTable(s32 tableIndex);
extern void Sound_StopAllManagedPlayers(void *context);
extern void SoundPhaseManager_Reset(void *context);
extern void Sound_ReapplyCurrentGroupSlots(void *context);
#ifdef __cplusplus
}
#endif

/* Pop a value, pass its low byte shifted by eight to the converter, store the VM result, return zero. */
s32 GamePhaseActorScriptVm_LookupSignedByteByHighNibble(GamePhaseActorScriptVm *self)
{
    u16 fx12Index = (u16)((u8)GamePhaseScriptVm_Pop(&self->base) << 8);
    s32 tableValue = SignedByteTable_LookupFx12Index(fx12Index);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)tableValue);
    return 0;
}

/* Pop a value, pass it to the recovered global operation, and return zero. */
s32 GamePhaseActorScriptVm_SelectWeightedGameWorkValue(GamePhaseActorScriptVm *self)
{
    s32 tableIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    GameWork_SelectWeightedValueFromTable(tableIndex);
    return 0;
}

/*
 * Pop command 15..20 and dispatch to the corresponding sound-context
 * operation.  Command 15 queries index -1 and stores a normalized Boolean as the VM result;
 * the remaining commands only mutate sound state.  Other commands do nothing.
 * Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchSoundContextUtilityCommand(GamePhaseActorScriptVm *self)
{
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    switch (command) {
    case 15:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, Sound_IsStreamPlaying(gSoundContext, -1) != 0);
        break;
    case 16: Sound_SaveStreamPosition(gSoundContext); break;
    case 17: Sound_ResumeStreamPosition(gSoundContext); break;
    case 18: Sound_StopAllManagedPlayers(gSoundContext); break;
    case 19: SoundPhaseManager_Reset(gSoundContext); break;
    case 20: Sound_ReapplyCurrentGroupSlots(gSoundContext); break;
    }
    return 0;
}
