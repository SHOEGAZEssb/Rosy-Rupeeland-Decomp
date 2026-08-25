/*
 * Recovered graphics archive resource base and destructor variants. These
 * functions preserve the retail split between heap payloads and allocator-
 * owned resource headers.
 */
#include "tingle/heap.h"
#include "tingle/types.h"

extern u8 data_020e5c90[];
extern u8 data_020e5c30[];
extern u8 data_021e9e60[];
extern void func_020a7298(void *heap, void *allocation);

/* Base virtual no-op; it accepts the resource and changes no state. */
void GraphicsArchiveResource_NoOpHook(void *self)
{
    (void)self;
}

/* Initializes the exact 0x20-byte resource header from archive/source
 * metadata. It does not take ownership beyond recording the source pointer. */
void GraphicsArchiveResource_Init(void *self, void *archive, const void *source,
                   u32 source_size, u32 resource_id, u16 resource_type)
{
    u8 *bytes = (u8 *)self;

    *(void **)(bytes + 0x00) = data_020e5c90;
    *(void **)(bytes + 0x04) = archive;
    *(u32 *)(bytes + 0x08) = 0;
    *(u32 *)(bytes + 0x0c) = 0;
    *(u32 *)(bytes + 0x10) = resource_id;
    *(const void **)(bytes + 0x14) = source;
    *(u32 *)(bytes + 0x18) = source_size;
    *(u16 *)(bytes + 0x1c) = 0;
    *(u16 *)(bytes + 0x1e) = resource_type;
}

/* Restores the base vtable and frees the optional payload at offset 0x14. */
static void DestroyResourceData(void *self)
{
    void *allocation = *(void **)((u8 *)self + 0x14);

    *(void **)self = data_020e5c90;
    if (allocation != 0) {
        Heap_Free(allocation);
    }
}

/* Non-deleting destructor; frees payload data and returns self. */
void *GraphicsArchiveResource_Destroy(void *self)
{
    DestroyResourceData(self);
    return self;
}

/* Heap-deleting destructor; frees payload and header, then returns the former
 * self address as required by the recovered ABI. */
void *GraphicsArchiveResource_DestroyAndFree(void *self)
{
    DestroyResourceData(self);
    Heap_Free(self);
    return self;
}

/* Second non-deleting destructor variant; frees payload and returns self. */
void *GraphicsArchiveResource_DestroyVariant(void *self)
{
    DestroyResourceData(self);
    return self;
}

/* Deleting allocator-owned destructor: releases payload first and then frees
 * the header through the archive allocator stored in the global context. */
void *GraphicsArchiveResource_DeleteAllocatorOwned(void *self)
{
    GraphicsArchiveResource_DestroyVariant(self);
    func_020a7298(*(void **)(data_021e9e60 + 4), self);
    return self;
}

/* Screen-resource deleting destructor sharing the base allocator contract. */
void *GraphicsScreenResource_Delete(void *self)
{
    return GraphicsArchiveResource_DeleteAllocatorOwned(self);
}

/* Allocator-owned resource deleting destructor sharing the base contract. */
void *GraphicsArchiveResource_DeleteAllocatorOwnedVariant(void *self)
{
    return GraphicsArchiveResource_DeleteAllocatorOwned(self);
}

/* Heap-deleting resource destructor at retail 0x02071200. The optional base
 * payload is released first, then the caller-owned header returns to Heap. */
void *GraphicsArchiveResource_DeleteHeapPrimary(void *self)
{
    GraphicsArchiveResource_DestroyVariant(self);
    Heap_Free(self);
    return self;
}

/* Equivalent deleting destructor retained at retail 0x02071278 for the
 * adjacent resource subtype and its distinct vtable entry. */
void *GraphicsArchiveResource_DeleteHeapSecondary(void *self)
{
    GraphicsArchiveResource_DestroyVariant(self);
    Heap_Free(self);
    return self;
}

/* Derived deleting destructor; frees decoded data at +0x28, the base payload,
 * and finally the header through the archive allocator. */
void *GraphicsDecodedResource_DeleteAllocatorOwned(void *self)
{
    void *decoded;

    *(void **)self = data_020e5c30;
    decoded = *(void **)((u8 *)self + 0x28);
    if (decoded != 0) {
        Heap_Free(decoded);
    }
    GraphicsArchiveResource_DestroyVariant(self);
    func_020a7298(*(void **)(data_021e9e60 + 4), self);
    return self;
}
