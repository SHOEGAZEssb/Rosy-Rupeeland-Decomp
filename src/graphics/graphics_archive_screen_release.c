#include "tingle/types.h"

/* Release reference-counted screen-map resources from the archive cache. */

typedef struct GraphicsCachedScreen GraphicsCachedScreen;
/* The retail vtable's second slot is the deleting destructor used at zero refs. */
struct GraphicsCachedScreen {
    virtual void destroy(void);
    virtual void destroyAndFree(void);
    u8 field_04[0x18];
    u16 referenceCount;
};

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020702b8(void *cache, void *node);
extern void func_02070280(void *cache, void *node);
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
    if (func_020702b8(cache, resource) == 0)
        return;
    resource->referenceCount--;
    if (resource->referenceCount != 0)
        return;
    func_02070280(cache, resource);
    if (resource != 0)
        resource->destroyAndFree();
}
