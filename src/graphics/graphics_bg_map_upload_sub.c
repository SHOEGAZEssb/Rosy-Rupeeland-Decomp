/*
 * Sub-engine BG screen-map upload dispatch. The loaded map remains owned by
 * its graphics archive and the destination is a byte offset in BG screen VRAM.
 */
#include "tingle/graphics_bg_map_resource.h"

extern void func_020b1ccc(const void *source, u32 destination, u32 size);
extern void func_020b1bfc(const void *source, u32 destination, u32 size);
extern void func_020b1b2c(const void *source, u32 destination, u32 size);
extern void func_020b1a5c(const void *source, u32 destination, u32 size);

/* Upload the loaded map to sub BG0..BG3. The shared size helper reads its
 * descriptor dimensions; invalid background indices leave VRAM unchanged. */
void GraphicsBgMapResource_UploadToSubBg(
    const GraphicsBgMapResource *resource, s32 bgIndex,
    u32 screenVramOffsetBytes)
{
    switch (bgIndex) {
    case 0:
        func_020b1ccc(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    case 1:
        func_020b1bfc(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    case 2:
        func_020b1b2c(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    case 3:
        func_020b1a5c(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    }
}
