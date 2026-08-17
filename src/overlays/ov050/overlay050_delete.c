#include "tingle/types.h"

/* Overlay 50 deleting hooks for effect and list-element storage. */

extern "C" u8 data_ov050_0220e384[];
extern "C" void Overlay050Effect_Destroy(void *effect);
extern "C" void Heap_Free(void *allocation);

/*
 * Restore the base-effect vtable, run its teardown, free `effect`, and return
 * its former address. Effect/heap state changes; the result is not dereferenceable.
 */
extern "C" void *func_ov050_0220e2d8(void *effect)
{
    *(void **)effect = data_ov050_0220e384;
    Overlay050Effect_Destroy(effect);
    Heap_Free(effect);
    return effect;
}

/*
 * Free `element` and return its former address identity. Heap state changes;
 * the result must not be dereferenced and no hardware effect occurs.
 */
extern "C" void *func_ov050_0220e300(void *element)
{
    Heap_Free(element);
    return element;
}
