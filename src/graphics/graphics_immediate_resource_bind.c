/* Indexed texture, palette, and polygon binding for immediate 3D draws. */

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

extern void func_0209b414(u32 format, u32 generation, u32 sizeS, u32 sizeT,
                          u32 repeatS, u32 repeatT, u32 flip, u32 address);
extern void G3Command_SetTexturePaletteBase(u32 address, u32 format);
extern void func_0209b560(u32 light, u32 polygonMode, u32 cullMode,
                          u32 polygonId, u32 alpha, u32 misc);

/*
 * Bind one indexed texture resource from the borrowed 3D owner. A negative
 * index clears texture state. polygonMisc is forwarded to the polygon command;
 * all resource and G3 effects complete synchronously.
 */
void func_0209b494(void *context, s32 resource, s32 polygonMisc)
{
    const u8 *bytes = (const u8 *)context;

    if (resource >= 0) {
        u32 offset = (u32)resource * 4;
        u32 format = *(const u32 *)(bytes + 0x94 + offset);

        func_0209b414(format, 1,
                      *(const u32 *)(bytes + 0x16c + offset),
                      *(const u32 *)(bytes + 0x244 + offset),
                      3, 0, 1,
                      *(const u32 *)(bytes + 0x31c + offset));
        G3Command_SetTexturePaletteBase(*(const u32 *)(bytes + 0x3f4 + offset), format);
        func_0209b560(0, 0, 3, 0, 0x1f, (u32)polygonMisc);
    } else {
        func_0209b414(0, 0, 0, 0, 0, 0, 0, 0);
        func_0209b560(0, 0, 3, 0, 0x1f, 0);
    }
}

#ifdef __cplusplus
}
#endif
