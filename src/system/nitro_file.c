#include "tingle/nitro_file.h"
#include "tingle/heap.h"

/*
 * Owner and loader for decompressed Nintendo resource-file data. NitroFile
 * tracks one heap buffer and its byte count, provides the class destructor
 * variants, and can read an LZ8 stream from a GameFile into a new allocation.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern const char data_020d40f4[];
extern const char data_020d40fc[];
extern void MI_UncompressLZ8(const void *source, void *destination);

#ifdef __cplusplus
}
#endif

/*
 * Construct an empty owner, install the NitroFile vtable, and return self.
 * Only the object's three words change; no heap or SDK operation occurs.
 */
NitroFile *func_02005118(NitroFile *self)
{
    self->vtable = &data_020d40dc;
    self->data = 0;
    self->size = 0;
    return self;
}

/*
 * Destroy the owned buffer if present, restore the base vtable, and return
 * self. The buffer address is left unchanged because the object is ending.
 */
NitroFile *func_02005134(NitroFile *self)
{
    self->vtable = &data_020d40dc;
    if (self->data != 0) {
        func_02003e38(self->data);
    }
    return self;
}

/*
 * Run the buffer-owning destructor, release the object itself through the
 * game heap, and return its former address for the C++ deleting-destructor ABI.
 */
NitroFile *func_02005160(NitroFile *self)
{
    self->vtable = &data_020d40dc;
    if (self->data != 0) {
        func_02003e38(self->data);
    }
    Heap_Free(self);
    return self;
}

/*
 * Alternate base-destructor entry used by derived resource classes. It
 * restores the NitroFile vtable, frees a present payload, and returns self.
 */
NitroFile *func_02005194(NitroFile *self)
{
    self->vtable = &data_020d40dc;
    if (self->data != 0) {
        func_02003e38(self->data);
    }
    return self;
}

/*
 * Reset the payload to empty. Size becomes zero first; a present allocation
 * is freed through the game heap and the stored address is then cleared.
 */
void func_020051c0(NitroFile *self)
{
    self->size = 0;
    if (self->data != 0) {
        func_02003e38(self->data);
        self->data = 0;
    }
}

/*
 * Read compressedSize bytes at offset from file, expand the Nitro LZ8 stream
 * into a new four-byte-aligned heap buffer, free the temporary read buffer,
 * and return the expanded allocation. This helper does not attach the result
 * to self; callers validate and adopt it. GameFile seek/read and the NitroSDK
 * decompressor provide the observable file and codec effects.
 */
void *func_020051ec(NitroFile *self, GameFile *file, s32 offset,
                    u32 compressedSize)
{
    void *compressed;
    void *expanded;
    s32 expandedSize;

    (void)self;
    compressed = func_02003e20(compressedSize, data_020d40f4, -4,
                               &gHeapContext);
    GameFile_Seek(file, offset, 0);
    GameFile_Read(file, compressed, compressedSize);

    expandedSize = (s32)(*(const u32 *)compressed >> 8);
    expandedSize = (expandedSize / 2) * 2;
    expanded = func_02003e20(expandedSize, data_020d40fc, 4, &gHeapContext);
    MI_UncompressLZ8(compressed, expanded);
    func_02003e38(compressed);
    return expanded;
}
