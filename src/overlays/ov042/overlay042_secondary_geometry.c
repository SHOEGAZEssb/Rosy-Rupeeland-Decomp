#include "tingle/types.h"

/*
 * Overlay 42 secondary geometry helpers. These address-distinct routines serve
 * the overlay's later renderer, packing vertices and texture coordinates into
 * the Nintendo DS geometry FIFO and copying its two-word coordinate records.
 */

#define REG_G3_TEXCOORD (*(volatile u32 *)0x04000488)
#define REG_G3_VTX_16   (*(volatile u32 *)0x0400048c)

extern "C" s16 gFx32CosSinTable[];
extern "C" void func_020b0808(s32 sine, s32 cosine);

/*
 * Submit one signed 16-bit XYZ vertex to the geometry FIFO. X/Y are packed in
 * the first word and Z in the second; high input bits are discarded, hardware
 * state changes, and no value is returned.
 */
extern "C" void func_ov042_021ffd00(s32 x, s32 y, s32 z)
{
    REG_G3_VTX_16 = ((u32)(u16)y << 16) | (u16)x;
    REG_G3_VTX_16 = (u16)z;
}

/*
 * Copy an eight-byte pair from source to destination. Both words are copied,
 * destination changes, and no value is returned.
 */
extern "C" void func_ov042_021ffd30(void *destination, const void *source)
{
    ((u32 *)destination)[0] = ((const u32 *)source)[0];
    ((u32 *)destination)[1] = ((const u32 *)source)[1];
}

/*
 * Submit one texture coordinate pair after the recovered 8-bit alignment
 * conversion. The packed word is written to the geometry FIFO, high input bits
 * are discarded, and no value is returned.
 */
extern "C" void func_ov042_021ffd44(s32 s, s32 t)
{
    u16 packedS = (u16)(s << 8 >> 16);
    u16 packedT = (u16)(t << 8 >> 16);
    REG_G3_TEXCOORD = ((u32)packedT << 16) | packedS;
}

/*
 * Emit one textured quadrilateral through the Nintendo DS geometry FIFO. The
 * first argument is unused. transform supplies two words written in sequence
 * to 0x04000470 after selecting matrix mode 0. angle selects adjacent signed
 * entries from the confirmed trigonometric table and func_020b0808 applies
 * them. vertices supplies four XY pairs, textureCoordinates supplies four ST
 * pairs, and polygonAttributes is narrowed to 16 bits for 0x04000480.
 *
 * Begin primitive type 1, submit all four corners at Z=0xAD (the last three XY
 * pairs are packed directly to 0x04000494), end the primitive, and write 1 to
 * 0x04000448 to restore the recovered matrix state. Hardware state changes and
 * no value is returned.
 */
extern "C" void func_ov042_021ffd78(void *unused, const s32 *transform,
                                    s32 angle, const s32 *vertices,
                                    const s32 *textureCoordinates,
                                    u16 polygonAttributes)
{
    (void)unused;
    *(volatile u32 *)0x04000444 = 0;
    *(volatile u32 *)0x04000470 = transform[0];
    *(volatile u32 *)0x04000470 = transform[1];
    s32 tableIndex = (angle >> 4) * 2;
    *(volatile u32 *)0x04000470 = 0;
    func_020b0808(gFx32CosSinTable[tableIndex],
                  gFx32CosSinTable[tableIndex + 1]);
    *(volatile u32 *)0x04000500 = 1;
    *(volatile u32 *)0x04000480 = polygonAttributes;
    func_ov042_021ffd44(textureCoordinates[0], textureCoordinates[1]);
    func_ov042_021ffd00((s16)vertices[0], (s16)vertices[1], 0xad);
    func_ov042_021ffd44(textureCoordinates[2], textureCoordinates[1]);
    *(volatile u32 *)0x04000494 =
        ((u32)(u16)vertices[1] << 16) | (u16)vertices[2];
    func_ov042_021ffd44(textureCoordinates[2], textureCoordinates[3]);
    *(volatile u32 *)0x04000494 =
        ((u32)(u16)vertices[3] << 16) | (u16)vertices[2];
    func_ov042_021ffd44(textureCoordinates[0], textureCoordinates[3]);
    *(volatile u32 *)0x04000494 =
        ((u32)(u16)vertices[3] << 16) | (u16)vertices[0];
    *(volatile u32 *)0x04000504 = 0;
    *(volatile u32 *)0x04000448 = 1;
}
