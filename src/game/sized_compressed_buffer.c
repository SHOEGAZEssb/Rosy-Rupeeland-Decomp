#include "tingle/game_file.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own an LZ8-expanded payload together with the expanded stream size. Loading
 * replaces prior storage, strips the leading four-byte payload header in
 * place, and publishes the buffer after the required cache synchronization.
 */
typedef struct SizedCompressedBuffer {
    u8 *bytes_00;
    u32 expandedSize_04;
} SizedCompressedBuffer;

#ifdef __cplusplus
extern "C" {
#endif
extern const char gSizedCompressedBufferTempAllocationTag[];
extern const char gSizedCompressedBufferPayloadAllocationTag[];
extern void MI_UncompressLZ8(const void *source, void *destination);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void func_020b4554(void *address, u32 size);
extern void func_020b44e8(void);
void SizedCompressedBuffer_Clear(SizedCompressedBuffer *self);
/* Initialize an empty buffer and zero its recorded expanded size. */
void SizedCompressedBuffer_Init(SizedCompressedBuffer *self)
{
    self->bytes_00 = 0;
    self->expandedSize_04 = 0;
}

/* Release the owned payload, clear both fields, and return self. */
SizedCompressedBuffer *SizedCompressedBuffer_Destroy(SizedCompressedBuffer *self)
{
    SizedCompressedBuffer_Clear(self);
    return self;
}

/* Free an installed payload and reset the pointer and expanded-size fields. */
void SizedCompressedBuffer_Clear(SizedCompressedBuffer *self)
{
    if (self->bytes_00)
        func_02003e38(self->bytes_00);
    self->bytes_00 = 0;
    self->expandedSize_04 = 0;
}

/*
 * Replace any installed payload, read compressedSize bytes at fileOffset,
 * obtain the expanded size from the upper 24 bits of the LZ8 header, allocate
 * that size rounded down to an even byte count, expand, remove the leading
 * four-byte payload header, flush/synchronize the exposed range, free the
 * temporary compressed input, record the unadjusted expanded size, and return
 * one. I/O and allocation failures are not reported by this interface.
 */
s32 SizedCompressedBuffer_LoadLz8Section(SizedCompressedBuffer *self, GameFile *file,
                  s32 fileOffset, u32 compressedSize)
{
    u8 *compressed;
    u32 expandedSize;
    u32 payloadSize;

    if (self->bytes_00)
        SizedCompressedBuffer_Clear(self);
    compressed = (u8 *)func_02003e20(compressedSize, gSizedCompressedBufferTempAllocationTag, -4,
                                     &gHeapContext);
    GameFile_Seek(file, fileOffset, 0);
    GameFile_Read(file, compressed, compressedSize);
    expandedSize = *(u32 *)compressed >> 8;
    self->bytes_00 = (u8 *)func_02003e20(expandedSize & ~1u,
                                         gSizedCompressedBufferPayloadAllocationTag, 4, &gHeapContext);
    MI_UncompressLZ8(compressed, self->bytes_00);
    payloadSize = expandedSize - 4;
    MI_CpuCopy8(self->bytes_00 + 4, self->bytes_00, payloadSize);
    func_020b4554(self->bytes_00, payloadSize);
    func_020b44e8();
    func_02003e38(compressed);
    self->expandedSize_04 = expandedSize;
    return 1;
}

/* Return the owned payload pointer without changing its lifetime. */
u8 *SizedCompressedBuffer_GetData(SizedCompressedBuffer *self)
{
    return self->bytes_00;
}

#ifdef __cplusplus
}
#endif
