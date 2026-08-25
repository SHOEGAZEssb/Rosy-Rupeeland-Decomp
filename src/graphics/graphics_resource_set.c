#include "tingle/graphics_resources.h"

/*
 * Construction, destruction, and archive loading for a three-part graphics
 * resource set. Existing resources are released as a group before replacement.
 * The concrete formats are not yet confirmed, so numbered fields and the
 * address-derived teardown name are retained.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *GraphicsArchive_AcquireCharacterResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquirePaletteResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquireScreenResource(void *archive, u32 resourceId);

#ifdef __cplusplus
}
#endif

/*
 * Initialize set with no owned handles. The set is mutated in place and the
 * function has no return value or direct SDK/hardware effects.
 */
void GraphicsResourceSet_Init(GraphicsResourceSet *set)
{
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}

/*
 * Release every handle owned by set through
 * GraphicsResourceSet_ReleaseHandles and return set. The called teardown
 * helpers may release graphics-library allocations.
 */
GraphicsResourceSet *GraphicsResourceSet_Destroy(GraphicsResourceSet *set)
{
    GraphicsResourceSet_ReleaseHandles(set);
    return set;
}

/*
 * Replace set's handles with the three IDs loaded from archive. Existing
 * resources are released first when resource0 is non-null. The loaders mutate
 * graphics-resource state; this function returns no value.
 */
void GraphicsResourceSet_Load(GraphicsResourceSet *set, void *archive,
                              u32 resource0Id, u32 resource1Id,
                              u32 resource2Id)
{
    if (set->resource0 != 0) {
        GraphicsResourceSet_ReleaseHandles(set);
    }

    set->resource0 = GraphicsArchive_AcquireCharacterResource(archive, resource0Id);
    set->resource1 = GraphicsArchive_AcquirePaletteResource(archive, resource1Id);
    set->resource2 = GraphicsArchive_AcquireScreenResource(archive, resource2Id);
}
