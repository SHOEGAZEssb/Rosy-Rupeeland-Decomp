#include "tingle/graphics_resources.h"

/*
 * Lazily constructed pair of three-handle graphics resource sets. The loader
 * gives both sets resources 0x9003 and 0x9004, then selects 0x9005 for the
 * first set and 0x9006 for the second. The exact semantics of the three
 * handles are not yet confirmed, so the recovered interface keeps them
 * numbered rather than assigning speculative resource-type names.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void __construct_array(void *array, u32 count, u32 elementSize,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void __destroy_arr(void *array, u32 count, u32 elementSize,
                          void (*destructor)(void *));
extern void __register_global_object(void *object, void (*destructor)(void *),
                                     void *record);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *set);
extern GraphicsResourceSet *GraphicsResourceSet_Destroy(
    GraphicsResourceSet *set);
extern void GraphicsResourceSet_Load(GraphicsResourceSet *set, void *archive,
                                     u32 resource0Id, u32 resource1Id,
                                     u32 resource2Id);

extern void *data_020f4e18;
extern u32 gGraphicsResourceSetsGuard;
extern u8 gGraphicsResourceSetsDestructorRecord[];

#ifdef __cplusplus
}
#endif

/* Destroy both resource sets in reverse order and return their base address. */
GraphicsResourceSet *GraphicsResourceSets_Destroy(GraphicsResourceSet *sets)
{
    __destroy_arr(sets, 2, sizeof(GraphicsResourceSet),
                  (void (*)(void *))GraphicsResourceSet_Destroy);
    return sets;
}

/*
 * Load the two fixed resource-ID triplets from the current archive. Existing
 * handles are released by GraphicsResourceSet_Load before it replaces them.
 */
void GraphicsResourceSets_Load(GraphicsResourceSet *sets)
{
    GraphicsResourceSet_Load(&sets[0], data_020f4e18, 0x9003, 0x9004, 0x9005);
    GraphicsResourceSet_Load(&sets[1], data_020f4e18, 0x9003, 0x9004, 0x9006);
}

/*
 * Construct the global pair once, register its shutdown destructor, and
 * return the pair. The low guard bit records successful registration.
 */
GraphicsResourceSet *GraphicsResourceSets_Get(void)
{
    if (!(gGraphicsResourceSetsGuard & 1)) {
        __construct_array(gGraphicsResourceSets, 2,
                          sizeof(GraphicsResourceSet),
                          (void (*)(void *))GraphicsResourceSet_Init,
                          (void (*)(void *))GraphicsResourceSet_Destroy);
        __register_global_object(
            gGraphicsResourceSets,
            (void (*)(void *))GraphicsResourceSets_Destroy,
            gGraphicsResourceSetsDestructorRecord);
        gGraphicsResourceSetsGuard |= 1;
    }
    return gGraphicsResourceSets;
}
