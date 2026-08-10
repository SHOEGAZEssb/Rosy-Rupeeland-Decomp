#include "tingle/types.h"

/* Overlay 25 selectable record row with label, numeric value, and digit sprites. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u8 data_ov025_02202de8[];
extern const u16 data_ov025_02202ef8[];
extern const s32 data_ov025_02202f28[];
extern const s32 data_ov025_02202f60[];
extern void *gRuntimeContext;
extern void *gSystemState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void func_02074110(void *);
extern void *func_020742cc(void *);
extern void func_02075598(void *, void *);
extern s32 func_02075e48(void *, u16, s32, s32, s32);
extern s32 func_02075ecc(u16);
extern void func_02076428(void *, s32, s32, s32, s32, s32);
extern void func_02092798(void *);
extern void func_02092814(void *, s32);
extern void func_ov025_021fdc60(void *, s32);
extern void func_ov025_021fde58(void *);
#ifdef __cplusplus
}
#endif

static void *create_sprite(void *widget, s32 animation, s32 x, s32 y)
{
    void *sprite = func_02073ffc(FIELD(void *, widget, 0xc), widget, 1);
    func_02073e48(sprite, animation, x, y, 1, 15, 0);
    return sprite;
}

/*
 * Constructs one record row for `index` from runtime-context table +0x38
 * (0x34-byte records). It loads resource triplet 0x4F..0x51, initializes input
 * +0x30, creates the row/controller sprites, copies an eight-code-unit label,
 * and builds either a short three-part value or a clamped decimal sprite run.
 * Record type 1 is active, type 2 is marked unavailable, and other types stay
 * inert. Resources 0x7001/0x7005 are registered with input state. Graphics,
 * archive, and widget state change; the widget pointer is returned.
 */
extern "C" void *func_ov025_021fd5dc(void *widget, s32 index)
{
    func_02071ea4(widget);
    func_02092798((u8 *)widget + 0x30);
    u8 *record = (u8 *)gRuntimeContext + 0x38 + index * 0x34;
    FIELD(s32, widget, 0x78) = index;
    for (s32 i = 0; i < 16; ++i) FIELD(u16, widget, 0x54 + i * 2) = 0;
    for (s32 i = 0; i < 6; ++i) FIELD(void *, widget, 0x14 + i * 4) = 0;
    FIELD(void *, widget, 0x2c) = 0;
    FIELD(s32, widget, 0x8c) = 0;

    func_02071ee0(widget, data_020f4e18, 0x4f, 0x50, 0x51);
    void *owner = func_020742cc(data_020f4e14);
    FIELD(void *, widget, 0xc) = owner;
    FIELD(s32, owner, 0x18) = 0x58;
    FIELD(s32, owner, 0x1c) = 0x28 + index * 0x3c;
    FIELD(void *, widget, 0x10) = func_02073ffc(owner, widget, 1);

    u16 type = FIELD(u16, record, 0);
    if (type == 1) {
        for (s32 i = 0; i < 8; ++i)
            FIELD(u16, widget, 0x54 + i * 2) = FIELD(u16, record, 0x14 + i * 2);
        FIELD(s32, widget, 0x7c) = FIELD(s32, record, 4);
        FIELD(s32, widget, 0x84) = FIELD(s32, record, 0x10);
        FIELD(s32, widget, 0x74) = 1;
        FIELD(s32, widget, 0x88) = 1;
        func_02073e48(FIELD(void *, widget, 0x10), 2, 0, 0, 1, 16, 0);
        FIELD(s32, widget, 0x80) = FIELD(u8, record, 3);

        if (FIELD(s32, widget, 0x80) != 0) {
            s32 value = FIELD(s32, widget, 0x7c);
            if (value < 10) {
                FIELD(void *, widget, 0x14) = create_sprite(widget, value + 10,
                    FIELD(s32, data_ov025_02202de8, 0xf8), 12);
                FIELD(void *, widget, 0x18) = create_sprite(widget, 0x30,
                    FIELD(s32, data_ov025_02202de8, 0xfc), 12);
                FIELD(void *, widget, 0x1c) = create_sprite(widget, 10,
                    FIELD(s32, data_ov025_02202de8, 0x100), 12);
            } else {
                if (value < 0) value = 0;
                if (value > 99999) value = 99999;
                s32 divisor = 10000;
                bool started = false;
                for (s32 slot = 0; slot < 6; ++slot) {
                    if (slot == 2) {
                        if (started)
                            FIELD(void *, widget, 0x14 + slot * 4) =
                                create_sprite(widget, 30,
                                              data_ov025_02202f28[slot], 12);
                        continue;
                    }
                    s32 digit = value / divisor;
                    if (digit || started || divisor == 1) {
                        started = true;
                        FIELD(void *, widget, 0x14 + slot * 4) =
                            create_sprite(widget, digit + 10,
                                          data_ov025_02202f28[slot], 12);
                        value %= divisor;
                    }
                    divisor /= 10;
                }
            }
        } else {
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10), 0x2e);
        }
        FIELD(void *, widget, 0x2c) = create_sprite(widget,
                                                    index * 2 + 4, 0, 0);
    } else {
        if (type == 2) FIELD(s32, widget, 0x8c) = 1;
        FIELD(s32, widget, 0x74) = 0;
        func_02073e48(FIELD(void *, widget, 0x10), 0, 0, 0, 1, 16, 0);
    }
    func_02092814((u8 *)widget + 0x30, 0x7001);
    func_02092814((u8 *)widget + 0x30, 0x7005);
    func_02074110(owner);
    return widget;
}

