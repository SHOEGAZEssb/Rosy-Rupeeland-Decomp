#include "tingle/types.h"

/* Overlay 12 render-transform object construction. */

extern u32 data_ov012_021fe5f4[];

/* Install the address-derived vtable, clear the owned resource/translation/rotation fields, set unit FX32 scale, and return void. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fce00(void *object)
{
    *(u32 **)((u8 *)object + 0x00) = data_ov012_021fe5f4;
    *(void **)((u8 *)object + 0x04) = 0;
    *(s32 *)((u8 *)object + 0x08) = 0;
    *(s32 *)((u8 *)object + 0x0c) = 0;
    *(s32 *)((u8 *)object + 0x10) = 0;
    *(s32 *)((u8 *)object + 0x14) = 0x1000;
    *(s32 *)((u8 *)object + 0x18) = 0x1000;
    *(s32 *)((u8 *)object + 0x1c) = 0x1000;
    *(s32 *)((u8 *)object + 0x20) = 0;
    *(s32 *)((u8 *)object + 0x24) = 0;
    *(s32 *)((u8 *)object + 0x28) = 0;
}
