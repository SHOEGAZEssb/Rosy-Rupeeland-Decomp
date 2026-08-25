/* Destructor wrapper for caller-owned character-resource collection storage. */
#include "tingle/types.h"

extern void TitleCharacterResourceCollection_ReleaseAll(void *collection);

/* Release entries but preserve and return caller-owned collection storage. */
void *TitleCharacterResourceCollection_Destroy(void *collection)
{
    TitleCharacterResourceCollection_ReleaseAll(collection);
    return collection;
}
