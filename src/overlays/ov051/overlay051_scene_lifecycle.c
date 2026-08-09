#include "tingle/types.h"

/* Overlay 51 shared dream-scene base teardown and deleting hook. */

extern "C" void func_0201e28c(void *scene);
extern "C" void Heap_Free(void *allocation);

/*
 * Run the shared scene teardown and return the unchanged `scene` pointer.
 * Scene-manager/SDK state changes; storage is not freed and no direct MMIO occurs.
 */
extern "C" void *func_ov051_0220d658(void *scene)
{
    func_0201e28c(scene);
    return scene;
}

/*
 * Run the shared scene teardown, free `scene`, and return its former address.
 * Heap and scene state change; the result must not be dereferenced.
 */
extern "C" void *func_ov051_0220d66c(void *scene)
{
    func_0201e28c(scene);
    Heap_Free(scene);
    return scene;
}
