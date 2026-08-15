#include "tingle/types.h"

/* Overlay 94 non-deleting destructor for the title/menu auxiliary effect list. */

extern const u8 data_ov094_02219e70[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *list);
#ifdef __cplusplus
}
#endif

/*
 * Restores the overlay dispatch record, releases entries through the inherited
 * list destructor, and returns the same list pointer.
 */
extern "C" void *func_ov094_02217c54(void *list)
{
    *(const void **)list = data_ov094_02219e70;
    PresentationList_DeleteAll(list);
    return list;
}
