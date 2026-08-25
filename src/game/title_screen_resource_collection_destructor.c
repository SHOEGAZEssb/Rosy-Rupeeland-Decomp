/* Destructor wrapper for the caller-owned screen-resource collection. */
#include "tingle/types.h"

extern void TitleScreenResourceCollection_ReleaseAll(void *collection);

/* Release entries but preserve and return caller-owned collection storage. */
void *TitleScreenResourceCollection_Destroy(void *collection)
{
    TitleScreenResourceCollection_ReleaseAll(collection);
    return collection;
}
