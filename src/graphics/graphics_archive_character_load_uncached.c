#include "tingle/types.h"

/* Uncached archive loading for decoded character graphics resources. */

typedef struct GraphicsArchiveResourceHeader {
    u32 magic;
} GraphicsArchiveResourceHeader;

#ifdef __cplusplus
extern "C" {
#endif

extern void *GraphicsArchive_LoadIndexedPayload(void *archive, u32 resourceId, u32 *size);
extern void *func_020713e4(u32 size);
extern void *func_020702f4(void *resource, void *archive, void *source,
                           u32 size, u32 resourceId);

#ifdef __cplusplus
}
#endif

/*
 * Load and validate one character payload without consulting or populating
 * the archive cache. The returned 0x2C-byte resource is owned by the caller;
 * valid payloads may use either the GCV or GCVT retail magic.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_0207164c(void *archive, u32 resourceId)
{
    GraphicsArchiveResourceHeader *source;
    /* Retail leaves the failure result undefined; host I/O rejects it. */
    void *resource
#ifndef __MWERKS__
        = 0
#endif
        ;
    u32 sourceSize;

    source = (GraphicsArchiveResourceHeader *)GraphicsArchive_LoadIndexedPayload(
        archive, resourceId, &sourceSize);
    if (source != 0 &&
        (source->magic == 0x56434720 || source->magic == 0x56434754)) {
        resource = func_020713e4(0x2c);
        if (resource != 0)
            resource = func_020702f4(resource, archive, source, sourceSize,
                                     resourceId);
    }
    return resource;
}
