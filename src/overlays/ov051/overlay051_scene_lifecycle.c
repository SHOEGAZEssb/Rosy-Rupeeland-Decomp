#include "tingle/field_effect.h"
#include "tingle/types.h"

/* Overlay 51 shared dream-scene FieldEffect teardown and deleting hook. */


extern "C" void Heap_Free(void *allocation);

/*
 * Run the shared scene teardown and return the unchanged `scene` pointer.
 * Scene-manager/SDK state changes; storage is not freed and no direct MMIO occurs.
 */
extern "C" void *func_ov051_0220d658(void *scene)
{
    FieldEffect_DestroyBase(scene);
    return scene;
}

/*
 * Run the shared scene teardown, free `scene`, and return its former address.
 * Heap and scene state change; the result must not be dereferenced.
 */
extern "C" void *func_ov051_0220d66c(void *scene)
{
    FieldEffect_DestroyBase(scene);
    Heap_Free(scene);
    return scene;
}
