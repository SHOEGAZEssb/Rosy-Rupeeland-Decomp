
/*
 * Portable transcriptions of the three retail graphics-archive cache lookup
 * veneers at 0x02071E60..0x02071E8F. These are recovered game-owned helpers;
 * cache storage and returned resource ownership remain with the archive.
 */
#include "tingle/types.h"

extern void *func_020702d4(void *cache, u32 resource_id);
extern void func_02070244(void *cache, void *resource);
extern void *func_0207142c(void *archive, u32 resource_id, u32 *size);
extern void *func_020713e4(u32 size);
extern void func_02070164(void *self, void *archive, const void *source,
                          u32 source_size, u32 resource_id,
                          u16 resource_type);
extern u8 data_020e5c50[];

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

/*
 * Portable transcription of retail func_02071980 (0x02071980..0x02071A23).
 * It acquires a VFD resource from archive cache +0xE4, constructing it from
 * an archive payload with magic " VFD" on a miss. The archive owns both the
 * cached allocation and source payload; callers own one reference.
 */
void *func_02071980(void *archive, u32 resource_id)
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

    source = (u32 *)func_0207142c(archive, resource_id, &source_size);
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

/* Look up a character resource in archive cache +0xB4 without retaining it. */
void *func_02071e60(void *archive, u32 resource_id)
{
    return func_020702d4((u8 *)archive + 0xb4, resource_id);
}

/* Look up a palette resource in archive cache +0xC0 without retaining it. */
void *func_02071e70(void *archive, u32 resource_id)
{
    return func_020702d4((u8 *)archive + 0xc0, resource_id);
}

/* Look up a cell resource in archive cache +0xCC without retaining it. */
void *func_02071e80(void *archive, u32 resource_id)
{
    return func_020702d4((u8 *)archive + 0xcc, resource_id);
}


