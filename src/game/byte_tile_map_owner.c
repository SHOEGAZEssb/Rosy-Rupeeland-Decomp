#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own a square signed-byte tile map plus an adjacent sized resource buffer and
 * an opaque 12-byte metadata component. The object supplies lifecycle hooks,
 * bounds-checked cell access, and several intentionally empty virtual methods.
 */
typedef struct ByteTileMapOwner {
    void **vtable_00;
    u8 sizedBuffer_04[8];
    u8 tileBytes_0c[4];
    u8 metadata_10[12];
    void *field_1c;
    u32 dimensions_20;
    u32 flags_24;
} ByteTileMapOwner;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020deb5c;
extern void func_0202b4d4(void *self);
extern void *func_0202b4e4(void *self);
extern void func_0202b3bc(void *self);
extern void *func_0202b3c8(void *self);
extern s32 func_0202b4c0(const void *self);
extern u8 func_0202b3f0(void *self, s32 index);
extern void func_0202b3fc(void *self, s32 index, u8 value);
extern void NclFile_Init(void *self);
extern void NclFile_Destroy(void *self);
#ifdef __cplusplus
}
#endif

/*
 * Install the recovered vtable, initialize both buffer owners and metadata,
 * clear flag bit zero, set flag bit one, preserve only dimensions_20's low
 * halfword, clear field_1c, and return self.
 */
ByteTileMapOwner *func_0202b9dc(ByteTileMapOwner *self)
{
    self->vtable_00 = (void **)data_020deb5c;
    func_0202b4d4(self->sizedBuffer_04);
    func_0202b3bc(self->tileBytes_0c);
    NclFile_Init(self->metadata_10);
    self->flags_24 &= ~1u;
    self->flags_24 |= 2;
    self->dimensions_20 &= 0xffff;
    self->field_1c = 0;
    return self;
}

/* Destroy metadata and both owned buffers, then return self without freeing it. */
ByteTileMapOwner *func_0202ba4c(ByteTileMapOwner *self)
{
    NclFile_Destroy(self->metadata_10);
    func_0202b3c8(self->tileBytes_0c);
    func_0202b4e4(self->sizedBuffer_04);
    return self;
}

/* Destroy all embedded owners, free self, and return its former address. */
ByteTileMapOwner *func_0202ba74(ByteTileMapOwner *self)
{
    NclFile_Destroy(self->metadata_10);
    func_0202b3c8(self->tileBytes_0c);
    func_0202b4e4(self->sizedBuffer_04);
    Heap_Free(self);
    return self;
}

/* Destroy all embedded owners and return self; this is a second non-freeing virtual destructor. */
ByteTileMapOwner *func_0202baa4(ByteTileMapOwner *self)
{
    NclFile_Destroy(self->metadata_10);
    func_0202b3c8(self->tileBytes_0c);
    func_0202b4e4(self->sizedBuffer_04);
    return self;
}

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bacc(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bad0(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bad4(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bad8(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202badc(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bae0(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bae4(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bae8(ByteTileMapOwner *self) { (void)self; }

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
    if (func_0202b4c0(self->tileBytes_0c))
        return 0;
    value = func_0202b3f0(self->tileBytes_0c, y * side + x);
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
    if (func_0202b4c0(self->tileBytes_0c))
        return;
    func_0202b3fc(self->tileBytes_0c, y * side + x, (u8)value);
}

/* Return one unconditionally; no object state is read or changed. */
s32 func_0202bbd0(const ByteTileMapOwner *self)
{
    (void)self;
    return 1;
}

/* Return zero unconditionally; the retail form materializes it through a stack local. */
s32 func_0202bbd8(const ByteTileMapOwner *self)
{
    s32 result = 0;
    (void)self;
    return result;
}

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bbf4(ByteTileMapOwner *self) { (void)self; }

/* Replace flag bit one with enabled's low bit and preserve every other flag. */
void func_0202bbf8(ByteTileMapOwner *self, s32 enabled)
{
    self->flags_24 = (self->flags_24 & ~2u) | ((enabled & 1) << 1);
}

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bc10(ByteTileMapOwner *self) { (void)self; }

/* Intentionally empty virtual hook; it has no observable effects. */
void func_0202bc14(ByteTileMapOwner *self) { (void)self; }
