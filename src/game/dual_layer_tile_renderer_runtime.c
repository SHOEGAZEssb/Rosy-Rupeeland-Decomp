#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Load, activate, position, and edit the two layers owned by the tile-renderer
 * base at 0x020291b8. This runtime half bridges packed game configuration to
 * file resources, main/sub BG registers, palettes, VRAM uploads, polymorphic
 * layer implementations, and a large embedded renderer at offset 0x60.
 */
typedef struct DualLayerTileRenderer {
    u8 base_00[4];
    u8 resource_04[8];
    u8 optionalResource_0c[4];
    void *palette_10;
    void *paletteData_14;
    u8 field_18[4];
    const u8 *config_1c;
    u32 packedDimensions_20;
    u32 flags_24;
    void *layers_28[2];
    u8 engineMode_30;
    u8 layerVariant_31;
    u8 field_32[2];
    s32 layerState_34[4];
    s32 field_44;
    s32 width_48;
    s32 height_4c;
    u8 origin_50[0x10];
    u8 embeddedRenderer_60[1];
} DualLayerTileRenderer;

typedef struct TileRendererConfig {
    u32 fileOffset_00;
    u32 fileSize_04;
    u32 resourceOffset_08;
    u32 resourceSize_0c;
    u32 mapOffset_10;
    u32 mapSize_14;
    u32 layer0Offset_18;
    u32 layer0Size_1c;
    u32 layer1Offset_20;
    u32 layer1Size_24;
    u32 optionalOffset_28;
    u32 optionalSize_2c;
    u8 field_30[8];
    s16 dimension0_38;
    s16 dimension1_3a;
} TileRendererConfig;

typedef void (*LayerVoidMethod)(void *);
typedef void (*LayerBoolMethod)(void *, s32);
typedef s32 (*LayerQueryMethod)(void *);
typedef void (*RendererTileMethod)(DualLayerTileRenderer *, s32, s32, s32,
                                   s32);

#ifdef __cplusplus
extern "C" {
#endif
extern const char gDualLayerTileRendererArchivePath[];
extern const char gDualLayerTileRendererLayerAllocationTag[];
extern void *gMainBgPaletteBuffer;
extern void *gSubBgPaletteBuffer;
extern void GameFile_Init(void *);
extern void GameFile_Destroy(void *);
extern void GameFile_Open(void *, const char *);
extern void GameFile_Close(void *);
extern void NclFile_LoadCompressedFromFile(void *, void *, u32, u32);
extern void func_0202b520(void *, void *, u32, u32);
extern void CompressedByteBuffer_LoadLz8Payload(void *, void *, u32, u32);
extern void *func_0202b5f4(void *);
extern void *CompressedByteBuffer_GetData(void *);
extern void *Bg3TileLayer_Init(void *, s32, s32, s32);
extern void *Bg3ExtendedTileLayer_Init(void *, s32, s32, s32);
extern void *Bg2TileLayer_Init(void *, s32, s32, s32);
extern void *Bg2ExtendedTileLayer_Init(void *, s32, s32, s32);
extern void TileLayer_InitSourceMap(void *, void *, u32, u32, void *, s32, s32, void *);
extern void TileLayer_SetScrollPositionDirect(void *, s32, s32);
extern void TileLayer_RebuildCache(void *);
extern void func_0202badc(void *);
extern void VecFx32_Subtract(void *, const void *, const void *);
extern void VecFx32Object_Destroy(void *);
extern void TileLayer_ScrollToPixelPosition(void *, s32, s32);
extern void func_0202b930(void *);
extern void func_020b1854(void *, s32, s32);
extern void func_020b17ec(void *, s32, s32);
extern void func_020b44e8(void);
extern void NcgFile_Init(void *);
extern void NcgFile_Destroy(void *);
extern void NcgFile_LoadCompressedFromFile(void *, void *, u32, u32);
extern void *func_020af838(void);
extern void *func_020af7e8(void);
extern void func_020b581c(void *, void *, s32);
extern void PaletteBuffer_Write(void *, const void *, s32, s32);
extern void func_020b1618(void);
extern void func_020b1598(void *, s32, s32);
extern void func_020b1534(void);
extern void func_020b13d4(void);
extern void func_020b1360(void *, s32, s32);
extern void func_020b1314(void);
extern void TileLayer_GetMetatileIndex(void *, s32, s32);
extern void TileLayer_SetMetatileIndex(void *, s32, s32, s32);
extern u16 TileLayer_GetSourceCell(void *, ...);
extern void TileLayer_SetSourceCellUpperBits(void *, s32, s32, s32);
extern void ByteTileMapOwner_SetCell(void *, s32, s32, s32);
extern void *func_0202b9bc(void *);
extern void func_0202b750(void *, void *, s32);
extern void func_0202b838(void *, const void *);
extern void func_0202b834(void *);
extern void DualLayerTileRenderer_UploadGraphics(DualLayerTileRenderer *);
extern void DualLayerTileRenderer_UploadPalette(DualLayerTileRenderer *);
#ifdef __cplusplus
}
#endif