static void set_digit_modes(void *widget, s32 base, s32 separator)
{
    s32 value = FIELD(s32, widget, 0x7c);
    if (value < 10) {
        void *sprite = FIELD(void *, widget, 0x14);
        if (sprite) GraphicsSpriteState_SetAnimationIndex(sprite, FIELD(u8, sprite, 0x38) % 10 + base);
        sprite = FIELD(void *, widget, 0x18);
        if (sprite) GraphicsSpriteState_SetAnimationIndex(sprite, separator + 0x12);
        sprite = FIELD(void *, widget, 0x1c);
        if (sprite) GraphicsSpriteState_SetAnimationIndex(sprite, base);
    } else {
        for (s32 i = 0; i < 6; ++i) {
            void *sprite = FIELD(void *, widget, 0x14 + i * 4);
            if (!sprite) continue;
            if (i == 2) GraphicsSpriteState_SetAnimationIndex(sprite, separator);
            else GraphicsSpriteState_SetAnimationIndex(sprite, FIELD(u8, sprite, 0x38) % 10 + base);
        }
    }
}

/*
 * Selects the row and moves its sprite owner to `y + 0x58`. Active rows use
 * selected main/digit/value animations (base 10, separator 30), while inactive
 * rows use main animation zero. The index badge selects animation 2*index+4.
 * Widget and sprite animation state change; returns void.
 */
extern "C" void func_ov025_021fd9e4(void *widget, s32 y)
{
    FIELD(s32, widget, 0x88) = 1;
    FIELD(s32, FIELD(void *, widget, 0xc), 0x18) = y + 0x58;
    if (FIELD(s32, widget, 0x74)) {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10),
                      FIELD(s32, widget, 0x80) ? 2 : 0x2e);
        set_digit_modes(widget, 10, 30);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x2c),
                      FIELD(s32, widget, 0x78) * 2 + 4);
    } else {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10), 0);
    }
}

/*
 * Deselects the row and moves its owner to `y + 0x58`. Active rows use the
 * alternate main/digit/value animations (base 20, separator 31); inactive rows
 * use main animation one. The index badge selects animation 2*index+5.
 */
