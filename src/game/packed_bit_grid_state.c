#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own the process-wide packed-bit grid used by game-phase script opcodes.
 * The grid dimensions come from the two halfwords at configuration offset
 * 0x20; storage is rounded up to a whole byte and cleared on configuration.
 */
typedef struct PackedBitGrid {
    u8 *bytes_00;
    u32 byteCount_04;
    u32 stride_08;
    u32 rowCount_0c;
} PackedBitGrid;

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d8810[];
extern u32 data_02105614;
extern u8 data_02105618[];
extern PackedBitGrid data_02105624;
extern void __register_global_object(void *, void (*)(void *), void *);
#ifdef __cplusplus
}
#endif

/* Initialize an empty grid without allocating storage. */
void PackedBitGrid_Init(PackedBitGrid *self)
{
    self->bytes_00 = 0;
    self->byteCount_04 = 0;
}

/* Free any owned byte array, clear its pointer, and reset its byte count. */
void PackedBitGrid_Clear(PackedBitGrid *self)
{
    if (self->bytes_00) {
        Heap_FreeAlternateEntry(self->bytes_00);
        self->bytes_00 = 0;
    }
    self->byteCount_04 = 0;
}

/*
 * Release the grid for shutdown and return it. The second null check is
 * preserved from the recovered control flow even though cleanup clears it.
 */
PackedBitGrid *PackedBitGrid_Destroy(PackedBitGrid *self)
{
    PackedBitGrid_Clear(self);
    if (self->bytes_00)
        PackedBitGrid_Clear(self);
    return self;
}

/*
 * Read column/row counts from configuration offset 0x20, replace any prior
 * storage with ceil(columns*rows/8) bytes tagged "ARRY", and clear all bits.
 */
void PackedBitGrid_Configure(PackedBitGrid *self, const void *configuration)
{
    u32 dimensions = *(const u32 *)((const u8 *)configuration + 0x20);
    u32 i;

    self->stride_08 = dimensions & 0xffff;
    self->rowCount_0c = dimensions >> 16;
    if (self->bytes_00)
        PackedBitGrid_Clear(self);
    self->byteCount_04 = (self->stride_08 * self->rowCount_0c + 7) / 8;
    self->bytes_00 = (u8 *)Heap_AllocAlternateEntry(self->byteCount_04,
                                         data_020d8810, 4, &gHeapContext);
    for (i = 0; i < self->byteCount_04; i++)
        self->bytes_00[i] = 0;
}

/* Lazily construct/register the global packed-bit grid and return it. */
PackedBitGrid *PackedBitGrid_GetOrCreateGlobal(void)
{
    if (!(data_02105614 & 1)) {
        PackedBitGrid_Init(&data_02105624);
        __register_global_object(&data_02105624,
                                 (void (*)(void *))PackedBitGrid_Destroy,
                                 data_02105618);
        data_02105614 |= 1;
    }
    return &data_02105624;
}
