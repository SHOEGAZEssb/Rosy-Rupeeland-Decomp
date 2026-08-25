#include "tingle/game_file.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own a sized LZ8-expanded payload whose destination is initialized before
 * decompression. Like the adjacent loader type, it strips a four-byte payload
 * header in place and synchronizes the resulting memory range for consumers.
 */
typedef struct ZeroedCompressedBuffer {
    u8 *bytes_00;
    u32 expandedSize_04;
} ZeroedCompressedBuffer;

#ifdef __cplusplus
extern "C" {
#endif
extern const char gSizedCompressedBufferTempAllocationTag[];
extern const char gZeroedCompressedBufferPayloadAllocationTag[];
extern void MI_UncompressLZ8(const void *source, void *destination);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void func_020b58f0(void *destination, s32 value, u32 size);
extern void func_020b4554(void *address, u32 size);
extern void func_020b44e8(void);
void ZeroedCompressedBuffer_Clear(ZeroedCompressedBuffer *self);
/* Initialize an empty buffer and zero its recorded expanded size. */
void ZeroedCompressedBuffer_Init(ZeroedCompressedBuffer *self)
{
    self->bytes_00 = 0;
    self->expandedSize_04 = 0;
}

/* Release the owned payload, clear both fields, and return self. */
ZeroedCompressedBuffer *ZeroedCompressedBuffer_Destroy(ZeroedCompressedBuffer *self)
{
    ZeroedCompressedBuffer_Clear(self);
    return self;
}

/* Free an installed payload and reset the pointer and expanded-size fields. */
void ZeroedCompressedBuffer_Clear(ZeroedCompressedBuffer *self)
{
    if (self->bytes_00)
        Heap_FreeAlternateEntry(self->bytes_00);
    self->bytes_00 = 0;
    self->expandedSize_04 = 0;
}

/*
 * Replace any installed payload, read compressedSize bytes at fileOffset,
 * obtain the expanded size from the upper 24 bits of the LZ8 header, allocate
 * an even-byte destination, call func_020b58f0 with value zero across the full
 * expanded range, decompress, remove the leading four-byte payload header,
 * flush/synchronize the exposed range, free the temporary input, and return
 * one. The zero-fill interpretation is inferred from the call arguments; the
 * callee's address-derived name is retained pending independent confirmation.
 */
s32 ZeroedCompressedBuffer_LoadLz8Section(ZeroedCompressedBuffer *self, GameFile *file,
                  s32 fileOffset, u32 compressedSize)
{
    u8 *compressed;
    u32 expandedSize;
    u32 payloadSize;

    if (self->bytes_00)
        ZeroedCompressedBuffer_Clear(self);
    compressed = (u8 *)Heap_AllocAlternateEntry(compressedSize, gSizedCompressedBufferTempAllocationTag, -4,
                                     &gHeapContext);
    GameFile_Seek(file, fileOffset, 0);
    GameFile_Read(file, compressed, compressedSize);
    expandedSize = *(u32 *)compressed >> 8;
    self->expandedSize_04 = expandedSize;
    self->bytes_00 = (u8 *)Heap_AllocAlternateEntry(expandedSize & ~1u,
                                         gZeroedCompressedBufferPayloadAllocationTag, 4, &gHeapContext);
    func_020b58f0(self->bytes_00, 0, expandedSize);
    MI_UncompressLZ8(compressed, self->bytes_00);
    payloadSize = expandedSize - 4;
    MI_CpuCopy8(self->bytes_00 + 4, self->bytes_00, payloadSize);
    func_020b4554(self->bytes_00, payloadSize);
    func_020b44e8();
    Heap_FreeAlternateEntry(compressed);
    return 1;
}

/* Return the owned payload pointer without changing its lifetime. */
u8 *ZeroedCompressedBuffer_GetData(ZeroedCompressedBuffer *self)
{
    return self->bytes_00;
}

#ifdef __cplusplus
}
#endif
