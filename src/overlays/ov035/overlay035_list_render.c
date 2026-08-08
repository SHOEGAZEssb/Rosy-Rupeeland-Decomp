#include "tingle/types.h"

/* Overlay 35 linked-node strip rendering and GX texture attribute packing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02091bd0(void *state, s32 mode, s32 maximum, s32 step);
extern void func_ov035_021fd128(s32 lightMask, s32 polygonMode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov035_021fd28c(s16 s, u16 t, u16 q);
extern void func_ov035_021fd7b0(s32 format, s32 transform, s32 sizeS,
                               s32 sizeT, s32 repeatS, s32 repeatT,
                               s32 flip, u32 address);
#ifdef __cplusplus
}
#endif

/*
 * Draws adjacent nodes as independent GX segments when list count +8 is at
 * least two. Node words +4/+8 and +0x0C/+0x10 form the two recovered packed
 * coordinate pairs, while +0x14 supplies the third texture-coordinate input.
 * Each later node's embedded animation +0x18 is advanced and used as polygon
 * alpha with polygon ID 14. List color +0x14 is emitted for every segment.
 * Returns no value; animation state advances and Nintendo DS GX MMIO changes.
 */
extern "C" void func_ov035_021fd60c(void *list)
{
    if (FIELD(s32, list, 8) < 2)
        return;

    func_ov035_021fd7b0(0, 0, 0, 0, 0, 0, 0, 0);
    void *previous = FIELD(void *, list, 0);
    s16 previousS = FIELD(s16, previous, 4);
    s16 previousT = FIELD(s16, previous, 8);
    s16 previousX = FIELD(s16, previous, 0x0c);
    s16 previousY = FIELD(s16, previous, 0x10);
    s16 previousQ = FIELD(s16, previous, 0x14);
    void *node = FIELD(void *, previous, 0);

    while (node != 0) {
        s16 currentS = FIELD(s16, node, 4);
        s16 currentT = FIELD(s16, node, 8);
        s16 currentX = FIELD(s16, node, 0x0c);
        s16 currentY = FIELD(s16, node, 0x10);
        s16 currentQ = FIELD(s16, node, 0x14);
        s32 alpha = func_02091bd0((u8 *)node + 0x18, 1, 0x1f, 1);

        func_ov035_021fd128(0, 0, 3, 0x0e, alpha, 0);
        REG32(0x04000500) = 1;
        REG32(0x04000480) = FIELD(u16, list, 0x14);
        func_ov035_021fd28c(previousS, (u16)previousT, (u16)previousQ);
        REG32(0x04000494) =
            (u16)previousX | ((u32)(u16)previousY << 16);
        func_ov035_021fd28c(currentX, (u16)currentY, (u16)currentQ);
        REG32(0x04000494) =
            (u16)currentS | ((u32)(u16)currentT << 16);
        REG32(0x04000504) = 0;

        previousS = currentS;
        previousT = currentT;
        previousX = currentX;
        previousY = currentY;
        node = FIELD(void *, node, 0);
    }
}

/*
 * Packs texture format, transform, dimensions, repeat/flip flags, and address
 * into GX register 0x040004A8. Field meanings are inferred from the Nintendo
 * DS GX layout; their bit placement is confirmed by the code. Returns no value
 * and directly changes GX texture state.
 */
extern "C" void func_ov035_021fd7b0(s32 format, s32 transform, s32 sizeS,
                                     s32 sizeT, s32 repeatS, s32 repeatT,
                                     s32 flip, u32 address)
{
    REG32(0x040004a8) = (format << 26) | (address >> 3) |
                        (transform << 30) | (sizeS << 20) | (sizeT << 23) |
                        (repeatS << 16) | (repeatT << 18) | (flip << 29);
}
