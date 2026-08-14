#include "tingle/types.h"

/*
 * Sound-context default-stream request recovered from ARM9 0x020594EC.
 *
 * The game-facing sound context suppresses the request while flag bit two at
 * offset 0x9c is set.  Otherwise it forwards the resident sound-manager
 * singleton to the lower player/archive layer.  The wrapper owns neither
 * object and returns no status.
 */

extern void *data_021e9aa8;
extern void func_0205adb4(void *manager);
#ifndef __MWERKS__
extern void Sound_HostPlayDefaultStreamRequest(s32 stream);
#endif

/* Start the selected stream with the lower manager's retail defaults. The
 * matching build keeps stream in r1 across the one-argument declaration. */
void func_020594ec(void *context, s32 stream)
{
    if ((*(u32 *)((u8 *)context + 0x9c) & 4) == 0) {
#ifdef __MWERKS__
        func_0205adb4(data_021e9aa8);
#else
        Sound_HostPlayDefaultStreamRequest(stream);
#endif
    }
}
