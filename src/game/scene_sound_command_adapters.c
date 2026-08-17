#include "tingle/types.h"

/*
 * Packed scene sound-command adapters and shared callbacks recovered at
 * 0x02092260..0x0209234b.
 * Scene pointers are borrowed and unused; each 16-bit packed value stores a
 * sequence-archive ID in the upper nine bits and a member in the lower seven.
 * The game-owned sound context remains the sole routing owner.
 */

extern void *gSoundContext;
extern void Sound_Play(void *context, s32 archive, s32 member);
extern void Sound_PlayDirectSequence(void *context, u16 sequence, s32 volume);
extern void func_0205940c(void *context, s32 archive, s32 member);
extern void func_0205943c(void *context, s32 archive, s32 member, s32 value,
                          s32 pan, s32 pitch);
extern void Sound_StopDirectSequence(void *context, u16 sequence, s32 fade_frames);

/* Start one packed sequence-archive member with its default parameters. */
void func_02092260(void *scene, s32 packed)
{
    u16 value = (u16)packed;
    (void)scene;
    Sound_Play(gSoundContext, (s32)value >> 7, value & 0x7f);
}

/* Stop one packed sequence-archive member immediately. */
void func_02092288(void *scene, s32 packed)
{
    u16 value = (u16)packed;
    (void)scene;
    func_0205940c(gSoundContext, (s32)value >> 7, value & 0x7f);
}

/* Apply an explicit volume/value to one packed sequence-archive member. */
void func_020922b0(void *scene, s32 packed, s32 argument)
{
    u16 value = (u16)packed;
    (void)scene;
    func_0205943c(gSoundContext, (s32)value >> 7, value & 0x7f,
                  argument, 0, 0);
}

/* Start a direct sequence at full retail volume. */
void func_020922f0(void *scene, s32 sequence)
{
    (void)scene;
    Sound_PlayDirectSequence(gSoundContext, (u16)sequence, 0x7f);
}

/* Stop or fade a direct sequence by ID. */
void func_02092314(void *scene, s32 sequence, s32 fade_frames)
{
    (void)scene;
    Sound_StopDirectSequence(gSoundContext, (u16)sequence, fade_frames);
}

/* Return the fixed false/zero result used by shared scene callback tables. */
s32 func_02092344(void)
{
    return 0;
}
