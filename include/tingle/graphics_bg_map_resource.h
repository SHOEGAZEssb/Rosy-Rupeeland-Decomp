#ifndef TINGLE_GRAPHICS_BG_MAP_RESOURCE_H
#define TINGLE_GRAPHICS_BG_MAP_RESOURCE_H

#include "tingle/types.h"

/* Loaded screen-map dimensions. Counts are 16-bit map entries, not pixels;
 * the preceding descriptor words remain opaque until their consumers are
 * recovered. */
typedef struct GraphicsBgMapDescriptor {
    u32 magic;
    u32 headerWords04To08[2];
    s32 entryColumnCount;
    s32 entryRowCount;
} GraphicsBgMapDescriptor;

/* Archive-owned loaded screen-map view. The descriptor and entries are
 * borrowed from the resource cache. Palette and layout operations mutate the
 * entry buffer in place, while uploads only read it. */
typedef struct GraphicsBgMapResource {
    u8 archiveResourceBase[0x20];
    const GraphicsBgMapDescriptor *descriptor;
    u16 *entries;
} GraphicsBgMapResource;

typedef char GraphicsBgMapDescriptorSizeCheck[
    sizeof(GraphicsBgMapDescriptor) == 0x14 ? 1 : -1];
typedef char GraphicsBgMapResourceSizeCheck[
    sizeof(GraphicsBgMapResource) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsBgMapResource_UploadToMainBg(
    const GraphicsBgMapResource *resource, s32 bgIndex,
    u32 screenVramOffsetBytes);
u32 GraphicsBgMapResource_GetDataSizeBytes(
    const GraphicsBgMapResource *resource);
void GraphicsBgMapResource_UploadToSubBg(
    const GraphicsBgMapResource *resource, s32 bgIndex,
    u32 screenVramOffsetBytes);
void GraphicsBgMapResource_SetPaletteBank(
    GraphicsBgMapResource *resource, s32 paletteBank);
void GraphicsBgMapResource_AddPaletteBankOffset(
    GraphicsBgMapResource *resource, s32 paletteBankOffset);
void GraphicsBgMapResource_Convert32x32BlockMajorToRowMajor(
    GraphicsBgMapResource *resource);

#ifdef __cplusplus
}
#endif

#endif
