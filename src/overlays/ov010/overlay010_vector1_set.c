#include "tingle/types.h"

/* Overlay 10 second three-word vector initialization. */

/* Store the three value arguments at state +0x10/+0x14/+0x18; return void with no delegated or hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fce84(void *state, s32 x, s32 y, s32 z)
{
    *(s32 *)((u8 *)state + 0x10) = x;
    *(s32 *)((u8 *)state + 0x14) = y;
    *(s32 *)((u8 *)state + 0x18) = z;
}
