#include "tingle/game_file.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own an LZ8-expanded byte payload loaded from a bounded region of a game
 * file. The four-byte header produced at the front of the expanded data is
 * removed in place before the payload is exposed to callers.
 */
typedef struct CompressedByteBuffer {
    u8 *bytes_00;
} CompressedByteBuffer;

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020deb34[];
extern const char gSizedCompressedBufferTempAllocationTag[];
extern void MI_UncompressLZ8(const void *source, void *destination);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void func_020b4554(void *address, u32 size);
extern void func_020b44e8(void);
/* Initialize an empty buffer; no allocation or SDK state is changed. */
void CompressedByteBuffer_Init(CompressedByteBuffer *self)
{
    self->bytes_00 = 0;
}

/* Free the payload when present and return self; the retained pointer is not cleared. */
CompressedByteBuffer *CompressedByteBuffer_Destroy(CompressedByteBuffer *self)
{
    if (self->bytes_00)
        func_02003e38(self->bytes_00);
    return self;
}

/* Return the owned payload pointer without changing ownership. */
u8 *CompressedByteBuffer_GetData(CompressedByteBuffer *self)
{
    return self->bytes_00;
}

/* Read and return the byte at the caller-supplied payload index. */
u8 CompressedByteBuffer_GetByte(CompressedByteBuffer *self, s32 index)
{
    return self->bytes_00[index];
}

/* Store the low eight bits of value at the caller-supplied payload index. */
void CompressedByteBuffer_SetByte(CompressedByteBuffer *self, s32 index, u8 value)
{
    self->bytes_00[index] = value;
}

/*
 * Read compressedSize bytes at fileOffset into temporary heap storage,
 * expand the LZ8 stream into an owned buffer, remove its leading four-byte
 * payload header with the SDK's overlap-capable byte copy, flush the exposed
 * payload, synchronize the cache operation, free the temporary input, and
 * return one. The LZ8 header's upper 24 bits are the expanded byte count.
 * This routine assumes self is empty and does not report I/O/allocation errors.
 */
s32 CompressedByteBuffer_LoadLz8Payload(CompressedByteBuffer *self, GameFile *file,
                  s32 fileOffset, u32 compressedSize)
{
    u8 *compressed;
    u32 expandedSize;
    u32 payloadSize;

    compressed = (u8 *)func_02003e20(compressedSize, gSizedCompressedBufferTempAllocationTag, -4,
                                     &gHeapContext);
    GameFile_Seek(file, fileOffset, 0);
    GameFile_Read(file, compressed, compressedSize);
    expandedSize = *(u32 *)compressed >> 8;
    self->bytes_00 = (u8 *)func_02003e20(expandedSize, data_020deb34, 4,
                                         &gHeapContext);
    MI_UncompressLZ8(compressed, self->bytes_00);
    payloadSize = expandedSize - 4;
    MI_CpuCopy8(self->bytes_00 + 4, self->bytes_00, payloadSize);
    func_020b4554(self->bytes_00, payloadSize);
    func_020b44e8();
    func_02003e38(compressed);
    return 1;
}

/* Return one when no payload is installed and zero otherwise. */
s32 CompressedByteBuffer_IsEmpty(const CompressedByteBuffer *self)
{
    return self->bytes_00 == 0;
}

#ifdef __cplusplus
}
#endif
