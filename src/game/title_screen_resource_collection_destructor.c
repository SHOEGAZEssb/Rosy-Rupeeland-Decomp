/* Destructor wrapper for the caller-owned screen-resource collection. */
#include "tingle/types.h"

extern void func_0209270c(void *collection);

/* Release entries but preserve and return caller-owned collection storage. */
void *func_020926f8(void *collection)
{
    func_0209270c(collection);
    return collection;
}
