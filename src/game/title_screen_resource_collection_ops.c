/* Release, append, and access operations for screen-resource collections. */
#include "tingle/types.h"

typedef struct TitleScreenResourceCollection {
    void *entries[16];
    s32 count;
} TitleScreenResourceCollection;

extern void *data_020f4e18;
extern void GraphicsArchive_ReleaseScreenResource(void *archive, void *resource);
extern void *GraphicsArchive_AcquireScreenResource(void *archive, u32 resourceId);

/* Release every live screen resource and reset the collection. */
void func_0209270c(TitleScreenResourceCollection *collection)
{
    s32 index;

    for (index = 0; index < collection->count; ++index) {
        GraphicsArchive_ReleaseScreenResource(data_020f4e18, collection->entries[index]);
        collection->entries[index] = 0;
    }
    collection->count = 0;
}

/* Load and append one resource unless the fixed collection is full. */
void func_02092754(TitleScreenResourceCollection *collection, u32 resourceId)
{
    if (collection->count >= 16)
        return;
    collection->entries[collection->count] =
        GraphicsArchive_AcquireScreenResource(data_020f4e18, resourceId);
    ++collection->count;
}

/* Return one entry; callers provide a retail-valid index. */
void *TitleScreenResourceCollection_Get(TitleScreenResourceCollection *collection, s32 index)
{
    return collection->entries[index];
}
