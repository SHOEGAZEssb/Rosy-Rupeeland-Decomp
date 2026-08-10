#include "tingle/types.h"

/*
 * Refresh the tile layer's circular 32x16 cache from its optional source map.
 * Source tiles contribute only their low nine bits. A packed two-byte cache
 * cursor stores X modulo 32 and Y modulo 16; clipped coordinates write zero.
 */
typedef struct TileLayerCacheState {
    void **vtable_0000;
    u8 cache_0004[0x1000];
    u8 cursorX_1004;
    u8 cursorY_1005;
    u8 field_1006[2];
    const u16 *sourceTiles_1008;
    u32 sourceCount_100c;
    u8 field_1010[0x18];
    s16 sourceOffsetX_1028;
    s16 sourceOffsetY_102a;
    u16 sourceWidth_102c;
    u16 sourceHeight_102e;
} TileLayerCacheState;

#ifdef __cplusplus
extern "C" {
#endif
extern void RectS32_Init(void *, s32, s32, s32, s32);
extern s32 RectS32_ContainsPoint(void *, s32, s32);
extern void TileLayer_WriteMetatileToCache(void *, s32, s32, u16);
#ifdef __cplusplus
}
#endif

/*
 * Rebuild all 32x16 cache cells, starting at the layer's packed cursor and
 * wrapping its low five/four coordinate bits after every column/row.
 */
void TileLayer_RebuildCache(TileLayerCacheState *self)
{
    u8 bounds[0x10];
    u8 cursorX = self->cursorX_1004;
    u8 cursorY = self->cursorY_1005;
    s32 x;
    s32 y;
    RectS32_Init(bounds, 0, 0, self->sourceWidth_102c,
                  self->sourceHeight_102e);
    for (y = 0; y < 16; y++) {
        for (x = 0; x < 32; x++) {
            s32 sourceX = x + self->sourceOffsetX_1028;
            s32 sourceY = y + self->sourceOffsetY_102a;
            u16 tile = 0;
            if (RectS32_ContainsPoint(bounds, sourceX, sourceY))
                tile = self->sourceTiles_1008[
                           sourceY * self->sourceWidth_102c + sourceX] & 0x1ff;
            TileLayer_WriteMetatileToCache(self, cursorX & 0x1f, cursorY & 0x0f, tile);
            cursorX = (cursorX & (u8)~0x1f) | ((cursorX + 1) & 0x1f);
        }
        cursorY = (cursorY & (u8)~0x0f) | ((cursorY + 1) & 0x0f);
    }
}

/*
 * Refresh a 16-tile vertical source run at fixed X. The caller's two-byte
 * cursor is advanced in Y modulo 16; X is unchanged.
 */
void TileLayer_RefreshCacheColumn(TileLayerCacheState *self, s32 sourceX, s32 sourceY,
                   u8 cursor[2])
{
    u8 bounds[0x10];
    s32 i;
    RectS32_Init(bounds, 0, 0, self->sourceWidth_102c,
                  self->sourceHeight_102e);
    for (i = 0; i < 16; i++, sourceY++) {
        u16 tile = 0;
        if (RectS32_ContainsPoint(bounds, sourceX, sourceY))
            tile = self->sourceTiles_1008[
                       sourceY * self->sourceWidth_102c + sourceX] & 0x1ff;
        TileLayer_WriteMetatileToCache(self, cursor[0] & 0x1f, cursor[1] & 0x0f, tile);
        cursor[1] = (cursor[1] & (u8)~0x0f) | ((cursor[1] + 1) & 0x0f);
    }
}

/*
 * Refresh a 32-tile horizontal source run at fixed Y. The caller's two-byte
 * cursor is advanced in X modulo 32; Y is unchanged.
 */
void TileLayer_RefreshCacheRow(TileLayerCacheState *self, s32 sourceX, s32 sourceY,
                   u8 cursor[2])
{
    u8 bounds[0x10];
    s32 i;
    RectS32_Init(bounds, 0, 0, self->sourceWidth_102c,
                  self->sourceHeight_102e);
    for (i = 0; i < 32; i++, sourceX++) {
        u16 tile = 0;
        if (RectS32_ContainsPoint(bounds, sourceX, sourceY))
            tile = self->sourceTiles_1008[
                       sourceY * self->sourceWidth_102c + sourceX] & 0x1ff;
        TileLayer_WriteMetatileToCache(self, cursor[0] & 0x1f, cursor[1] & 0x0f, tile);
        cursor[0] = (cursor[0] & (u8)~0x1f) | ((cursor[0] + 1) & 0x1f);
    }
}
