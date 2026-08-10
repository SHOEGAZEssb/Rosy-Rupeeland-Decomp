#include "tingle/ncl_file.h"
#include "tingle/heap.h"

/*
 * CNclFile reader for Nintendo color-palette resources. It inherits the
 * NitroFile buffer owner, validates and parses an LZ8-expanded palette block,
 * copies its 16-bit color payload, and flushes the resulting heap range.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern char data_020d410c[];
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void func_020b4554(void *address, u32 size);
extern void OS_Halt(void);

#ifdef __cplusplus
}
#endif

/* Construct the NitroFile base, install the CNclFile vtable, and return self. */
NclFile *NclFile_Init(NclFile *self)
{
    NitroFile_Init(&self->base);
    self->base.vtable = (const NitroFileVTable *)&data_020d40ec;
    return self;
}

/* Destroy the inherited palette payload through NitroFile and return self. */
NclFile *NclFile_Destroy(NclFile *self)
{
    NitroFile_DestroyBase(&self->base);
    return self;
}

/* Destroy the inherited payload, free the object, and return its former address. */
NclFile *NclFile_DestroyAndFree(NclFile *self)
{
    NitroFile_DestroyBase(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Parse a decompressed CNclFile resource. Its header +0x0c halfword locates a
 * block; multiplying the block words at +0x08 and +0x0c and then doubling
 * gives the byte count for 16-bit colors beginning at +0x10. The function
 * allocates, copies, cache-flushes, attaches the payload, and returns one.
 */
s32 NclFile_ParseResource(NclFile *self, const void *resource)
{
    const u8 *header = (const u8 *)resource;
    const u8 *block = header + *(const u16 *)(header + 0xc);
    u32 size = (*(const u32 *)(block + 0x8) *
                *(const u32 *)(block + 0xc)) << 1;

    self->base.data = func_02003e20(size, data_020d410c, 4, &gHeapContext);
    MI_CpuCopy8(block + 0x10, self->base.data, size);
    func_020b4554(self->base.data, size);
    self->base.size = size;
    return 1;
}

/*
 * Reset self, read and LZ8-expand one palette resource, and compare its word
 * at expanded offset +4 with the CNclFile signature. A mismatch invokes
 * OS_Halt; success parses the inner resource, frees the temporary, and returns
 * one. File, heap, decompression, and cache effects come from the shared path.
 */
s32 NclFile_LoadCompressedFromFile(NclFile *self, GameFile *file,
                                   s32 offset, u32 compressedSize)
{
    u8 *expanded;

    NitroFile_Clear(&self->base);
    expanded = (u8 *)NitroFile_ReadCompressedLz8(&self->base, file, offset, compressedSize);
    if (*(const u32 *)(expanded + 4) != NclFile_GetSignature(self)) {
        OS_Halt();
    }
    NclFile_ParseResource(self, expanded + 4);
    func_02003e38(expanded);
    return 1;
}

/* Build and return the confirmed four-byte CNclFile resource signature. */
#ifndef MATCHING
u32 NclFile_GetSignature(const NclFile *self)
{
    u8 signature[4];

    (void)self;
    signature[0] = 'N';
    signature[1] = 'C';
    signature[2] = 'C';
    signature[3] = 'L';
    return *(const u32 *)signature;
}
#endif
