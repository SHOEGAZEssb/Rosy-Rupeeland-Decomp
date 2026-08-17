
/*
 * Portable reconstructions of the sprite-resource prepare veneers at
 * 0x02070418, 0x02070860, and 0x02070d74.  Each lazily resolves the retained
 * retail resource ID through its owning archive and reconstructs only the
 * derived pointers belonging to that resource family.
 */
#include "tingle/types.h"

extern void *GraphicsArchive_LoadIndexedPayload(void *archive, u32 resource_id, u32 *size);

void func_02070418(void *resource)
{
    u8 *bytes = (u8 *)resource;
    u32 size;
    void *source;

    if (*(void **)(bytes + 0x14) != 0)
        return;
    source = GraphicsArchive_LoadIndexedPayload(*(void **)(bytes + 0x04),
                           *(u32 *)(bytes + 0x10), &size);
    *(void **)(bytes + 0x14) = source;
    *(void **)(bytes + 0x20) = source;
    *(u8 **)(bytes + 0x24) = (u8 *)source + 0x0c;
}

void GraphicsSpriteResource_Prepare(void *resource)
{
    u8 *bytes = (u8 *)resource;
    u32 size;
    void *source;

    if (*(void **)(bytes + 0x14) != 0)
        return;
    source = GraphicsArchive_LoadIndexedPayload(*(void **)(bytes + 0x04),
                           *(u32 *)(bytes + 0x10), &size);
    *(void **)(bytes + 0x14) = source;
    *(void **)(bytes + 0x20) = source;
    *(u8 **)(bytes + 0x24) = (u8 *)source + 0x08;
}

void func_02070d74(void *resource)
{
    u8 *bytes = (u8 *)resource;
    u8 *source;
    u32 size;

    if (*(void **)(bytes + 0x14) != 0)
        return;
    source = (u8 *)GraphicsArchive_LoadIndexedPayload(*(void **)(bytes + 0x04),
                                  *(u32 *)(bytes + 0x10), &size);
    *(u8 **)(bytes + 0x14) = source;
    *(u8 **)(bytes + 0x20) = source;
    *(u8 **)(bytes + 0x24) = source + *(u32 *)(source + 0x08);
    *(u8 **)(bytes + 0x28) = source + *(u32 *)(source + 0x10);
    *(u8 **)(bytes + 0x2c) = source + *(u32 *)(source + 0x18);
    *(u8 **)(bytes + 0x30) = source + *(u32 *)(source + 0x20);
}


