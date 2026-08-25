#include "tingle/graphics_bg_map_resource.h"
#include "tingle/graphics_resources.h"

/* Load a three-part background resource set, upload selected pieces, then release it. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void func_020b44e8(void);
extern void func_02070638(void *resource, s32 background, s32 value);
extern s32 GraphicsResource_GetFormat(void *resource);
extern void func_02070b50(void *resource, s32 destination);
#ifdef __cplusplus
}
#endif

/*
 * Load three IDs from archive data_020f4e18, configure resource 2 with the
 * halfword parameter, clear main palette entry zero, and upload resources for
 * background 0..3.  uploadGraphics gates resource-0 work (and some paired
 * resource-1 work exactly as recovered).  Destroy the temporary set and
 * return zero; resource APIs may issue VRAM/cache transfers.
 */
s32 GraphicsMainBackground_LoadResources(s32 background, u32 resource0Id,
                                         u32 resource1Id, u32 resource2Id,
                                         u16 parameter, s32 uploadGraphics)
{
    GraphicsResourceSet resources;
    s32 characterDataDestination;

    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             resource0Id, resource1Id, resource2Id);
    GraphicsBgMapResource_AddPaletteBankOffset(
        (GraphicsBgMapResource *)resources.resource2, (s32)parameter);
    *(volatile u16 *)0x05000000 = 0;
    func_020b44e8();

    switch (background) {
    case 0:
        if (uploadGraphics) {
            func_02070638(resources.resource0, 0, 0);
            func_02070b50(resources.resource1, parameter << 5);
        }
        GraphicsBgMapResource_UploadToMainBg(
            (GraphicsBgMapResource *)resources.resource2, 0, 0U);
        break;
    case 1:
        if (uploadGraphics) {
            func_02070638(resources.resource0, 1, 0);
            characterDataDestination =
                GraphicsResource_GetFormat(resources.resource0)
                    ? 0x2000 : parameter << 5;
            func_02070b50(resources.resource1, characterDataDestination);
        }
        GraphicsBgMapResource_UploadToMainBg(
            (GraphicsBgMapResource *)resources.resource2, 1, 0U);
        break;
    case 2:
        if (uploadGraphics)
            func_02070638(resources.resource0, 2, 0);
        characterDataDestination =
            GraphicsResource_GetFormat(resources.resource0)
                ? 0x4000 : parameter << 5;
        func_02070b50(resources.resource1, characterDataDestination);
        GraphicsBgMapResource_UploadToMainBg(
            (GraphicsBgMapResource *)resources.resource2, 2, 0U);
        break;
    case 3:
        if (uploadGraphics) {
            func_02070638(resources.resource0, 3, 0);
            characterDataDestination =
                GraphicsResource_GetFormat(resources.resource0)
                    ? 0x6000 : parameter << 5;
            func_02070b50(resources.resource1, characterDataDestination);
        }
        GraphicsBgMapResource_UploadToMainBg(
            (GraphicsBgMapResource *)resources.resource2, 3, 0U);
        break;
    }
    GraphicsResourceSet_Destroy(&resources);
    return 0;
}
