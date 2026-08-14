/* Destructor wrapper for caller-owned character-resource collection storage. */
#include "tingle/types.h"

extern void func_020927cc(void *collection);

/* Release entries but preserve and return caller-owned collection storage. */
void *func_020927b8(void *collection)
{
    func_020927cc(collection);
    return collection;
}
