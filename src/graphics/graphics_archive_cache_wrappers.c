
/*
 * Portable transcriptions of the three retail graphics-archive cache lookup
 * veneers at 0x02071E60..0x02071E8F. These are recovered game-owned helpers;
 * cache storage and returned resource ownership remain with the archive.
 */
#include "tingle/types.h"
#include "tingle/heap.h"

extern void *func_020702d4(void *cache, u32 resource_id);
extern void func_02070244(void *cache, void *resource);
extern void *GraphicsArchive_LoadIndexedPayload(void *archive, u32 resource_id, u32 *size);
extern void *func_020713e4(u32 size);
extern void func_02070164(void *self, void *archive, const void *source,
                          u32 source_size, u32 resource_id,
                          u16 resource_type);
extern u8 data_020e5c50[];
extern u8 data_020e5c40[];
extern u8 data_020e5c70[];
extern const char data_020e6908[];
extern const char data_020e6910[];
extern HeapContext gHeapContext;

typedef struct GraphicsArchiveCachedResource {
    u8 field_00[0x1c];
    u16 reference_count;
} GraphicsArchiveCachedResource;

/*
 * Construct the retail VFD cached-resource view (func_020710DC). The common
 * archive header owns the source payload; the three pointers at +0x20 select
 * the VFD table, first entry, and data immediately following its 8-byte
 * entries respectively.
 */
void *func_020710dc(void *self, void *archive, const u32 *source,
                    u32 source_size, u32 resource_id)
{
    u8 *bytes = (u8 *)self;

    func_02070164(self, archive, source, source_size, resource_id, 4);
    *(void **)(bytes + 0x00) = data_020e5c50;
    *(const u32 **)(bytes + 0x20) = source;
    *(const u8 **)(bytes + 0x24) = (const u8 *)source + 8;
    *(const u8 **)(bytes + 0x28) =
        (const u8 *)source + 8 + source[1] * 8;
    return self;
}

/* Construct a cached VPO resource (retail 0x02071170). The archive retains
 * the source buffer; four source-relative tables are exposed at +0x24..+0x30,
 * and the caller owns the returned cache reference. */
void *func_02071170(void *self, void *archive, const u32 *source,
                    u32 source_size, u32 resource_id)
{
    u8 *bytes = (u8 *)self;

    func_02070164(self, archive, source, source_size, resource_id, 5);
    *(void **)bytes = data_020e5c40;
    *(const u32 **)(bytes + 0x20) = source;
    *(const u8 **)(bytes + 0x24) = (const u8 *)source + source[2];
    *(const u8 **)(bytes + 0x28) = (const u8 *)source + source[4];
    *(const u8 **)(bytes + 0x2c) = (const u8 *)source + source[6];
    *(const u8 **)(bytes + 0x30) = (const u8 *)source + source[8];
    return self;
}

/* Construct a cached OWLV resource (retail 0x0207121C). The archive retains
 * the source and the sole payload view begins eight bytes into it. */
void *func_0207121c(void *self, void *archive, const u32 *source,
                    u32 source_size, u32 resource_id)
{
    u8 *bytes = (u8 *)self;

    func_02070164(self, archive, source, source_size, resource_id, 6);
    *(void **)bytes = data_020e5c70;
    *(const u32 **)(bytes + 0x20) = source;
    *(const u8 **)(bytes + 0x24) = (const u8 *)source + 8;
    return self;
}

/*
 * Portable transcription of retail GraphicsArchive_AcquireVfdResource (0x02071980..0x02071A23).
 * It acquires a VFD resource from archive cache +0xE4, constructing it from
 * an archive payload with magic " VFD" on a miss. The archive owns both the
 * cached allocation and source payload; callers own one reference.
 */
void *GraphicsArchive_AcquireVfdResource(void *archive, u32 resource_id)
{
    GraphicsArchiveCachedResource *resource;
    u32 source_size;
    u32 *source;

    resource = (GraphicsArchiveCachedResource *)func_020702d4(
        (u8 *)archive + 0xe4, resource_id);
    if (resource != 0) {
        resource->reference_count++;
        return resource;
    }

    source = (u32 *)GraphicsArchive_LoadIndexedPayload(archive, resource_id, &source_size);
    if (source != 0 && *source == 0x56464420) {
        resource = (GraphicsArchiveCachedResource *)func_020713e4(0x2c);
        if (resource != 0) {
            resource = (GraphicsArchiveCachedResource *)func_020710dc(
                resource, archive, source, source_size, resource_id);
        }
        resource->reference_count++;
        func_02070244((u8 *)archive + 0xe4, resource);
    }
    return resource;
}

/* Acquire a VPO resource from archive cache +0xF0, constructing and retaining
 * one cache-owned 0x34-byte handle on a miss. Invalid IDs/formats return null. */
void *GraphicsArchive_AcquireVpoResource(void *archive, u32 resource_id)
{
    GraphicsArchiveCachedResource *resource;
    u32 source_size;
    u32 *source;

    resource = (GraphicsArchiveCachedResource *)func_020702d4(
        (u8 *)archive + 0xf0, resource_id);
    if (resource != 0) {
        ++resource->reference_count;
        return resource;
    }
    source = (u32 *)GraphicsArchive_LoadIndexedPayload(archive, resource_id, &source_size);
    if (source != 0 && *source == 0x56504f20) {
        resource = (GraphicsArchiveCachedResource *)Heap_Alloc(
            0x34, data_020e6908, 4, &gHeapContext);
        if (resource != 0)
            resource = (GraphicsArchiveCachedResource *)func_02071170(
                resource, archive, source, source_size, resource_id);
        ++resource->reference_count;
        func_02070244((u8 *)archive + 0xf0, resource);
    }
    return resource;
}

/* Acquire an OWLV resource from archive cache +0xFC, constructing and
 * retaining one cache-owned 0x28-byte handle on a miss. */
void *GraphicsArchive_AcquireOwlvResource(void *archive, u32 resource_id)
{
    GraphicsArchiveCachedResource *resource;
    u32 source_size;
    u32 *source;

    resource = (GraphicsArchiveCachedResource *)func_020702d4(
        (u8 *)archive + 0xfc, resource_id);
    if (resource != 0) {
        ++resource->reference_count;
        return resource;
    }
    source = (u32 *)GraphicsArchive_LoadIndexedPayload(archive, resource_id, &source_size);
    if (source != 0 && *source == 0x564c574f) {
        resource = (GraphicsArchiveCachedResource *)Heap_Alloc(
            0x28, data_020e6910, 4, &gHeapContext);
        if (resource != 0)
            resource = (GraphicsArchiveCachedResource *)func_0207121c(
                resource, archive, source, source_size, resource_id);
        ++resource->reference_count;
        func_02070244((u8 *)archive + 0xfc, resource);
    }
    return resource;
}

/* Look up a character resource in archive cache +0xB4 without retaining it. */
void *func_02071e60(void *archive, u32 resource_id)
{
    return func_020702d4((u8 *)archive + 0xb4, resource_id);
}

/* Look up a palette resource in archive cache +0xC0 without retaining it. */
void *GraphicsArchive_FindPaletteResource(void *archive, u32 resource_id)
{
    return func_020702d4((u8 *)archive + 0xc0, resource_id);
}

/* Look up a cell resource in archive cache +0xCC without retaining it. */
void *func_02071e80(void *archive, u32 resource_id)
{
    return func_020702d4((u8 *)archive + 0xcc, resource_id);
}

