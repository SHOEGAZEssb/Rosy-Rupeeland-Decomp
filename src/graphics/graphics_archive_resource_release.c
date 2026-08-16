
/*
 * Portable reconstruction of the assembly-selected cell-resource release at
 * retail address 0x02071C94.
 *
 * The archive owns an intrusive cache at +0xCC.  A cached resource carries a
 * 16-bit reference count at +0x1C; the last release unlinks the resource and
 * invokes vtable slot 1, the allocator-aware deleting destructor.  Resources
 * not present in this archive are left untouched, exactly as on the ARM9.
 */
#include "tingle/types.h"

extern void func_02002728(void *allocation);

/*
 * Release the texture allocation owned by a sprite resource (0x020703d8).
 * Retail retains resources marked by flags bit 24; otherwise it clears the
 * derived pointer before freeing and nulling the allocation owner field.
 */
void func_020703d8(void *resource)
{
    u8 *bytes = (u8 *)resource;
    void **allocation = (void **)(bytes + 0x14);

    if (*allocation == 0 || ((*(u32 *)(bytes + 0x28) >> 24) & 1) != 0)
        return;
    *(void **)(bytes + 0x24) = 0;
    func_02002728(*allocation);
    *allocation = 0;
}

/* Release the palette allocation and invalidate its derived pointer. */
void func_02070830(void *resource)
{
    u8 *bytes = (u8 *)resource;
    void **allocation = (void **)(bytes + 0x14);

    if (*allocation == 0)
        return;
    *(void **)(bytes + 0x24) = 0;
    func_02002728(*allocation);
    *allocation = 0;
}

/* Release the optional alternate decoded buffer at +0x28 and clear its owner
 * field. The resource remains caller-owned; a null buffer is a no-op. */
void func_02070934(void *resource)
{
    void **allocation = (void **)((u8 *)resource + 0x28);

    if (*allocation == 0)
        return;
    func_02002728(*allocation);
    *allocation = 0;
}

/* Release a cell/animation allocation and all four derived table pointers. */
void func_02070d38(void *resource)
{
    u8 *bytes = (u8 *)resource;
    void **allocation = (void **)(bytes + 0x14);

    if (*allocation == 0)
        return;
    *(void **)(bytes + 0x24) = 0;
    *(void **)(bytes + 0x28) = 0;
    *(void **)(bytes + 0x2c) = 0;
    *(void **)(bytes + 0x30) = 0;
    func_02002728(*allocation);
    *allocation = 0;
}

typedef void (*GraphicsResourceDeletingDestructor)(void *resource);

extern void *func_020702b8(void *cache, void *resource);
extern void func_02070280(void *cache, void *resource);

static void ReleaseCachedResource(void *archive, void *resource,
                                  u32 cache_offset)
{
    void *cache = (u8 *)archive + cache_offset;
    u16 *reference_count;
    GraphicsResourceDeletingDestructor *vtable;

    if (func_020702b8(cache, resource) == 0)
        return;
    reference_count = (u16 *)((u8 *)resource + 0x1c);
    (*reference_count)--;
    if (*reference_count != 0)
        return;
    func_02070280(cache, resource);
    if (resource == 0)
        return;
    vtable = *(GraphicsResourceDeletingDestructor **)resource;
    vtable[1](resource);
}

void func_02071c94(void *archive, void *resource)
{
    ReleaseCachedResource(archive, resource, 0xcc);
}

/* Releases the resource family stored in archive cache +0xe4. */
void func_02071d4c(void *archive, void *resource)
{
    ReleaseCachedResource(archive, resource, 0xe4);
}

/* Releases the resource family stored in archive cache +0xf0. */
void func_02071da8(void *archive, void *resource)
{
    ReleaseCachedResource(archive, resource, 0xf0);
}

/* Releases the resource family stored in archive cache +0xfc. */
void func_02071e04(void *archive, void *resource)
{
    ReleaseCachedResource(archive, resource, 0xfc);
}
