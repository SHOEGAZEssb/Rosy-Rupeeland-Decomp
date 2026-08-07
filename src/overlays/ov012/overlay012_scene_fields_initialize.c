#include "tingle/types.h"

/* Overlay 12 embedded scene-field initialization. */

/* Store second/third arguments at +0x24/+0x28, clear +0x04/+0x08, ignore the fourth argument, and return void without hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd148(void *state, s32 field24, s32 field28, s32 unused)
{
    (void)unused;
    *(s32 *)((u8 *)state + 0x24) = field24;
    *(s32 *)((u8 *)state + 0x28) = field28;
    *(s32 *)((u8 *)state + 4) = 0;
    *(s32 *)((u8 *)state + 8) = 0;
}
