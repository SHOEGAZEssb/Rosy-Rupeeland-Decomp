#include "tingle/types.h"

/* Overlay 94 deleting destructor for the title/menu auxiliary effect list. */

extern const u8 data_ov094_02219e70[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *memory);
extern void PresentationList_DeleteAll(void *list);
#ifdef __cplusplus
}
#endif

/*
 * Restores the overlay dispatch record, destroys inherited list entries,
 * frees the allocation, and returns the original pointer.
 */
extern "C" void *func_ov094_02219bb0(void *list)
{
    *(const void **)list = data_ov094_02219e70;
    PresentationList_DeleteAll(list);
    Heap_Free(list);
    return list;
}
