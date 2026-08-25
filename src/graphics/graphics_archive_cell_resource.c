
/*
 * Portable reconstructions of the assembly-selected sprite-cell resource
 * constructor at 0x02070C38 and cached loader at 0x02071800. The field writes,
 * cache offset, magic, allocation size, ownership, and reference-count order
 * follow the exact ARM9 disassembly from the authoritative retail build.
 */
#include "tingle/types.h"

typedef struct GraphicsArchiveCachedResource {
    u8 field_00[0x1c];
    u16 reference_count;
} GraphicsArchiveCachedResource;

extern u8 data_020e5c60[];
extern u8 data_021e9e60[];

extern void GraphicsArchiveResource_Init(void *self, void *archive, const void *source,
                          u32 source_size, u32 resource_id,
                          u16 resource_type);
extern void *GraphicsResourceCache_FindByResourceId(void *cache, u32 resource_id);
extern void GraphicsResourceCache_Append(void *cache, void *resource);
extern void *GraphicsArchive_AllocateCachedHandle(u32 size);
extern void *GraphicsArchive_LoadIndexedPayload(void *archive, u32 resource_id, u32 *size);
extern void *GraphicsArchiveResource_DestroyVariant(void *self);
extern void func_020a7298(void *heap, void *allocation);

void *GraphicsCellResource_Init(void *self, void *archive, const void *source,
                    u32 source_size, u32 resource_id)
{
    u8 *bytes = (u8 *)self;
    const u8 *source_bytes = (const u8 *)source;

    GraphicsArchiveResource_Init(self, archive, source, source_size, resource_id, 2);
    *(void **)(bytes + 0x00) = data_020e5c60;
    *(const void **)(bytes + 0x20) = source;
    *(const u8 **)(bytes + 0x24) = source_bytes + *(const u32 *)(source_bytes + 0x08);
    *(const u8 **)(bytes + 0x28) = source_bytes + *(const u32 *)(source_bytes + 0x10);
    *(const u8 **)(bytes + 0x2c) = source_bytes + *(const u32 *)(source_bytes + 0x18);
    *(const u8 **)(bytes + 0x30) = source_bytes + *(const u32 *)(source_bytes + 0x20);
    return self;
}

/* Non-deleting and allocator-aware deleting destructors at 0x02070CB4 and
 * 0x02070CC8, used by the retail cell-resource vtable. */
void *GraphicsCellResource_Destroy(void *self)
{
    GraphicsArchiveResource_DestroyVariant(self);
    return self;
}

void *GraphicsCellResource_DeleteAllocatorOwned(void *self)
{
    GraphicsArchiveResource_DestroyVariant(self);
    func_020a7298(*(void **)(data_021e9e60 + 4), self);
    return self;
}

void *GraphicsArchive_AcquireCellResource(void *archive, u32 resource_id)
{
    GraphicsArchiveCachedResource *resource;
    const u32 *source;
    u32 source_size;

    resource = (GraphicsArchiveCachedResource *)GraphicsResourceCache_FindByResourceId(
        (u8 *)archive + 0xcc, resource_id);
    if (resource != 0) {
        resource->reference_count++;
    } else {
        source = (const u32 *)GraphicsArchive_LoadIndexedPayload(archive, resource_id,
                                            &source_size);
        if (source != 0 && source[0] == 0x56434520) {
            resource = (GraphicsArchiveCachedResource *)GraphicsArchive_AllocateCachedHandle(0x34);
            if (resource != 0) {
                resource = (GraphicsArchiveCachedResource *)GraphicsCellResource_Init(
                    resource, archive, source, source_size, resource_id);
            }
            resource->reference_count++;
            GraphicsResourceCache_Append((u8 *)archive + 0xcc, resource);
        }
    }
    return resource;
}


