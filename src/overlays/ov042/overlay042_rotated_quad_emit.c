#include "tingle/types.h"

/*
 * Overlay 42 rotated textured-quad emission. This recovered renderer writes
 * directly to Nintendo DS geometry-engine registers, applies a table-driven
 * Z rotation, and submits one textured four-vertex polygon.
 */

extern "C" void func_020b0808(s16 sine, s16 cosine);
extern "C" void func_ov042_0220507c(s32 s, s32 t);
extern "C" void func_ov042_02204eb4(s16 x, s16 y, s32 z);
extern "C" s16 data_020c9670[];

/*
 * The first argument is unused. Given a two-word translation, 16-bit angle,
 * four signed vertex coordinate pairs, four texture coordinate pairs, and a
 * polygon attribute halfword, reset matrix mode, stream translation and scale
 * parameters, load sine/cosine from data_020c9670, and call the SDK rotation
 * helper. Set polygon attributes, begin a primitive, then emit four texture
 * coordinates and vertices clockwise; the first vertex uses the shared helper
 * with Z=0xAE and the remaining packed XY vertices go directly to G3_VTX_16.
 * End the primitive and restore matrix mode. Only geometry-engine state changes.
 */
extern "C" void func_ov042_02205b38(void *unused, const s32 *translation,
                                      s32 angle, const s32 *vertices,
                                      const s32 *texcoords, u16 attributes)
{
    (void)unused;
    volatile u32 *const mtxMode = (volatile u32 *)0x04000444;
    volatile u32 *const mtxTranslate = (volatile u32 *)0x04000470;
    volatile u32 *const polygonAttr = (volatile u32 *)0x04000480;
    volatile u32 *const packedVertex = (volatile u32 *)0x04000494;
    volatile u32 *const begin = (volatile u32 *)0x04000500;
    volatile u32 *const end = (volatile u32 *)0x04000504;

    *mtxMode = 0;
    *mtxTranslate = (u32)translation[0];
    *mtxTranslate = (u32)translation[1];
    *mtxTranslate = 0;
    s32 trigIndex = (angle >> 4) * 2;
    func_020b0808(data_020c9670[trigIndex],
                  data_020c9670[trigIndex + 1]);
    *begin = 1;
    *polygonAttr = attributes;

    func_ov042_0220507c(texcoords[0], texcoords[1]);
    func_ov042_02204eb4((s16)vertices[0],
                        (s16)(vertices[1] - 1), 0xae);
    func_ov042_0220507c(texcoords[2], texcoords[1]);
    *packedVertex = ((u16)(vertices[1] - 1) << 16) | (u16)vertices[2];
    func_ov042_0220507c(texcoords[2], texcoords[3]);
    *packedVertex = ((u16)(vertices[3] - 1) << 16) | (u16)vertices[2];
    func_ov042_0220507c(texcoords[0], texcoords[3]);
    *packedVertex = ((u16)(vertices[3] - 1) << 16) | (u16)vertices[0];
    *end = 0;
    *(volatile u32 *)0x04000448 = 1;
}
