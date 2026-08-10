#include "tingle/types.h"

/*
 * Overlay 49 base-object construction. The recovered routine initializes the
 * shared runtime base, two embedded vectors, and its primary counters/state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_020f3058[];
extern "C" void VecFx32Object_Init(void *vector);

/*
 * Install the confirmed base vtable, initialize embedded vector-like records
 * at +0x1C and +0x2C, clear fields +4/+8/+0xC/+0x44, and return caller-owned
 * `object`. Only object memory changes; vector initialization has no direct
 * hardware effect and no allocation occurs.
 */
extern "C" void *func_ov049_0220b740(void *object)
{
    FIELD(void *, object, 0) = data_020f3058;
    VecFx32Object_Init((u8 *)object + 0x1c);
    VecFx32Object_Init((u8 *)object + 0x2c);
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 0x0c) = 0;
    FIELD(s32, object, 0x44) = 0;
    return object;
}
