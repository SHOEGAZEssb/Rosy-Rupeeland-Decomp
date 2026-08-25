#include "tingle/types.h"

/*
 * Overlay 4 affine-background application. This recovered helper computes two
 * rotation/scale matrices and applies each to matching backgrounds on both DS
 * display engines.
 */

typedef struct Overlay004AffineMatrix {
    s32 field_00;
    s32 field_04;
    s32 field_08;
    s32 field_0c;
} Overlay004AffineMatrix;

typedef struct Overlay004AffineBackgroundState {
    u8 field_000[0x108];
    s32 width_108;
    s32 height_10c;
    s16 angle_110;
    u8 field_112[0x12];
    s32 scaleA_124;
    u8 field_128[0x18];
    s32 scaleB_140;
} Overlay004AffineBackgroundState;

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 gFx32CosSinTable[];
extern s32 func_020adc90(s16 coefficient, s32 scale);
extern void func_020afd28(volatile void *registers,
                          const Overlay004AffineMatrix *matrix, s32 width,
                          s32 height, s32 centerX, s32 centerY);
#ifdef __cplusplus
}
#endif

static void overlay004_build_affine(Overlay004AffineMatrix *matrix, s32 angle,
                                     s32 scale)
{
    s32 sine = func_020adc90(gFx32CosSinTable[angle * 2 + 1], scale);
    s32 cosine = func_020adc90(gFx32CosSinTable[angle * 2], scale);

    matrix->field_00 = sine;
    matrix->field_04 = cosine;
    matrix->field_08 = -cosine;
    matrix->field_0c = sine;
}

/*
 * Convert angle_110 from its stored 1/16-unit representation and build the
 * first matrix with scaleA_124. Apply it to sub/main BG3 register blocks
 * 0x04001030/0x04000030. Build the second matrix with scaleB_140 shifted left
 * two bits and apply it to sub/main BG2 blocks 0x04001020/0x04000020. All calls
 * use width_108 and height_10c+0xC0; X center is width-0x80, while sub and main
 * Y centers are height-0x60 and that value+0xC0. Returns no value. Register
 * writes are delegated to func_020afd28, but the MMIO destinations and affine
 * hardware effects are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay004_ApplyAffineBackground(Overlay004AffineBackgroundState *state)
{
    Overlay004AffineMatrix matrix;
    s32 angle = state->angle_110 >> 4;
    s32 centerX = state->width_108 - 0x80;
    s32 subCenterY = state->height_10c - 0x60;
    s32 mainCenterY = subCenterY + 0xc0;
    s32 extentY = state->height_10c + 0xc0;

    overlay004_build_affine(&matrix, angle, state->scaleA_124);
    func_020afd28((volatile void *)0x04001030, &matrix, state->width_108,
                  extentY, centerX, subCenterY);
    func_020afd28((volatile void *)0x04000030, &matrix, state->width_108,
                  extentY, centerX, mainCenterY);

    overlay004_build_affine(&matrix, angle, state->scaleB_140 << 2);
    func_020afd28((volatile void *)0x04001020, &matrix, state->width_108,
                  extentY, centerX, subCenterY);
    func_020afd28((volatile void *)0x04000020, &matrix, state->width_108,
                  extentY, centerX, mainCenterY);
}
