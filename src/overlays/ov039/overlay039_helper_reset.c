#include "tingle/types.h"

/* Overlay 39 bulk helper-state reset. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Walk all thirty helper pointers at scene +0xA0..+0x114 in descending order
 * and overwrite each helper's +0x18 word with state four. Inputs are the scene;
 * returns no value. All helper state words change, and pointers are assumed
 * valid as established by the constructor.
 */
extern "C" void func_ov039_021fdb78(void *scene)
{
    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        FIELD(u32, helper, 0x18) = 4;
    }
}
