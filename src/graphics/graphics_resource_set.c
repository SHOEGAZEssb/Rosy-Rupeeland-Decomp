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

extern void *func_02071568(void *archive, u32 resourceId);
extern void *func_020716bc(void *archive, u32 resourceId);
extern void *func_020718dc(void *archive, u32 resourceId);

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
 * Release every handle owned by set through func_02072000 and return set.
 * The called teardown helpers may release graphics-library allocations.
 */
GraphicsResourceSet *GraphicsResourceSet_Destroy(GraphicsResourceSet *set)
{
    func_02072000(set);
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
        func_02072000(set);
    }

    set->resource0 = func_02071568(archive, resource0Id);
    set->resource1 = func_020716bc(archive, resource1Id);
    set->resource2 = func_020718dc(archive, resource2Id);
}
