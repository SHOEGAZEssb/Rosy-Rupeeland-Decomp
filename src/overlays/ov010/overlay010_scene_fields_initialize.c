#include "tingle/types.h"

/* Overlay 10 scene-field initialization for the embedded +0x24 member. */

/* Store the second/third arguments at +0x24/+0x28 and clear +0x04/+0x08; the fourth argument is unused. Return void with no hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fce94(void *state, s32 field24, s32 field28, s32 unused)
{
    (void)unused;
    *(s32 *)((u8 *)state + 0x24) = field24;
    *(s32 *)((u8 *)state + 0x28) = field28;
    *(s32 *)((u8 *)state + 4) = 0;
    *(s32 *)((u8 *)state + 8) = 0;
}
