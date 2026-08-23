#include "tingle/types.h"
#include "tingle/sound_stream.h"

/*
 * Recovered game-facing facade for the single Nitro streamed-audio player.
 *
 * The sound context only gates requests through flag bit two at +0x9C. Stream
 * identity and playback state live in the manager referenced by
 * data_021e9aa8; the lower manager owns NitroSDK calls and timing units.
 */

/*
 * Query the sole stream player. A negative streamId returns its raw active
 * handle; a nonnegative ID returns one only when that exact stream owns a
 * nonzero handle. No state or hardware changes occur.
 */
s32 Sound_IsStreamPlaying(void *context, s32 streamId)
{
    u8 *manager = (u8 *)data_021e9aa8;

    (void)context;
    if (streamId >= 0) {
        if (*(s32 *)(manager + 0x10) == streamId &&
            *(s32 *)(manager + 0x28) != 0)
            return 1;
        return 0;
    }
    return *(s32 *)(manager + 0x28);
}

/*
 * Start streamId with its start offset, volume, fade duration, and fade-in
 * flag. Requests are ignored while sound-context flag bit two is set. The
 * lower manager owns validation and the Nitro stream player.
 */
void Sound_PlayStream(void *context, s32 streamId, s32 startUnits, s32 volume,
                   s32 fadeFrames, s32 fadeIn)
{
    if ((*(u32 *)((u8 *)context + 0x9c) & 4) == 0)
        func_0205ae3c(data_021e9aa8, streamId, startUnits, volume,
                      fadeFrames, fadeIn);
}

/* Stop the sole stream over fadeFrames; suppressed requests have no effect. */
void Sound_StopStream(void *context, s32 fadeFrames)
{
    if ((*(u32 *)((u8 *)context + 0x9c) & 4) == 0)
        func_0205af24(data_021e9aa8, fadeFrames);
}

/* Fade the sole stream to volume over fadeFrames when requests are enabled. */
void Sound_FadeStreamVolume(void *context, s32 volume, s32 fadeFrames)
{
    if ((*(u32 *)((u8 *)context + 0x9c) & 4) == 0)
        func_0205aee8(data_021e9aa8, volume, fadeFrames);
}

/* Save the current stream position through the lower manager; returns void. */
void Sound_SaveStreamPosition(void *context)
{
    (void)context;
    func_0205acdc(data_021e9aa8);
}

/* Restore the saved stream position through the lower manager; returns void. */
void Sound_ResumeStreamPosition(void *context)
{
    (void)context;
    func_0205acf4(data_021e9aa8);
}
