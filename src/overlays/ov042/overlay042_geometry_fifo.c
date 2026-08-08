#include "tingle/types.h"

/*
 * Overlay 42 geometry FIFO helpers. These recovered routines pack texture
 * coordinates and signed 16-bit vertices for the Nintendo DS geometry engine,
 * and emit a caller-provided strip of texture/vertex records.
 */

#define REG_G3_TEXCOORD (*(volatile u32 *)0x04000488)
#define REG_G3_VTX_16   (*(volatile u32 *)0x0400048c)
#define REG_G3_BEGIN    (*(volatile u32 *)0x04000500)
#define REG_G3_END      (*(volatile u32 *)0x04000504)

/*
 * Submit one signed 16-bit XYZ vertex. X and Y are packed into the first FIFO
 * word and Z into the second; the geometry engine is changed and no value is
 * returned. High bits of all inputs are discarded.
 */
extern "C" void func_ov042_021fd548(s32 x, s32 y, s32 z)
{
    REG_G3_VTX_16 = ((u32)(u16)y << 16) | (u16)x;
    REG_G3_VTX_16 = (u16)z;
}

/*
 * Submit one texture coordinate pair after the recovered 8-bit fixed-point
 * alignment conversion. The packed word is written to the geometry FIFO; no
 * value is returned and high input bits are discarded by the shifts.
 */
extern "C" void func_ov042_021fd624(s32 s, s32 t)
{
    u16 packedS = (u16)(s << 8 >> 16);
    u16 packedT = (u16)(t << 8 >> 16);
    REG_G3_TEXCOORD = ((u32)packedT << 16) | packedS;
}

/*
 * Emit count texture/vertex records. textureCoordinates supplies two words per
 * record and vertices supplies three words per record; each vertex component
 * is narrowed to signed 16 bits. The routine begins geometry primitive type 2,
 * streams records in order, ends the primitive, and returns no value.
 */
extern "C" void func_ov042_021fd578(void *unused,
                                    const s32 *vertices,
                                    const s32 *textureCoordinates,
                                    s32 count)
{
    (void)unused;
    REG_G3_BEGIN = 2;
    for (s32 i = 0; i < count; ++i) {
        func_ov042_021fd624(textureCoordinates[i * 2],
                           textureCoordinates[i * 2 + 1]);
        func_ov042_021fd548((s16)vertices[i * 3],
                           (s16)vertices[i * 3 + 1],
                           (s16)vertices[i * 3 + 2]);
    }
    REG_G3_END = 0;
}
