#include "tingle/graphics_bg_map_resource.h"

/* Main-engine upload dispatch for loaded background screen-map resources. */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020b1d34(const void *source, s32 destination, u32 size);
extern void func_020b1c64(const void *source, s32 destination, u32 size);
extern void func_020b1b94(const void *source, s32 destination, u32 size);
extern void func_020b1ac4(const void *source, s32 destination, u32 size);

#ifdef __cplusplus
}
#endif

/*
 * Upload the loaded screen map to main-engine background 0..3 at the caller's
 * byte offset. Invalid indices do not alter VRAM.
 */
#ifdef __cplusplus
extern "C"
#endif
void GraphicsBgMapResource_UploadToMainBg(
    const GraphicsBgMapResource *resource, s32 bgIndex,
    u32 screenVramOffsetBytes)
{
    switch (bgIndex) {
    case 0:
        func_020b1d34(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    case 1:
        func_020b1c64(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    case 2:
        func_020b1b94(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    case 3:
        func_020b1ac4(resource->entries, screenVramOffsetBytes,
                      GraphicsBgMapResource_GetDataSizeBytes(resource));
        return;
    }
}
