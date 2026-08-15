#include "tingle/types.h"

/* Uncached archive loading for decoded palette graphics resources. */

typedef struct GraphicsArchiveResourceHeader {
    u32 magic;
} GraphicsArchiveResourceHeader;

#ifdef __cplusplus
extern "C" {
#endif

extern void *func_0207142c(void *archive, u32 resourceId, u32 *size);
extern void *func_020713e4(u32 size);
extern void *func_02070750(void *resource, void *archive, void *source,
                           u32 size, u32 resourceId);

#ifdef __cplusplus
}
#endif

/*
 * Load and validate one VCL palette payload without consulting or populating
 * the archive cache. The returned 0x2C-byte resource is owned by the caller.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_02071798(void *archive, u32 resourceId)
{
    GraphicsArchiveResourceHeader *source;
    /* Retail leaves the failure result undefined; host I/O rejects it. */
    void *resource
#ifndef __MWERKS__
        = 0
#endif
        ;
    u32 sourceSize;

    source = (GraphicsArchiveResourceHeader *)func_0207142c(
        archive, resourceId, &sourceSize);
    if (source != 0 && source->magic == 0x56434c20) {
        resource = func_020713e4(0x2c);
        if (resource != 0)
            resource = func_02070750(resource, archive, source, sourceSize,
                                     resourceId);
    }
    return resource;
}