/*
 * Open the fixed renderer archive, load the common resource/map and optional
 * resource, create layer zero/one when their config sizes are nonzero using
 * variant 0 or 2 implementations, configure both layers, clear their runtime
 * counters, upload graphics/palettes, close the file, and destroy temporaries.
 */
void DualLayerTileRenderer_LoadFromConfig(DualLayerTileRenderer *self,
                   const TileRendererConfig *config, s32 mode, s32 variant)
{
    u8 file[0x4c];
    void *map;
    void *optional;
    self->engineMode_30 = (u8)mode;
    self->layerVariant_31 = (u8)variant;
    self->config_1c = (const u8 *)config;
    GameFile_Init(file);
    GameFile_Open(file, gDualLayerTileRendererArchivePath);
    NclFile_LoadCompressedFromFile(&self->palette_10, file, config->resourceOffset_08,
                  config->resourceSize_0c);
    func_0202b520(self->resource_04, file, config->mapOffset_10,
                  config->mapSize_14);
    if (config->optionalSize_2c)
        CompressedByteBuffer_LoadLz8Payload(self->optionalResource_0c, file,
                      config->optionalOffset_28, config->optionalSize_2c);
    self->packedDimensions_20 =
        (u16)config->dimension0_38 | ((u32)(u16)config->dimension1_3a << 16);

    if (config->layer0Size_1c) {
        self->layers_28[0] = Heap_Alloc(0x1040, gDualLayerTileRendererLayerAllocationTag, 4,
                                        &gHeapContext);
        if (self->layers_28[0]) {
            if (variant == 0)
                self->layers_28[0] = Bg3TileLayer_Init(
                    self->layers_28[0], mode, self->field_44, self->width_48);
            else if (variant == 2)
                self->layers_28[0] = Bg3ExtendedTileLayer_Init(
                    self->layers_28[0], mode, self->field_44, self->width_48);
        }
        map = func_0202b5f4(self->resource_04);
        optional = CompressedByteBuffer_GetData(self->optionalResource_0c);
        TileLayer_InitSourceMap(self->layers_28[0], file, config->layer0Offset_18,
                      config->layer0Size_1c, map,
                      (s16)(self->packedDimensions_20 & 0xffff),
                      (s16)(self->packedDimensions_20 >> 16), optional);
        TileLayer_SetScrollPositionDirect(self->layers_28[0], 0, 0);
        self->layerState_34[0] = 0;
        self->layerState_34[2] = 0;
    }
    if (config->layer1Size_24) {
        self->layers_28[1] = Heap_Alloc(0x1040, gDualLayerTileRendererLayerAllocationTag, 4,
                                        &gHeapContext);
        if (self->layers_28[1]) {
            if (variant == 0)
                self->layers_28[1] = Bg2TileLayer_Init(
                    self->layers_28[1], mode, self->field_44, self->height_4c);
            else if (variant == 2)
                self->layers_28[1] = Bg2ExtendedTileLayer_Init(
                    self->layers_28[1], mode, self->field_44, self->height_4c);
        }
        map = func_0202b5f4(self->resource_04);
        TileLayer_InitSourceMap(self->layers_28[1], file, config->layer1Offset_20,
                      config->layer1Size_24, map,
                      (s16)(self->packedDimensions_20 & 0xffff),
                      (s16)(self->packedDimensions_20 >> 16), 0);
        TileLayer_SetScrollPositionDirect(self->layers_28[1], 0, 0);
        self->layerState_34[1] = 0;
        self->layerState_34[3] = 0;
    }
    DualLayerTileRenderer_UploadGraphics(self);
    DualLayerTileRenderer_UploadPalette(self);
    GameFile_Close(file);
    GameFile_Destroy(file);
}

/*
 * Invoke layer vtable slot five, refresh graphics/palette state, finalize each
 * layer, optionally call renderer vtable slot nine with one, and set BG control
 * low bits to screen base mode two/character base mode one on the selected engine.
 */
void DualLayerTileRenderer_ActivateLayers(DualLayerTileRenderer *self, s32 notify)
{
    s32 i;
    volatile u16 *screenControl;
    volatile u16 *characterControl;
    for (i = 0; i < 2; i++)
        if (self->layers_28[i])
            ((LayerVoidMethod)(*(void ***)self->layers_28[i])[5])(
                self->layers_28[i]);
    DualLayerTileRenderer_UploadGraphics(self);
    DualLayerTileRenderer_UploadPalette(self);
    for (i = 0; i < 2; i++)
        if (self->layers_28[i])
            TileLayer_RebuildCache(self->layers_28[i]);
    if (notify)
        ((LayerBoolMethod)(*(void ***)self)[9])(self, 1);
    screenControl = (volatile u16 *)(self->engineMode_30 == 1 ?
                                     0x0400000e : 0x0400100e);
    characterControl = screenControl - 1;
    *screenControl = (*screenControl & ~3u) | 2;
    *characterControl = (*characterControl & ~3u) | 1;
}

