#include "tingle/types.h"

/*
 * Overlay 49 small polymorphic point lifecycle. The recovered 12-byte record
 * stores a vtable followed by two 32-bit coordinates/state values.
 */

extern "C" u8 data_ov049_0220d398[];

/*
 * Install the point vtable, clear fields +4/+8, and return no value. Only the
 * caller-owned point changes; no allocation, SDK call, or hardware effect occurs.
 */
extern "C" void func_ov049_0220c21c(void *point)
{
    u8 *bytes = (u8 *)point;
    *(void **)bytes = data_ov049_0220d398;
    *(s32 *)(bytes + 4) = 0;
    *(s32 *)(bytes + 8) = 0;
}

/* No-op virtual hook; its input and all observable state remain unchanged. */
extern "C" void func_ov049_0220c238(void *)
{
}

/*
 * Copy fields +4/+8 from `source` to `destination` unless both pointers are
 * identical. Return nothing; only destination memory can change and no SDK or
 * hardware effects occur.
 */
extern "C" void func_ov049_0220c23c(void *destination, const void *source)
{
    if (source != destination) {
        *(s32 *)((u8 *)destination + 4) = *(const s32 *)((const u8 *)source + 4);
        *(s32 *)((u8 *)destination + 8) = *(const s32 *)((const u8 *)source + 8);
    }
}
