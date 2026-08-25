#include "tingle/types.h"

/* Overlay 13 base-object no-op destruction and embedded transition-field initialization. */

/* Accept an embedded element pointer and return immediately without changing state or hardware. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay013_Record_NoOp(void *element)
{
    (void)element;
}

/* Store arguments two and three at +0x24/+0x28, clear +0x04/+0x08, ignore the fourth argument, and return void. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fce04(void *state, s32 field24, s32 field28, s32 unused)
{
    (void)unused;
    *(s32 *)((u8 *)state + 0x24) = field24;
    *(s32 *)((u8 *)state + 0x28) = field28;
    *(s32 *)((u8 *)state + 4) = 0;
    *(s32 *)((u8 *)state + 8) = 0;
}
