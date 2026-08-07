#include "tingle/types.h"

/*
 * Overlay 7 item hiding. This recovered helper writes the hidden-state value
 * to every populated object and clears one sub-display register.
 */

/*
 * Write halfword 4 at +0x42 of the primary pointer at state +0x4C, each of the
 * ten pointers at +0x50..+0x74, and fixed pointers +0x78/+0x7C. Clear word
 * 0x04001010, set state byte +0xD0 to one, and return no value. The original
 * assumes every object pointer is valid. The object-state writes and sub-engine
 * MMIO effect are confirmed; the semantic register/flag names remain unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fbc80(void *state)
{
    s32 index;

    *(u16 *)((u8 *)*(void **)((u8 *)state + 0x4c) + 0x42) = 4;
    for (index = 9; index >= 0; index--) {
        void *object = *(void **)((u8 *)state + 0x50 + index * 4);

        *(u16 *)((u8 *)object + 0x42) = 4;
    }
    *(u16 *)((u8 *)*(void **)((u8 *)state + 0x78) + 0x42) = 4;
    *(u16 *)((u8 *)*(void **)((u8 *)state + 0x7c) + 0x42) = 4;
    *(volatile u32 *)0x04001010 = 0;
    *(u8 *)((u8 *)state + 0xd0) = 1;
}
