#include "tingle/types.h"

/* Overlay 37 timer-driven randomized scene sound playback. */

extern const u16 data_ov037_021feaa4[6];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02091c7c(void *timer, s32 mode);
extern s32 TitleRandom_NextBounded(void *randomState, s32 bound);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern void Sound_Play(void *soundContext, s32 soundId, s32 parameter);
extern void func_02091b98(void *timer, s32 delay);
#ifdef __cplusplus
}
#endif

/*
 * When timer +0x18C fires in mode 2, selects one of six packed sound entries,
 * plays it through the global sound context (upper bits are the sound ID and
 * low seven bits the parameter), then restarts the timer with a randomized
 * delay from 10 through 29. Returns nothing; RNG, sound, and timer state may
 * change. The local table copy is an observed compiler artifact.
 */
extern "C" void func_ov037_021fe1f0(void *scene)
{
    if (!func_02091c7c((u8 *)scene + 0x18c, 2))
        return;
    u16 choices[6];
    for (s32 i = 0; i < 6; ++i)
        choices[i] = data_ov037_021feaa4[i];
    u16 packed = choices[TitleRandom_NextBounded((u8 *)scene + 0xbc, 6)];
    Sound_Play(gSoundContext, (s16)packed >> 7, packed & 0x7f);
    func_02091b98((u8 *)scene + 0x18c,
                  func_0209189c((u8 *)scene + 0xbc, 10, 30));
}
