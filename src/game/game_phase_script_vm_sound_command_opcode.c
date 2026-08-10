#include "tingle/game_phase_script_vm.h"

/* Dispatch the script VM's packed sound playback and global sound-control command. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 soundId, s32 variant);
extern void func_0205940c(void *context, s32 soundId, s32 variant);
extern void func_020593dc(void *context, s32 soundId, s32 variant,
                         void *actor, s32 value, s32 scale);
extern s32 func_020594a4(void *context, s32 soundId, s32 variant);
extern void func_02058d40(void *context, s32 value);
extern s32 func_02059344(void *context, u16 value);
extern void func_020594ec(void *context, u16 value);
extern void func_0205958c(void *context, s32 value);
extern void func_0205974c(void *context, s32 value);
extern void func_020597fc(void *context, s32 value);
extern void func_02058de0(void *context, s32 enabled);
extern void func_02058ffc(void *context, s32 enabled, s32 attack, s32 release);
extern void func_02059068(void *context, s32 enabled, s32 attack, s32 release);
extern void func_02059104(void *context, s32 enabled, s32 attack, s32 release);
extern void func_02059260(void *context, s32 enabled);
extern void func_02059248(void *context, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Pop a value and command selector, dispatch the selected sound-context
 * operation, and return zero.  Commands 0..3 split the low halfword into a
 * nine-bit sound ID and seven-bit variant.  Commands 3 and 5 push their query
 * results; selectors 15..33 and unsupported selectors have no effect.
 */
s32 func_0201a614(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u16 packed;
    s32 soundId;
    s32 variant;

    switch (command) {
    case 0:
        packed = (u16)value;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        Sound_Play(gSoundContext, soundId, variant);
        break;
    case 1:
        packed = (u16)value;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        func_0205940c(gSoundContext, soundId, variant);
        break;
    case 2:
        packed = (u16)value;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        func_020593dc(gSoundContext, soundId, variant, self->actor, 0, 0x100);
        break;
    case 3:
        packed = (u16)value;
        soundId = packed >> 7;
        variant = packed & 0x7f;
        GamePhaseScriptVm_SetResult(&self->base,
                      (u32)func_020594a4(gSoundContext, soundId, variant));
        break;
    case 4: func_02058d40(gSoundContext, value); break;
    case 5:
        GamePhaseScriptVm_SetResult(&self->base, (u32)func_02059344(gSoundContext, (u16)value));
        break;
    case 6: func_020594ec(gSoundContext, (u16)value); break;
    case 7: func_0205958c(gSoundContext, value); break;
    case 8: func_0205974c(gSoundContext, value); break;
    case 9: func_020597fc(gSoundContext, value); break;
    case 10: func_02058de0(gSoundContext, value == 1); break;
    case 11: func_02058ffc(gSoundContext, value == 1, 20, 30); break;
    case 12: func_02059068(gSoundContext, value == 1, 20, 30); break;
    case 13: func_02059104(gSoundContext, value == 1, 20, 30); break;
    case 14: func_02059260(gSoundContext, value == 1); break;
    case 34: func_02059248(gSoundContext, value == 1); break;
    }
    return 0;
}
