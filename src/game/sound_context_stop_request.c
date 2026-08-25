#include "tingle/types.h"
#include "tingle/sound_stream.h"

/*
 * Sound-context default-stream request recovered from ARM9 0x020594EC.
 *
 * The game-facing sound context suppresses the request while flag bit two at
 * offset 0x9c is set.  Otherwise it forwards the resident sound-manager
 * singleton to the lower player/archive layer.  The wrapper owns neither
 * object and returns no status.
 */

#ifndef __MWERKS__
extern void Sound_HostPlayDefaultStreamRequest(s32 stream);
#endif

/* Start the selected stream with the lower manager's retail defaults. */
void SoundContext_PlayDefaultStream(void *context, s32 stream)
{
    if ((*(u32 *)((u8 *)context + 0x9c) & 4) == 0) {
#ifdef __MWERKS__
        SoundManager_PlayDefaultStream(data_021e9aa8, stream);
#else
        Sound_HostPlayDefaultStreamRequest(stream);
#endif
    }
}
