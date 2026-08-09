#include "tingle/types.h"

/*
 * Overlay 43 state callback helpers. These recovered routines provide the
 * no-op embedded-object destructor and install a new controller state pair.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Destroy an embedded controller component. The pointer is accepted for the
 * common lifecycle interface but no state, allocation, or hardware is changed.
 */
extern "C" void func_ov043_0220b740(void *component)
{
    (void)component;
}

/*
 * Install two state callbacks/identifiers at +0x24/+0x28 and reset the primary
 * and secondary state counters at +0x04/+0x08. The object is changed in place;
 * there is no return value or SDK effect. The precise callable-versus-identifier
 * meaning of the two values is not yet confirmed.
 */
extern "C" void func_ov043_0220b744(void *object, u32 first, u32 second)
{
    FIELD(u32, object, 0x24) = first;
    FIELD(u32, object, 0x28) = second;
    FIELD(u32, object, 0x04) = 0;
    FIELD(u32, object, 0x08) = 0;
}
