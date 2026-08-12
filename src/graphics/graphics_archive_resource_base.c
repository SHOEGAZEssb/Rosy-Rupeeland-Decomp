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
void func_02070160(void *self)
{
    (void)self;
}

/* Initializes the exact 0x20-byte resource header from archive/source
 * metadata. It does not take ownership beyond recording the source pointer. */
void func_02070164(void *self, void *archive, const void *source,
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
void *func_020701a4(void *self)
{
    DestroyResourceData(self);
    return self;
}

/* Heap-deleting destructor; frees payload and header, then returns the former
 * self address as required by the recovered ABI. */
void *func_020701d0(void *self)
{
    DestroyResourceData(self);
    Heap_Free(self);
    return self;
}

/* Second non-deleting destructor variant; frees payload and returns self. */
void *func_02070204(void *self)
{
    DestroyResourceData(self);
    return self;
}

/* Deleting allocator-owned destructor: releases payload first and then frees
 * the header through the archive allocator stored in the global context. */
void *func_0207039c(void *self)
{
    func_02070204(self);
    func_020a7298(*(void **)(data_021e9e60 + 4), self);
    return self;
}

/* Screen-resource deleting destructor sharing the base allocator contract. */
void *func_02070de4(void *self)
{
    return func_0207039c(self);
}

/* Allocator-owned resource deleting destructor sharing the base contract. */
void *func_02071148(void *self)
{
    return func_0207039c(self);
}

/* Derived deleting destructor; frees decoded data at +0x28, the base payload,
 * and finally the header through the archive allocator. */
void *func_020707d4(void *self)
{
    void *decoded;

    *(void **)self = data_020e5c30;
    decoded = *(void **)((u8 *)self + 0x28);
    if (decoded != 0) {
        Heap_Free(decoded);
    }
    func_02070204(self);
    func_020a7298(*(void **)(data_021e9e60 + 4), self);
    return self;
}
