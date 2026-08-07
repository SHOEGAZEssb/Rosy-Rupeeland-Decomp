#include "tingle/types.h"

/*
 * Overlay 9 scene-field initialization. This recovered helper retains two
 * caller values in a state object and clears two control words.
 */

/*
 * Ignore the fourth register argument, store the second and third arguments at
 * state +0x24/+0x28, and clear state +0x04/+0x08. Return no value. Field
 * semantics remain unidentified and no hardware or SDK effects occur.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fce74(void *state, s32 field24, s32 field28, s32 unused)
{
    (void)unused;
    *(s32 *)((u8 *)state + 0x24) = field24;
    *(s32 *)((u8 *)state + 0x28) = field28;
    *(s32 *)((u8 *)state + 0x04) = 0;
    *(s32 *)((u8 *)state + 0x08) = 0;
}
