#include "tingle/types.h"

/*
 * Overlay 5 draw-group flag update. This recovered helper enables one flag on
 * every primary draw object in the scene population.
 */

/*
 * Iterate the 11 pointers stored at state +0xC8 through +0xF0 and set bit 3
 * in each pointed object's halfword at +0x24. Return no value. The original
 * assumes every pointer is valid; the flag's renderer meaning is unknown and
 * no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov005_021fbe1c(void *state)
{
    s32 index;

    for (index = 0; index < 11; index++) {
        void *draw = *(void **)((u8 *)state + 0xc8 + index * 4);

        *(u16 *)((u8 *)draw + 0x24) |= 8;
    }
}
