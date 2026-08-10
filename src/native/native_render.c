/*
 * Portable native software-rendering primitives.
 *
 * This deliberately small layer gives early reconstructed scenes a host-owned
 * framebuffer and debug font without exposing Win32 drawing objects to them.
 */
#include "tingle/native_render.h"

#include <stddef.h>

typedef struct NativeGlyph {
    char character;
    u8 rows[7];
} NativeGlyph;

/* Five low bits in each row describe one independently authored 5x7 glyph. */
static const NativeGlyph sGlyphs[] = {
    {'0', {14, 17, 19, 21, 25, 17, 14}},
    {'1', {4, 12, 4, 4, 4, 4, 14}},
    {'2', {14, 17, 1, 2, 4, 8, 31}},
    {'3', {30, 1, 1, 14, 1, 1, 30}},
    {'4', {2, 6, 10, 18, 31, 2, 2}},
    {'5', {31, 16, 16, 30, 1, 1, 30}},
    {'6', {14, 16, 16, 30, 17, 17, 14}},
    {'7', {31, 1, 2, 4, 8, 8, 8}},
    {'8', {14, 17, 17, 14, 17, 17, 14}},
    {'9', {14, 17, 17, 15, 1, 1, 14}},
    {'A', {14, 17, 17, 31, 17, 17, 17}},
    {'B', {30, 17, 17, 30, 17, 17, 30}},
    {'C', {14, 17, 16, 16, 16, 17, 14}},
    {'D', {30, 17, 17, 17, 17, 17, 30}},
    {'E', {31, 16, 16, 30, 16, 16, 31}},
    {'F', {31, 16, 16, 30, 16, 16, 16}},
    {'G', {14, 17, 16, 23, 17, 17, 15}},
    {'H', {17, 17, 17, 31, 17, 17, 17}},
    {'I', {14, 4, 4, 4, 4, 4, 14}},
    {'J', {7, 2, 2, 2, 2, 18, 12}},
    {'K', {17, 18, 20, 24, 20, 18, 17}},
    {'L', {16, 16, 16, 16, 16, 16, 31}},
    {'M', {17, 27, 21, 21, 17, 17, 17}},
    {'N', {17, 25, 21, 19, 17, 17, 17}},
    {'O', {14, 17, 17, 17, 17, 17, 14}},
    {'P', {30, 17, 17, 30, 16, 16, 16}},
    {'Q', {14, 17, 17, 17, 21, 18, 13}},
    {'R', {30, 17, 17, 30, 20, 18, 17}},
    {'S', {15, 16, 16, 14, 1, 1, 30}},
    {'T', {31, 4, 4, 4, 4, 4, 4}},
    {'U', {17, 17, 17, 17, 17, 17, 14}},
    {'V', {17, 17, 17, 17, 17, 10, 4}},
    {'W', {17, 17, 17, 21, 21, 21, 10}},
    {'X', {17, 17, 10, 4, 10, 17, 17}},
    {'Y', {17, 17, 10, 4, 4, 4, 4}},
    {'Z', {31, 1, 2, 4, 8, 16, 31}},
    {':', {0, 4, 4, 0, 4, 4, 0}},
    {'/', {1, 2, 2, 4, 8, 8, 16}},
    {'-', {0, 0, 0, 31, 0, 0, 0}},
    {'$', {4, 15, 20, 14, 5, 30, 4}},
    {'+', {0, 4, 4, 31, 4, 4, 0}},
    {'>', {16, 8, 4, 2, 4, 8, 16}},
    {'.', {0, 0, 0, 0, 0, 4, 4}}
};

static const u8 *FindGlyph(char character)
{
    size_t index;

    if (character >= 'a' && character <= 'z') character -= 'a' - 'A';
    for (index = 0; index < sizeof(sGlyphs) / sizeof(sGlyphs[0]); ++index) {
        if (sGlyphs[index].character == character) return sGlyphs[index].rows;
    }
    return NULL;
}

void TingleNativeCanvas_FillRect(TingleNativeCanvas *canvas, s32 x, s32 y,
                                 s32 width, s32 height, u32 color)
{
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
    s32 draw_x;
    s32 draw_y;

    if (canvas == NULL || canvas->pixels == NULL || width <= 0 || height <= 0) return;
    left = x < 0 ? 0 : x;
    top = y < 0 ? 0 : y;
    right = x + width > canvas->width ? canvas->width : x + width;
    bottom = y + height > canvas->height ? canvas->height : y + height;
    for (draw_y = top; draw_y < bottom; ++draw_y) {
        for (draw_x = left; draw_x < right; ++draw_x) {
            canvas->pixels[draw_y * canvas->stride + draw_x] = color;
        }
    }
}

void TingleNativeCanvas_DrawText(TingleNativeCanvas *canvas, s32 x, s32 y,
                                 const char *text, u32 color, s32 scale)
{
    s32 cursor = x;

    if (canvas == NULL || text == NULL || scale <= 0) return;
    while (*text != '\0') {
        const u8 *glyph = FindGlyph(*text++);
        s32 row;
        s32 column;

        if (glyph != NULL) {
            for (row = 0; row < 7; ++row) {
                for (column = 0; column < 5; ++column) {
                    if ((glyph[row] & (1u << (4 - column))) != 0) {
                        TingleNativeCanvas_FillRect(canvas, cursor + column * scale,
                                                   y + row * scale, scale, scale, color);
                    }
                }
            }
        }
        cursor += 6 * scale;
    }
}
