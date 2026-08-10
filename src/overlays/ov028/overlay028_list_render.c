#include "tingle/types.h"

/* Overlay 28 five-row text rendering, touch hit-testing, and scroll updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay028Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay028Row;

extern const u8 data_021f3ecc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, s32, s32, s32);
extern const void *func_02079f3c(const void *, u16);
extern s32 func_020befec(s32, s32);
extern void func_ov028_021fd390(void *, s32);
extern void func_ov028_021fd420(void *, s32);
extern void func_ov028_021fd468(void *);
#ifdef __cplusplus
}
#endif

/*
 * Commits font +0, binds its source to manager value +0x14, and renders at
 * most five visible rows from controller first-visible +0x0C. A nonnull row
 * descriptor supplies text directly at +0x18 and style 14/6/0; a null one uses
 * localized message 0x188 (+2) and style 1/6/0. Text is drawn at X=0x42 and
 * Y=0x15+row*24. Returns void and changes font/render SDK state.
 */
extern "C" void func_ov028_021fd468(void *state)
{
    void *font = FIELD(void *, state, 0);
    GraphicsSpriteRenderer_ClearTextBuffer(font);
    if (FIELD(s32, state, 0x40) == 0)
        return;
    GraphicsSpriteRenderer_SetFontResource(font, FIELD(void *, state, 0x14));
    Overlay028Row *rows = FIELD(Overlay028Row *, state, 0x38);
    s32 first = FIELD(s32, FIELD(void *, state, 0x44), 0xc);
    for (s32 visible = 0; visible < 5; ++visible) {
        s32 index = first + visible;
        if (index >= FIELD(s32, state, 0x40))
            return;
        if (rows[index].descriptor != 0) {
            GraphicsSpriteRenderer_DrawText(font, (u8 *)rows[index].descriptor + 0x18,
                          0x42, 0x15 + visible * 0x18, 14, 6, 0);
        } else {
            const void *text = func_02079f3c(data_021f3ecc, 0x188);
            GraphicsSpriteRenderer_DrawText(font, (u8 *)text + 2,
                          0x42, 0x15 + visible * 0x18, 1, 6, 0);
        }
    }
}

/*
 * Maps point fields +4/+8 into the list rectangle X=32..204, Y=16..136.
 * It divides relative Y by row height 24, clamps the visible result to row 4,
 * adds controller first-visible +0x0C, and returns that index when populated;
 * all misses return -1. No state or hardware changes occur.
 */
extern "C" s32 func_ov028_021fd558(void *state, const void *point)
{
    s32 y = FIELD(s32, point, 8) - 0x10;
    s32 x = FIELD(s32, point, 4) - 0x20;
    if (x < 0 || x > 0xac || y < 0 || y > 0x78)
        return -1;
    s32 visible = func_020befec(y, 0x18);
    if (visible >= 5)
        visible = 4;
    s32 index = visible + FIELD(s32, FIELD(void *, state, 0x44), 0xc);
    if (index >= FIELD(s32, state, 0x40))
        return -1;
    return index;
}

/*
 * Returns the twelve-byte row selected by controller index +0x14. The caller
 * must ensure that index is valid; this helper has no side effects.
 */
extern "C" Overlay028Row *func_ov028_021fd5c8(void *state)
{
    return &FIELD(Overlay028Row *, state, 0x38)
        [FIELD(s32, FIELD(void *, state, 0x44), 0x14)];
}

/*
 * Returns zero until controller progress +0x30 reaches half signed duration
 * +0x2C. At that point, if first-visible +0x0C differs from target +0x10, it
 * updates renderer Y, destroys row index +0x74, creates index +0x70, and
 * rerenders labels. Returns one once the midpoint is reached; UI state changes.
 */
extern "C" s32 func_ov028_021fd5e0(void *state)
{
    void *controller = FIELD(void *, state, 0x44);
    if (FIELD(s32, controller, 0x30) != FIELD(s32, controller, 0x2c) / 2)
        return 0;
    s32 first = FIELD(s32, controller, 0xc);
    if (first != FIELD(s32, controller, 0x10)) {
        FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x1c - first * 0x18;
        func_ov028_021fd420(state, FIELD(s32, controller, 0x74));
        func_ov028_021fd390(state, FIELD(s32, controller, 0x70));
        func_ov028_021fd468(state);
    }
    return 1;
}

/*
 * Stores four caller values in words +0xA4..+0xB0 and returns void. The fourth
 * value is the first stack argument; no SDK or hardware effects occur.
 */
extern "C" void func_ov028_021fd668(void *object, s32 a, s32 b, s32 c, s32 d)
{
    FIELD(s32, object, 0xa4) = a;
    FIELD(s32, object, 0xa8) = b;
    FIELD(s32, object, 0xac) = c;
    FIELD(s32, object, 0xb0) = d;
}
