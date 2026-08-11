#include "tingle/types.h"

/* Cached archive loading for decoded character graphics resources. */

typedef struct GraphicsArchiveResourceHeader {
    u32 magic;
} GraphicsArchiveResourceHeader;

typedef struct GraphicsArchiveCachedResource {
    u8 field_00[0x1c];
    u16 referenceCount;
} GraphicsArchiveCachedResource;

#ifdef __cplusplus
extern "C" {
#endif

extern void *func_020702d4(void *cache, u32 resourceId);
extern void func_02070244(void *cache, void *resource);
extern void *func_0207142c(void *archive, u32 resourceId, u32 *size);
extern void *func_020713e4(u32 size);
extern void *func_020702f4(void *resource, void *archive, void *source,
                           u32 size, u32 resourceId);

#ifdef __cplusplus
}
#endif

/*
 * Acquire a cached character resource for resourceId, loading and validating
 * its archive payload on a cache miss. The returned resource's 16-bit
 * reference count is incremented; allocation and cache ownership stay with
 * the graphics archive manager.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_02071568(void *archive, u32 resourceId)
{
    GraphicsArchiveCachedResource *resource;
    GraphicsArchiveResourceHeader *source;
    u32 sourceSize;

    resource = (GraphicsArchiveCachedResource *)func_020702d4(
        (u8 *)archive + 0xb4, resourceId);
    if (resource != 0) {
        resource->referenceCount++;
    } else {
        source = (GraphicsArchiveResourceHeader *)func_0207142c(
            archive, resourceId, &sourceSize);
        if (source != 0 &&
            (source->magic == 0x56434720 || source->magic == 0x56434754)) {
            resource = (GraphicsArchiveCachedResource *)func_020713e4(0x2c);
            if (resource != 0) {
                resource = (GraphicsArchiveCachedResource *)func_020702f4(
                    resource, archive, source, sourceSize, resourceId);
            }
            resource->referenceCount++;
            func_02070244((u8 *)archive + 0xb4, resource);
        }
    }
    return resource;
}
