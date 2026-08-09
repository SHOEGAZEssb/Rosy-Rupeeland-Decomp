#include "tingle/types.h"

/* Overlay 53 field-effect scene helpers and offset-derived callback objects. */

extern "C" void Heap_Free(void *allocation);
extern "C" u32 data_ov053_0220dd00[];

/* Input and all observable state remain unchanged. */
extern "C" void func_ov053_0220db70(void *) { }
/* Input and all observable state remain unchanged. */
extern "C" void func_ov053_0220db74(void *) { }
/* Input and all observable state remain unchanged. */
extern "C" void func_ov053_0220db78(void *) { }
/* Input and all observable state remain unchanged. */
extern "C" void func_ov053_0220db7c(void *) { }
/* Input and all observable state remain unchanged. */
extern "C" void func_ov053_0220db80(void *) { }

/*
 * Install the recovered vtable and two halfword coordinates in caller-owned
 * `record`. Only record memory changes; nothing is returned and no SDK/MMIO occurs.
 */
extern "C" void func_ov053_0220db84(void *record, u16 x, u16 y)
{
    u32 *words = (u32 *)record;
    words[0] = (u32)data_ov053_0220dd00;
    *(u16 *)((u8 *)record + 4) = x;
    *(u16 *)((u8 *)record + 6) = y;
}

/* Input and all observable state remain unchanged. */
extern "C" void func_ov053_0220db9c(void *) { }

/*
 * Free `object` and return its former address identity. Heap state changes;
 * the result must not be dereferenced and no SDK/MMIO occurs.
 */
extern "C" void *func_ov053_0220dba0(void *object)
{
    Heap_Free(object);
    return object;
}
