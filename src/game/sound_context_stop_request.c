#include "tingle/types.h"

/*
 * Sound-context stop-request wrapper recovered from ARM9 0x020594EC.
 *
 * The game-facing sound context suppresses the request while flag bit two at
 * offset 0x9c is set.  Otherwise it forwards the resident sound-manager
 * singleton to the lower player/archive layer.  The wrapper owns neither
 * object and returns no status.
 */

extern void *data_021e9aa8;
extern void func_0205adb4(void *manager);
#ifndef __MWERKS__
extern void Sound_HostStopStreamRequest(s32 unused_value);
#endif

/* Conditionally stop the active player owned by the resident sound manager. */
void func_020594ec(void *context, s32 unused_value)
{
    if ((*(u32 *)((u8 *)context + 0x9c) & 4) == 0) {
#ifdef __MWERKS__
        func_0205adb4(data_021e9aa8);
#else
        Sound_HostStopStreamRequest(unused_value);
#endif
    }
}
