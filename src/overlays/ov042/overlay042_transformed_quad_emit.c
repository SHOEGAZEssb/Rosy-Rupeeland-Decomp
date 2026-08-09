#include "tingle/types.h"

/*
 * Overlay 42 fully transformed textured-quad emission. This recovered renderer
 * streams translation and scale vectors into the Nintendo DS geometry engine,
 * applies a table-driven rotation, and emits a textured four-vertex polygon.
 */

extern "C" void func_020b0808(s16 sine, s16 cosine);
extern "C" void func_ov042_0220507c(s32 s, s32 t);
extern "C" void func_ov042_02204eb4(s16 x, s16 y, s32 z);
extern "C" s16 data_020c9670[];

/*
 * The first argument is unused. Given three-component translation and scale
 * payloads (read from words +4/+8/+C), a 16-bit angle, an additional two-word
 * translation, five vertex components, four texture components, and polygon
 * attributes, configure matrix mode and rotation then begin one primitive.
 * Emit its first XYZ vertex through the shared helper and the remaining packed
 * XY vertices directly to G3_VTX_16, ending the primitive afterward. Only DS
 * geometry-engine registers change; no value is returned.
 */
extern "C" void func_ov042_02204ee4(void *unused, const s32 *translation,
                                      s32 angle, const s32 *scale,
                                      const s32 *vertices,
                                      const s32 *extraTranslation,
                                      const s32 *texcoords, u16 attributes)
{
    (void)unused;
    volatile u32 *const mtxMode = (volatile u32 *)0x04000444;
    volatile u32 *const mtxScale = (volatile u32 *)0x0400046c;
    volatile u32 *const mtxTranslate = (volatile u32 *)0x04000470;
    volatile u32 *const polygonAttr = (volatile u32 *)0x04000480;
    volatile u32 *const packedVertex = (volatile u32 *)0x04000494;
    volatile u32 *const begin = (volatile u32 *)0x04000500;
    volatile u32 *const end = (volatile u32 *)0x04000504;

    *mtxMode = 0;
    *mtxTranslate = (u32)translation[1];
    *mtxTranslate = (u32)translation[2];
    *mtxTranslate = (u32)translation[3];
    *mtxScale = (u32)scale[1];
    *mtxScale = (u32)scale[2];
    *mtxScale = (u32)scale[3];
    *mtxTranslate = (u32)extraTranslation[0];
    *mtxTranslate = (u32)extraTranslation[1];
    *mtxTranslate = 0;
    s32 trigIndex = (angle >> 4) * 2;
    func_020b0808(data_020c9670[trigIndex],
                  data_020c9670[trigIndex + 1]);
    *begin = 1;
    *polygonAttr = attributes;

    func_ov042_0220507c(texcoords[0], texcoords[1]);
    func_ov042_02204eb4((s16)vertices[0], (s16)vertices[1],
                        (s16)vertices[2]);
    func_ov042_0220507c(texcoords[2], texcoords[1]);
    *packedVertex = ((u16)vertices[1] << 16) | (u16)vertices[3];
    func_ov042_0220507c(texcoords[2], texcoords[3]);
    *packedVertex = ((u16)vertices[4] << 16) | (u16)vertices[3];
    func_ov042_0220507c(texcoords[0], texcoords[3]);
    *packedVertex = ((u16)vertices[4] << 16) | (u16)vertices[0];
    *end = 0;
    *(volatile u32 *)0x04000448 = 1;
}
