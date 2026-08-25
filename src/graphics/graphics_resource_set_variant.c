#include "tingle/graphics_resources.h"

/*
 * Construction, replacement loading, and teardown for the second recovered
 * three-handle graphics resource set. It shares the first two resource
 * families with GraphicsResourceSet but uses a distinct third loader and
 * destructor; the concrete format is not yet confirmed.
 */

/* Each decoded handle retains its owning graphics archive at offset 0x04. */
typedef struct GraphicsResourceHandleVariant {
    u32 field_00;
    void *archive_04;
} GraphicsResourceHandleVariant;

#ifdef __cplusplus
extern "C" {
#endif

extern void *GraphicsArchive_AcquireCharacterResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquirePaletteResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquireVpoResource(void *archive, u32 resourceId);
extern void GraphicsArchive_ReleaseCharacterResource(void *archive, void *resource);
extern void GraphicsArchive_ReleasePaletteResource(void *archive, void *resource);
extern void GraphicsArchive_ReleaseVpoResource(void *archive, void *resource);

#ifdef __cplusplus
}
#endif

/*
 * Initialize set with three null handles. The set is mutated in place and the
 * function has no return value or direct SDK/hardware effects.
 */
void GraphicsResourceSetVariant_Init(GraphicsResourceSet *set)
{
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}

/*
 * Release every handle owned by set through
 * GraphicsResourceSetVariant_ReleaseHandles and return set. The called
 * teardown helpers may release graphics-library allocations.
 */
GraphicsResourceSet *GraphicsResourceSetVariant_Destroy(
    GraphicsResourceSet *set)
{
    GraphicsResourceSetVariant_ReleaseHandles(set);
    return set;
}

/*
 * Replace set's handles with the three IDs loaded from archive. Existing
 * resources are released first when resource0 is non-null. The third handle
 * uses the distinct GraphicsArchive_AcquireVpoResource family; the function returns no value.
 */
void GraphicsResourceSetVariant_Load(GraphicsResourceSet *set, void *archive,
                                     u32 resource0Id, u32 resource1Id,
                                     u32 resource2Id)
{
    if (set->resource0 != 0) {
        GraphicsResourceSetVariant_ReleaseHandles(set);
    }

    set->resource0 = GraphicsArchive_AcquireCharacterResource(archive, resource0Id);
    set->resource1 = GraphicsArchive_AcquirePaletteResource(archive, resource1Id);
    set->resource2 = GraphicsArchive_AcquireVpoResource(archive, resource2Id);
}

/*
 * If resource0 is non-null, release all three handles from their retained
 * archives through the appropriate cache families, then clear the set. A null
 * resource0 marks the complete set empty and causes no state change. Final
 * references may unlink and destroy their decoded graphics resources.
 */
void GraphicsResourceSetVariant_ReleaseHandles(GraphicsResourceSet *set)
{
    GraphicsResourceHandleVariant *resource0 =
        (GraphicsResourceHandleVariant *)set->resource0;
    GraphicsResourceHandleVariant *resource1;
    GraphicsResourceHandleVariant *resource2;

    if (resource0 == 0) {
        return;
    }

    GraphicsArchive_ReleaseCharacterResource(resource0->archive_04, resource0);
    resource1 = (GraphicsResourceHandleVariant *)set->resource1;
    GraphicsArchive_ReleasePaletteResource(resource1->archive_04, resource1);
    resource2 = (GraphicsResourceHandleVariant *)set->resource2;
    GraphicsArchive_ReleaseVpoResource(resource2->archive_04, resource2);
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}
