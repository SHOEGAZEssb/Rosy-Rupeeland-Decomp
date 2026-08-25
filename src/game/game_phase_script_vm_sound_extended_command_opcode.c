#include "tingle/game_phase_script_vm.h"

/* Dispatch multi-operand playback and channel-mask controls for the global sound context. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void Sound_PlayOwnedEffect(void *context, s32 soundId, s32 variant,
                         void *actor, s32 first, s32 second);
extern void Sound_FadeEffectVolume(void *context, s32 soundId, s32 variant,
                         s32 first, s32 second);
extern void Sound_FadeDirectSequence(void *context, u16 first, u16 second, u16 third);
extern void Sound_ConfigureAuxiliaryManagers(void *context, s32 first, s32 second, s32 third);
extern u16 Sound_GetDirectSequenceTrackMask(void *context, u16 index);
extern void Sound_SetDirectSequenceTrackMask(void *context, u16 index, u16 mask);
#ifdef __cplusplus
}
#endif

/*
 * Pop three operands and selector 26..33, dispatch the supported sound
 * operation, and return zero.  Selector 26 splits its first operand into a
 * nine-bit sound ID and seven-bit variant and uses the VM actor.  Selector 33
 * reads a halfword mask, sets or clears the requested bit, then writes it back.
 * Selectors 30..32 and unsupported selectors do nothing.
 */
s32 GamePhaseActorScriptVm_DispatchThreeOperandSoundCommand(GamePhaseActorScriptVm *self)
{
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u16 packed;
    u16 mask;

    switch (command) {
    case 26:
        packed = (u16)first;
        Sound_PlayOwnedEffect(gSoundContext, packed >> 7, packed & 0x7f,
                      self->actor, second, third);
        break;
    case 27:
        packed = (u16)first;
        Sound_FadeEffectVolume(gSoundContext, packed >> 7, packed & 0x7f, second, third);
        break;
    case 28:
        Sound_FadeDirectSequence(gSoundContext, (u16)first, (u16)second, (u16)third);
        break;
    case 29:
        Sound_ConfigureAuxiliaryManagers(gSoundContext, first, second, third);
        break;
    case 33:
        mask = Sound_GetDirectSequenceTrackMask(gSoundContext, (u16)first);
        if (third != 0) {
            mask |= (u16)(1 << second);
        } else {
            mask &= (u16)~(1 << second);
        }
        Sound_SetDirectSequenceTrackMask(gSoundContext, (u16)first, mask);
        break;
    }
    return 0;
}
