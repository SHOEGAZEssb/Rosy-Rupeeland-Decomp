#include "tingle/types.h"

/* Overlay 21 selection text, category display, and tile-buffer transition helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;

#ifdef __cplusplus
extern "C" {
#endif
extern const void *func_020628c8(void *);
extern void *func_02070874(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, s32, s32, s32);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern s32 func_02092960(void *, s32, u32, s32, s32, s32, s32, s32);
extern void *func_ov000_021fcad8(void *);
extern void *func_ov001_021fc7e4(void *);
extern void func_ov021_021ff404(void *, const void *);
extern void func_ov021_021ff504(void *, const void *);
extern u32 func_ov021_021ff62c(const void *, u32);
#ifdef __cplusplus
}
#endif

/*
 * Advance the tile-buffer transition: copy destination +0x3F4 to source
 * +0x3F0, set destination to resource +0x400's buffer +0x80, and reset timer
 * +0x3F8. Graphics buffer state changes; returns void and no MMIO occurs.
 */
extern "C" void func_ov021_021ff380(void *state)
{
    FIELD(void *, state, 0x3f0) = FIELD(void *, state, 0x3f4);
    FIELD(void *, state, 0x3f4) =
        (u8 *)func_02070874(FIELD(void *, state, 0x400)) + 0x80;
    FIELD(s32, state, 0x3f8) = 0;
}

/*
 * As 0x021FF380, but select resource buffer offset +0x60. Graphics buffer
 * state changes; returns void and performs no direct hardware access.
 */
extern "C" void func_ov021_021ff3ac(void *state)
{
    FIELD(void *, state, 0x3f0) = FIELD(void *, state, 0x3f4);
    FIELD(void *, state, 0x3f4) =
        (u8 *)func_02070874(FIELD(void *, state, 0x400)) + 0x60;
    FIELD(s32, state, 0x3f8) = 0;
}

/*
 * As 0x021FF380, but select resource buffer offset +0x20. Graphics buffer
 * state changes; returns void and performs no direct hardware access.
 */
extern "C" void func_ov021_021ff3d8(void *state)
{
    FIELD(void *, state, 0x3f0) = FIELD(void *, state, 0x3f4);
    FIELD(void *, state, 0x3f4) =
        (u8 *)func_02070874(FIELD(void *, state, 0x400)) + 0x20;
    FIELD(s32, state, 0x3f8) = 0;
}

/*
 * Select font context +0x64 and render a value/category line. A null descriptor
 * uses cached text +0x314; category one (nested record +4 flags bits 16..19)
 * uses cached text +0x2D4; other categories print descriptor value +8 using
 * format constant 0x2710. Font/UI state changes; returns void and no MMIO.
 */
extern "C" void func_ov021_021ff404(void *state, const void *descriptor)
{
    void *font = data_020f4e14;
    GraphicsSpriteRenderer_SetFontResource(font, (u8 *)state + 0x64);
    if (descriptor != 0) {
        const u8 *record = FIELD(const u8 *, descriptor, 4);
        u32 category = (FIELD(u32, record, 0xc) >> 16) & 0xf;
        if (category != 1) {
            func_02092960(font, FIELD(s32, descriptor, 8), 0x2710, 0x72,
                          6, 0xe, 1, 1);
        } else {
            GraphicsSpriteRenderer_DrawText(font, (u8 *)state + 0x2d4, 0x72, 6,
                          0xe, 4, 0);
        }
    } else {
        GraphicsSpriteRenderer_DrawText(font, (u8 *)state + 0x314, 0x72, 6,
                      0xe, 4, 0);
    }
}

/*
 * Return nested descriptor record +4 flags bits 16..19. Inputs are read only,
 * the result is in range 0..15, and no SDK/hardware effects occur.
 */
extern "C" u32 func_ov021_021ff4f0(const void *descriptor)
{
    const u8 *record = FIELD(const u8 *, descriptor, 4);
    return (FIELD(u32, record, 0xc) >> 16) & 0xf;
}

/*
 * Clear the selection-name area at X=0x10,Y=6,size 0xB0x0x16. Hide marker
 * sprite +0x9C for null input; otherwise show it, select font context +0x64,
 * resolve display text with func_020628C8, and render it at X=0x10,Y=6 with
 * style 0x0E/4. Font/sprite state changes; returns void and no MMIO occurs.
 */
extern "C" void func_ov021_021ff504(void *state, const void *item)
{
    void *font = data_020f4e14;
    GraphicsSpriteCanvas_FillRect(font, 0x10, 6, 0xb0, 0x16, 0);
    void *sprite = FIELD(void *, state, 0x9c);
    if (item == 0) {
        FIELD(u16, sprite, 0x24) |= 4;
        return;
    }
    FIELD(u16, sprite, 0x24) &= (u16)~4;
    GraphicsSpriteRenderer_SetFontResource(font, (u8 *)state + 0x64);
    GraphicsSpriteRenderer_DrawText(font, func_020628c8((void *)item), 0x10, 6,
                  0xe, 4, 0);
}

/*
 * Return nested object +0x0C flags +0x20 masked by the caller value, or zero
 * when the nested object is absent. Inputs are read only; no SDK/MMIO occurs.
 */
extern "C" u32 func_ov021_021ff62c(const void *object, u32 mask)
{
    const void *nested = FIELD(const void *, object, 0xc);
    return nested != 0 ? FIELD(u32, nested, 0x20) & mask : 0;
}

/*
 * Refresh display from overlay-0 panel +0x354's current entry. Render its
 * nested item through 0x021FF504; if wrapper flag one is set, render the null
 * category line, otherwise render the entry only when it owns a nonnull nested
 * +0x0C member. Panel/font/sprite state changes; returns void, no MMIO.
 */
extern "C" void func_ov021_021ff5b8(void *state)
{
    void *entry = func_ov000_021fcad8(FIELD(void *, state, 0x354));
    void *item = FIELD(void *, entry, 0xc);
    func_ov021_021ff504(state, item);
    entry = func_ov000_021fcad8(FIELD(void *, state, 0x354));
    if (func_ov021_021ff62c(entry, 1) != 0) {
        func_ov021_021ff404(state, 0);
    } else if (item != 0 && FIELD(void *, item, 0xc) != 0) {
        func_ov021_021ff404(state, item);
    }
}

/*
 * Refresh display from overlay-1 panel +0x358's current entry, using the same
 * item/flag/category rules as 0x021FF5B8. Panel/font/sprite state changes;
 * returns void and performs no direct hardware access.
 */
extern "C" void func_ov021_021ff644(void *state)
{
    void *entry = func_ov001_021fc7e4(FIELD(void *, state, 0x358));
    void *item = FIELD(void *, entry, 0xc);
    func_ov021_021ff504(state, item);
    entry = func_ov001_021fc7e4(FIELD(void *, state, 0x358));
    if (func_ov021_021ff62c(entry, 1) != 0) {
        func_ov021_021ff404(state, 0);
    } else if (item != 0 && FIELD(void *, item, 0xc) != 0) {
        func_ov021_021ff404(state, item);
    }
}
