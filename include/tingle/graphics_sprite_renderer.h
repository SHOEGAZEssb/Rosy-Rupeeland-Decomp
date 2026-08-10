#ifndef TINGLE_GRAPHICS_SPRITE_RENDERER_H
#define TINGLE_GRAPHICS_SPRITE_RENDERER_H

#include "tingle/graphics_indexed_chain_pool.h"
#include "tingle/graphics_lookup_cache.h"
#include "tingle/graphics_render_entry_pool.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/graphics_transfer_queue.h"
#include "tingle/graphics_vram_allocator.h"

/* Composite renderer state recovered from its embedded fixed-capacity pools. */
typedef struct GraphicsSpriteRenderer {
    void *field_00;
    void *field_04;
    void *field_08;
    void *field_0c;
    void *field_10;
    void *field_14;
    void *field_18;
    u32 field_1c;
    u32 field_20;
    u32 engine;
    u32 field_28;
    u32 field_2c;
    u32 field_30;
    u32 field_34;
    u32 field_38;
    u8 shadowBuffer[0x400];
    GraphicsSpriteGroup *groupHead;
    GraphicsSpriteGroup *groupTail;
    u32 groupCount;
    GraphicsVramAllocator vramAllocator;
    GraphicsIndexedChainPool indexedPool0;
    GraphicsIndexedChainPool indexedPool1;
    GraphicsRenderEntryPool renderEntryPool;
    GraphicsLookupCache lookupCache;
    GraphicsTransferQueue transferQueue;
} GraphicsSpriteRenderer;

typedef char GraphicsSpriteRendererSizeCheck[
    sizeof(GraphicsSpriteRenderer) == 0x2924 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteRenderer *func_02074200(GraphicsSpriteRenderer *renderer,
                                      u32 engine, u32 field28, u32 field2c);
void GraphicsSpriteRenderer_ConfigureObjectDisplay(
    GraphicsSpriteRenderer *renderer);
void *GraphicsSpriteRenderer_SetFontResource(GraphicsSpriteRenderer *renderer, void *replacement);
void GraphicsSpriteRenderer_ClearFontResource(GraphicsSpriteRenderer *renderer);
void GraphicsSpriteRenderer_ClearTextBuffer(GraphicsSpriteRenderer *renderer);
void *GraphicsSpriteRenderer_GetObjectPaletteAddress(GraphicsSpriteRenderer *renderer);
void GraphicsSpriteRenderer_QueuePaletteUploads(GraphicsSpriteRenderer *renderer);
void func_020756b4(GraphicsSpriteRenderer *renderer, s32 x, s32 y,
                   const char *text, s32 length, u32 mode);
void GraphicsSpriteRenderer_Printf(GraphicsSpriteRenderer *renderer, s32 x, s32 y,
                   const char *format, ...);
void DebugText_Printf(GraphicsSpriteRenderer *renderer, s32 x, s32 y,
                      u32 mode, const char *format, ...);
void GraphicsSpriteRenderer_SetTextGridPosition(GraphicsSpriteRenderer *renderer, s32 x, s32 y);
void GraphicsSpriteRenderer_ConfigureTextGridPriority(GraphicsSpriteRenderer *renderer, s32 priority,
                   u32 field20);
void GraphicsSpriteRenderer_SetTextGridObjectMode(GraphicsSpriteRenderer *renderer, s32 objectMode);
u32 GraphicsSpriteRenderer_DrawGlyph(GraphicsSpriteRenderer *renderer,
                                     s32 glyphIndex, u32 destinationX,
                                     u32 destinationY, u32 mode);
u8 GraphicsSpriteRenderer_GetGlyphMetric(GraphicsSpriteRenderer *renderer,
                                         s32 glyphIndex);
u16 GraphicsSpriteFont_MapCharacterToGlyph(u32 characterCode);
void GraphicsSpriteText_FormatDecimal(u16 *destination, s32 value,
                                      s32 placeValue, s32 zeroPad);
u32 GraphicsSpriteRenderer_DrawCharacter(GraphicsSpriteRenderer *renderer,
                                         u32 characterCode, u32 destinationX,
                                         u32 destinationY, u32 mode);
u8 GraphicsSpriteRenderer_GetCharacterMetric(
    GraphicsSpriteRenderer *renderer, u32 characterCode);
s32 GraphicsSpriteRenderer_DrawText(GraphicsSpriteRenderer *renderer,
                                    const u16 *text, s32 destinationX,
                                    s32 destinationY, u32 mode,
                                    s32 glyphAdvance, s32 spacing);
s32 GraphicsSpriteRenderer_MeasureText(GraphicsSpriteRenderer *renderer,
                                       const u16 *text, s32 glyphAdvance,
                                       s32 spacing);

#ifdef __cplusplus
}
#endif

#endif
