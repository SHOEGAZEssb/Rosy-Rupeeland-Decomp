#include "tingle/types.h"

/* Release reference-counted character and palette resources from caches. */

typedef struct GraphicsCachedResource GraphicsCachedResource;
#ifndef __MWERKS__
typedef void (*GraphicsCachedResourceDestructor)(GraphicsCachedResource *);
typedef struct GraphicsCachedResourceVtable {
    GraphicsCachedResourceDestructor destroy;
    GraphicsCachedResourceDestructor destroyAndFree;
} GraphicsCachedResourceVtable;
#endif
/* The retail vtable's second slot is the deleting destructor used at zero refs. */
struct GraphicsCachedResource {
#ifdef __MWERKS__
    virtual void destroy(void);
    virtual void destroyAndFree(void);
#else
    GraphicsCachedResourceVtable *vtable;
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
 * Release one character resource from archive cache +0xb4. Nonmembers are
 * ignored; the final reference unlinks the node and invokes its deleting
 * destructor. Returns no value and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void GraphicsArchive_ReleaseCharacterResource(void *archive, GraphicsCachedResource *resource)
{
    void *cache = (u8 *)archive + 0xb4;
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

/*
 * Release one palette resource from archive cache +0xc0. Nonmembers are
 * ignored; the final reference unlinks the node and invokes its deleting
 * destructor. Returns no value and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void GraphicsArchive_ReleasePaletteResource(void *archive, GraphicsCachedResource *resource)
{
    void *cache = (u8 *)archive + 0xc0;
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
