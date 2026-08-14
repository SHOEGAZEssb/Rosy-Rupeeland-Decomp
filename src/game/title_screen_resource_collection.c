/*
 * Fixed-capacity collection of screen resources used by scene presentation.
 * Entries are owned by the shared graphics archive and released on teardown.
 */
#include "tingle/types.h"

typedef struct TitleScreenResourceCollection {
    void *entries[16];
    s32 count;
} TitleScreenResourceCollection;

extern void *data_020f4e18;
extern void func_02071cf0(void *archive, void *resource);
extern void *func_020718dc(void *archive, u32 resourceId);

/* Initialize an empty 16-entry screen-resource collection. */
void *func_020926d8(TitleScreenResourceCollection *collection)
{
    s32 index;
    void *empty = 0;

    for (index = 0; index < 16; ++index)
        collection->entries[index] = empty;
    collection->count = 0;
    return collection;
}
