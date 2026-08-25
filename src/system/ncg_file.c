#include "tingle/ncg_file.h"
#include "tingle/heap.h"

/*
 * CNcgFile reader for Nintendo character-graphics resources. The class extends
 * NitroFile with tile dimensions and pixel format, validates a decompressed
 * resource, copies its graphics payload into owned heap memory, and flushes
 * the copied range for hardware-visible use.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern char gNcgFileBufferTag[];
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void func_020b4554(void *address, u32 size);
extern void OS_Halt(void);

#ifdef __cplusplus
}
#endif

/*
 * Construct the NitroFile base, install the CNcgFile vtable, clear both tile
 * dimensions, and return self. The format word remains unspecified by retail.
 */
NcgFile *NcgFile_Init(NcgFile *self)
{
    NitroFile_Init(&self->base);
    self->base.vtable = &gNcgFileVTable;
    self->width = 0;
    self->height = 0;
    return self;
}

/* Destroy the inherited payload through NitroFile and return self. */
NcgFile *NcgFile_Destroy(NcgFile *self)
{
    NitroFile_DestroyBase(&self->base);
    return self;
}

/* Destroy the inherited payload, free the object, and return its former address. */
NcgFile *NcgFile_DestroyAndFree(NcgFile *self)
{
    NitroFile_DestroyBase(&self->base);
    Heap_Free(self);
    return self;
}

/*
 * Parse a decompressed CNcgFile resource. The section offset at header +0x0c
 * locates a block whose width, height, and format are at +0x08..+0x10; its
 * payload begins at +0x14. A tagged aligned buffer is allocated, copied, cache
 * flushed through func_020b4554, attached to self, and success (one) returned.
 */
s32 NcgFile_ParseResource(NcgFile *self, const void *resource)
{
    const u8 *header = (const u8 *)resource;
    const u8 *block = header + *(const u16 *)(header + 0xc);
    u32 size;

    self->width = *(const u32 *)(block + 0x8);
    self->height = *(const u32 *)(block + 0xc);
    self->format = *(const u32 *)(block + 0x10);
    size = NcgFile_GetPayloadSize(self);
    self->base.data = Heap_AllocAlternateEntry(size, gNcgFileBufferTag, 4, &gHeapContext);
    MI_CpuCopy8(block + 0x14, self->base.data, size);
    func_020b4554(self->base.data, size);
    self->base.size = size;
    return 1;
}

/*
 * Reset self, read and LZ8-expand one resource from file, and validate the
 * four-byte CNcgFile signature stored at expanded offset +4. A mismatch calls
 * OS_Halt; otherwise the inner resource at +4 is parsed, the temporary expanded
 * buffer is freed, and one is returned.
 */
s32 NcgFile_LoadCompressedFromFile(NcgFile *self, GameFile *file,
                                   s32 offset, u32 compressedSize)
{
    u8 *expanded;

    NitroFile_Clear(&self->base);
    expanded = (u8 *)NitroFile_ReadCompressedLz8(&self->base, file, offset, compressedSize);
    if (*(const u32 *)(expanded + 4) != NcgFile_GetSignature(self)) {
        OS_Halt();
    }
    NcgFile_ParseResource(self, expanded + 4);
    Heap_FreeAlternateEntry(expanded);
    return 1;
}

/*
 * Return the graphics payload size derived from signed tile dimensions and
 * format: format zero uses 32 bytes per tile, while formats one and two use
 * 64. For other formats retail returns the incoming object address value.
 */
#ifndef MATCHING
u32 NcgFile_GetPayloadSize(const NcgFile *self)
{
    if (self->format != 0) {
        if (self->format == 1 || self->format == 2) {
            return self->width * self->height << 6;
        }
        return (u32)self;
    }
    return self->width * self->height << 5;
}
#else
/* Matching counterpart of the documented portable size calculation above. */
asm u32 NcgFile_GetPayloadSize(const NcgFile *self)
{
    ldr r1, [r0, #0x10]
    cmp r1, #0
    beq zero_format
    cmp r1, #1
    cmpne r1, #2
    ldreqsh r1, [r0, #0xc]
    ldreqsh r0, [r0, #0xe]
    smulbbeq r0, r1, r0
    moveq r0, r0, lsl #6
    bx lr
zero_format:
    ldrsh r1, [r0, #0xc]
    ldrsh r0, [r0, #0xe]
    smulbb r0, r1, r0
    mov r0, r0, lsl #5
    bx lr
}
#endif

/* Build and return the confirmed four-byte CNcgFile resource signature. */
#ifndef MATCHING
u32 NcgFile_GetSignature(const NcgFile *self)
{
    u8 signature[4];

    (void)self;
    signature[0] = 'N';
    signature[1] = 'C';
    signature[2] = 'C';
    signature[3] = 'G';
    return *(const u32 *)signature;
}
#else
/* Matching counterpart of the documented portable signature builder above. */
asm u32 NcgFile_GetSignature(const NcgFile *self)
{
    stmdb sp!, {r3}
    sub sp, sp, #4
    add r3, sp, #0
    mov r1, #0x43
    mov r2, #0x4e
    mov r0, #0x47
    strb r2, [r3, #0]
    strb r1, [r3, #1]
    strb r1, [r3, #2]
    strb r0, [r3, #3]
    ldr r0, [sp, #0]
    add sp, sp, #4
    ldmia sp!, {r3}
    bx lr
}
#endif
