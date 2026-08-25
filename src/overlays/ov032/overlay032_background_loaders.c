#include "tingle/graphics_bg_map_resource.h"

/* Overlay 32 main-engine background mode changes and archive-resource uploads. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

typedef struct GraphicsResourceSet {
    void *characterResource;
    void *paletteResource;
    GraphicsBgMapResource *bgMapResource;
} GraphicsResourceSet;

extern void *data_020f4e18[];
extern const u8 data_020c7bac[];
extern const u8 data_020c7bb0[];
extern const u8 data_020c7bb4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(GraphicsResourceSet *);
extern void GraphicsResourceSet_Load(...);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *);
extern void func_020b44e8(void);
extern void GraphicsBgCharacterResource_UploadToMainBg(...);
extern s32 GraphicsResource_GetFormat(void *);
extern void GraphicsBgPaletteResource_UploadToMainBg(...);
extern void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *);
#ifdef __cplusplus
}
#endif

static void upload_text_background(GraphicsResourceSet *set, s32 layer, u32 mapBase)
{
    func_020b44e8();
    GraphicsBgCharacterResource_UploadToMainBg(set->characterResource, layer, 0);
    GraphicsBgPaletteResource_UploadToMainBg(set->paletteResource,
                  GraphicsResource_GetFormat(set->characterResource)
                      ? mapBase : 0);
    GraphicsBgMapResource_UploadToMainBg(set->bgMapResource, layer, 0);
    GraphicsResourceSet_ReleaseHandles(set);
}

/*
 * Enables main BG0/BG1/BG2, loads archive IDs 0xA064/0xA065/0xA06B into a
 * temporary set, uploads them to BG2 at map base 0x6000, restores palette entry
 * zero to 0x24A3, and destroys the temporary set. Returns void.
 */
extern "C" void func_ov032_021fe4a8(void)
{
    GraphicsResourceSet set;
    REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1700;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18[0], 0xa064, 0xa065, 0xa06b);
    upload_text_background(&set, 2, 0x6000);
    REG16(0x05000000) = 0x24a3;
    GraphicsResourceSet_Destroy(&set);
}

/*
 * Enables all main BG layers, uploads common IDs 0xA064/0xA065/0xA06C to BG2,
 * then reloads the persistent set at +0xB44 from the selected 0x208-byte record
 * and uploads it to BG3. It clears the fixed-point accumulator at +0xC34,
 * restores palette entry zero, and returns void. Table fields remain address-
 * named until their underlying asset records are identified.
 */
extern "C" void func_ov032_021fe55c(void *scene)
{
    GraphicsResourceSet temporary;
    GraphicsResourceSet *persistent = (GraphicsResourceSet *)((u8 *)scene + 0xb44);
    u32 tableOffset = FIELD(u32, scene, 0xc24) * 0x208;

    REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1f00;
    GraphicsResourceSet_Init(&temporary);
    GraphicsResourceSet_Load(&temporary, data_020f4e18[0], 0xa064, 0xa065, 0xa06c);
    upload_text_background(&temporary, 2, 0x6000);

    GraphicsResourceSet_ReleaseHandles(persistent);
    GraphicsResourceSet_Load(persistent, data_020f4e18[0],
                             FIELD(u32, data_020c7bac, tableOffset),
                             FIELD(u32, data_020c7bb0, tableOffset),
                             FIELD(u32, data_020c7bb4, tableOffset));
    func_020b44e8();
    GraphicsBgCharacterResource_UploadToMainBg(persistent->characterResource, 3, 0);
    GraphicsBgPaletteResource_UploadToMainBg(
        persistent->paletteResource,
        GraphicsResource_GetFormat(persistent->characterResource)
            ? 0x6000 : 0);
    GraphicsBgMapResource_UploadToMainBg(persistent->bgMapResource, 3, 0);
    FIELD(s32, scene, 0xc34) = 0;
    REG16(0x05000000) = 0x24a3;
    GraphicsResourceSet_Destroy(&temporary);
}
