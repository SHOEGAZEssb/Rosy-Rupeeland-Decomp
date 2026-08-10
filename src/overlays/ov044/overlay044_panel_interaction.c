#include "tingle/types.h"

/*
 * Overlay 44 panel interaction. These recovered helpers query row flags,
 * manage row bindings, render the visible list, map touch input to rows, and
 * synchronize the child viewport with the panel's font resources.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_021f3ecc[];
extern "C" void *gSystemState;
extern "C" void func_02073ef8(void *binding);
extern "C" void GraphicsSpriteCanvas_FillRect(void *font, s32 x, s32 y, s32 color,
                               s32 width, s32 flags);
extern "C" void *GraphicsSpriteRenderer_SetFontResource(void *font, void *presentation);
extern "C" void *func_02079f3c(const void *table, s32 index);
extern "C" void GraphicsSpriteRenderer_DrawText(void *font, const void *text, s32 x, s32 y,
                               s32 color, s32 mode, s32 flags);
extern "C" const void *func_020628c8(void *item);
extern "C" void func_02092960(void *font, u32 value, s32 width, s32 y,
                               s32 color, s32 digits, s32 spacing, s32 flags);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);
extern "C" void func_ov044_0220bb60(void *object, s32 index);
extern "C" void func_ov044_0220baa0(void *object, s32 index);
extern "C" void func_ov044_0220bba4(void *object);

/*
 * Return item flag bits selected by mask. Record +0x0C references the item and
 * item +0x20 stores its flags. A missing item returns zero. No state changes.
 */
extern "C" u32 func_ov044_0220bb48(void *record, u32 mask)
{
    void *item = FIELD(void *, record, 0xc);
    return item ? FIELD(u32, item, 0x20) & mask : 0;
}

/*
 * Release row binding +0x10 for an index below appended count +0x40, then
 * clear the pointer. Invalid or unbound indices are ignored. Resource state
 * changes through func_02073ef8; no value is returned.
 */
extern "C" void func_ov044_0220bb60(void *object, s32 index)
{
    if (index >= FIELD(s32, object, 0x40))
        return;
    void *record = (u8 *)FIELD(void *, object, 0x38) + index * 0x20;
    if (!FIELD(void *, record, 0x10))
        return;
    func_02073ef8(FIELD(void *, record, 0x10));
    FIELD(void *, record, 0x10) = 0;
}

/*
 * Render at most five rows beginning at child top index +0x0C. Clear a
 * 176-pixel-wide font region, then for each row draw either the fixed marker
 * from data_021f3ecc when item flag one is set, or the item's recovered text
 * plus a right-side numeric value from item halfword +0x04. System-state byte
 * +0x5F shifts the number upward by two pixels; values >=99 use three digits.
 * Font/presentation state is updated and no value is returned.
 */
extern "C" void func_ov044_0220bba4(void *object)
{
    void *font = FIELD(void *, object, 0);
    GraphicsSpriteCanvas_FillRect(font, 0, 0, 0xff, 0xb0, 0);
    if (FIELD(s32, object, 0x40) == 0)
        return;

    for (s32 visible = 0; visible < 5; ++visible) {
        void *child = FIELD(void *, object, 0x44);
        s32 index = FIELD(s32, child, 0xc) + visible;
        if (index >= FIELD(s32, object, 0x40))
            break;
        GraphicsSpriteRenderer_SetFontResource(font, (u8 *)object + 0x14);
        void *record = (u8 *)FIELD(void *, object, 0x38) + index * 0x20;
        s32 y = (visible + 1) * 24;
        if (func_ov044_0220bb48(record, 1)) {
            const void *marker = (u8 *)func_02079f3c(data_021f3ecc, 0x188) + 2;
            GraphicsSpriteRenderer_DrawText(font, marker, 0x44, y, 1, 4, 0);
        } else {
            void *item = FIELD(void *, record, 0xc);
            GraphicsSpriteRenderer_DrawText(font, func_020628c8(item), 0x44, y, 14, 4, 0);
            s32 numberY = visible * 24 + 0x20;
            if (FIELD(u8, gSystemState, 0x5f))
                numberY -= 2;
            u16 value = FIELD(u16, item, 4);
            GraphicsSpriteRenderer_SetFontResource(font, FIELD(void *, object, 0x18));
            func_02092960(font, value, 10, 0xb0, numberY,
                           value >= 99 ? 3 : 14, 8, 1);
        }
    }
}

/*
 * Convert touch coordinates +0x04/+0x08 into an absolute row index. Accept
 * x=64..192 and y=24..144, divide the y offset by 24, clamp visible row to
 * four, add child top index +0x0C, and reject values beyond appended count
 * +0x40. Return -1 outside the region or for missing rows. No state changes.
 */
extern "C" s32 func_ov044_0220bd28(void *object, const void *touch)
{
    s32 x = FIELD(s32, touch, 4) - 0x40;
    s32 y = FIELD(s32, touch, 8) - 0x18;
    if (x < 0 || x > 0x80 || y < 0 || y > 0x78)
        return -1;
    s32 row = func_020befec(y, 24);
    if (row >= 5)
        row = 4;
    row += FIELD(s32, FIELD(void *, object, 0x44), 0xc);
    return row < FIELD(s32, object, 0x40) ? row : -1;
}

/*
 * Return the record selected by child index +0x14 from array +0x38. The
 * returned pointer addresses a 32-byte record; no validation or state change.
 */
extern "C" void *func_ov044_0220bd98(void *object)
{
    s32 index = FIELD(s32, FIELD(void *, object, 0x44), 0x14);
    return (u8 *)FIELD(void *, object, 0x38) + index * 0x20;
}

/*
 * Synchronize a completed child scroll step. Return zero until child +0x30
 * equals half of +0x2C. At the midpoint, when top index +0x0C differs from
 * target +0x10, adjust font height, release row +0x74, bind row +0x70, and
 * redraw visible rows; then return one. Font and row bindings may change.
 */
extern "C" s32 func_ov044_0220bdac(void *object)
{
    void *child = FIELD(void *, object, 0x44);
    s32 amount = FIELD(s32, child, 0x2c);
    if (FIELD(s32, child, 0x30) != (amount + (amount < 0)) / 2)
        return 0;
    if (FIELD(s32, child, 0xc) != FIELD(s32, child, 0x10)) {
        FIELD(s32, FIELD(void *, object, 4), 0x1c) =
            0x20 - FIELD(s32, child, 0xc) * 24;
        func_ov044_0220bb60(object, FIELD(s32, child, 0x74));
        func_ov044_0220baa0(object, FIELD(s32, child, 0x70));
        func_ov044_0220bba4(object);
    }
    return 1;
}

/* Accept the common lifecycle pointer and intentionally perform no work. */
extern "C" void func_ov044_0220be34(void *component)
{
    (void)component;
}

/*
 * Install callback/state values at +0x24/+0x28 and reset counters +0x04/+0x08.
 * The object changes in place; there is no return value or SDK effect.
 */
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second)
{
    FIELD(u32, object, 0x24) = first;
    FIELD(u32, object, 0x28) = second;
    FIELD(u32, object, 4) = 0;
    FIELD(u32, object, 8) = 0;
}
