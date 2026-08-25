#include "tingle/types.h"

/* Overlay 14 small value-object initialization and copy helpers. */

/* Clear the three words at +0x00/+0x04/+0x08 and return void without hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay014_ClearValueTriple(void *value)
{
    *(s32 *)((u8 *)value + 8) = 0;
    *(s32 *)((u8 *)value + 4) = 0;
    *(s32 *)value = 0;
}

/* Store arguments two and three at +0x24/+0x28, clear +0x04/+0x08, ignore argument four, and return void. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay014_SetCallbackDescriptor(void *state, s32 field24, s32 field28, s32 unused)
{
    (void)unused;
    *(s32 *)((u8 *)state + 0x24) = field24;
    *(s32 *)((u8 *)state + 0x28) = field28;
    *(s32 *)((u8 *)state + 4) = 0;
    *(s32 *)((u8 *)state + 8) = 0;
}

/* Copy exactly three words from source to destination and return void without hardware effects. */
#ifdef __cplusplus
extern "C"
#endif
void Overlay014_CopyValueTriple(void *destination, const void *source)
{
    *(u32 *)destination = *(const u32 *)source;
    *(u32 *)((u8 *)destination + 4) = *(const u32 *)((const u8 *)source + 4);
    *(u32 *)((u8 *)destination + 8) = *(const u32 *)((const u8 *)source + 8);
}
