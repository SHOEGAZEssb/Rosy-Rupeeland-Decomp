#include "tingle/types.h"

/* Cached archive loading for decoded background screen-map resources. */

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
extern void *func_02070d88(void *resource, void *archive, void *source,
                           u32 size, u32 resourceId);

#ifdef __cplusplus
}
#endif

/*
 * Acquire a cached screen-map resource for resourceId. A cache miss loads a
 * payload with magic 0x56534320, constructs its 0x28-byte handle, increments
 * the 16-bit reference count, and inserts it into archive cache +0xD8.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_020718dc(void *archive, u32 resourceId)
{
    GraphicsArchiveCachedResource *resource;
    GraphicsArchiveResourceHeader *source;
    u32 sourceSize;

    resource = (GraphicsArchiveCachedResource *)func_020702d4(
        (u8 *)archive + 0xd8, resourceId);
    if (resource != 0) {
        resource->referenceCount++;
        return resource;
    }

    source = (GraphicsArchiveResourceHeader *)func_0207142c(
        archive, resourceId, &sourceSize);
    if (source != 0 && source->magic == 0x56534320) {
        resource = (GraphicsArchiveCachedResource *)func_020713e4(0x28);
        if (resource != 0) {
            resource = (GraphicsArchiveCachedResource *)func_02070d88(
                resource, archive, source, sourceSize, resourceId);
        }
        resource->referenceCount++;
        func_02070244((u8 *)archive + 0xd8, resource);
    }
    return resource;
}