/* If base flag bit one is set, invoke vtable slot two on both existing layers. */
void DualLayerTileRenderer_UpdateLayers(DualLayerTileRenderer *self)
{
    s32 i;
    if (!((self->flags_24 >> 1) & 1))
        return;
    for (i = 0; i < 2; i++)
        if (self->layers_28[i])
            ((LayerVoidMethod)(*(void ***)self->layers_28[i])[2])(
                self->layers_28[i]);
}

/*
 * Run base position preparation, transform an input relative to offset 0x50,
 * publish integer FX32 coordinates to both layers, update the embedded renderer
 * when enabled, and dispatch engine-specific transfer mode one or two.
 */
void DualLayerTileRenderer_UpdatePosition(DualLayerTileRenderer *self, const void *position)
{
    s32 transformed[4];
    s32 x;
    s32 y;
    func_0202badc(self);
    VecFx32_Subtract(transformed, position, self->origin_50);
    x = transformed[1] >> 12;
    y = transformed[2] >> 12;
    if (self->layers_28[0])
        TileLayer_ScrollToPixelPosition(self->layers_28[0], x, y);
    if (self->layers_28[1])
        TileLayer_ScrollToPixelPosition(self->layers_28[1], x, y);
    if (*(u32 *)(self->base_00 + 0x1878) & 1) {
        func_0202b930(self->embeddedRenderer_60);
        if ((self->flags_24 >> 1) & 1) {
            void *handle = *(void **)(self->base_00 + 0x1874);
            if (self->engineMode_30 == 1)
                func_020b1854(handle, 0x6800, 0x800);
            else if (self->engineMode_30 == 2)
                func_020b17ec(handle, 0x6800, 0x800);
        }
    }
    VecFx32Object_Destroy(transformed);
}

/* Load common graphics data and upload it to the engine/mode-selected 0x20/0x40 KiB destination. */
void DualLayerTileRenderer_UploadGraphics(DualLayerTileRenderer *self)
{
    u8 resource[0x14];
    u8 file[0x4c];
    s32 units = self->layerVariant_31 == 0 ? 0x20 : 0x40;
    func_020b44e8();
    NcgFile_Init(resource);
    GameFile_Init(file);
    GameFile_Open(file, gDualLayerTileRendererArchivePath);
    NcgFile_LoadCompressedFromFile(resource, file,
                  *(const u32 *)(self->config_1c + 0),
                  *(const u32 *)(self->config_1c + 4));
    if (self->engineMode_30 == 1)
        func_020b581c(*(void **)(resource + 4), func_020af838(), units << 10);
    else if (self->engineMode_30 == 2)
        func_020b581c(*(void **)(resource + 4), func_020af7e8(), units << 10);
    GameFile_Destroy(file);
    NcgFile_Destroy(resource);
}

/* Upload or split the loaded palette according to engine mode and layer variant. */
void DualLayerTileRenderer_UploadPalette(DualLayerTileRenderer *self)
{
    func_020b44e8();
    if (self->engineMode_30 == 1) {
        if (self->layerVariant_31 == 0)
            PaletteBuffer_Write(gMainBgPaletteBuffer, self->paletteData_14, 0, 0x1c0);
        else if (self->layerVariant_31 == 2) {
            func_020b1618();
            func_020b1598(self->paletteData_14, 0x4000, 0x2000);
            func_020b1598(self->paletteData_14, 0x6000, 0x2000);
            func_020b1534();
        }
    } else if (self->engineMode_30 == 2) {
        *(u16 *)self->paletteData_14 = 0;
        if (self->layerVariant_31 == 0)
            PaletteBuffer_Write(gSubBgPaletteBuffer, self->paletteData_14, 0, 0x200);
        else if (self->layerVariant_31 == 2) {
            func_020b13d4();
            func_020b1360(self->paletteData_14, 0x4000, 0x2000);
            func_020b1360(self->paletteData_14, 0x6000, 0x2000);
            func_020b1314();
        }
    }
}

/* Forward two values to TileLayer_GetMetatileIndex on the indexed layer. */
void DualLayerTileRenderer_ForwardLayerPair(DualLayerTileRenderer *self, s32 layer, s32 a, s32 b)
{
    TileLayer_GetMetatileIndex(self->layers_28[layer], a, b);
}

