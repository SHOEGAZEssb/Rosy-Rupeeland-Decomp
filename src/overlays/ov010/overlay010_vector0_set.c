#include "tingle/types.h"

/* Overlay 10 first three-word vector initialization. */

/* Store the three value arguments at state +0x04/+0x08/+0x0C; return void with no delegated or hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fce7c(void *state, s32 x, s32 y, s32 z)
{
    *(s32 *)((u8 *)state + 4) = x;
    *(s32 *)((u8 *)state + 8) = y;
    *(s32 *)((u8 *)state + 12) = z;
}
