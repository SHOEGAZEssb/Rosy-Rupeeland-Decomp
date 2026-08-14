/*
 * Sub-engine palette upload dispatch for decoded graphics resources. Standard
 * palettes write palette RAM; extended palettes use a temporary LCDC mapping.
 */
#include "tingle/types.h"

typedef struct GraphicsBgPaletteResource {
    u8 field00[0x14];
    u32 loaded;
    u8 field18[8];
    const void *descriptor;
} GraphicsBgPaletteResource;

extern void *func_02070874(const GraphicsBgPaletteResource *resource);
extern void func_020b1ff0(const void *source, u32 destination, u32 size);
extern void func_020b13d4(void);
extern void func_020b1360(const void *source, u32 destination, u32 size);
extern void func_020b1314(void);

/* Upload a loaded palette according to its descriptor mode. Mode 0x10 uses
 * 32-byte colors; mode 0x100 brackets 512-byte extended-palette banks. */
void func_02070bc4(GraphicsBgPaletteResource *resource, u32 destination)
{
    const u8 *descriptor;

    if (resource->loaded == 0)
        return;
    descriptor = (const u8 *)resource->descriptor;
    switch (*(const u16 *)(descriptor + 4)) {
    case 0x10:
        func_020b1ff0(func_02070874(resource), destination,
                      *(const u16 *)(descriptor + 6) << 5);
        return;
    case 0x100:
        func_020b13d4();
        func_020b1360(func_02070874(resource), destination,
                      *(const u16 *)((const u8 *)resource->descriptor + 6)
                          << 9);
        func_020b1314();
        return;
    default:
        return;
    }
}
