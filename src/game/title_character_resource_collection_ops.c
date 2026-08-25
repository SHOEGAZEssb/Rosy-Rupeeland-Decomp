/* Release and append operations for character-resource collections. */
#include "tingle/types.h"

typedef struct TitleCharacterResourceCollection {
    void *entries[8];
    s32 count;
} TitleCharacterResourceCollection;

extern void *data_020f4e18;
extern void GraphicsArchive_ReleaseResourceE4(void *archive, void *resource);
extern void *GraphicsArchive_AcquireVfdResource(void *archive, u32 resourceId);

/* Release every live character resource and reset the collection. */
void TitleCharacterResourceCollection_ReleaseAll(TitleCharacterResourceCollection *collection)
{
    s32 index;

    for (index = 0; index < collection->count; ++index) {
        GraphicsArchive_ReleaseResourceE4(data_020f4e18, collection->entries[index]);
        collection->entries[index] = 0;
    }
    collection->count = 0;
}

/* Load and append one resource unless the fixed collection is full. */
void TitleCharacterResourceCollection_Append(TitleCharacterResourceCollection *collection,
                   u32 resourceId)
{
    if (collection->count >= 8)
        return;
    collection->entries[collection->count] =
        GraphicsArchive_AcquireVfdResource(data_020f4e18, resourceId);
    ++collection->count;
}
