#include "tingle/game_phase_script_vm.h"
#include "tingle/sound_stream.h"

/* Forward the script VM's remaining high-arity commands to the global sound context. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void Sound_ConfigureGroupSlots(void *context, s32 first, s32 second, s32 third,
                         s32 fourth, s32 fifth, s32 sixth, s32 seventh);
#ifdef __cplusplus
}
#endif

/*
 * Pop five operands and a selector, start a streamed track only for selector
 * 32, and return zero. The operands are the stream ID, start position in the
 * sound context's native units, initial volume, fade duration in frames, and
 * fade-in flag. The stream ID is therefore script bytecode data rather than a
 * phase-to-music table entry. It is narrowed to a halfword before dispatch;
 * unsupported selectors consume their operands without side effects.
 */
s32 func_0201ac18(GamePhaseActorScriptVm *self)
{
    s32 fifth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 fourth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);

    if (command == 32) {
        Sound_PlayStream(gSoundContext, (u16)first, second, third, fourth, fifth);
    }
    return 0;
}

/* Pop seven operands, pass them unchanged to the sound context, and return zero. */
s32 func_0201ac9c(GamePhaseActorScriptVm *self)
{
    s32 seventh = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 sixth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 fifth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 fourth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);

    Sound_ConfigureGroupSlots(gSoundContext, first, second, third, fourth,
                  fifth, sixth, seventh);
    return 0;
}
