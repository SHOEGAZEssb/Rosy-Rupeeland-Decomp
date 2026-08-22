#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Scroll, mutate, and query the common tile-layer state. Pixel motion updates
 * only newly exposed rows/columns of its circular 32x16 metatile cache. Source
 * map cells contain a nine-bit metatile index plus seven caller-controlled bits;
 * each metatile expands to four cache halfwords through a 10-byte definition.
 */
typedef struct TileLayerAccessState {
    void **vtable_0000;
    u16 cache_0004[0x800];
    u8 cursorX_1004;
    u8 cursorY_1005;
    u8 field_1006[2];
    u16 *sourceTiles_1008;
    u32 sourceCount_100c;
    const u16 *definitions_1010;
    const void *field_1014;
    s32 pixelX_1018;
    s32 pixelY_101c;
    u32 field_1020;
    u32 field_1024;
    s16 sourceOffsetX_1028;
    s16 sourceOffsetY_102a;
    u16 sourceWidth_102c;
    u16 sourceHeight_102e;
    u8 field_1030[4];
    u16 definitionBase_1034;
} TileLayerAccessState;

#ifdef __cplusplus
extern "C" {
#endif
extern const char gTileLayerArrayAllocationTag[];
extern void TileLayer_RefreshCacheColumn(void *, s32, s32, u8 *);
extern void TileLayer_RefreshCacheRow(void *, s32, s32, u8 *);
extern void TileLayer_RebuildCache(void *);
extern void OwnedTileBuffer_Clear(void *);
extern void ZeroedCompressedBuffer_Init(void *);
extern void ZeroedCompressedBuffer_LoadLz8Section(void *, void *, u32, u32);
extern void *ZeroedCompressedBuffer_GetData(void *);
extern void ZeroedCompressedBuffer_Destroy(void *);
extern void MI_CpuCopy8(const void *, void *, u32);
void TileLayer_WriteMetatileToCache(TileLayerAccessState *, s32, s32, u16);
void OwnedTileBuffer_Resize(void *, u32);
void TileLayer_LoadSourceTileSection(TileLayerAccessState *, void *, u32, u32);
static s32 PixelToTile(s32 value)
{
    return (value + (value < 0 ? 15 : 0)) >> 4;
}

static s32 WrapCoordinate(s32 value, s32 modulus)
{
    s32 result = value % modulus;
    return result < 0 ? result + modulus : result;
}

/*
 * Move to new pixel coordinates. For every crossed tile boundary, refresh the
 * newly exposed 16-cell column or 32-cell row, advance/retreat the circular
 * cursor and source offset, then store the exact pixel coordinates.
 */
void TileLayer_ScrollToPixelPosition(TileLayerAccessState *self, s32 pixelX, s32 pixelY)
{
    s32 target;
    target = PixelToTile(pixelX) - 1;
    while (target > self->sourceOffsetX_1028) {
        u8 cursor[2] = {self->cursorX_1004, self->cursorY_1005};
        TileLayer_RefreshCacheColumn(self, self->sourceOffsetX_1028 + 32,
                      self->sourceOffsetY_102a, cursor);
        self->cursorX_1004 = (self->cursorX_1004 & (u8)~0x1f) |
                             ((self->cursorX_1004 + 1) & 0x1f);
        self->sourceOffsetX_1028++;
    }
    while (target < self->sourceOffsetX_1028) {
        u8 cursor[2] = {
            (u8)((self->cursorX_1004 & (u8)~0x1f) |
                 ((self->cursorX_1004 - 1) & 0x1f)),
            self->cursorY_1005
        };
        TileLayer_RefreshCacheColumn(self, self->sourceOffsetX_1028 - 1,
                      self->sourceOffsetY_102a, cursor);
        self->cursorX_1004 = cursor[0];
        self->sourceOffsetX_1028--;
    }

    target = PixelToTile(pixelY) - 1;
    while (target > self->sourceOffsetY_102a) {
        u8 cursor[2] = {self->cursorX_1004, self->cursorY_1005};
        TileLayer_RefreshCacheRow(self, self->sourceOffsetX_1028,
                      self->sourceOffsetY_102a + 16, cursor);
        self->cursorY_1005 = (self->cursorY_1005 & (u8)~0x0f) |
                             ((self->cursorY_1005 + 1) & 0x0f);
        self->sourceOffsetY_102a++;
    }
    while (target < self->sourceOffsetY_102a) {
        u8 cursor[2] = {
            self->cursorX_1004,
            (u8)((self->cursorY_1005 & (u8)~0x0f) |
                 ((self->cursorY_1005 - 1) & 0x0f))
        };
        TileLayer_RefreshCacheRow(self, self->sourceOffsetX_1028,
                      self->sourceOffsetY_102a - 1, cursor);
        self->cursorY_1005 = cursor[1];
        self->sourceOffsetY_102a--;
    }
    self->pixelX_1018 = pixelX;
    self->pixelY_101c = pixelY;
}

/*
 * Replace a source cell's low nine bits. If that cell is inside the currently
 * cached 32x16 window, immediately expand it into the wrapped cache position.
 */
void TileLayer_SetMetatileIndex(TileLayerAccessState *self, s32 x, s32 y, u16 tile)
{
    u16 *cell = &self->sourceTiles_1008[y * self->sourceWidth_102c + x];
    *cell = (*cell & 0xfe00) | (tile & 0x1ff);
    if (x >= self->sourceOffsetX_1028 &&
        x < self->sourceOffsetX_1028 + 32 &&
        y >= self->sourceOffsetY_102a &&
        y < self->sourceOffsetY_102a + 16)
        TileLayer_WriteMetatileToCache(self, WrapCoordinate(x, 32),
                      WrapCoordinate(y, 16), tile);
}

/*
 * Expand one metatile into a 2x2 cache block. The circular cache uses two
 * 16-column screen blocks; definition halfwords receive the recovered base at
 * offset 0x1034 before being written.
 */
void TileLayer_WriteMetatileToCache(TileLayerAccessState *self, s32 x, s32 y, u16 tile)
{
    const u16 *definition = self->definitions_1010 + tile * 5;
    s32 wrappedX = WrapCoordinate(x, 32);
    s32 wrappedY = WrapCoordinate(y, 16);
    s32 index = (wrappedX & 15) * 2 + wrappedY * 64 +
                (wrappedX / 16) * 1024;
    self->cache_0004[index] = definition[0] + self->definitionBase_1034;
    self->cache_0004[index + 1] = definition[1] + self->definitionBase_1034;
    self->cache_0004[index + 32] = definition[2] + self->definitionBase_1034;
    self->cache_0004[index + 33] = definition[3] + self->definitionBase_1034;
}

/* Preserve a source cell's low nine bits and replace its upper bits. */
void TileLayer_SetSourceCellUpperBits(TileLayerAccessState *self, s32 x, s32 y, u16 upperBits)
{
    u16 *cell = &self->sourceTiles_1008[y * self->sourceWidth_102c + x];
    *cell = (*cell & 0x1ff) | upperBits;
}

/* Return only the low nine-bit metatile index for a source coordinate. */
u16 TileLayer_GetMetatileIndex(TileLayerAccessState *self, s32 x, s32 y)
{
    return self->sourceTiles_1008[y * self->sourceWidth_102c + x] & 0x1ff;
}

/* Return the full 16-bit source-map cell for a coordinate. */
u16 TileLayer_GetSourceCell(TileLayerAccessState *self, s32 x, s32 y)
{
    return self->sourceTiles_1008[y * self->sourceWidth_102c + x];
}

/* Replace an owned halfword buffer with storage for count elements. */
void OwnedTileBuffer_Resize(void *ownedBuffer, u32 count)
{
    void **bytes = (void **)ownedBuffer;
    if (*bytes)
        OwnedTileBuffer_Clear(ownedBuffer);
    bytes[0] = func_02003e20(count * 2, gTileLayerArrayAllocationTag, 4, &gHeapContext);
    ((u32 *)ownedBuffer)[1] = count;
}

/*
 * Load a file subsection through a temporary archive view, allocate the layer's
 * halfword buffer from half the byte size, copy all bytes, and destroy the view.
 */
void TileLayer_LoadSourceTileSection(TileLayerAccessState *self, void *file,
                   u32 offset, u32 size)
{
    u8 view[8];
    const void *source;
    ZeroedCompressedBuffer_Init(view);
    ZeroedCompressedBuffer_LoadLz8Section(view, file, offset, size);
    OwnedTileBuffer_Resize(&self->sourceTiles_1008, *(u32 *)(view + 4) >> 1);
    source = ZeroedCompressedBuffer_GetData(view);
    MI_CpuCopy8(source, self->sourceTiles_1008, *(u32 *)(view + 4));
    ZeroedCompressedBuffer_Destroy(view);
}

/*
 * Load source tiles; attach metatile definitions and auxiliary pointer; set
 * dimensions and zero scroll/source origins; derive packed cursors; fully
 * rebuild the cache.
 */
void TileLayer_InitSourceMap(TileLayerAccessState *self, void *file, u32 offset,
                   u32 size, const u16 *definitions, s16 width, s16 height,
                   const void *auxiliary)
{
    TileLayer_LoadSourceTileSection(self, file, offset, size);
    self->definitions_1010 = definitions;
    self->field_1014 = auxiliary;
    self->sourceWidth_102c = (u16)width;
    self->sourceHeight_102e = (u16)height;
    self->pixelX_1018 = 0;
    self->pixelY_101c = 0;
    self->sourceOffsetX_1028 = 0;
    self->sourceOffsetY_102a = 0;
    self->cursorX_1004 = (self->cursorX_1004 & (u8)~0x1f) |
                         (self->sourceOffsetX_1028 & 0x1f);
    self->cursorY_1005 = (self->cursorY_1005 & (u8)~0x0f) |
                         (self->sourceOffsetY_102a & 0x0f);
    TileLayer_RebuildCache(self);
}

/* Store exact pixel coordinates and their signed, truncating tile coordinates. */
void TileLayer_SetScrollPositionDirect(TileLayerAccessState *self, s32 pixelX, s32 pixelY)
{
    self->pixelX_1018 = pixelX;
    self->pixelY_101c = pixelY;
    self->sourceOffsetX_1028 = (s16)PixelToTile(pixelX);
    self->sourceOffsetY_102a = (s16)PixelToTile(pixelY);
}

#ifdef __cplusplus
}
#endif
