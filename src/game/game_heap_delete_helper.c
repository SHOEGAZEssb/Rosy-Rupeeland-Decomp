#include "tingle/heap.h"
#include "tingle/point_2d_s16.h"

/* Provide the CPoint2D<short> deleting destructor from its retail vtable. */

/* Free the supplied allocation and return its now-dangling former address. */
CPoint2DS16 *CPoint2DS16_DestroyAndFree(CPoint2DS16 *object)
{
    Heap_Free(object);
    return object;
}