/* Forward three values to TileLayer_SetMetatileIndex on the indexed layer. */
void DualLayerTileRenderer_ForwardLayerTriple(DualLayerTileRenderer *self, s32 layer,
                   s32 a, s32 b, s32 c)
{
    TileLayer_SetMetatileIndex(self->layers_28[layer], b, c, a);
}

/* Invoke vtable slot three with the supplied value on both existing layers. */
void DualLayerTileRenderer_SetLayersEnabled(DualLayerTileRenderer *self, s32 value)
{
    s32 i;
    for (i = 0; i < 2; i++)
        if (self->layers_28[i])
            ((LayerBoolMethod)(*(void ***)self->layers_28[i])[3])(
                self->layers_28[i], value);
}

/* Return one only when vtable slot four returns nonzero for both layers. */
s32 DualLayerTileRenderer_AreBothLayersReady(DualLayerTileRenderer *self)
{
    s32 i;
    s32 complete = 0;
    for (i = 0; i < 2; i++)
        if (self->layers_28[i] &&
            ((LayerQueryMethod)(*(void ***)self->layers_28[i])[4])(
                self->layers_28[i]))
            complete++;
    return complete == 2;
}

/*
 * Read one tile from each layer when coordinates are within packed dimensions,
 * extract bits 9..15, and return layer zero in bits 0..6 plus layer one in 7..13.
 */
u16 DualLayerTileRenderer_GetPackedTileValue(DualLayerTileRenderer *self, s32 x, s32 y)
{
    u16 low = 0;
    u16 high = 0;
    u16 width = (u16)self->packedDimensions_20;
    u16 height = (u16)(self->packedDimensions_20 >> 16);
    if (x < 0 || x >= width || y < 0 || y >= height)
        return 0;
    if (self->layers_28[0])
        low = (TileLayer_GetSourceCell(self->layers_28[0], x, y) & 0xfe00) >> 9;
    if (self->layers_28[1])
        high = (TileLayer_GetSourceCell(self->layers_28[1], x, y) & 0xfe00) >> 9;
    return low | (high << 7);
}

/* Split a packed two-layer tile value and write bits 9..15 into each layer. */
void DualLayerTileRenderer_SetPackedTileValue(DualLayerTileRenderer *self, s32 x, s32 y, u16 value)
{
    u16 width = (u16)self->packedDimensions_20;
    u16 height = (u16)(self->packedDimensions_20 >> 16);
    if (x < 0 || x >= width || y < 0 || y >= height)
        return;
    if (self->layers_28[0])
        TileLayer_SetSourceCellUpperBits(self->layers_28[0], x, y, (value & 0x7f) << 9);
    if (self->layers_28[1])
        TileLayer_SetSourceCellUpperBits(self->layers_28[1], x, y,
                      ((value >> 7) & 0x7f) << 9);
}

/* Convert FX32-like rectangle bounds to tile units and dispatch vtable slot 12 for every tile. */
void DualLayerTileRenderer_FillTileRectangle(DualLayerTileRenderer *self, s32 layer, s32 left,
                   s32 top, s32 right, s32 bottom, s32 value)
{
    s32 x;
    s32 y;
    if (!self->layers_28[layer])
        return;
    left = (left + ((left >> 3) < 0 ? 15 : 0)) >> 4;
    top = (top + ((top >> 3) < 0 ? 15 : 0)) >> 4;
    right = (right + ((right >> 3) < 0 ? 15 : 0)) >> 4;
    bottom = (bottom + ((bottom >> 3) < 0 ? 15 : 0)) >> 4;
    for (y = top; y < bottom; y++)
        for (x = left; x < right; x++)
            ((RendererTileMethod)(*(void ***)self)[12])(self, layer, value, x, y);
}

/* Return the query result for the embedded renderer at offset 0x60. */
void *DualLayerTileRenderer_GetEmbeddedRendererState(DualLayerTileRenderer *self)
{
    return func_0202b9bc(self->embeddedRenderer_60);
}

/* Load fixed archive data into a temporary large renderer and copy it into offset 0x60. */
void DualLayerTileRenderer_LoadEmbeddedRendererEntry(DualLayerTileRenderer *self, s32 index)
{
    u8 resource[0x14];
    u8 file[0x4c];
    u8 temporary[0x181c];
    NcgFile_Init(resource);
    GameFile_Init(file);
    GameFile_Open(file, gDualLayerTileRendererArchivePath);
    NcgFile_LoadCompressedFromFile(resource, file,
                  *(const u32 *)(self->config_1c + 0),
                  *(const u32 *)(self->config_1c + 4));
    func_0202b750(temporary, resource, index);
    func_0202b838(self->embeddedRenderer_60, temporary);
    func_0202b834(temporary);
    GameFile_Destroy(file);
    NcgFile_Destroy(resource);
}

/* Recovered empty renderer hook; it has no inputs, state changes, or return value. */
void func_02029d3c(void)
{
}
