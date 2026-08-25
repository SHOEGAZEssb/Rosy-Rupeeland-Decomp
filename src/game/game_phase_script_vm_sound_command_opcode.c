#include "tingle/game_phase_script_vm.h"
#include "tingle/sound_stream.h"

/* Dispatch the script VM's packed sound playback and global sound-control command. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 soundId, s32 variant);
extern void Sound_StopEffect(void *context, s32 soundId, s32 variant);
extern void Sound_PlayOwnedEffect(void *context, s32 soundId, s32 variant,
                         void *actor, s32 value, s32 scale);
extern s32 Sound_IsEffectPlaying(void *context, s32 soundId, s32 variant);
extern void Sound_StopAllDirectSequences(void *context, s32 value);
extern s32 Sound_IsDirectSequencePlaying(void *context, u16 value);
extern void Sound_LoadGroup(void *context, s32 value);
extern void Sound_ReleaseGroup(void *context, s32 value);
extern void Sound_SetCaptureEnabled(void *context, s32 enabled);
extern void Sound_SetCaptureRoute0Enabled(void *context, s32 enabled, s32 attack, s32 release);
extern void Sound_SetCaptureRoute1Enabled(void *context, s32 enabled, s32 attack, s32 release);
extern void Sound_SetDirectCaptureRoutesEnabled(void *context, s32 enabled, s32 attack, s32 release);
extern void SoundPhaseDatabaseManager_Update(void *context, s32 enabled);
extern void SoundPhaseManager_RequestAlternateTransition(void *context, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Pop a value and command selector, dispatch the selected sound-context
 * operation, and return zero.  Commands 0..3 split the low halfword into a
 * nine-bit sound ID and seven-bit variant.  Commands 3 and 5 store their query
 * values as VM results; selectors 15..33 and unsupported selectors have no effect.
 */
s32 GamePhaseActorScriptVm_DispatchSoundCommand(GamePhaseActorScriptVm *self)
{
    s32 soundValue = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u16 packed;
    s32 soundId;
    s32 variant;

    switch (command) {
    case 0:
        packed = (u16)soundValue;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        Sound_Play(gSoundContext, soundId, variant);
        break;
    case 1:
        packed = (u16)soundValue;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        Sound_StopEffect(gSoundContext, soundId, variant);
        break;
    case 2:
        packed = (u16)soundValue;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        Sound_PlayOwnedEffect(gSoundContext, soundId, variant, self->actor, 0, 0x100);
        break;
    case 3:
        packed = (u16)soundValue;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                      (u32)Sound_IsEffectPlaying(gSoundContext, soundId, variant));
        break;
    case 4: Sound_StopAllDirectSequences(gSoundContext, soundValue); break;
    case 5:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)Sound_IsDirectSequencePlaying(gSoundContext, (u16)soundValue));
        break;
    case 6: SoundContext_PlayDefaultStream(gSoundContext, (u16)soundValue); break;
    case 7: Sound_StopStream(gSoundContext, soundValue); break;
    case 8: Sound_LoadGroup(gSoundContext, soundValue); break;
    case 9: Sound_ReleaseGroup(gSoundContext, soundValue); break;
    case 10: Sound_SetCaptureEnabled(gSoundContext, soundValue == 1); break;
    case 11: Sound_SetCaptureRoute0Enabled(gSoundContext, soundValue == 1, 20, 30); break;
    case 12: Sound_SetCaptureRoute1Enabled(gSoundContext, soundValue == 1, 20, 30); break;
    case 13: Sound_SetDirectCaptureRoutesEnabled(gSoundContext, soundValue == 1, 20, 30); break;
    case 14: SoundPhaseDatabaseManager_Update(gSoundContext, soundValue == 1); break;
    case 34: SoundPhaseManager_RequestAlternateTransition(gSoundContext, soundValue == 1); break;
    }
    return 0;
}
