#include "tingle/heap.h"
#include "tingle/ncl_file.h"
#include "tingle/types.h"

/*
 * Own a square signed-byte tile map plus an adjacent sized resource buffer and
 * an embedded CNclFile palette resource. The object supplies lifecycle hooks,
 * bounds-checked cell access, and several intentionally empty virtual methods.
 */
typedef struct ByteTileMapOwner {
    void **vtable_00;
    u8 sizedBuffer_04[8];
    u8 tileBytes_0c[4];
    NclFile palette_10;
    void *field_1c;
    u32 dimensions_20;
    u32 flags_24;
} ByteTileMapOwner;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gByteTileMapOwnerVtable[];
extern void SizedCompressedBuffer_Init(void *self);
extern void *SizedCompressedBuffer_Destroy(void *self);
extern void CompressedByteBuffer_Init(void *self);
extern void *CompressedByteBuffer_Destroy(void *self);
extern s32 CompressedByteBuffer_IsEmpty(const void *self);
extern u8 CompressedByteBuffer_GetByte(void *self, s32 index);
extern void CompressedByteBuffer_SetByte(void *self, s32 index, u8 value);
/*
 * Install the recovered vtable, initialize both buffer owners and the palette,
 * clear flag bit zero, set flag bit one, preserve only dimensions_20's low
 * halfword, clear field_1c, and return self.
 */
ByteTileMapOwner *ByteTileMapOwner_Init(ByteTileMapOwner *self)
{
    self->vtable_00 = gByteTileMapOwnerVtable;
    SizedCompressedBuffer_Init(self->sizedBuffer_04);
    CompressedByteBuffer_Init(self->tileBytes_0c);
    NclFile_Init(&self->palette_10);
    self->flags_24 &= ~1u;
    self->flags_24 |= 2;
    self->dimensions_20 &= 0xffff;
    self->field_1c = 0;
    return self;
}

/* Destroy the palette and both owned buffers, then return self without freeing it. */
ByteTileMapOwner *ByteTileMapOwner_DestroyComplete(ByteTileMapOwner *self)
{
    NclFile_Destroy(&self->palette_10);
    CompressedByteBuffer_Destroy(self->tileBytes_0c);
    SizedCompressedBuffer_Destroy(self->sizedBuffer_04);
    return self;
}

/* Destroy all embedded owners, free self, and return its former address. */
ByteTileMapOwner *ByteTileMapOwner_DestroyAndFree(ByteTileMapOwner *self)
{
    NclFile_Destroy(&self->palette_10);
    CompressedByteBuffer_Destroy(self->tileBytes_0c);
    SizedCompressedBuffer_Destroy(self->sizedBuffer_04);
    Heap_Free(self);
    return self;
}

/* Destroy all embedded owners and return self; this is a second non-freeing virtual destructor. */
ByteTileMapOwner *ByteTileMapOwner_Destroy(ByteTileMapOwner *self)
{
    NclFile_Destroy(&self->palette_10);
    CompressedByteBuffer_Destroy(self->tileBytes_0c);
    SizedCompressedBuffer_Destroy(self->sizedBuffer_04);
    return self;
}

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook0(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook1(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook2(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook3(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook4(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook5(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook6(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook7(ByteTileMapOwner *self) { (void)self; }

/*
 * Return the signed byte at (x,y). Both coordinates use dimensions_20's low
 * halfword as the square side length. Invalid coordinates or an absent byte
 * buffer return zero; otherwise the linear index is y*side+x.
 */
s32 ByteTileMapOwner_GetCell(ByteTileMapOwner *self, s32 x, s32 y)
{
    u32 side = self->dimensions_20 & 0xffff;
    u8 value;

    if (x < 0 || (u32)x >= side || y < 0 || (u32)y >= side)
        return 0;
    if (CompressedByteBuffer_IsEmpty(self->tileBytes_0c))
        return 0;
    value = CompressedByteBuffer_GetByte(self->tileBytes_0c, y * side + x);
    return value >= 0x80 ? (s32)value - 0x100 : value;
}

/*
 * Store the low byte of value at (x,y) when both coordinates are in the
 * square bounds and byte storage exists; otherwise leave the object unchanged.
 */
void ByteTileMapOwner_SetCell(ByteTileMapOwner *self, s32 x, s32 y, s8 value)
{
    u32 side = self->dimensions_20 & 0xffff;

    if (x < 0 || (u32)x >= side || y < 0 || (u32)y >= side)
        return;
    if (CompressedByteBuffer_IsEmpty(self->tileBytes_0c))
        return;
    CompressedByteBuffer_SetByte(self->tileBytes_0c, y * side + x, (u8)value);
}

/* Return one unconditionally; no object state is read or changed. */
s32 ByteTileMapOwner_ReturnOne(const ByteTileMapOwner *self)
{
    (void)self;
    return 1;
}

/* Return zero unconditionally; the retail form materializes it through a stack local. */
s32 ByteTileMapOwner_ReturnZero(const ByteTileMapOwner *self)
{
    s32 result = 0;
    (void)self;
    return result;
}

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook8(ByteTileMapOwner *self) { (void)self; }

/* Replace flag bit one with enabled's low bit and preserve every other flag. */
void ByteTileMapOwner_SetFlag2Enabled(ByteTileMapOwner *self, s32 enabled)
{
    self->flags_24 = (self->flags_24 & ~2u) | ((enabled & 1) << 1);
}

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook9(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void ByteTileMapOwner_NoOpHook10(ByteTileMapOwner *self) { (void)self; }

#ifdef __cplusplus
}
#endif
