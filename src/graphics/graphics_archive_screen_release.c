#include "tingle/types.h"

/* Release reference-counted screen-map resources from the archive cache. */

typedef struct GraphicsCachedScreen GraphicsCachedScreen;
#ifndef __MWERKS__
typedef void (*GraphicsCachedScreenDestructor)(GraphicsCachedScreen *);
typedef struct GraphicsCachedScreenVtable {
    GraphicsCachedScreenDestructor destroy;
    GraphicsCachedScreenDestructor destroyAndFree;
} GraphicsCachedScreenVtable;
#endif
/* The retail vtable's second slot is the deleting destructor used at zero refs. */
struct GraphicsCachedScreen {
#ifdef __MWERKS__
    virtual void destroy(void);
    virtual void destroyAndFree(void);
#else
    GraphicsCachedScreenVtable *vtable;
#endif
    u8 field_04[0x18];
    u16 referenceCount;
};

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsResourceCache_FindNode(void *cache, void *node);
extern void GraphicsResourceCache_Remove(void *cache, void *node);
#ifdef __cplusplus
}
#endif

/*
 * Release one background screen map from archive cache +0xd8. Nonmembers are
 * ignored; the final reference unlinks the node and invokes its deleting
 * destructor. Returns no value and performs no direct GX operation.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_02071cf0(void *archive, GraphicsCachedScreen *resource)
{
    void *cache = (u8 *)archive + 0xd8;
    if (GraphicsResourceCache_FindNode(cache, resource) == 0)
        return;
    resource->referenceCount--;
    if (resource->referenceCount != 0)
        return;
    GraphicsResourceCache_Remove(cache, resource);
    if (resource != 0)
#ifdef __MWERKS__
        resource->destroyAndFree();
#else
        resource->vtable->destroyAndFree(resource);
#endif
}
