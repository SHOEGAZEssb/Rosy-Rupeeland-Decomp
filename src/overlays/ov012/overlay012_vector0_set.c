#include "tingle/types.h"

/* Overlay 12 first three-word vector initialization. */

/* Store x/y/z at state +0x04/+0x08/+0x0C; returns void without delegated or hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd0bc(void *state, s32 x, s32 y, s32 z)
{
    *(s32 *)((u8 *)state + 4) = x;
    *(s32 *)((u8 *)state + 8) = y;
    *(s32 *)((u8 *)state + 12) = z;
}
