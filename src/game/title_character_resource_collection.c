/*
 * Fixed-capacity collection of character/palette resources. The shared
 * graphics archive owns loaded entries until this collection releases them.
 */
#include "tingle/types.h"

typedef struct TitleCharacterResourceCollection {
    void *entries[8];
    s32 count;
} TitleCharacterResourceCollection;

extern void *data_020f4e18;
extern void func_02071d4c(void *archive, void *resource);
extern void *func_02071980(void *archive, u32 resourceId);

/* Initialize an empty eight-entry character-resource collection. */
void *func_02092798(TitleCharacterResourceCollection *collection)
{
    s32 index;
    void *empty = 0;

    for (index = 0; index < 8; ++index)
        collection->entries[index] = empty;
    collection->count = 0;
    return collection;
}
