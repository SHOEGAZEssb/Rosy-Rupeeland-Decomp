#include "tingle/graphics_sprite_canvas.h"

/*
 * Software drawing primitives for a 256-by-192, 4-bpp sprite surface. The NDS
 * backing store is divided into 64-by-64-pixel blocks, then 8-by-8 tiles; each
 * u32 contains one horizontal run of eight four-bit pixels.
 */

enum {
    GRAPHICS_SPRITE_CANVAS_WIDTH = 256,
    GRAPHICS_SPRITE_CANVAS_HEIGHT = 192
};

#ifndef MATCHING

/*
 * Return the word containing (x, y) in the confirmed NDS tiled layout. Inputs
 * must already lie inside the 256-by-192 surface. No state changes occur.
 */
static u32 *GraphicsSpriteCanvas_GetPixelWord(u32 *pixels, s32 x, s32 y)
{
    u32 block = ((u32)y >> 6) * 4 + ((u32)x >> 6);
    u32 tile = ((u32)y & 0x38) + (((u32)x & 0x3f) >> 3);
    u32 row = (u32)y & 7;

    return (u32 *)((u8 *)pixels + block * 0x800 + tile * 0x20 + row * 4);
}

/*
 * Store the low four bits of color at one in-bounds pixel. This portable
 * helper expresses the behavior of retail func_020763dc; the retail helper
 * receives color through its caller's retained r5 rather than the C ABI.
 */
static void GraphicsSpriteCanvas_PutPixel(u32 *pixels, s32 x, s32 y,
                                          u32 color)
{
    u32 shift = ((u32)x & 7) * 4;
    u32 mask = 0xf << shift;
    u32 *word = GraphicsSpriteCanvas_GetPixelWord(pixels, x, y);

    *word = (*word & ~mask) | ((color & 0xf) << shift);
}

/*
 * Draw an inclusive Bresenham line from (x0, y0) to (x1, y1), clipping each
 * emitted pixel independently to the 256-by-192 canvas. The low nibble of
 * color replaces the destination pixel. The canvas backing pixels change;
 * there are no hardware or SDK effects.
 */
void func_02076308(GraphicsSpriteCanvas *canvas, s32 x0, s32 y0,
                   s32 x1, s32 y1, u32 color)
{
    s32 dx = x1 - x0;
    s32 dy = y1 - y0;
    s32 stepX = 1;
    s32 stepY = 1;
    s32 error;
    u32 count;

    if (dx < 0) {
        dx = -dx;
        stepX = -1;
    }
    if (dy < 0) {
        dy = -dy;
        stepY = -1;
    }

    if (dx > dy) {
        error = -dx;
        count = (u16)(dx + 1);
        do {
            if (x0 >= 0 && y0 >= 0 && x0 < GRAPHICS_SPRITE_CANVAS_WIDTH &&
                y0 < GRAPHICS_SPRITE_CANVAS_HEIGHT) {
                GraphicsSpriteCanvas_PutPixel(canvas->pixels, x0, y0, color);
            }
            x0 += stepX;
            error += dy * 2;
            if (error >= 0) {
                error -= dx * 2;
                y0 += stepY;
            }
        } while (--count != 0);
    } else {
        error = -dy;
        count = (u16)(dy + 1);
        do {
            if (x0 >= 0 && y0 >= 0 && x0 < GRAPHICS_SPRITE_CANVAS_WIDTH &&
                y0 < GRAPHICS_SPRITE_CANVAS_HEIGHT) {
                GraphicsSpriteCanvas_PutPixel(canvas->pixels, x0, y0, color);
            }
            y0 += stepY;
            error += dx * 2;
            if (error >= 0) {
                error -= dy * 2;
                x0 += stepX;
            }
        } while (--count != 0);
    }
}

/*
 * Fill the inclusive rectangle between the two supplied corners. Coordinates
 * are ordered, rejected when wholly outside, and clipped to 0..255 by 0..191.
 * The low nibble of color replaces every covered pixel. The retail routine
 * batches partial and whole eight-pixel words; this portable form deliberately
 * expresses the same visible result through the shared pixel helper.
 */
void func_02076428(GraphicsSpriteCanvas *canvas, s32 x0, s32 y0,
                   s32 x1, s32 y1, u32 color)
{
    s32 x;
    s32 y;
    s32 swap;

    if (x1 < x0) {
        swap = x0;
        x0 = x1;
        x1 = swap;
    }
    if (y1 < y0) {
        swap = y0;
        y0 = y1;
        y1 = swap;
    }
    if (x0 >= GRAPHICS_SPRITE_CANVAS_WIDTH ||
        y0 >= GRAPHICS_SPRITE_CANVAS_HEIGHT || x1 < 0 || y1 < 0) {
        return;
    }
    if (x0 < 0) {
        x0 = 0;
    }
    if (y0 < 0) {
        y0 = 0;
    }
    if (x1 >= GRAPHICS_SPRITE_CANVAS_WIDTH) {
        x1 = GRAPHICS_SPRITE_CANVAS_WIDTH - 1;
    }
    if (y1 >= GRAPHICS_SPRITE_CANVAS_HEIGHT) {
        y1 = GRAPHICS_SPRITE_CANVAS_HEIGHT - 1;
    }

    for (x = x0; x <= x1; x++) {
        for (y = y0; y <= y1; y++) {
            GraphicsSpriteCanvas_PutPixel(canvas->pixels, x, y, color);
        }
    }
}