extern "C" void func_ov025_021fdb18(void *widget, s32 y)
{
    FIELD(s32, widget, 0x88) = 0;
    FIELD(s32, FIELD(void *, widget, 0xc), 0x18) = y + 0x58;
    if (FIELD(s32, widget, 0x74)) {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10),
                      FIELD(s32, widget, 0x80) ? 3 : 0x2f);
        set_digit_modes(widget, 20, 31);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x2c),
                      FIELD(s32, widget, 0x78) * 2 + 5);
    } else {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10), 1);
    }
}

/* Returns one when the row is inactive (+0x74 is zero), otherwise zero. */
extern "C" s32 func_ov025_021fdc4c(void *widget)
{
    return FIELD(s32, widget, 0x74) == 0;
}

/* Clears the row's recovered font rectangle; font-buffer state changes. */
extern "C" void func_ov025_021fde58(void *widget)
{
    s32 y = FIELD(s32, widget, 0x78) * 0x3c;
    func_02076428(data_020f4e14, 0x40, y + 0x14, 0xc0, y + 0x30, 0);
}

/*
 * Clears and redraws the row at vertical adjustment `offset`. Active rows draw
 * up to eight label code units with font context +0x30, followed by numeric
 * value +0x84 as up to seven digits with locale separators and selected/un-
 * selected palette 3/5. Inactive rows are only cleared. Font state changes;
 * returns void.
 */
extern "C" void func_ov025_021fdc60(void *widget, s32 offset)
{
    func_ov025_021fde58(widget);
    if (!FIELD(s32, widget, 0x74)) return;
    s32 locale = FIELD(u8, gSystemState, 0x5f);
    if (locale >= 6) locale = 5;
    func_02075598(data_020f4e14, (u8 *)widget + 0x30);
    s32 row_y = FIELD(s32, widget, 0x78) * 0x3c;
    s32 x = FIELD(s32, FIELD(void *, widget, 0xc), 0x18) - 0x18;
    for (s32 i = 0; i < 8; ++i) {
        u16 character = FIELD(u16, widget, 0x54 + i * 2);
        if (!character) break;
        s32 advance = func_02075e48(data_020f4e14,
                                    (u16)func_02075ecc(character),
                                    x, offset + row_y + 0x14, 14);
        x += advance ? advance + 1 : 5;
    }

    func_02075598(data_020f4e14, (u8 *)widget + 0x34);
    s32 color = FIELD(s32, widget, 0x88) ? 3 : 5;
    s32 value = FIELD(s32, widget, 0x84);
    if (value < 0) value = 0;
    if (value > 9999999) value = 9999999;
    s32 divisor = 1000000;
    bool started = false;
    s32 base_x = FIELD(s32, FIELD(void *, widget, 0xc), 0x18);
    s32 y = offset + row_y + 0x25 - (locale ? 2 : 0);
    for (s32 slot = 0; slot < 9; ++slot) {
        if (slot == 1 || slot == 5) {
            if (started)
                func_02075e48(data_020f4e14, data_ov025_02202ef8[locale],
                              base_x + data_ov025_02202f60[slot], y, color);
            continue;
        }
        s32 digit = value / divisor;
        if (digit || started || divisor == 1) {
            started = true;
            func_02075e48(data_020f4e14, (u16)(digit + 0x10),
                          base_x + data_ov025_02202f60[slot], y, color);
            value %= divisor;
        }
        divisor /= 10;
    }
}

/*
 * Moves the row owner vertically to `offset + 0x28 + 60*index`, then tail-
 * invokes func_ov025_021FDC60 with the same offset. Graphics/font state change.
 */
extern "C" void func_ov025_021fdea0(void *widget, s32 offset)
{
    FIELD(s32, FIELD(void *, widget, 0xc), 0x1c) =
        offset + 0x28 + FIELD(s32, widget, 0x78) * 0x3c;
    func_ov025_021fdc60(widget, offset);
}
