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

extern void *GraphicsResourceCache_FindByResourceId(void *cache, u32 resourceId);
extern void GraphicsResourceCache_Append(void *cache, void *resource);
extern void *GraphicsArchive_LoadIndexedPayload(void *archive, u32 resourceId, u32 *size);
extern void *GraphicsArchive_AllocateCachedHandle(u32 size);
extern void *GraphicsArchiveScreenResource_Init(void *resource, void *archive, void *source,
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
void *GraphicsArchive_AcquireScreenResource(void *archive, u32 resourceId)
{
    GraphicsArchiveCachedResource *resource;
    GraphicsArchiveResourceHeader *source;
    u32 sourceSize;

    resource = (GraphicsArchiveCachedResource *)GraphicsResourceCache_FindByResourceId(
        (u8 *)archive + 0xd8, resourceId);
    if (resource != 0) {
        resource->referenceCount++;
    } else {
        source = (GraphicsArchiveResourceHeader *)GraphicsArchive_LoadIndexedPayload(
            archive, resourceId, &sourceSize);
        if (source != 0 && source->magic == 0x56534320) {
            resource = (GraphicsArchiveCachedResource *)GraphicsArchive_AllocateCachedHandle(0x28);
            if (resource != 0) {
                resource = (GraphicsArchiveCachedResource *)GraphicsArchiveScreenResource_Init(
                    resource, archive, source, sourceSize, resourceId);
            }
            resource->referenceCount++;
            GraphicsResourceCache_Append((u8 *)archive + 0xd8, resource);
        }
    }
    return resource;
}
