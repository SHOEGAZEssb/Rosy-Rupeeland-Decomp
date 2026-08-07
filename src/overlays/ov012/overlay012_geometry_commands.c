#include "tingle/types.h"

/* Overlay 12 direct Nintendo DS geometry-command register encoders. */

/* Pack six caller-supplied fields into G3_POLYGON_ATTR and return void after writing 0x040004A4. Field widths remain caller-constrained. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fe348(u32 field0, u32 field4, u32 field6, u32 field24,
                         u32 field16, u32 passthrough)
{
    volatile u32 *polygonAttr = (volatile u32 *)0x040004a4;

    *polygonAttr = passthrough | field0 | (field4 << 4) | (field6 << 6) |
                   (field24 << 24) | (field16 << 16);
}

/* Pack eight texture-parameter fields into G3_TEXIMAGE_PARAM and return void after writing 0x040004A8. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fe374(u32 field26, u32 field30, u32 field20, u32 field23,
                         u32 field16, u32 field18, u32 field29, u32 address)
{
    volatile u32 *textureParam = (volatile u32 *)0x040004a8;

    *textureParam = (field26 << 26) | (address >> 3) | (field30 << 30) |
                    (field20 << 20) | (field23 << 23) | (field16 << 16) |
                    (field18 << 18) | (field29 << 29);
}

/* Convert two signed fixed-point coordinates by the confirmed shift sequence, pack them into G3_TEXCOORD, and return void. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fe3b4(s32 s, s32 t)
{
    volatile u32 *texcoord = (volatile u32 *)0x04000488;
    u32 packedS = (u16)((s << 8) >> 16);
    u32 packedT = (u16)((t << 8) >> 16);

    *texcoord = packedS | (packedT << 16);
}