/*
 * Draw the four inclusive edges of the supplied rectangle by calling
 * func_02076308. Corner pixels are consequently written twice. Coordinates
 * are clipped by the line routine and the low color nibble is stored. Return
 * no value; only canvas pixels change.
 */
void func_0207663c(GraphicsSpriteCanvas *canvas, s32 x0, s32 y0,
                   s32 x1, s32 y1, u32 color)
{
    func_02076308(canvas, x0, y0, x1, y0, color);
    func_02076308(canvas, x1, y0, x1, y1, color);
    func_02076308(canvas, x0, y0, x0, y1, color);
    func_02076308(canvas, x0, y1, x1, y1, color);
}

/* No-op drawing hook. It accepts no inputs, changes no state, and returns. */
void func_020766c8(void)
{
}
#else
/* These matching fallbacks implement the documented portable C above. */
#ifdef __cplusplus
extern "C" {
#endif
void func_020763dc(u32 *pixels, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

asm void func_02076308(GraphicsSpriteCanvas *canvas, s32 x0, s32 y0,
                       s32 x1, s32 y1, u32 color)
{
    DCD 0xE92D4FF0
    DCD 0xE5900000
    DCD 0xE59D4024
    DCD 0xE59D5028
    DCD 0xE1A05805
    DCD 0xE2855001
    DCD 0xE3A06001
    DCD 0xE3A07001
    DCD 0xE0533001
    DCD 0x42633000
    DCD 0x42666000
    DCD 0xE0544002
    DCD 0x42644000
    DCD 0x42677000
    DCD 0xE1530004
    DCD 0xDA000011
    DCD 0xE2638000
    DCD 0xE0855003
    DCD 0xE3510000
    DCD 0xBA000005
    DCD 0xE3520000
    DCD 0xBA000003
    DCD 0xE3510C01
    DCD 0xAA000001
    DCD 0xE35200C0
    DCD 0xBB00001A
    DCD 0xE0811006
    DCD 0xE0988084
    DCD 0x50488083
    DCD 0x50822007
    DCD 0xE2455001
    DCD 0xE1B0C805
    DCD 0x1AFFFFF0
    DCD 0xEA000010
    DCD 0xE2648000
    DCD 0xE0855004
    DCD 0xE3510000
    DCD 0xBA000005
    DCD 0xE3520000
    DCD 0xBA000003
    DCD 0xE3510C01
    DCD 0xAA000001
    DCD 0xE35200C0
    DCD 0xBB000008
    DCD 0xE0822007
    DCD 0xE0988083
    DCD 0x50488084
    DCD 0x50811006
    DCD 0xE2455001
    DCD 0xE1B0C805
    DCD 0x1AFFFFF0
    DCD 0xE8BD4FF0
    DCD 0xE12FFF1E
}

/*
 * Retail-only pixel writer entered from func_02076308 with pixels, x, and y
 * in r0-r2 and the color retained in r5 rather than passed through the C ABI.
 * It changes one four-bit pixel and returns no value. Native code uses the
 * typed GraphicsSpriteCanvas_PutPixel helper above; this address-derived entry
 * point must remain private because it has no portable callable signature.
 */
asm void func_020763dc(u32 *pixels, s32 x, s32 y)
{
    and r9, r1, #7
    mov r9, r9, lsl #2
    mov r12, r2, lsr #6
    mov r12, r12, lsl #2
    add r12, r12, r1, lsr #6
    add r11, r0, r12, lsl #11
    and r12, r2, #7
    add r11, r11, r12, lsl #2
    and r10, r2, #0x38
    and r12, r1, #0x3f
    add r10, r10, r12, lsr #3
    add r11, r11, r10, lsl #5
    ldr r10, [r11]
    mov r12, #0x0f
    bic r10, r10, r12, lsl r9
    mov r12, r5, lsr #0x10
    orr r10, r10, r12, lsl r9
    str r10, [r11]
    bx lr
}

/*
 * The optimized retail fill is retained word-for-word because structured C
 * radically changes its partial-word masks, tiled pointer stepping, and loop
 * schedule. Its portable equivalent is func_02076428 directly above.
 */
asm void func_02076428(GraphicsSpriteCanvas *canvas, s32 x0, s32 y0,
                       s32 x1, s32 y1, u32 color)
{
    DCD 0xE92D4FF0
    DCD 0xE5900000
    DCD 0xE59D4024
    DCD 0xE59D5028
    DCD 0xE3A0E000
    DCD 0xE24EE001
    DCD 0xE1510003
    DCD 0xC1A0C001
    DCD 0xC1A01003
    DCD 0xC1A0300C
    DCD 0xE1520004
    DCD 0xC1A0C002
    DCD 0xC1A02004
    DCD 0xC1A0400C
    DCD 0xE3510C01
    DCD 0xAA000072
    DCD 0xE35200C0
    DCD 0xAA000070
    DCD 0xE3530000
    DCD 0xBA00006E
    DCD 0xE3540000
    DCD 0xBA00006C
    DCD 0xE3510000
    DCD 0xB3A01000
    DCD 0xE3520000
    DCD 0xB3A02000
    DCD 0xE3530C01
    DCD 0xA3A030FF
    DCD 0xE35400C0
    DCD 0xA3A040BF
    DCD 0xE205500F
    DCD 0xE1855205
    DCD 0xE1855405
    DCD 0xE1855805
    DCD 0xE1A0C322
    DCD 0xE080068C
    DCD 0xE202C038
    DCD 0xE080028C
    DCD 0xE202C007
    DCD 0xE080010C
    DCD 0xE1A0C321
    DCD 0xE080858C
    DCD 0xE201C03F
    DCD 0xE1A0C1AC
    DCD 0xE088828C
    DCD 0xE3C16007
    DCD 0xE3C37007
    DCD 0xE1560007
    DCD 0x1A000014
    DCD 0xE2019007
    DCD 0xE1A09109
    DCD 0xE1A0A91E
    DCD 0xE2039007
    DCD 0xE2699007
    DCD 0xE1A09109
    DCD 0xE1A0B93E
    DCD 0xE00A600B
    DCD 0xE0055006
    DCD 0xE5980000
    DCD 0xE1C00006
    DCD 0xE1800005
    DCD 0xE4880004
    DCD 0xE2822001
    DCD 0xE3120007
    DCD 0x028880E0
    DCD 0x0312003F
    DCD 0x02888B06
    DCD 0xE1520004
    DCD 0xDAFFFFF4
    DCD 0xEA00003C
    DCD 0xE2019007
    DCD 0xE1B09109
    DCD 0x0A00000D
    DCD 0xE1A0A91E
    DCD 0xE005B00A
    DCD 0xE1A07002
    DCD 0xE5989000
    DCD 0xE1C9900A
    DCD 0xE189900B
    DCD 0xE4889004
    DCD 0xE2877001
    DCD 0xE3170007
    DCD 0x028880E0
    DCD 0x0317003F
    DCD 0x02888B06
    DCD 0xE1570004
    DCD 0xDAFFFFF4
    DCD 0xE2819007
    DCD 0xE1A091A9
    DCD 0xE283A001
    DCD 0xE1A0A1AA
    DCD 0xE05AB009
    DCD 0x0A00000F
    DCD 0xE1A0C1A9
    DCD 0xE080858C
    DCD 0xE209C007
    DCD 0xE088828C
    DCD 0xE1A07002
    DCD 0xE4885004
    DCD 0xE2877001
    DCD 0xE3170007
    DCD 0x028880E0
    DCD 0x0317003F
    DCD 0x02888B06
    DCD 0xE1570004
    DCD 0xDAFFFFF7
    DCD 0xE2899001
    DCD 0xE25BB001
    DCD 0x1AFFFFEF
    DCD 0xE2039007
    DCD 0xE2699007
    DCD 0xE1B09109
    DCD 0x0A000011
    DCD 0xE1A0693E
    DCD 0xE0055006
    DCD 0xE1A0C323
    DCD 0xE080858C
    DCD 0xE203C03F
    DCD 0xE1A0C1AC
    DCD 0xE088828C
    DCD 0xE5989000
    DCD 0xE1C99006
    DCD 0xE1899005
    DCD 0xE4889004
    DCD 0xE2822001
    DCD 0xE3120007
    DCD 0x028880E0
    DCD 0x0312003F
    DCD 0x02888B06
    DCD 0xE1520004
    DCD 0xDAFFFFF4
    DCD 0xE8BD4FF0
    DCD 0xE12FFF1E
}

asm void func_0207663c(GraphicsSpriteCanvas *canvas, s32 x0, s32 y0,
                       s32 x1, s32 y1, u32 color)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #8
    ldr r5, [sp, #0x28]
    ldr r4, [sp, #0x2c]
    str r5, [sp]
    mov r8, r1
    mov r6, r3
    mov r3, r8
    str r4, [sp, #4]
    mov r9, r0
    mov r7, r2
    bl func_02076308
    str r5, [sp]
    mov r0, r9
    mov r1, r6
    mov r2, r7
    str r4, [sp, #4]
    mov r3, r6
    bl func_02076308
    str r7, [sp]
    mov r2, r7
    str r4, [sp, #4]
    mov r0, r9
    mov r1, r8
    mov r3, r6
    bl func_02076308
    mov r0, r9
    mov r1, r8
    mov r3, r6
    str r5, [sp]
    str r4, [sp, #4]
    mov r2, r5
    bl func_02076308
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
}

asm void func_020766c8(void)
{
    bx lr
}
#endif
