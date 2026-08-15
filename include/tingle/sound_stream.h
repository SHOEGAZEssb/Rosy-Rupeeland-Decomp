#ifndef TINGLE_SOUND_STREAM_H
#define TINGLE_SOUND_STREAM_H

#include "tingle/types.h"

/* Canonical ARM9 ABI for the game-owned single-stream facade and manager.
 * Durations are 60 Hz frames; startUnits are 100 ms units; volume is 0..127.
 * The manager and context remain borrowed game-owned objects. */

#ifdef __cplusplus
extern "C" {
#endif

extern void *data_021e9aa8;

s32 func_02059510(void *context, s32 streamId);
void func_020594ec(void *context, s32 streamId);
void func_02059550(void *context, s32 streamId, s32 startUnits, s32 volume,
                   s32 fadeFrames, s32 fadeIn);
void func_0205958c(void *context, s32 fadeFrames);
void func_020595b0(void *context, s32 volume, s32 fadeFrames);
void func_020595d4(void *context);
void func_020595ec(void *context);

void func_0205acdc(void *manager);
void func_0205acf4(void *manager);
void func_0205adb4(void *manager, s32 streamId);
void func_0205ae3c(void *manager, s32 streamId, s32 startUnits, s32 volume,
                   s32 fadeFrames, s32 fadeIn);
void func_0205aee8(void *manager, s32 volume, s32 fadeFrames);
void func_0205af24(void *manager, s32 fadeFrames);

#ifdef __cplusplus
}
#endif

#endif
