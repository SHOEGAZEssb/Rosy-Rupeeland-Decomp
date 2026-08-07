#include "tingle/types.h"

/* Overlay 12 second three-word vector initialization. */

/* Store x/y/z at state +0x10/+0x14/+0x18; returns void without delegated or hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd0c4(void *state, s32 x, s32 y, s32 z)
{
    *(s32 *)((u8 *)state + 0x10) = x;
    *(s32 *)((u8 *)state + 0x14) = y;
    *(s32 *)((u8 *)state + 0x18) = z;
}
